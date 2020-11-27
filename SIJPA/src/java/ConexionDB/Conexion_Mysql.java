/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionDB;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
            //Colima
//            String url = "jdbc:mysql://node235835-sijpacol.j.layershift.co.uk/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","LNCqxn74661");
            //Jalisco
//            String url = "jdbc:mysql://node236661-sijpajal.j.layershift.co.uk/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","YNXirg26154");
            //Conceptuales
//            String url = "jdbc:mysql://node237036-sijpaconce.j.layershift.co.uk/sijpa_db";
//            conexion = (Connection) DriverManager.getConnection(url,"root","RQZcks05124");
            //Localhost
            String url = "jdbc:mysql://localhost:3306/sijpa_db";
            conexion = (Connection) DriverManager.getConnection(url,"root","InegiSijpa2020");
            if(conexion != null){
                //System.out.println("Conexion oracle exitosa!");
                return true;
            }else{
                //System.out.println("Conexion oracle fallida!");
                return false;
            }
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
    
    public ResultSet consultarTablas(){
        ResultSet rst = null;
        try {
            DatabaseMetaData metadatos_base = getConexion().getMetaData();
            String[] types = {"TABLE"};
            rst = metadatos_base.getTables(null, null, "%", types);   
        } catch (SQLException ex) {
            Logger.getLogger(Conexion_Mysql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public ArrayList<String[]> obtenerColumnasDeTabla(String tabla){
        Conectar();
        ResultSet rst;
        ArrayList<String[]> encabezado = new ArrayList<>();
        try {
            Statement sentencia; 
            sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rst = sentencia.executeQuery("SELECT * FROM "+tabla);
            ResultSetMetaData metadatos = rst.getMetaData();
            int numero_columna = metadatos.getColumnCount();
            for (int i=1; i<=numero_columna; i++) {
                encabezado.add(new String[]{
                        metadatos.getColumnName(i).toUpperCase()
                    });
            }
            close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion_Mysql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return encabezado;
    }
}
