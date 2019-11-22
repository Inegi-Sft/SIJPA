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
public class showIntermedia {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> ini;
    String sql;
    ResultSet resul;
    int conteoInter;

    public ArrayList findIntermediaTabla(String inicia) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EP.PROCESADO_CLAVE, RSI.DESCRIPCION, RSE.DESCRIPCION, RSM.DESCRIPCION, RSP.DESCRIPCION "
                + "FROM DATOS_ETAPAPROC_ADOJC EP, CATALOGOS_RESPUESTA_SIMPLE RSI, CATALOGOS_RESPUESTA_SIMPLE RSE, CATALOGOS_RESPUESTA_SIMPLE RSM, CATALOGOS_RESPUESTA_SIMPLE RSP "
                + "WHERE EP.AUDIENCIA_INTERMEDIA = RSI.RESPUESTA_ID "
                + "AND EP.CORRECCION_ESCRITO_ACUSACION = RSE.RESPUESTA_ID "
                + "AND EP.PRESENTACION_PRUEBAS = RSM.RESPUESTA_ID "
                + "AND EP.ACUERDO_PROBATORIO = RSP.RESPUESTA_ID "
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

    public int countIntermedia(String exp) {
        try {
            conn.Conectar();
            conteoInter = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPAPROC_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "' AND AUDIENCIA_INTERMEDIA <> -2";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoInter = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoInter;
    }

}
