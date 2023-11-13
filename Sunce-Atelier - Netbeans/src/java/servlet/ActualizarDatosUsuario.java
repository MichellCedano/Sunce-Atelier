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
import modelo.Usuario;

/**
 *
 * @author kingu
 */
@WebServlet(name = "ActualizarDatosUsuario", urlPatterns = {"/actualizarUsuario"})
public class ActualizarDatosUsuario extends HttpServlet {

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

        String nuevoNombre = request.getParameter("nombre");
        String nuevaPass = request.getParameter("pass");
        String correo = request.getParameter("correo");
        String nuevoTelefono = request.getParameter("telefono");
        String nuevaCalle = request.getParameter("calle");
        String nuevaColonia = request.getParameter("colonia");
        String nuevaCiudad = request.getParameter("ciudad");
        String nuevoEstado = request.getParameter("estado");
        String nuevoPais = request.getParameter("pais");
        String nuevoCodigo_postal = request.getParameter("codigo_postal");
        String nuevoNumero_casa = request.getParameter("numero_casa");

        int nuevoCodigoPostal = Integer.parseInt(nuevoCodigo_postal);
        // Obtén más parámetros según sea necesario

        // Utiliza la clase Consultas para actualizar la información del usuario
        Consultas sql = new Consultas();
        Usuario usuario = new Usuario(nuevoNombre, nuevaPass, nuevoTelefono);
        usuario.setCorreo(correo);
        usuario.agregarDireccion(nuevaCalle, nuevaColonia, nuevaCiudad, nuevoEstado, nuevoPais, nuevoCodigoPostal, nuevoNumero_casa);

        System.out.println(nuevaCalle);
        System.out.println("Si llego aqui");
        if (sql.actualizarUsuario(usuario)) {
            out.println("Éxito");
        } else {
            out.println("Error");
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
