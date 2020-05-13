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
public class showTramiteJO {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> trami;
    ArrayList<String[]> ini;
    String sql;
    ResultSet resul;
    int conteo;
    
    public ArrayList findTramiteJO(String causaClave, String proceClave){
        conn.Conectar();
        trami = new ArrayList();
            sql = "SELECT * FROM DATOS_TRAMITES_ADOJO "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{
                     resul.getString("ESTATUS"),
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
    
    public ArrayList findTramiteCausaJO(String causaClave) {
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT T.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ', P.A_PATERNO,' ', P.A_MATERNO), EP.DESCRIPCION, T.FECHA_ACTO_PROCESAL "
                + "FROM DATOS_TRAMITES_ADOJO T, DATOS_PROCESADOS_ADOJO P "
                + "WHERE T.PROCESADO_CLAVE=P.PROCESADO_CLAVE "
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
                + " FROM DATOS_TRAMITES_ADOJO T, DATOS_PROCESADOS_ADOJO P"
                + " WHERE T.PROCESADO_CLAVE=P.PROCESADO_CLAVE"
                + " AND T.PROCESADO_CLAVE='" + proceClave + "'";
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
            sql = "SELECT COUNT(*) FROM DATOS_TRAMITES_ADOJO WHERE CAUSA_CLAVE = '" + causaClave + "'";
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
    
    public ArrayList findEstatus() {
        conn.Conectar();
        ini = new ArrayList();
        sql = " SELECT * FROM catalogos_estatusjo ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;

    }
    
}
