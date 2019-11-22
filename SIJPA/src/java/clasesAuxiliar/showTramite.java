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
 * @author CESAR.OSORIO
 */
public class showTramite {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> trami;
    String sql;
    ResultSet resul;
    int conteo;
    
    public ArrayList findTramite(){
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT * FROM DATOS_TRAMITES_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),resul.getString(8),resul.getString(9)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;
    } 
    
    public ArrayList findTramiteProce(String pro) {
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT T.*, P.NOMBRE, P.A_PATERNO, P.A_MATERNO, EP.DESCRIPCION "
                + " FROM DATOS_TRAMITES_ADOJC T, DATOS_PROCESADOS_ADOJC P, CATALOGOS_ETAPA_PROCESAL EP"
                + " WHERE T.PROCESADO_CLAVE=P.PROCESADO_CLAVE"
                + " AND T.ETAPA_PROCESAL=EP.PROCESAL_ID"
                + " AND T.PROCESADO_CLAVE='"+pro+"'";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{
                    resul.getString("T.PROCESADO_CLAVE"), resul.getString("P.NOMBRE")+" "+resul.getString("P.A_PATERNO")+" "+resul.getString("P.A_MATERNO"),
                    resul.getString("EP.DESCRIPCION"),resul.getString("T.MOTIVO_TRAMITE"),resul.getString("T.FECHA_ULTIMA_ACTUALIZACION")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;

    }
    public int countTramiteExp(String exp) {
        try{
            conn.Conectar();
            conteo = 0;
            sql = "SELECT COUNT(*) FROM DATOS_TRAMITES_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteo= resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showConclusiones .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteo;

    }
}
