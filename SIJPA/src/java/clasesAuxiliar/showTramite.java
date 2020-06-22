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
    
    public ArrayList findTramite(String causaClave, String proceClave){
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT * FROM DATOS_TRAMITES_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{
                    resul.getString("ETAPA_PROCESAL"), resul.getString("ESTATUS_INVESTIGACION"), resul.getString("ESTATUS_INTERMEDIA"),
                    resul.getString("ESPECIFIQUE"), resul.getString("FECHA_ACTO_PROCESAL")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;
    }
    
    public ArrayList findTramiteCausa(String causaClave) {
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT T.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ', P.A_PATERNO,' ', P.A_MATERNO), EP.DESCRIPCION, T.FECHA_ACTO_PROCESAL "
                + "FROM DATOS_TRAMITES_ADOJC T, DATOS_PROCESADOS_ADOJC P, CATALOGOS_ETAPA_PROCESAL EP "
                + "WHERE T.PROCESADO_CLAVE=P.PROCESADO_CLAVE "
                + "AND T.ETAPA_PROCESAL=EP.PROCESAL_ID "
                + "AND T.PROCESADO_CLAVE = '" + causaClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;

    }
    
    public ArrayList findTramiteTabla(String proceClave) {
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT T.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ', P.A_PATERNO,' ', P.A_MATERNO), EP.DESCRIPCION, T.FECHA_ACTO_PROCESAL "
                + " FROM DATOS_TRAMITES_ADOJC T, DATOS_PROCESADOS_ADOJC P, CATALOGOS_ETAPA_PROCESAL EP"
                + " WHERE T.PROCESADO_CLAVE = P.PROCESADO_CLAVE"
                + " AND T.ETAPA_PROCESAL = EP.PROCESAL_ID"
                + " AND T.PROCESADO_CLAVE = '" + proceClave + "'";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;
    }
    
    public int countTramiteExp(String causaClave) {
        try{
            conn.Conectar();
            conteo = 0;
            sql = "SELECT COUNT(*) FROM DATOS_TRAMITES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteo= resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteo;
    }
    public int countTramiteProc(String causaClave,String ProcesadoClave) {
        try{
            conn.Conectar();
            conteo = 0;
            sql = "SELECT COUNT(*) FROM DATOS_TRAMITES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE='"+ ProcesadoClave +"'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteo= resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteo;
    }
    
    
}
