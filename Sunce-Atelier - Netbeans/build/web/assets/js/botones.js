let isLoggedIn = false;

function openLoginForm() {
    document.getElementById('id01').style.display = 'block';
}

function closeLoginForm() {
    document.getElementById('id01').style.display = 'none';
}

function toggleLoginState() {
    const loginButton = document.getElementById('loginButton');
    const userInfoLink = document.getElementById('userInfoLink');
    if (isLoggedIn) {

    } else {
        // El usuario está iniciando sesión
        isLoggedIn = true;
        loginButton.textContent = 'Cerrar Sesión';
        userInfoLink.style.display = 'inline';
    }
}

function toggleCloseState() {
    const loginButton = document.getElementById('loginButton');
    if (isLoggedIn) {
        // El usuario está cerrando la sesión
        isLoggedIn = false;
        loginButton.textContent = 'Iniciar Sesion';
        userInfoLink.style.display = 'none';
    } else {
        openLoginForm(); // Abre el formulario
    }
}

let cambiosPendientes = false;

function editarCampo(id) {
    const campo = document.getElementById(id);
    const botonEditar = document.getElementById('edit' + id);
    campo.disabled = !campo.disabled;
    botonEditar.textContent = campo.disabled ? 'Editar' : 'Cancelar';
    cambiosPendientes = true;
}

function guardarCambios() {
    if (cambiosPendientes) {
        document.getElementById('confirmacion').style.display = 'block';
    } else {
        document.getElementById('confirmacion').style.display = 'none';
    }
}

function restaurarCambios() {
    const form = document.getElementById('userForm');
    form.reset();
    cambiosPendientes = false;
    document.getElementById('confirmacion').style.display = 'none';
}

// JavaScript para mostrar la ventana emergente y llenarla con detalles del producto
document.addEventListener("DOMContentLoaded", function() {
    const productLinks = document.querySelectorAll('[data-toggle="modal"]');
    const modal = document.getElementById('productModal');
    const modalTitle = modal.querySelector('.modal-title');
    const productImage = modal.querySelector('#productImage');
    const productDescription = modal.querySelector('#productDescription');
    const addToCartButton = modal.querySelector('#addToCartButton');

    productLinks.forEach(function(productLink) {
        productLink.addEventListener('click', function(e) {
            e.preventDefault();

            modalTitle.textContent = productLink.getAttribute('data-nombre');
            productImage.src = productLink.getAttribute('data-imagen');
            productDescription.textContent = productLink.getAttribute('data-descripcion');
            productPrice.textContent = productLink.getAttribute('data-precio');
            addToCartButton.addEventListener('click', function() {
                const nombre = productLink.getAttribute('data-nombre');
                const precio = parseFloat(productLink.getAttribute('data-precio'));
                // Lógica para agregar el producto al carrito aquí
                agregarAlCarrito(nombre, precio);
                modal.style.display = 'none'; // Cierra la ventana emergente
            });

            modal.style.display = 'block'; // Muestra la ventana emergente
        });
    });
});

function guardarCambios() {
    // Obtener los valores actualizados de los campos del formulario
    var nuevoNombre = document.getElementById('nombre').value;
    var nuevaPass = document.getElementById('pass').value;
    var nuevoCorreo = document.getElementById('correo').value;
    var nuevoTelefono = document.getElementById('telefono').value;
    var nuevaCalle = document.getElementById('calle').value;
    var nuevaColonia = document.getElementById('colonia').value;
    var nuevaCiudad = document.getElementById('ciudad').value;
    var nuevoEstado = document.getElementById('estado').value;
    var nuevoPais = document.getElementById('pais').value;
    var nuevoCodigo_postal = document.getElementById('codigo_postal').value;
    var nuevoNumero_casa = document.getElementById('numero_casa').value;

    // Agregar impresiones para depuración
    console.log("Nuevo nombre: " + nuevoNombre);
    console.log("Nueva contraseña: " + nuevaPass);
    console.log("Nuevo correo: " + nuevoCorreo);
    console.log("Nuevo teléfono: " + nuevoTelefono);
    console.log("Nueva calle: " + nuevaCalle);
    console.log("Nueva colonia: " + nuevaColonia);
    console.log("Nueva ciudad: " + nuevaCiudad);
    console.log("Nuevo estado: " + nuevoEstado);
    console.log("Nuevo país: " + nuevoPais);
    console.log("Nuevo código postal: " + nuevoCodigo_postal);
    console.log("Nuevo número de casa: " + nuevoNumero_casa);

    // Realizar una solicitud AJAX al servidor para guardar los cambios
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Manejar la respuesta del servidor si es necesario
                alert("Cambios guardados con éxito");
            } else {
                // Manejar errores en la respuesta del servidor
                alert("Error al guardar cambios");
            }
        }
    };

    // Configurar la solicitud
    xhr.open("POST", "actualizarUsuario", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Crear los datos a enviar en la solicitud
    var params = "nombre=" + encodeURIComponent(nuevoNombre) +
        "&pass=" + encodeURIComponent(nuevaPass) +
        "&correo=" + encodeURIComponent(nuevoCorreo) +
        "&telefono=" + encodeURIComponent(nuevoTelefono) +
        "&calle=" + encodeURIComponent(nuevaCalle) +
        "&colonia=" + encodeURIComponent(nuevaColonia) +
        "&ciudad=" + encodeURIComponent(nuevaCiudad) +
        "&estado=" + encodeURIComponent(nuevoEstado) +
        "&pais=" + encodeURIComponent(nuevoPais) +
        "&codigo_postal=" + encodeURIComponent(nuevoCodigo_postal) +
        "&numero_casa=" + encodeURIComponent(nuevoNumero_casa);

console.log("Solicitud AJAX enviada con parámetros: " + params);
    // Enviar la solicitud
    xhr.send(params);
}
