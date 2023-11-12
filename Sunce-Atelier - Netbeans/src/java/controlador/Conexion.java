package controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author koine
 */
public class Conexion {
    private String USERNAME="root";
    private String PASSWORD="";
    private String HOST="localhost";
    private String PORT="3307";
    private String DATEBASE="sunceatelier";
    private String CLASSNAME="com.mysql.jdbc.Driver";
    private String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DATEBASE;
    private Connection con;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);            
        }catch(ClassNotFoundException e){
            System.err.println("Error en: "+e);
        }catch(SQLException e){
            System.err.println("Error en: "+e);
        }
    }
    
    public Connection getConexion(){
        return con;
    }
    
}
