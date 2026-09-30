# repair-encoding.ps1
# Reverts double-encoded UTF-8 caused by PS 5.1 Get-Content -Raw + Set-Content.
# Detection: if UTF8-decode then 1252-encode then UTF8-decode yields a different
# string, the file was double-encoded.

$ErrorActionPreference = "Stop"

$cp1252 = [System.Text.Encoding]::GetEncoding(1252)
$utf8 = New-Object System.Text.UTF8Encoding $false, $true

$repaired = 0
$skipped = 0

Get-ChildItem -Path "." -Recurse -File -Include *.md, *.html, *.yml, *.yaml, *.txt, *.css, *.js |
    Where-Object { $_.FullName -notmatch '\\\.git\\' } |
    ForEach-Object {
        $file = $_
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)

        $offset = 0
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            $offset = 3
        }

        $utf8View = $utf8.GetString($bytes, $offset, $bytes.Length - $offset)

        # Try the round-trip: UTF8 -> 1252 bytes -> UTF8
        $candidate = $cp1252.GetBytes($utf8View)
        try {
            $check = $utf8.GetString($candidate)
        } catch {
            $skipped++
            return
        }

        if ($check -eq $utf8View) {
            # No change = not double-encoded
            $skipped++
            return
        }

        Write-Host "repair: $($file.Name)" -ForegroundColor Yellow
        [System.IO.File]::WriteAllBytes($file.FullName, $candidate)
        $repaired++
    }

Write-Host ""
Write-Host "repaired: $repaired" -ForegroundColor Green
Write-Host "skipped:  $skipped" -ForegroundColor Gray
