/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author kingu
 */
public class ControladorProducto {

    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";

        for (Producto producto : mp.getAllProductos()) {
            htmlcode += "<div class=\"col-sm-4 product-item " + producto.getTipo() + "\">\n"
                    + "<div class=\"card\">\n"
                    + "<div class=\"productinfo text-center\">\n"
                    + "<img src=\"" + producto.getImg() + "\" alt=\"\" width=\"230\" height=\"230\" />\n"
                    + "<h2>$" + producto.getPrecio() + "</h2>\n"
                    + "<p>" + producto.getNombre() + "</p>\n"
                    + "<a href=\"#\" class=\"btn btn-default add-to-cart ver-detalles\" "
                    + "data-toggle=\"modal\" data-target=\"#productModal\" "
                    + "data-nombre=\"" + producto.getNombre() + "\" "
                    + "data-precio=\"" + producto.getPrecio() + "\" "
                    + "data-descripcion=\"" + producto.getNombre() + "\" "
                    + "data-imagen=\"" + producto.getImg() + "\" "
                    + "data-stock=\"" + producto.getStock() + "\" "
                    + "data-idProducto=\"" + producto.getId() + "\">"
                    + "<i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n"
                    + "</div>\n"
                    + "</div><br>\n"
                    + "</div>";
        }
        return htmlcode;
    }

    public String obtenerProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.get3Productos()) {
            htmlcode += "<div class=\"col-sm-4\">\n"
                    + "<div class=\"card\">\n"
                    + "<div class=\"productinfo text-center\">\n"
                    + "<img src=\"" + producto.getImg() + "\" alt=\"\" width=\"230\" height=\"230\" />\n"
                    + "<h2>$" + producto.getPrecio() + "</h2>\n"
                    + "<p>" + producto.getNombre() + "</p>\n"
                    + "<a href=\"#\" class=\"btn btn-default add-to-cart ver-detalles\" "
                    + "data-toggle=\"modal\" data-target=\"#productModal\" "
                    + "data-nombre=\"" + producto.getNombre() + "\" "
                    + "data-precio=\"" + producto.getPrecio() + "\" "
                    + "data-descripcion=\"" + producto.getNombre() + "\" "
                    + "data-imagen=\"" + producto.getImg() + "\" "
                    + "data-stock=\"" + producto.getStock() + "\" "
                    + "data-idProducto=\"" + producto.getId() + "\">"
                    + "<i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n"
                    + "</div>\n"
                    + "</div><br>\n"
                    + "</div>";
        }
        return htmlcode;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }
}
