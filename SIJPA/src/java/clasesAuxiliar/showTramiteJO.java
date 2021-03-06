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
public class showTramiteJO {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> tramite;
    String sql;
    ResultSet resul;
    int conteoTram,conteo;
    
    public ArrayList findTramiteCausaJC(String causaClaveJC) {
        conn.Conectar();
        tramite = new ArrayList();
        sql = "SELECT PR.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO) "
                    + "FROM DATOS_PROCESADOS_ADOJC PR, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE PR.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PR.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND PR.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                tramite.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }

        return tramite;
    }
    
    public ArrayList findTramiteCausaJO(String causaClaveJO) {
        conn.Conectar();
        tramite = new ArrayList();
        sql = "SELECT TR.PROCESADO_CLAVE, CONCAT(PO.NOMBRE,' ', PO.A_PATERNO,' ', PO.A_MATERNO) NOMBRE,TR.FECHA_ACTO_PROCESAL "
                + "FROM DATOS_TRAMITES_ADOJO TR, DATOS_PROCESADOS_ADOJO PO, DATOS_CAUSAS_PENALES_ADOJO CP, CATALOGOS_ETAPA_PROCESAL EP "
                + "WHERE TR.CAUSA_CLAVEJO = PO.CAUSA_CLAVEJO "
                + "AND TR.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND PO.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND TR.PROCESADO_CLAVE = PO.PROCESADO_CLAVEJO "
                + "AND CP.CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "ORDER BY 1;"; 
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                tramite.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tramite;
    }
    
    public ArrayList findTramiteTablaJO(String proceClave) {
        conn.Conectar();
        tramite = new ArrayList();
        sql = "SELECT T.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ', P.A_PATERNO,' ', P.A_MATERNO), 'JUICIO ORAL', T.FECHA_ACTO_PROCESAL "
                + " FROM DATOS_TRAMITES_ADOJO T, DATOS_PROCESADOS_ADOJO P "
                + " WHERE T.PROCESADO_CLAVE = P.PROCESADO_CLAVEJO "
                + " AND T.PROCESADO_CLAVE='" + proceClave + "'";    
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                tramite.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tramite;
    }
    
    public ArrayList findTramiteJO(String causaClaveJO, String proceClave){
        conn.Conectar();
        tramite = new ArrayList();
        sql = "SELECT * FROM DATOS_TRAMITES_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                tramite.add(new String[]{
                   resul.getString("ESTATUS"),
                    resul.getString("ESPECIFIQUE"), resul.getString("FECHA_ACTO_PROCESAL")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tramite;
    }
    
     public int countTramitesInsertados(String causaClaveJO) {
        try {
            conn.Conectar();
            conteoTram = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_TRAMITES_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' ;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoTram = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoTram;
    }
public int countTramiteProcJO(String causaClaveJO,String ProcesadoClaveJO) {
        try{
            conn.Conectar();
            conteo = 0;
            sql = "SELECT COUNT(*) FROM DATOS_TRAMITES_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND PROCESADO_CLAVE='"+ ProcesadoClaveJO +"'";
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
