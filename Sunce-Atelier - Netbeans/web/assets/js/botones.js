let isLoggedIn = false;
var articulos = [];

function openLoginForm() {
    document.getElementById('id01').style.display = 'block';
}

function closeLoginForm() {
    document.getElementById('id01').style.display = 'none';
}


function openAgregarProductoForm() {
    document.getElementById('agregarProducto').style.display = 'block';
}

function closeAgregarProductoForm() {
    document.getElementById('agregarProducto').style.display = 'none';
}

function openActualizarProductoForm() {
    document.getElementById('actualizarProducto').style.display = 'block';
}

function closeActualizarProductoForm() {
    document.getElementById('actualizarProducto').style.display = 'none';
}

function openEliminarProductoForm() {
    document.getElementById('eliminarProducto').style.display = 'block';
}

function closeEliminarProductoForm() {
    document.getElementById('eliminarProducto').style.display = 'none';
}

function openEliminarUsuarioForm() {
    document.getElementById('eliminarUsuario').style.display = 'block';
}

function closeEliminarUsuarioForm() {
    document.getElementById('eliminarUsuario').style.display = 'none';
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


function restaurarCambios() {
    const form = document.getElementById('userForm');
    form.reset();
    cambiosPendientes = false;
    document.getElementById('confirmacion').style.display = 'none';
}

function restaurarCambiosAdministrador() {
    const form = document.getElementById('adminForm');
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
    var formulario = document.getElementById("userForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z]\w{5,14}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres, incluir al menos una letra mayúscula, una letra minúscula, un número, y el primer carácter debe ser una letra.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }
    
    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }

    var numeroCasa = formulario.numero_casa.value.trim();
    var numeroCasaRegex = /^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)?$/;

    if (!numeroCasaRegex.test(numeroCasa)) {
        alert("Por favor, ingrese un número de casa válido que puede incluir números, letras y un guion en medio (no al principio ni al final).");
        formulario.numero_casa.classList.add("invalid-input");
        return false;
    } else {
        formulario.numero_casa.classList.remove("invalid-input");
    }
    
    var calle = formulario.calle.value.trim();
    var calleRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!calleRegex.test(calle)) {
        alert("Por favor, ingrese una calle válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.calle.classList.add("invalid-input");
        return false;
    } else {
        formulario.calle.classList.remove("invalid-input");
    }
    
    var colonia = formulario.colonia.value.trim();
    var coloniaRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!coloniaRegex.test(colonia)) {
        alert("Por favor, ingrese una colonia válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.colonia.classList.add("invalid-input");
        return false;
    } else {
        formulario.colonia.classList.remove("invalid-input");
    }
    
    var ciudad = formulario.ciudad.value.trim();
    var ciudadRegex = /^[a-zA-Z\s]+$/;

    if (!ciudadRegex.test(ciudad)) {
        alert("Por favor, ingrese un nombre de ciudad válido que solo contenga letras.");
        formulario.ciudad.classList.add("invalid-input");
        return false;
    } else {
        formulario.ciudad.classList.remove("invalid-input");
    }

    var estado = formulario.estado.value.trim();
    var estadoRegex = /^[a-zA-Z\s]+$/;
    if (!estadoRegex.test(estado)) {
        alert("Por favor, ingrese un nombre de estado válido que solo contenga letras.");
        formulario.estado.classList.add("invalid-input");
        return false;
    } else {
        formulario.estado.classList.remove("invalid-input");
    }

    var pais = formulario.pais.value.trim();
    var paisRegex = /^[a-zA-Z\s]+$/;

    if (!paisRegex.test(pais)) {
        alert("Por favor, ingrese un nombre de país válido que solo contenga letras.");
        formulario.pais.classList.add("invalid-input");
        return false;
    } else {
        formulario.pais.classList.remove("invalid-input");
    }
    
    var codigoPostal = formulario.codigo_postal.value.trim();
    var codigoPostalRegex = /^\d{5}$/;

    if (!codigoPostalRegex.test(codigoPostal)) {
        alert("Por favor, ingrese un código postal válido que consista en exactamente 5 números.");
        formulario.codigo_postal.classList.add("invalid-input");
        return false;
    } else {
        formulario.codigo_postal.classList.remove("invalid-input");
    }
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

function guardarCambiosAdministrador() {
    var formulario = document.getElementById("adminForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z]\w{5,14}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres, incluir al menos una letra mayúscula, una letra minúscula, un número, y el primer carácter debe ser una letra.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }
    
    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }
    // Obtener los valores actualizados de los campos del formulario
    var nuevoNombre = document.getElementById('nombre').value;
    var nuevaPass = document.getElementById('pass').value;
    var nuevoCorreo = document.getElementById('correo').value;
    var nuevoTelefono = document.getElementById('telefono').value;

    // Agregar impresiones para depuración
    console.log("Nuevo nombre: " + nuevoNombre);
    console.log("Nueva contraseña: " + nuevaPass);
    console.log("Nuevo correo: " + nuevoCorreo);
    console.log("Nuevo teléfono: " + nuevoTelefono);

    // Realizar una solicitud AJAX al servidor para guardar los cambios
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Manejar la respuesta del servidor si es necesario
                alert("Cambios guardados con éxito");
                window.location.href = 'administracion.jsp';
            } else {
                // Manejar errores en la respuesta del servidor
                alert("Error al guardar cambios");
            }
        }
    };

    // Configurar la solicitud
    xhr.open("POST", "actualizarAdministrador", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // Crear los datos a enviar en la solicitud
    var params = "nombre=" + encodeURIComponent(nuevoNombre) +
        "&pass=" + encodeURIComponent(nuevaPass) +
        "&correo=" + encodeURIComponent(nuevoCorreo) +
        "&telefono=" + encodeURIComponent(nuevoTelefono);

console.log("Solicitud AJAX enviada con parámetros: " + params);
    // Enviar la solicitud
    xhr.send(params);
}

function validarFormulario() {
    var formulario = document.getElementById("registroForm");

    var nombreUsuario = formulario.nombre.value.trim();
    var nombreUsuarioRegex = /^[a-zA-Z][a-zA-Z0-9-_]{2,14}$/;

    if (!nombreUsuarioRegex.test(nombreUsuario)) {
        alert("El nombre de usuario debe comenzar con una letra y tener entre 3 y 15 caracteres, permitiendo letras, números, guiones y guiones bajos.");
        formulario.nombre.classList.add("invalid-input");
        return false;
    } else {
        formulario.nombre.classList.remove("invalid-input");
    }

    var contraseña = formulario.pass.value.trim();
    var contraseñaRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z]\w{5,14}$/;

    if (!contraseñaRegex.test(contraseña)) {
        alert("La contraseña debe tener al menos 6 caracteres, incluir al menos una letra mayúscula, una letra minúscula, un número, y el primer carácter debe ser una letra.");
        formulario.pass.classList.add("invalid-input");
        return false;
    } else {
        formulario.pass.classList.remove("invalid-input");
    }

    var correo = formulario.correo.value.trim();
    var correoRegex = /^[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z][a-zA-Z0-9_]*)*@[a-zA-Z][a-zA-Z0-9_]*(?:\.[a-zA-Z]+)+$/;

    if (!correoRegex.test(correo)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        formulario.correo.classList.add("invalid-input");
        return false;
    } else {
        formulario.correo.classList.remove("invalid-input");
    }
    
    var telefono = formulario.telefono.value.trim();
    var telefonoRegex = /^\d{10}$/;

    if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido con 10 dígitos.");
        formulario.telefono.classList.add("invalid-input");
        return false;
    } else {
        formulario.telefono.classList.remove("invalid-input");
    }

    var numeroCasa = formulario.numero_casa.value.trim();
    var numeroCasaRegex = /^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)?$/;

    if (!numeroCasaRegex.test(numeroCasa)) {
        alert("Por favor, ingrese un número de casa válido que puede incluir números, letras y un guion en medio (no al principio ni al final).");
        formulario.numero_casa.classList.add("invalid-input");
        return false;
    } else {
        formulario.numero_casa.classList.remove("invalid-input");
    }
    
    var calle = formulario.calle.value.trim();
    var calleRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!calleRegex.test(calle)) {
        alert("Por favor, ingrese una calle válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.calle.classList.add("invalid-input");
        return false;
    } else {
        formulario.calle.classList.remove("invalid-input");
    }
    
    var colonia = formulario.colonia.value.trim();
    var coloniaRegex = /^[a-zA-Z0-9]+(?:[.-\s][a-zA-Z0-9]+)*$/;

    if (!coloniaRegex.test(colonia)) {
        alert("Por favor, ingrese una colonia válida que puede incluir letras, números, el punto y el guion (con el punto inmediatamente después de una letra y el guion solo en el medio).");
        formulario.colonia.classList.add("invalid-input");
        return false;
    } else {
        formulario.colonia.classList.remove("invalid-input");
    }
    
    var ciudad = formulario.ciudad.value.trim();
    var ciudadRegex = /^[a-zA-Z\s]+$/;

    if (!ciudadRegex.test(ciudad)) {
        alert("Por favor, ingrese un nombre de ciudad válido que solo contenga letras.");
        formulario.ciudad.classList.add("invalid-input");
        return false;
    } else {
        formulario.ciudad.classList.remove("invalid-input");
    }

    var estado = formulario.estado.value.trim();
    var estadoRegex = /^[a-zA-Z\s]+$/;
    if (!estadoRegex.test(estado)) {
        alert("Por favor, ingrese un nombre de estado válido que solo contenga letras.");
        formulario.estado.classList.add("invalid-input");
        return false;
    } else {
        formulario.estado.classList.remove("invalid-input");
    }

    var pais = formulario.pais.value.trim();
    var paisRegex = /^[a-zA-Z\s]+$/;

    if (!paisRegex.test(pais)) {
        alert("Por favor, ingrese un nombre de país válido que solo contenga letras.");
        formulario.pais.classList.add("invalid-input");
        return false;
    } else {
        formulario.pais.classList.remove("invalid-input");
    }
    
    var codigoPostal = formulario.codigo_postal.value.trim();
    var codigoPostalRegex = /^\d{5}$/;

    if (!codigoPostalRegex.test(codigoPostal)) {
        alert("Por favor, ingrese un código postal válido que consista en exactamente 5 números.");
        formulario.codigo_postal.classList.add("invalid-input");
        return false;
    } else {
        formulario.codigo_postal.classList.remove("invalid-input");
    }
    
    return true;
}

function validarNumero(input) {
    // Si el valor es menor que 0, establece el valor a 0
    if (input.value < 0 || tieneDecimal(input.value)) {
        input.value = 0;
    }
}

function tieneDecimal(valor) {
    // Verifica si el valor tiene un punto decimal
    return valor.includes('.');
}

document.addEventListener('DOMContentLoaded', function () {
      // Selecciona todos los elementos con la clase 'cart_quantity_up' y 'cart_quantity_down'
      var quantityUpButtons = document.querySelectorAll('.cart_quantity_up');
      var quantityDownButtons = document.querySelectorAll('.cart_quantity_down');

      // Agrega un evento de clic a cada botón de aumento
      quantityUpButtons.forEach(function (button) {
         button.addEventListener('click', function () {
            updateCartItem(button, 1); // Aumenta la cantidad en 1
         });
      });

      // Agrega un evento de clic a cada botón de disminución
      quantityDownButtons.forEach(function (button) {
         button.addEventListener('click', function () {
            updateCartItem(button, -1); // Disminuye la cantidad en 1
         });
      });

      function updateCartItem(button, change) {
         // Encuentra la fila asociada al botón clicado
         var row = button.closest('tr');

         // Obtiene el ID del producto y la cantidad actual de la fila
         var productId = row.dataset.productid;
         var currentQuantity = parseInt(row.dataset.cantidad);

         // Calcula la nueva cantidad
         var newQuantity = currentQuantity + change;

         // Realiza una solicitud Ajax para actualizar la cantidad en el servidor
         var xhr = new XMLHttpRequest();
         xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
               // Actualiza la cantidad en la fila y recalcula subtotales y totales
               row.dataset.cantidad = newQuantity;
               updateSubtotalsAndTotals();
            }
         };
         xhr.open('POST', 'actualizarCantidad', true); // Ajusta la URL según tu configuración
         xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
         xhr.send('productId=' + productId + '&newQuantity=' + newQuantity);
      }

      function updateSubtotalsAndTotals() {
         // Lógica para recorrer las filas y actualizar subtotales y totales
         // ...

         // Ejemplo:
         var total = 0;
         var rows = document.querySelectorAll('tbody tr');
         rows.forEach(function (row) {
            var quantity = parseInt(row.dataset.cantidad);
            var price = parseFloat(row.querySelector('.cart_price p').innerText.substring(1)); // Elimina el signo de dólar
            var subtotal = quantity * price;
            total += subtotal;

            // Actualiza el subtotal en la fila
            row.querySelector('.cart_total_price').innerText = '$' + subtotal.toFixed(2);
         });

         // Actualiza el total en el pie de página
         document.getElementById('txt-total').innerText = '$' + total.toFixed(2);
      }
   });
