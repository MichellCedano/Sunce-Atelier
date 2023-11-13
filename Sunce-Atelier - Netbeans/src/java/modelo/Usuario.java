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
public class Usuario {
    int id_usuario;
    String nombre;
    String pass;
    String correo;
    String telefono;
    String tipo;
    String calle;
    String colonia;
    String ciudad;
    String estado;
    String pais;
    int codigo_postal;
    String numero_casa;

    public Usuario(int id_usuario, String nombre, String pass, String correo, String telefono, String tipo) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.pass = pass;
        this.correo = correo;
        this.telefono = telefono;
        this.tipo = tipo;
    }

    public Usuario(String nombre, String pass, String telefono) {
        this.nombre = nombre;
        this.pass = pass;
        this.telefono = telefono;
    }

    
    
    public void agregarDireccion(String calle, String colonia, String ciudad, String estado, String pais, int codigo_postal, String numero_casa){
        this.calle=calle;
        this.ciudad=ciudad;
        this.colonia=colonia;
        this.estado=estado;
        this.pais=pais;
        this.codigo_postal=codigo_postal;
        this.numero_casa=numero_casa;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getCodigo_postal() {
        return codigo_postal;
    }

    public void setCodigo_postal(int codigo_postal) {
        this.codigo_postal = codigo_postal;
    }

    public String getNumero_casa() {
        return numero_casa;
    }

    public void setNumero_casa(String numero_casa) {
        this.numero_casa = numero_casa;
    }
    
    
}
