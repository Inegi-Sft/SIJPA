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
public class showInicial {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> ini, vdeli;
    String sql;
    ResultSet resul;
    int conteoIni;
    int totalProcesa;

    public ArrayList findInicialTabla(String inicia) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EP.PROCESADO_CLAVE, RSD.DESCRIPCION, RSL.DESCRIPCION, RSDE.DESCRIPCION, ep.FECHA_CIERRE_INVESTIGACION "
                + "FROM DATOS_ETAPAPROC_ADOJC EP, CATALOGOS_RESPUESTA_SIMPLE RSD, CATALOGOS_RESPUESTA_SIMPLE RSL, CATALOGOS_RESPUESTA_SIMPLE RSDE "
                + "WHERE EP.CTRL_DETENCION = RSD.RESPUESTA_ID "
                + "AND EP.DETENCION_LEGAL = RSL.RESPUESTA_ID "
                + "AND EP.ADOLESCENTE_DECLARO = RSDE.RESPUESTA_ID "
                + "AND EP.PROCESADO_CLAVE = '" + inicia + "';";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;

    }

    public int countInicial(String exp) {
        try {
            conn.Conectar();
            conteoIni = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPAPROC_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoIni = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoIni;
    }

    public ArrayList findVdelitos(String exp) {
        conn.Conectar();
        vdeli = new ArrayList();
        sql = "SELECT DISTINCT(DELITO_CLAVE), COUNT(DISTINCT(PROCESADO_CLAVE)), COUNT(DISTINCT(VICTIMA_CLAVE)) FROM DATOS_VDELITOS_ADOJC "
                + "WHERE EXPEDIENTE_CLAVE = '" + exp + "' GROUP BY DELITO_CLAVE;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vdeli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vdeli;
    }

    public int countVdelitos(String exp) {
        try {
            conn.Conectar();
            totalProcesa = 0;
            sql = "SELECT NUMERO_PROCESADOS AS TOTAL FROM DATOS_DELITOS_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                totalProcesa = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalProcesa;
    }
}
