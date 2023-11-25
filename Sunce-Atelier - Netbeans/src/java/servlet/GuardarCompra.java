/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.Consultas;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Articulo;

/**
 *
 * @author kingu
 */
@WebServlet(name = "GuardarCompra", urlPatterns = {"/guardarCompra"})
public class GuardarCompra extends HttpServlet {

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
        HttpSession sesion = request.getSession(false);
        ArrayList<Articulo> articulos = (ArrayList<Articulo>) sesion.getAttribute("carrito");

        if(articulos==null || articulos.isEmpty()){
            request.getSession().setAttribute("mensaje", "No hay productos en el carrito");
            request.getSession().removeAttribute("carrito");
            response.sendRedirect("index2.jsp");
        }else{
            String subtotal = request.getParameter("total");
            float total = Float.parseFloat(subtotal);
            String correo = request.getParameter("correo");  // Utiliza getParameter para obtener valores del formulario
            System.out.println(correo);
            Consultas sql = new Consultas();
            int id_usuario = sql.buscarUsuario(correo);

            sql = new Consultas();

            int id_compra = sql.registrarCompra(id_usuario, total);
            ArrayList<String> mensajesError = new ArrayList<>();
            for (int i = 0; i < articulos.size(); i++) {
                sql = new Consultas();
                if (!sql.registrarVenta(articulos.get(i), id_compra)) {
                    // Si hay un error, agrega el mensaje al ArrayList
                    mensajesError.add("Error al registrar la compra");
                }
            }

    // Después del bucle, verifica si hubo errores y realiza la redirección si es necesario
            if (!mensajesError.isEmpty()) {
                request.getSession().setAttribute("mensaje", "No se pudo realizar la compra");
                request.getSession().removeAttribute("carrito");
                response.sendRedirect("index2.jsp");
            } else {
                // Si no hubo errores, establece el mensaje de éxito y realiza la redirección
                request.getSession().setAttribute("mensaje", "Compra registrada correctamente");
                request.getSession().removeAttribute("carrito");
                response.sendRedirect("index2.jsp");
            }
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
