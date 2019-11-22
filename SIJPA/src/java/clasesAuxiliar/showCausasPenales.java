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
public class showCausasPenales {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> causas, lista;
    
    String sql;
    ResultSet rs, resul;
    public ArrayList findJuez(String juzclave) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT CONCAT(NOMBRE_JUEZ,' ',APELLIO_PAT_JUEZ,' ',APELLIDO_MAT_JUEZ) FROM DATOS_JUZGADOS_ADOJC WHERE JUZGADO_CLAVE ='"+ juzclave + "' ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findCausasPorJuzgado(String juzgado){
        try {
            conn.Conectar();
            causas = new ArrayList();
            
            sql = "SELECT E.*,TP.*, C.* "
                + " FROM DATOS_EXPEDIENTES_ADOJC E, CATALOGOS_PROCEDIMIENTO TP, CATALOGOS_RESPUESTA_SIMPLE C"
                + " WHERE TP.PROCEDIMIENTO_ID=E.TIPO_PROCEDIMIENTO"
                + " AND C.RESPUESTA_ID=E.COMPETENCIA"
                + " AND JUZGADO_CLAVE='"+juzgado+"' ORDER BY 1;";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                causas.add(new String[]{
                    rs.getString("expediente_clave"),rs.getString("TP.DESCRIPCION"),rs.getString("TOTAL_PROCESADOS"),
                    rs.getString("TOTAL_VICTIMAS"),rs.getString("TOTAL_DELITOS"),rs.getString("C.DESCRIPCION"),rs.getString("FECHA_INGRESO")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }
    
    public int countTotalCausas(){
        int total=0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_EXPEDIENTES_ADOJC";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                total=rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int countTotalCausasPorJuzgado(String juzgado){
        int total=0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_EXPEDIENTES_ADOJC where JUZGADO_CLAVE='"+juzgado+"'";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                total=rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int countTotalDelitos(String exp){
        int total=0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_DELITOS AS TOTAL FROM DATOS_EXPEDIENTES_ADOJC where EXPEDIENTE_CLAVE='"+exp+"'";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                total=rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int countTotalProcesados(String exp){
        int total=0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_PROCESADOS AS TOTAL FROM DATOS_EXPEDIENTES_ADOJC where EXPEDIENTE_CLAVE='"+exp+"'";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                total=rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int countTotalVictimas(String exp){
        int total=0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_VICTIMAS AS TOTAL FROM DATOS_EXPEDIENTES_ADOJC where EXPEDIENTE_CLAVE='"+exp+"'";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                total=rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
}