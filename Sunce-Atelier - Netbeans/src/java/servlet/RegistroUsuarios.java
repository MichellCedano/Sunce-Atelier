/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author koine
 */
@WebServlet(name = "RegistroUsuarios", urlPatterns = {"/nuevoUsuario"})
public class RegistroUsuarios extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String nombre=request.getParameter("nombre");
        String clave=request.getParameter("pass");
        String correo=request.getParameter("correo");
        String telefono=request.getParameter("telefono");
        String calle=request.getParameter("calle");
        String colonia=request.getParameter("colonia");
        String ciudad=request.getParameter("ciudad");
        String estado=request.getParameter("estado");
        String pais=request.getParameter("pais");
        String codigoP=request.getParameter("codigo_postal");
        String numeroCasa=request.getParameter("numero_casa");
        Consultas sql= new Consultas();
        
        Integer cp = Integer.parseInt(codigoP);
        
        if(sql.registrar(nombre, clave, correo, telefono, calle, colonia, ciudad, estado, pais, cp, numeroCasa)){
            request.getSession().setAttribute("mensajeRegistro", "Registro exitoso");
            response.sendRedirect("index.jsp");
        }else{
            request.getSession().setAttribute("mensajeRegistro", "No se pudo registrar");
            response.sendRedirect("registro.jsp");
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
