# INE Recognition

> Extractor de datos de credencial de elector (INE/IFE) mexicana mediante OCR, construido con Ruby y Tesseract.

---

## ¿Qué hace?

Lee una foto de una INE y extrae los siguientes campos de forma automática:

| Campo | Descripción |
|---|---|
| `name` | Nombre completo del titular |
| `address` | Domicilio registrado |
| `section` | Sección electoral |
| `validity` | Vigencia de la credencial |
| `elector_key` | Clave de elector |
| `curp` | CURP del titular |

---

## Requisitos

### Tesseract OCR

Descarga e instala Tesseract para Windows:
https://github.com/UB-Mannheim/tesseract/wiki

- Durante la instalación, asegúrate de incluir el **paquete de idioma español** (`spa`)
- Agrega Tesseract al PATH del sistema

Verifica la instalación:
```bash
tesseract --version
```

### Gems de Ruby

```bash
gem install rtesseract
gem install mini_magick
```

---

## Uso

1. Coloca la imagen de tu INE en la carpeta del proyecto.
2. Actualiza el nombre del archivo en `main.rb` si es necesario:

```ruby
ine = GR_RECOGNITION::Ine.new("tu_ine.jpeg")
```

3. Ejecuta:

```bash
ruby main.rb
```

### Ejemplo de salida

```
--- RESULTADOS COMPLETOS GR ---
Nombre:     APELLIDO1 APELLIDO2 NOMBRE
Domicilio:  CALLE NUM, COLONIA CP, MUNICIPIO, ESTADO
Sección:    XXXX
Vigencia:   XXXX-XXXX
Clave:      XXXXXXXXXXXXXXXXXX
CURP:       XXXXXXXXXXXXXXXXXX
```

---

## Cómo tomar la foto

La precisión del OCR depende directamente de la calidad de la imagen. Sigue estas indicaciones:

- **Fondo negro** — coloca la credencial sobre una superficie completamente negra y sin texturas. Esto evita que el OCR intente leer elementos fuera de la tarjeta
- **Sin reflejos** — el plástico de la INE refleja la luz y borra las letras. Usa luz ambiente difusa y nunca flash directo
- **Buena resolución** — mínimo 1000 x 600 px; entre más nítida, mejor lectura
- **Completamente plana** — sin dobleces ni curvas, alineada con la cámara sin inclinación
- **Solo el frente** — el lado con foto, nombre, domicilio y CURP
- **Formato** — JPEG o PNG

---

## Estructura del proyecto

```
INE-recognition/
├── ine_recognition.rb   # Módulo principal con lógica OCR
├── main.rb              # Punto de entrada
└── README.md
```

---

## Licencia

MIT
