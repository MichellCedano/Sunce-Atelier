package controlador;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author koine
 */
public class Consultas {

    Conexion con = new Conexion();
    
    public Consultas() {
    }
    
    public boolean autenticacion(String correo,String clave){
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String consulta="select * from usuarios where correo=? and pass=?";
            System.out.println("Consulta es " + consulta);
            pst=con.getConexion().prepareStatement(consulta);
            pst.setString(1, correo);
            pst.setString(2, clave);
            rs=pst.executeQuery();
            
            if(rs.next()){
                return true;
            }
            
        }catch(Exception e){
            System.out.println("Error en: "+e );
        }finally{
            try{
               if(con.getConexion()!=null)
                   con.getConexion().close();
               if(pst!=null)pst.close();
               if(rs!=null)rs.close();
            }catch(Exception e){
                System.out.println("Error en "+e);
            }
        }
        return false;
        
    }
    
    public int buscarUsuario(String correo){
        PreparedStatement pst=null;
        ResultSet rs=null;
        int idUsuario = 0;
        try{
            String consulta="select id_usuario,correo from usuarios where correo=?";
            System.out.println("Consulta es: "+ consulta);
            pst= con.getConexion().prepareStatement(consulta);   
            pst.setString(1, correo);
            rs=pst.executeQuery();
            
            if(rs.next()){
                return idUsuario=rs.getInt("id_usuario");
            }
            
        }catch(Exception e){
            System.out.println("Error en: "+e );
        }finally{
            try{
               if(con.getConexion()!=null)
                   con.getConexion().close();
               if(pst!=null)pst.close();
               if(rs!=null)rs.close();
            }catch(Exception e){
                System.out.println("Error en "+e);
            }
        }
        return -1;
        
    }
    
    public boolean registrarDireccion(String  calle, String colonia, String ciudad, String estado, String pais, int codigoP, String numCasa,int idUsuario){
        PreparedStatement pst=null;
        try{
            con=new Conexion();
            System.out.println("Direccion");
            String consulta="insert into direccion(calle,colonia,ciudad,estado,pais,codigo_postal,numero_casa,id_usuario) values(?,?,?,?,?,?,?,?)";
            pst=con.getConexion().prepareStatement(consulta);
            pst.setString(1, calle);
            pst.setString(2, colonia);
            pst.setString(3, ciudad);
            pst.setString(4, estado);
            pst.setString(5, pais);
            pst.setInt(6, codigoP);
            pst.setString(7, numCasa);
            pst.setInt(8, idUsuario);
            if(pst.executeUpdate()==1){
                return true;
            }
            
            
        }catch(Exception e){
            System.out.println("Error en: "+e);
        }finally{
            try{
                if(con.getConexion()!=null) con.getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error en: "+e);
            }
        }
        return false;
    }
    
    public boolean registrar(String nombre, String clave, String correo, String telefono, String  calle, String colonia, String ciudad, String estado, String pais, int codigoP, String numCasa){
        PreparedStatement pst=null;
        try{
            
            System.out.println("Registrar");
            String consulta="insert into usuarios(nombre,pass,correo,telefono,tipo) values(?,?,?,?,?)";
            pst=con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, clave);
            pst.setString(3, correo);
            pst.setString(4, telefono);
            pst.setString(5, "usuario");
            
            if(pst.executeUpdate()==1){
                int idUsuario = buscarUsuario(correo);
            
                registrarDireccion(calle,colonia,ciudad,estado,pais,codigoP,numCasa,idUsuario);
                
                return true;
            }
              
        }catch(Exception e){
            System.out.println("Error en: "+e);
        }finally{
            try{
                if(con.getConexion()!=null) con.getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error en: "+e);
            }
        }
        return false;
    }
    
}
