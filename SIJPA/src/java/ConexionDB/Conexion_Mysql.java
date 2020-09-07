/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CARLOS.SANCHEZG
 */
public class Conexion_Mysql {
    private Connection conexion; 
     
    public Connection getConexion() { 
        return conexion; 
    } 
    
    public boolean Conectar() { 
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            //Conceptuales
//            String url = "jdbc:mysql://node56241-sijpa2020.jl.serv.net.mx/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","BTCavy91841");
            //Administradores
//            String url = "jdbc:mysql://node56244-sijpa2020admin.jl.serv.net.mx/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","VHYyyb87899");
            //Colima
//            String url = "jdbc:mysql://node28694-sijpacol.es-1.axarnet.cloud/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","DHXgdd16979");
            //Localhost
            String url = "jdbc:mysql://localhost:3306/sijpa_db";
            conexion = (Connection) DriverManager.getConnection(url,"root","");
            return conexion != null; //System.out.println("Conexion oracle exitosa!");
            //System.out.println("Conexion oracle fallida!");
        } catch (ClassNotFoundException e) { 
            System.err.println("Error: " + e);
        } catch (SQLException ex) {        
            Logger.getLogger(Conexion_Mysql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false; 
    } 
    
    public boolean escribir(String sql) { 
        try {
            Statement sentencia; 
            sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate(sql);
            sentencia.close();
        } catch (SQLException e) { 
            System.err.println("ERROR SQL AL ESCRIBIR: " + e); 
            return false; 
        }         
        return true; 
    } 
    
    public ResultSet consultar(String sql) {
        ResultSet rst;
        try {
            Statement sentencia; 
            sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rst = sentencia.executeQuery(sql);
        } catch (SQLException e) { 
            System.out.println("ERROR SQL AL CONSULTAR: " + e);
            return null; 
        }
        return rst; 
    }
    
    public void close() throws SQLException{
        //System.out.println("Conexion oracle Cerrada");
        conexion.close();
    }
}
