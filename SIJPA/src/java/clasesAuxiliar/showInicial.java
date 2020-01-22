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

    public ArrayList findInicialTabla(String procesado) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EI.PROCESADO_CLAVE,CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSD.DESCRIPCION, AV.DESCRIPCION, RSS.DESCRIPCION "
                + "FROM DATOS_ETAPA_INICIAL_ADOJC EI, DATOS_PROCESADOS_ADOJC P, CATALOGOS_RESPUESTA_SIMPLE RSD, CATALOGOS_AUTO_VINCULACION AV, CATALOGOS_RESPUESTA_SIMPLE RSS "
                + "WHERE P.PROCESADO_CLAVE=EI.PROCESADO_CLAVE "
                + "AND EI.CTRL_DETENCION = RSD.RESPUESTA_ID "
                + "AND EI.AUTO_VINCULACION = AV.AUTO_ID "
                + "AND EI.SOBRESEIMIENTO_CAUSAP = RSS.RESPUESTA_ID "
                + "AND EI.PROCESADO_CLAVE = '" + procesado + "';";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(1),resul.getString(2), resul.getString(3),
                    resul.getString(4),resul.getString(5)
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
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPA_INICIAL_ADOJC WHERE CAUSA_CLAVE = '" + exp + "'";
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
                + "WHERE CAUSA_CLAVE = '" + exp + "' GROUP BY DELITO_CLAVE;";
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
            sql = "SELECT NUMERO_PROCESADOS AS TOTAL FROM DATOS_DELITOS_ADOJC WHERE CAUSA_CLAVE = '" + exp + "'";
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
    public String verificaSobreseimientoAperturaJO(String exp, String pro) {
        String valor="",sobre="",apertura="";
        try {
            conn.Conectar();
            sql = "SELECT SOBRESEIMIENTO_CAUSAP FROM DATOS_ETAPA_INICIAL_ADOJC WHERE CAUSA_CLAVE='"+exp+"' AND PROCESADO_CLAVE='"+pro+"'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                sobre = resul.getString("SOBRESEIMIENTO_CAUSAP");
            }
            if(sobre.equals("1")){//condicion para saber si en datos_etapa_inicial seleccionaron sobreseimiento
                valor="1";//valor del sobreseimiento en el catalogo tipo_resolucion
            }else{
                sql = "SELECT APERTURA_JUICIO_ORAL FROM DATOS_ETAPA_INTERMEDIA_ADOJC WHERE CAUSA_CLAVE='"+exp+"' AND PROCESADO_CLAVE='"+pro+"'";
                resul = conn.consultar(sql);
                while (resul.next()) {
                    apertura = resul.getString("APERTURA_JUICIO_ORAL");
                }
                if(apertura.equals("1")){//condicion para saber si en datos_etapa_intermedia seleccionaron apertura a JO
                    valor="5";//valor de apertura a JO en el catalogo tipo_resolucion
                }
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valor;
    }
}
