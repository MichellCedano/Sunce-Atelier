package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Articulo;
import modelo.Compra;
import modelo.ControladorProducto;
import modelo.Producto;
import modelo.Usuario;

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

    public int autenticacion(String correo, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select tipo from usuarios where correo=? and pass=?";
            System.out.println("Consulta es " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, correo);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipo");
                if (tipo.equals("usuario")) {
                    return 1;
                } else {
                    return 2;
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return 0;

    }

    public int buscarUsuario(String correo) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        int idUsuario = 0;
        try {
            String consulta = "select id_usuario,correo from usuarios where correo=?";
            System.out.println("Consulta es: " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, correo);
            rs = pst.executeQuery();

            if (rs.next()) {
                return idUsuario = rs.getInt("id_usuario");
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return -1;

    }

    public boolean registrarDireccion(String calle, String colonia, String ciudad, String estado, String pais, int codigoP, String numCasa, int idUsuario) {
        PreparedStatement pst = null;
        try {
            con = new Conexion();
            System.out.println("Direccion");
            String consulta = "insert into direccion(calle,colonia,ciudad,estado,pais,codigo_postal,numero_casa,id_usuario) values(?,?,?,?,?,?,?,?)";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, calle);
            pst.setString(2, colonia);
            pst.setString(3, ciudad);
            pst.setString(4, estado);
            pst.setString(5, pais);
            pst.setInt(6, codigoP);
            pst.setString(7, numCasa);
            pst.setInt(8, idUsuario);
            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    public int registrar(String nombre, String clave, String correo, String telefono, String calle, String colonia, String ciudad, String estado, String pais, int codigoP, String numCasa) {
        PreparedStatement pst = null;
        try {

            if (buscarUsuario(correo) > 0) {
                return -1;
            }
            System.out.println("Registrar");
            String consulta = "insert into usuarios(nombre,pass,correo,telefono,tipo) values(?,?,?,?,?)";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, clave);
            pst.setString(3, correo);
            pst.setString(4, telefono);
            pst.setString(5, "usuario");

            if (pst.executeUpdate() == 1) {
                int idUsuario = buscarUsuario(correo);

                registrarDireccion(calle, colonia, ciudad, estado, pais, codigoP, numCasa, idUsuario);

                return 1;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return 0;
    }

    public Usuario obtenerUsuario(String correo) {
        Usuario usuario = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where correo=?";
            System.out.println("Consulta es: " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, correo);
            rs = pst.executeQuery();

            if (rs.next()) {
                usuario = new Usuario(rs.getInt("id_usuario"), rs.getString("nombre"), rs.getString("pass"), rs.getString("correo"), rs.getString("telefono"), rs.getString("tipo"));
                String consulta2 = "select calle,colonia,ciudad,estado,pais,codigo_postal,numero_casa from direccion where id_usuario=?";
                System.out.println("Consulta es: " + consulta);
                pst = con.getConexion().prepareStatement(consulta2);
                pst.setInt(1, usuario.getId_usuario());
                rs = pst.executeQuery();

                if (rs.next()) {
                    usuario.agregarDireccion(rs.getString("calle"), rs.getString("colonia"), rs.getString("ciudad"), rs.getString("estado"), rs.getString("pais"), rs.getInt("codigo_postal"), rs.getString("numero_casa"));
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return usuario;
    }

    public boolean actualizarUsuario(Usuario usuario) {
        PreparedStatement pstUsuarios = null;
        PreparedStatement pstDireccion = null;

        try {
            // Actualizar información en la tabla de usuarios
            String consultaUsuarios = "UPDATE usuarios SET nombre=?, pass=?, telefono=? WHERE correo=?";
            pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
            pstUsuarios.setString(1, usuario.getNombre());
            pstUsuarios.setString(2, usuario.getPass());
            pstUsuarios.setString(3, usuario.getTelefono());
            pstUsuarios.setString(4, usuario.getCorreo());

            System.out.println(usuario.getCorreo());
            System.out.println("Aqui tambien llego");
            if (pstUsuarios.executeUpdate() == 1) {
                // Obtener el ID del usuario actualizado
                int id_usuario = this.buscarUsuario(usuario.getCorreo());

                this.con = new Conexion();
                // Actualizar información en la tabla de direcciones
                String consultaDireccion = "UPDATE direccion SET calle=?, colonia=?, ciudad=?, estado=?, pais=?, codigo_postal=?, numero_casa=? WHERE id_usuario=?";
                pstDireccion = con.getConexion().prepareStatement(consultaDireccion);
                pstDireccion.setString(1, usuario.getCalle());
                pstDireccion.setString(2, usuario.getColonia());
                pstDireccion.setString(3, usuario.getCiudad());
                pstDireccion.setString(4, usuario.getEstado());
                pstDireccion.setString(5, usuario.getPais());
                pstDireccion.setInt(6, usuario.getCodigo_postal());
                pstDireccion.setString(7, usuario.getNumero_casa());
                pstDireccion.setInt(8, id_usuario);
                System.out.println("Aqui tambien");

                if (pstDireccion.executeUpdate() == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pstUsuarios != null) {
                    pstUsuarios.close();
                }
                if (pstDireccion != null) {
                    pstDireccion.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;

    }

    public boolean actualizarAdministrador(Usuario usuario) {
        PreparedStatement pstUsuarios = null;

        try {
            // Actualizar información en la tabla de usuarios
            String consultaUsuarios = "UPDATE usuarios SET nombre=?, pass=?, telefono=? WHERE correo=?";
            pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
            pstUsuarios.setString(1, usuario.getNombre());
            pstUsuarios.setString(2, usuario.getPass());
            pstUsuarios.setString(3, usuario.getTelefono());
            pstUsuarios.setString(4, usuario.getCorreo());

            if (pstUsuarios.executeUpdate() == 1) {
                // Obtener el ID del usuario actualizado
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pstUsuarios != null) {
                    pstUsuarios.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }

    public boolean agregarProducto(String nombre, String img, float precio, String tipo, int stock) {
        PreparedStatement pst = null;
        try {

            System.out.println("Agregar");
            String consulta = "insert into productos(nombre,img_producto,precio,tipo,stock) values(?,?,?,?,?)";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, img);
            pst.setFloat(3, precio);
            pst.setString(4, tipo);
            pst.setInt(5, stock);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    public boolean eliminarProducto(int id_producto) {
        PreparedStatement pst = null;
        try {

            System.out.println("Agregar");
            String consulta = "DELETE FROM productos WHERE id_producto = ?";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, id_producto);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    public boolean eliminarUsuario(int id_usuario) {
        PreparedStatement pst = null;
        try {

            String consulta = "DELETE FROM direccion WHERE id_usuario = ?";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, id_usuario);

            if (pst.executeUpdate() == 1) {
                consulta = "DELETE FROM usuarios WHERE id_usuario = ?";
                pst = con.getConexion().prepareStatement(consulta);
                pst.setInt(1, id_usuario);
                if (pst.executeUpdate() == 1) {
                    return true;
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    public boolean actualizarProducto(Producto producto) {
        PreparedStatement pstUsuarios = null;

        try {
            // Actualizar información en la tabla de usuarios
            String consultaUsuarios = "UPDATE productos SET nombre=?, img_producto=?, precio=?, tipo=?, stock=? WHERE id_producto=?";
            pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
            pstUsuarios.setString(1, producto.getNombre());
            pstUsuarios.setString(2, producto.getImg());
            pstUsuarios.setFloat(3, producto.getPrecio());
            pstUsuarios.setString(4, producto.getTipo());
            pstUsuarios.setInt(5, producto.getStock());
            pstUsuarios.setInt(6, producto.getId());

            if (pstUsuarios.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pstUsuarios != null) {
                    pstUsuarios.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }

    public int registrarCompra(int id_usuario, float total) {
        PreparedStatement pst = null;
        try {

            String consulta = "insert into compras(id_usuario,total) values(?,?)";
            pst = con.getConexion().prepareStatement(consulta, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, id_usuario);
            pst.setFloat(2, total);

            int filasAfectadas = pst.executeUpdate();

            if (filasAfectadas == 1) {
                // Obtener las claves generadas
                ResultSet generatedKeys = pst.getGeneratedKeys();

                if (generatedKeys.next()) {
                    int id_compra = generatedKeys.getInt(1); // Obtener el ID de la compra
                    return id_compra;
                } else {
                    // No se pudo obtener el ID generado
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return -1;
    }

    public boolean registrarVenta(Articulo articulo, int id_compra) {
        PreparedStatement pst = null;
        try {

            ControladorProducto cp = new ControladorProducto();
            Producto producto = cp.getProducto(articulo.getIdProducto());
            producto.setStock(producto.getStock() - articulo.getCantidad());
            this.actualizarProducto(producto);
            float subtotal = producto.getPrecio() * articulo.getCantidad();
            String consulta = "insert into compra_producto(cantidad_producto,id_compra,id_producto,subtotal_precio) values(?,?,?,?)";
            con = new Conexion();
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, articulo.getCantidad());
            pst.setInt(2, id_compra);
            pst.setInt(3, articulo.getIdProducto());
            pst.setFloat(4, subtotal);

            if (pst.executeUpdate() == 1) {

                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    public ArrayList<Compra> obtenerCompras(String correo) {
        int id_usuario = this.buscarUsuario(correo);
        con = new Conexion();
        ArrayList<Compra> compras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select * from compras where id_usuario=?";
            pst = con.getConexion().prepareStatement(sql);
            pst.setInt(1, id_usuario);
            rs = pst.executeQuery();
            while (rs.next()) {
                compras.add(new Compra(rs.getInt("id_compra"), rs.getInt("id_usuario"), rs.getFloat("total")));
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
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
            } catch (Exception e) {

            }
        }
        return compras;
    }

    public ArrayList<Producto> obtenerProductosCompra(int id_compra) {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = new Conexion();
            String sql = "SELECT productos.*, compra_producto.cantidad_producto FROM productos "
                    + "JOIN compra_producto ON productos.id_producto = compra_producto.id_producto "
                    + "JOIN compras ON compra_producto.id_compra = compras.id_compra "
                    + "WHERE compras.id_compra = ?";
            pst = con.getConexion().prepareStatement(sql);
            pst.setInt(1, id_compra);
            rs = pst.executeQuery();

            while (rs.next()) {
                int idProducto = rs.getInt("id_producto");
                String nombre = rs.getString("nombre");
                String imgProducto = rs.getString("img_producto");
                String tipo = rs.getString("tipo");
                float precio = rs.getFloat("precio");

                // Obtener la cantidad desde la tabla compra_producto
                int cantidad = rs.getInt("cantidad_producto");

                // Crear instancia de Producto con la cantidad en lugar de stock
                productos.add(new Producto(idProducto, nombre, imgProducto, tipo, precio, cantidad));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Manejo básico de excepciones para depuración
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Manejo básico de excepciones para depuración
            }
        }
        return productos;
    }

    public int actualizarCantidad(int id, int cantidad) {
        PreparedStatement pstUsuarios = null;

        try {
            // Actualizar información en la tabla de usuarios
            if (cantidad == 0) {
                String consultaUsuarios = "DELETE from articulos WHERE id_producto=?";
                pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
                pstUsuarios.setInt(1, id);
                return 0;
            } else {
                String consultaUsuarios = "UPDATE productos SET cantidad=? WHERE id_producto=?";
                pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
                pstUsuarios.setInt(1, cantidad);
                pstUsuarios.setInt(2, id);

                if (pstUsuarios.executeUpdate() == 1) {
                    return 1;
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pstUsuarios != null) {
                    pstUsuarios.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return -1;
    }
}
