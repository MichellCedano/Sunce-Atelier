/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author kingu
 */
public class ModeloUsuario extends Conexion{
    
    public ArrayList<Usuario> getAllUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select * from usuarios where tipo=?";
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, "usuario");
            rs = pst.executeQuery();
            while (rs.next()) {
                usuarios.add(new Usuario(rs.getInt("id_usuario"), rs.getString("nombre"), rs.getString("pass"), rs.getString("correo"), rs.getString("telefono"), rs.getString("tipo")));
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch(Exception e){
                
            }
        }
        return usuarios;
    }
    
}
