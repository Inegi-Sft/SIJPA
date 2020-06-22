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
            //String url = "jdbc:mysql://node42241-sjpa2020.in1.cloudjiffy.net:3306/sijpa_db";
            String url = "jdbc:mysql://localhost:3306/sijpa_db";
            //String url = "jdbc:mysql://10.15.130.27:3306/sijpa_dbp";
            conexion = (Connection) DriverManager.getConnection(url,"root","");
            //conexion = (Connection) DriverManager.getConnection(url,"root","HLAhki79491");
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
        ResultSet rst = null;
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
