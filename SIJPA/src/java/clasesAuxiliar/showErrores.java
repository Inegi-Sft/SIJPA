/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class showErrores {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet rs;
    
    public ArrayList findErroresFaltanTablas(String id){
        try {
            conn.Conectar_espejo();
            lista = new ArrayList();
            sql = "SELECT TABLA_FALTANTE FROM TABLA_ERRORES_TABLASFALTANTES WHERE ID_ERROR='"+id+"'";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString("TABLA_FALTANTE")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showErrores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;    
    }
    public ArrayList findErroresFaltanColumnas(String id){
        try {
            conn.Conectar_espejo();
            lista = new ArrayList();
            sql = "SELECT TABLA,COLUMNAS_FALTANTES FROM TABLA_ERRORES_COLUMNASFALTANTES WHERE ID_ERROR='"+id+"'";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString("TABLA"),rs.getString("COLUMNAS_FALTANTES")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showErrores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;    
    }
    public ArrayList findErroresImportacionDatos(String id){
        try {
            conn.Conectar_espejo();
            lista = new ArrayList();
            sql = "SELECT TABLA,EXCEPCION FROM TABLA_ERRORES_EXCEPCIONES WHERE ID_ERROR='"+id+"'";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString("TABLA"),rs.getString("EXCEPCION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showErrores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;    
    }  
}
