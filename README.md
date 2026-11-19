# Tienda de Camisetas

Tienda en línea con carrito de compras hecha en **PHP puro**, usando **programación orientada a objetos** y el patrón **MVC**.

🔗 **Demo en línea:** https://tienda-camisas.rf.gd/

## Funcionalidades

**Usuarios**
- Registro e inicio de sesión
- Navegación por categorías (Sudaderas, Manga larga, Tirantes, Manga corta)
- Carrito de compras con control de stock
- Realizar pedidos y consultar "Mis pedidos"

**Administrador**
- Gestión de categorías y productos (crear, editar y eliminar, con subida de imágenes)
- Gestión de pedidos y cambio de estado

**Otros**
- Paginación en el inicio

## Tecnologías

PHP 8 · MySQL · HTML · CSS · MVC · POO

## Cuentas de prueba (demo)

- Administrador: `admin@admin.com` / `adminadmin`
- Usuario: `luis@luis.com` / `luisluis`

> La demo es pública y los datos pueden reiniciarse en cualquier momento.

## Instalación en local (WAMP / XAMPP)

1. Clona o descarga el repositorio dentro de la carpeta `www` (o `htdocs`).
2. Crea una base de datos llamada `tienda_master` e importa `database/tienda_master.sql`.
3. Revisa que `config/parameters.php` tenga la URL correcta:
   ```php
   define("base_url", "http://localhost/nombre-de-tu-carpeta/");
   ```
4. Los datos de conexión por defecto son `root` sin contraseña. Si usas otros, copia `config/db.local.example.php` como `config/db.local.php` y pon tus datos.
5. Abre `http://localhost/nombre-de-tu-carpeta/`.

## Notas

- Los nombres de los controladores empiezan con minúscula (`productoController.php`) porque en servidores Linux importan las mayúsculas.

## Mejoras pendientes

- Diseño responsive para celulares y tablets
- Validar los cambios de estado de los pedidos (por ejemplo, que un pedido "enviado" no pueda volver a "en preparación")
- Usar transacciones al confirmar pedidos
- Mejorar la validación de la subida de imágenes
