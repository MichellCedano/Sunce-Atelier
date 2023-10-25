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