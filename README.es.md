# minikit-ai

> Hazle preguntas a tus propios documentos. No se sube nada. Nada sale de tu ordenador.

[English](README.md) Â· [EspaÃ±ol](README.es.md) Â· [FranÃ§ais](README.fr.md) Â· [PortuguÃªs](README.pt.md) Â· [ä¸­æ–‡](README.zh.md) Â· [à¤¹à¤¿à¤¨à¥à¤¦à¥€](README.hi.md) Â· [Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©](README.ar.md)

**Windows 10/11** Â· sin permisos de administrador Â· un solo instalador Â· funciona sin internet.

---

## 1. QuÃ© es

ApÃºntale a una carpeta con documentos. Los lee, los memoriza y responde preguntas sobre
ellos en lenguaje natural, mostrÃ¡ndote exactamente los pÃ¡rrafos que ha usado.

- **PDF**, **Word (.docx)**, **Markdown** y **texto plano**
- Todo ocurre en tu ordenador: los modelos de IA, la base de datos, el panel web
- Sin cuenta, sin clave de API, sin suscripciÃ³n, sin telemetrÃ­a

## 2. Instalar en cuatro pasos

### Paso 1 â€” Instalar Ollama

Ollama es el motor libre y de cÃ³digo abierto que ejecuta los modelos de IA en tu propio
ordenador.

1. Entra en **<https://ollama.com/download>**
2. Descarga la versiÃ³n para Windows e instÃ¡lala
3. DÃ©jala instalada. TodavÃ­a no necesitas arrancarla.

### Paso 2 â€” Descargar los dos modelos de IA

Abre la **lÃ­nea de comandos** (pulsa `Win`, escribe `cmd`, pulsa Enter) y pega estas dos
lÃ­neas, una cada vez:

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 MB) convierte el texto en nÃºmeros para que el programa pueda
  buscarlo
- `qwen2.5:0.5b` (400 MB) escribe las respuestas

Son deliberadamente minÃºsculos: el objetivo es que funcione en un ordenador viejo y
barato. Si tienes mÃ¡s memoria y quieres mejores respuestas, mÃ¡s adelante puedes cambiar a
`qwen2.5:3b`.

### Paso 3 â€” Ejecutar el instalador

1. Entra en **<https://github.com/VinekROG/minikit-ai/releases/latest>**
2. Descarga `minikit-ai-0.1.0-setup.exe` (unos 4 MB)
3. Haz doble clic
4. Windows mostrarÃ¡ un aviso azul. Es normal, lÃ©elo mÃ¡s abajo.
5. Pulsa **MÃ¡s informaciÃ³n â†’ Ejecutar de todas formas**
6. El instalador nunca pide permisos de administrador

> **Sobre el aviso azul:** Windows lo muestra porque el archivo no tiene firma digital. El
> autor no tiene certificado de firma. El aviso dice Â«aplicaciÃ³n no reconocidaÂ», no Â«virusÂ».
> Una vez instalado, este mensaje solo aparece una vez.

### Paso 4 â€” Arrancarlo

1. Pulsa la tecla de Windows y escribe **minikit-ai**
2. Pulsa Enter
3. Se abre una ventana negra pequeÃ±a y tu navegador se abre solo
4. Ese es el programa. La ventana negra debe permanecer abierta.

---

## 3. CÃ³mo se usa

1. **AÃ±ade documentos.** Arrastra un archivo a la ventana, o escribe la ruta de una
   carpeta como `C:\Users\TÃº\Documentos\contratos` y pulsa *Indexar*.
2. **Haz una pregunta.** EscrÃ­bela en el recuadro de la derecha, en el idioma que quieras.
3. **Mira las fuentes.** La respuesta lista los pÃ¡rrafos que ha usado, para que puedas
   comprobarla.

La primera respuesta tarda bastante (30â€“90 segundos en un ordenador antiguo) porque el
modelo se carga en memoria por primera vez. Las siguientes son mucho mÃ¡s rÃ¡pidas.

Formatos admitidos: `.pdf` `.docx` `.txt` `.md`

---

## 4. Por quÃ© tus documentos se quedan privados

Esta es la parte importante, asÃ­ que aquÃ­ estÃ¡ exactamente lo que hace el programa: no una
promesa, una descripciÃ³n del mecanismo.

### 4.1 La red estÃ¡ apagada de verdad

Todas las conexiones salientes del programa pasan por una Ãºnica puerta. Esa puerta permite
exactamente un destino: `127.0.0.1`, tu propio ordenador. Nada mÃ¡s. Ni una direcciÃ³n web,
ni un nombre de dominio, ni otro equipo de tu red.

Si algo intenta salir â€” un error de programaciÃ³n, un archivo daÃ±ado, una instrucciÃ³n
maliciosa escondida dentro de uno de tus propios documentos â€” ocurren tres cosas a la vez:

1. La conexiÃ³n se rechaza.
2. Los datos de los documentos que estaban en memoria se sobrescriben con ceros.
3. El intento se guarda en un registro que puedes leer en el panel.

Puedes comprobarlo tÃº mismo cuando quieras. Pulsa el botÃ³n **Ejecutar autocomprobaciÃ³n** del
panel: intenta a propÃ³sito llegar a `1.1.1.1` y a `example.com` y te enseÃ±a los rechazos.

### 4.2 Nadie puede usar tu copia a distancia

El panel estÃ¡ atado a tu propia mÃ¡quina, exige una contraseÃ±a aleatoria que se genera en
cada arranque, rechaza las peticiones cuya direcciÃ³n no sea la de tu ordenador y no contesta
si alguien envÃ­a demasiadas peticiones seguidas. Una pÃ¡gina web que tengas abierta en otra
pestaÃ±a no puede hablar con Ã©l.

### 4.3 El cÃ³digo no se publica

Este repositorio contiene el instalador y la documentaciÃ³n. **El cÃ³digo fuente no estÃ¡
aquÃ­.** Si quieres ver cÃ³mo funciona, es una conversaciÃ³n que hay que tener directamente,
no algo que puedas copiar de una web.

### 4.4 La interfaz va cifrada dentro del programa

El HTML, el CSS y el JavaScript del panel se guardan cifrados dentro del ejecutable y solo
se descifran en memoria mientras estÃ¡ funcionando. Abrir el archivo con un editor de texto
o descomprimir el programa no los revela.

---

## 5. LÃ­mites honestos

Ser sincero contigo vale mÃ¡s que una buena pÃ¡gina de marketing.

| | |
|---|---|
| **Sin firma digital** | Windows te avisa la primera vez: `MÃ¡s informaciÃ³n â†’ Ejecutar de todas formas`. |
| **La base de datos no estÃ¡ cifrada** | Tus documentos se guardan en un archivo de tu carpeta de usuario. Quien tenga acceso a tu cuenta de Windows puede leerlo. |
| **Cita, no razona** | Busca y repite lo que dicen tus documentos. No calcula ni deduce. |
| **Las respuestas pueden ser incorrectas** | El modelo es pequeÃ±o a propÃ³sito. Comprueba siempre los pÃ¡rrafos citados. |
| **Un usuario a la vez** | Pensado para una persona y un ordenador. No es un servidor compartido. |

---

## 6. Preguntas frecuentes

**Â¿Necesito conexiÃ³n a internet?**
Solo durante la instalaciÃ³n y al descargar los modelos. DespuÃ©s puedes desconectarte y
sigue funcionando.

**Â¿Manda algo a alguna empresa?**
No. El programa es incapaz de hacerlo: el Ãºnico destino de red que acepta es `127.0.0.1`.
El apartado 4.1 explica por quÃ©, y tambiÃ©n explica cÃ³mo comprobarlo.

**Â¿CÃ³mo lo desinstalo?**
ConfiguraciÃ³n â†’ Aplicaciones instaladas â†’ minikit-ai â†’ Desinstalar. Tus documentos se
conservan, no se borran, asÃ­ que si reinstalas no pierdes el Ã­ndice.

**Mi ordenador va lento. Â¿QuÃ© hago?**
Cierra otros programas mientras preguntas. La primera respuesta siempre es la mÃ¡s lenta.

**Algo ha fallado.**
Abre la lÃ­nea de comandos y escribe `minikit-ai doctor`. Imprime exactamente quÃ© falta.

---

## 7. Para desarrolladores

El cÃ³digo fuente no estÃ¡ en este repositorio. Consulta [SECURITY.md](SECURITY.md) para
informar de una vulnerabilidad y [LICENSE](LICENSE) para los tÃ©rminos de uso.

**Gracias por usarlo.**
