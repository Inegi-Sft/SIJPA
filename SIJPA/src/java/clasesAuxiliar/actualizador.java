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
 * @author CARLOS.SANCHEZG
 */
public class actualizador {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet resul;
    
    public boolean findTablaVersion(){
        try {
            conn.Conectar();
            sql = "SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_SCHEMA = 'sijpa_db' AND TABLE_NAME = 'VERSION_SISTEMA'";
            //System.out.println(sql);
            resul = conn.consultar(sql);
            return resul.next();
        } catch (SQLException ex) {
            Logger.getLogger(actualizador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean findVersion(String version){
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT VERSION FROM VERSION_SISTEMA WHERE VERSION = '" + version + "';";
            resul = conn.consultar(sql);
            return resul.next();
        } catch (SQLException ex) {
            Logger.getLogger(actualizador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public String version(){
        String ver = "";
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT VERSION FROM VERSION_SISTEMA;";
            resul = conn.consultar(sql);
            if(resul.next()){
                ver = resul.getString(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(actualizador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ver;
    }
    
}
