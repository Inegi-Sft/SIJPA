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
    ArrayList<String[]> ini, medioPru;
    String sql;
    ResultSet resul;
    int conteoInter;
    
    public ArrayList findIntermedia(String causaClave, String proceClave) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT * FROM DATOS_ETAPA_INTERMEDIA_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString("FECHA_ESCRITO_ACUSACION"), resul.getString("FECHA_CONTESTACION"), resul.getString("DESCUBRIMIENTO_PROBATORIO"),
                    resul.getString("AUDIENCIA_INTERMEDIA"), resul.getString("FECHA_AUDIENCIA_INTERMEDIA"), resul.getString("SEPARACION_ACUSACION"),
                    resul.getString("PRESENTACION_MPRUEBA"), resul.getString("PRESENTA_MP_MINISTERIO"), resul.getString("PRESENTA_MP_ASESOR"),
                    resul.getString("PRESENTA_MP_DEFENSA"), resul.getString("ACUERDOS_PROBATORIOS"), resul.getString("APERTURA_JUICIO_ORAL"),
                    resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }
    
    public ArrayList findIntermediaCausa(String causa) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EP.PROCESADO_CLAVE, RSI.DESCRIPCION, EP.FECHA_ESCRITO_ACUSACION, RSM.DESCRIPCION, RSP.DESCRIPCION "
                + "FROM DATOS_ETAPA_INTERMEDIA_ADOJC EP, CATALOGOS_RESPUESTA_SIMPLE RSI, CATALOGOS_RESPUESTA_SIMPLE RSE, CATALOGOS_RESPUESTA_SIMPLE RSM, CATALOGOS_RESPUESTA_SIMPLE RSP "
                + "WHERE EP.AUDIENCIA_INTERMEDIA = RSI.RESPUESTA_ID "
                + "AND EP.PRESENTACION_MPRUEBA = RSM.RESPUESTA_ID "
                + "AND EP.ACUERDOS_PROBATORIOS = RSP.RESPUESTA_ID "
                + "AND EP.CAUSA_CLAVE = '" + causa + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }

    public ArrayList findIntermediaTabla(String proceClave) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EP.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSI.DESCRIPCION, EP.FECHA_ESCRITO_ACUSACION, RSM.DESCRIPCION "
                + "FROM DATOS_ETAPA_INTERMEDIA_ADOJC EP, DATOS_PROCESADOS_ADOJC P, CATALOGOS_RESPUESTA_SIMPLE RSI, CATALOGOS_RESPUESTA_SIMPLE RSM "
                + "WHERE EP.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                + "AND EP.AUDIENCIA_INTERMEDIA = RSI.RESPUESTA_ID "
                + "AND EP.PRESENTACION_MPRUEBA = RSM.RESPUESTA_ID "
                + "AND EP.PROCESADO_CLAVE = '" + proceClave + "';";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), 
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showIntermedia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }

    public int countIntermedia(String causaClave) {
        try {
            conn.Conectar();
            conteoInter = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPA_INTERMEDIA_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' AND AUDIENCIA_INTERMEDIA <> -2";
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
    
    public int countTotPasanInicial_Intermedia(String exp) {
        try {
            conn.Conectar();
            conteoInter = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPA_INICIAL_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + exp + "' AND FORMULO_ACUSACION = 1";
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

    public String findProcesadoClave(String causaClave, String proceClave) {
        String valor="";
        int existe = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) AS EXISTE FROM DATOS_ETAPA_INTERMEDIA_ADOJC "
                    + "WHERE CAUSA_CLAVE='" + causaClave + "' AND PROCESADO_CLAVE='" + proceClave + "'";
            System.out.println(sql);
            resul = conn.consultar(sql);
            if (resul.next()) {
                existe = resul.getInt("EXISTE");
                if(existe == 0){//condicion para saber si el procesado entro a etapa intermedia
                    valor="1";//valor de inicial en el catalogo etapa_procesal
                }else{
                    valor="2";//valor de intermedia en el catalogo etapa_procesal
                }
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valor;
    }
    
    public ArrayList findMediosPrueba(String causaClave, String proceClave, String figuraPru, String medioPrueba){
        medioPru = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT MEDIO_PRUEBA, RESOLUCION_PRUEBA FROM DATOS_PRESENTA_MP_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND FIGURA_MPRUEBA = " + figuraPru + " "
                    + "AND MEDIO_PRUEBA = " + medioPrueba + " "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            if(resul.next()) {
               medioPru.add(new String[]{
                   resul.getString(1), resul.getString(2)
               });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return medioPru;
    }
    
    public int countIntermediaProc(String causaClave,String ProcesadoClave) {
        try{
            conn.Conectar();
            conteoInter = 0;
            sql = "SELECT COUNT(*) FROM DATOS_ETAPA_INTERMEDIA_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE='"+ ProcesadoClave +"'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoInter= resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showTramite .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoInter;
    }
}
