# minikit-ai

> Hazle preguntas a tus propios documentos. No se sube nada. Nada sale de tu ordenador.

[English](README.md) · [Español](README.es.md) · [Français](README.fr.md) · [Português](README.pt.md) · [中文](README.zh.md) · [हिन्दी](README.hi.md) · [العربية](README.ar.md)

**Windows 10/11** · sin permisos de administrador · un solo instalador · funciona sin internet.

---

## 1. Qué es

Apúntale a una carpeta con documentos. Los lee, los memoriza y responde preguntas sobre
ellos en lenguaje natural, mostrándote exactamente los párrafos que ha usado.

- **PDF**, **Word (.docx)**, **Markdown** y **texto plano**
- Todo ocurre en tu ordenador: los modelos de IA, la base de datos, el panel web
- Sin cuenta, sin clave de API, sin suscripción, sin telemetría

## 2. Instalar en cuatro pasos

### Paso 1 — Instalar Ollama

Ollama es el motor libre y de código abierto que ejecuta los modelos de IA en tu propio
ordenador.

1. Entra en **<https://ollama.com/download>**
2. Descarga la versión para Windows e instálala
3. Déjala instalada. Todavía no necesitas arrancarla.

### Paso 2 — Descargar los dos modelos de IA

Abre la **línea de comandos** (pulsa `Win`, escribe `cmd`, pulsa Enter) y pega estas dos
líneas, una cada vez:

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 MB) convierte el texto en números para que el programa pueda
  buscarlo
- `qwen2.5:0.5b` (400 MB) escribe las respuestas

Son deliberadamente minúsculos: el objetivo es que funcione en un ordenador viejo y
barato. Si tienes más memoria y quieres mejores respuestas, más adelante puedes cambiar a
`qwen2.5:3b`.

### Paso 3 — Ejecutar el instalador

1. Entra en **<https://github.com/OWNER/minikit-ai/releases/latest>**
2. Descarga `minikit-ai-0.1.0-setup.exe` (unos 4 MB)
3. Haz doble clic
4. Windows mostrará un aviso azul. Es normal, léelo más abajo.
5. Pulsa **Más información → Ejecutar de todas formas**
6. El instalador nunca pide permisos de administrador

> **Sobre el aviso azul:** Windows lo muestra porque el archivo no tiene firma digital. El
> autor no tiene certificado de firma. El aviso dice «aplicación no reconocida», no «virus».
> Una vez instalado, este mensaje solo aparece una vez.

### Paso 4 — Arrancarlo

1. Pulsa la tecla de Windows y escribe **minikit-ai**
2. Pulsa Enter
3. Se abre una ventana negra pequeña y tu navegador se abre solo
4. Ese es el programa. La ventana negra debe permanecer abierta.

---

## 3. Cómo se usa

1. **Añade documentos.** Arrastra un archivo a la ventana, o escribe la ruta de una
   carpeta como `C:\Users\Tú\Documentos\contratos` y pulsa *Indexar*.
2. **Haz una pregunta.** Escríbela en el recuadro de la derecha, en el idioma que quieras.
3. **Mira las fuentes.** La respuesta lista los párrafos que ha usado, para que puedas
   comprobarla.

La primera respuesta tarda bastante (30–90 segundos en un ordenador antiguo) porque el
modelo se carga en memoria por primera vez. Las siguientes son mucho más rápidas.

Formatos admitidos: `.pdf` `.docx` `.txt` `.md`

---

## 4. Por qué tus documentos se quedan privados

Esta es la parte importante, así que aquí está exactamente lo que hace el programa: no una
promesa, una descripción del mecanismo.

### 4.1 La red está apagada de verdad

Todas las conexiones salientes del programa pasan por una única puerta. Esa puerta permite
exactamente un destino: `127.0.0.1`, tu propio ordenador. Nada más. Ni una dirección web,
ni un nombre de dominio, ni otro equipo de tu red.

Si algo intenta salir — un error de programación, un archivo dañado, una instrucción
maliciosa escondida dentro de uno de tus propios documentos — ocurren tres cosas a la vez:

1. La conexión se rechaza.
2. Los datos de los documentos que estaban en memoria se sobrescriben con ceros.
3. El intento se guarda en un registro que puedes leer en el panel.

Puedes comprobarlo tú mismo cuando quieras. Pulsa el botón **Ejecutar autocomprobación** del
panel: intenta a propósito llegar a `1.1.1.1` y a `example.com` y te enseña los rechazos.

### 4.2 Nadie puede usar tu copia a distancia

El panel está atado a tu propia máquina, exige una contraseña aleatoria que se genera en
cada arranque, rechaza las peticiones cuya dirección no sea la de tu ordenador y no contesta
si alguien envía demasiadas peticiones seguidas. Una página web que tengas abierta en otra
pestaña no puede hablar con él.

### 4.3 El código no se publica

Este repositorio contiene el instalador y la documentación. **El código fuente no está
aquí.** Si quieres ver cómo funciona, es una conversación que hay que tener directamente,
no algo que puedas copiar de una web.

### 4.4 La interfaz va cifrada dentro del programa

El HTML, el CSS y el JavaScript del panel se guardan cifrados dentro del ejecutable y solo
se descifran en memoria mientras está funcionando. Abrir el archivo con un editor de texto
o descomprimir el programa no los revela.

---

## 5. Límites honestos

Ser sincero contigo vale más que una buena página de marketing.

| | |
|---|---|
| **Sin firma digital** | Windows te avisa la primera vez: `Más información → Ejecutar de todas formas`. |
| **La base de datos no está cifrada** | Tus documentos se guardan en un archivo de tu carpeta de usuario. Quien tenga acceso a tu cuenta de Windows puede leerlo. |
| **Cita, no razona** | Busca y repite lo que dicen tus documentos. No calcula ni deduce. |
| **Las respuestas pueden ser incorrectas** | El modelo es pequeño a propósito. Comprueba siempre los párrafos citados. |
| **Un usuario a la vez** | Pensado para una persona y un ordenador. No es un servidor compartido. |

---

## 6. Preguntas frecuentes

**¿Necesito conexión a internet?**
Solo durante la instalación y al descargar los modelos. Después puedes desconectarte y
sigue funcionando.

**¿Manda algo a alguna empresa?**
No. El programa es incapaz de hacerlo: el único destino de red que acepta es `127.0.0.1`.
El apartado 4.1 explica por qué, y también explica cómo comprobarlo.

**¿Cómo lo desinstalo?**
Configuración → Aplicaciones instaladas → minikit-ai → Desinstalar. Tus documentos se
conservan, no se borran, así que si reinstalas no pierdes el índice.

**Mi ordenador va lento. ¿Qué hago?**
Cierra otros programas mientras preguntas. La primera respuesta siempre es la más lenta.

**Algo ha fallado.**
Abre la línea de comandos y escribe `minikit-ai doctor`. Imprime exactamente qué falta.

---

## 7. Para desarrolladores

El código fuente no está en este repositorio. Consulta [SECURITY.md](SECURITY.md) para
informar de una vulnerabilidad y [LICENSE](LICENSE) para los términos de uso.

**Gracias por usarlo.**
