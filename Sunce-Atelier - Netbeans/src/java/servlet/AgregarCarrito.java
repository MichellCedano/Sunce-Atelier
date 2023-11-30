/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Articulo;
import modelo.ControladorProducto;

/**
 *
 * @author kingu
 */
@WebServlet(name = "AgregarCarrito", urlPatterns = {"/agregarCarrito"})
public class AgregarCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            String cantidadString = request.getParameter("cantidad");
            String idProductoString = request.getParameter("idProducto");

            // Verifica si los parámetros son nulos o están vacíos
            if (cantidadString != null && !cantidadString.isEmpty() && idProductoString != null && !idProductoString.isEmpty()) {
                // Convierte los parámetros a tipos numéricos
                int cantidad = Integer.parseInt(cantidadString);
                int idProducto = Integer.parseInt(idProductoString);

                // Resto del código para manejar el carrito
                HttpSession sesion = request.getSession(true);
                ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList<Articulo>) sesion.getAttribute("carrito");

                boolean flag = false;

                ControladorProducto cp = new ControladorProducto();
                int stock = cp.getProducto(idProducto).getStock();
                if (articulos.size() > 0) {
                    for (Articulo a : articulos) {
                        if (idProducto == a.getIdProducto()) {
                            a.setCantidad(a.getCantidad() + cantidad);
                            if (a.getCantidad() > stock) {
                                a.setCantidad(stock);
                            }
                            flag = true;
                            break;
                        }
                    }
                }

                if (!flag) {
                    if (cantidad > stock) {
                        cantidad = stock;
                    }
                    if(stock!=0){
                        articulos.add(new Articulo(idProducto, cantidad));
                    }
                }

                sesion.setAttribute("carrito", articulos);

                // Redirige a la página del carrito
                response.sendRedirect("carrito.jsp");
            } else {
                // Manejo de error si los parámetros son nulos o vacíos
                response.getWriter().println("Error: Parámetros nulos o vacíos");
            }
        } catch (NumberFormatException e) {
            // Manejo de error si no se puede convertir a números
            response.getWriter().println("Error: No se pudo convertir a números");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
