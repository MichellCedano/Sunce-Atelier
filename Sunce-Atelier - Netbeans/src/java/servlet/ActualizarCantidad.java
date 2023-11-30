/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Articulo;
import modelo.ControladorProducto;

/**
 *
 * @author kingu
 */
@WebServlet(name = "ActualizarCantidad", urlPatterns = {"/actualizarCantidad"})
public class ActualizarCantidad extends HttpServlet {

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
        String productId = request.getParameter("productId");
        String newQuantity = request.getParameter("newQuantity");
        int id = Integer.parseInt(productId);
        int cantidad = Integer.parseInt(newQuantity);

        ArrayList<Articulo> articulos = (ArrayList<Articulo>) request.getSession().getAttribute("carrito");
        for (int i = 0; i < articulos.size(); i++) {
            if (articulos.get(i).getIdProducto() == id) {
                ControladorProducto cp=new ControladorProducto();
                int stock=cp.getProducto(id).getStock();
                if(cantidad<=stock){
                    articulos.get(i).setCantidad(cantidad);
                }
                if(cantidad==0){
                    articulos.remove(i);
                }
            }
        }
        request.getSession().removeAttribute("carrito");
        request.getSession().setAttribute("carrito", articulos);

        // Envía una respuesta JSON con los datos actualizados
        String jsonResponse = "{ \"status\": \"success\", \"message\": \"Actualización exitosa\", \"newQuantity\": " + cantidad + " }";
        response.getWriter().write(jsonResponse);
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
