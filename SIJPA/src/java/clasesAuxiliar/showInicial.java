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
    ArrayList<String[]> ini, vdeli,proceEtapa,mediCau;
    ArrayList<String> list;
    String sql;
    ResultSet resul;
    int conteoIni;
    int totalProcesa;
    
    public ArrayList findInicial(String causaClave, String proceClave) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT * FROM DATOS_ETAPA_INICIAL_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString("AUDIENCIA_INICIAL"), resul.getString("CTRL_DETENCION"), resul.getString("DETENCION_LEGAL"),
                    resul.getString("FECHA_LIBERTAD"), resul.getString("FORMULACION_IMPUTACION"), resul.getString("FECHA_IMPUTACION"),
                    resul.getString("IMPUTADO_DECLARO"), resul.getString("FECHA_DECLARACION"), resul.getString("PLAZO_CONSTITUCIONAL"),
                    resul.getString("TIEMPO_PLAZO"), resul.getString("AUTO_VINCULACION"), resul.getString("FECHA_VINCULACION"),
                    resul.getString("IMPUSO_MCAUTELARES"), resul.getString("INVESTIGACION_COMPLEMENTARIA"), resul.getString("FECHA_PLAZO_INVESTIGACION"),
                    resul.getString("PRORROGA_PLAZO_CIERRE"), resul.getString("PLAZO_CIERRE_INVESTIGACION"), resul.getString("FECHA_CIERRE_INVESTIGACION"),
                    resul.getString("SOBRESEIMIENTO_CAUSAP"), resul.getString("SUSPENSION_PROCESO"), resul.getString("CAUSA_SUSPENSION_PROCESO"),
                    resul.getString("REAPERTURA_PROCESO"), resul.getString("FECHA_REAPERTURA_PROCESO"), resul.getString("SOLICITO_REAPERTURA"),
                    resul.getString("FORMULO_ACUSACION"), resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }
    
    public ArrayList findInicialCausa(String causaClave) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSA.DESCRIPCION, AV.DESCRIPCION, RS.DESCRIPCION, CE.DESCRIPCION "
                + "FROM DATOS_ETAPA_INICIAL_ADOJC EI, DATOS_PROCESADOS_ADOJC P, CATALOGOS_RESPUESTA_SIMPLE RSA, CATALOGOS_AUTO_VINCULACION AV, "
                + "CATALOGOS_RESPUESTA_SIMPLE RS, CATALOGOS_ETAPAS CE "
                + "WHERE EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                + "AND EI.AUDIENCIA_INICIAL = RSA.RESPUESTA_ID "
                + "AND EI.AUTO_VINCULACION = AV.AUTO_ID "
                + "AND EI.SOBRESEIMIENTO_CAUSAP = RS.RESPUESTA_ID "
                + "AND EI.ETAPA = CE.ETAPA_ID "
                + "AND EI.CAUSA_CLAVE = '" + causaClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }

    public ArrayList findInicialTabla(String proceClave) {
        conn.Conectar();
        ini = new ArrayList();
        sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSA.DESCRIPCION, AV.DESCRIPCION, RS.DESCRIPCION, CE.DESCRIPCION "
                + "FROM DATOS_ETAPA_INICIAL_ADOJC EI, DATOS_PROCESADOS_ADOJC P, CATALOGOS_RESPUESTA_SIMPLE RSA, CATALOGOS_AUTO_VINCULACION AV, "
                + "CATALOGOS_RESPUESTA_SIMPLE RS, CATALOGOS_ETAPAS CE "
                + "WHERE EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                + "AND EI.AUDIENCIA_INICIAL = RSA.RESPUESTA_ID "
                + "AND EI.AUTO_VINCULACION = AV.AUTO_ID "
                + "AND EI.SOBRESEIMIENTO_CAUSAP = RS.RESPUESTA_ID "
                + "AND EI.ETAPA = CE.ETAPA_ID "
                + "AND EI.PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                ini.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ini;
    }

    public int countInicial(String causaClave) {
        try {
            conn.Conectar();
            conteoIni = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPA_INICIAL_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoIni = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoIni;
    }

    public ArrayList findVdelitos(String causaClave) {
        conn.Conectar();
        vdeli = new ArrayList();
        sql = "SELECT DISTINCT(DELITO_CLAVE), COUNT(DISTINCT(PROCESADO_CLAVE)), COUNT(DISTINCT(VICTIMA_CLAVE)) "
                + "FROM DATOS_VDELITOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' GROUP BY DELITO_CLAVE;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vdeli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vdeli;
    }

    public int countVdelitos(String causaClave) {
        try {
            conn.Conectar();
            totalProcesa = 0;
            sql = "SELECT NUMERO_PROCESADOS AS TOTAL FROM DATOS_DELITOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                totalProcesa = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalProcesa;
    }
    
    public String verificaSobreAperturaJO(String causaClave, String proceClave) {
        String valor = "", sobre = "", apertura = "";
        try {
            conn.Conectar();
            sql = "SELECT SOBRESEIMIENTO_CAUSAP FROM DATOS_ETAPA_INICIAL_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' AND PROCESADO_CLAVE = '" + proceClave + "';";
            resul = conn.consultar(sql);
            while (resul.next()) {
                sobre = resul.getString("SOBRESEIMIENTO_CAUSAP");
            }
            if(sobre.equals("1")){//condicion para saber si en datos_etapa_inicial seleccionaron sobreseimiento
                valor = "1";//valor del sobreseimiento en el catalogo tipo_resolucion
            }else{
                sql = "SELECT APERTURA_JUICIO_ORAL FROM DATOS_ETAPA_INTERMEDIA_ADOJC "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' AND PROCESADO_CLAVE = '" + proceClave + "';";
                resul = conn.consultar(sql);
                while (resul.next()) {
                    apertura = resul.getString("APERTURA_JUICIO_ORAL");
                }
                if(apertura.equals("1")){//condicion para saber si en datos_etapa_intermedia seleccionaron apertura a JO
                    valor = "5";//valor de apertura a JO en el catalogo tipo_resolucion
                }
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valor;
    }
    
    public ArrayList findProceEtapa(String causaClave, String proceClave){
        proceEtapa = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), ETAPA "
                    + "FROM DATOS_ETAPA_INICIAL_ADOJC EI "
                    + "JOIN DATOS_PROCESADOS_ADOJC P "
                    + "ON EI.CAUSA_CLAVE = P.CAUSA_CLAVE "
                    + "AND EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                    + "WHERE EI.CAUSA_CLAVE = '" + causaClave + "' AND EI.PROCESADO_CLAVE = '" + proceClave + "' "
                    + "ORDER BY 1;";
            System.out.println(sql);
            resul = conn.consultar(sql);
            while (resul.next()) {
                proceEtapa.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proceEtapa;
    }
    
    public ArrayList findCausaEtapa(String causaClave, int etapa){
        proceEtapa = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO) "
                    + "FROM DATOS_ETAPA_INICIAL_ADOJC EI "
                    + "JOIN DATOS_PROCESADOS_ADOJC P "
                    + "ON EI.CAUSA_CLAVE = P.CAUSA_CLAVE "
                    + "AND EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                    + "WHERE EI.CAUSA_CLAVE = '" + causaClave + "' AND EI.ETAPA = " + etapa + " ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proceEtapa.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proceEtapa;
    }
    
    public ArrayList findCausaInter(String causaClave){
        proceEtapa = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO) "
                    + "FROM DATOS_ETAPA_INICIAL_ADOJC EI "
                    + "JOIN DATOS_PROCESADOS_ADOJC P "
                    + "ON EI.CAUSA_CLAVE = P.CAUSA_CLAVE "
                    + "AND EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                    + "WHERE EI.CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND EI.ETAPA REGEXP '1|6|7' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proceEtapa.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proceEtapa;
    }
    
    public ArrayList findCausaInterConclu(String causaClave){
        proceEtapa = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO) "
                    + "FROM DATOS_ETAPA_INICIAL_ADOJC EI "
                    + "JOIN DATOS_PROCESADOS_ADOJC P "
                    + "ON EI.CAUSA_CLAVE = P.CAUSA_CLAVE "
                    + "AND EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                    + "WHERE EI.CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND EI.ETAPA REGEXP '2|6' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proceEtapa.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proceEtapa;
    }
    
    public ArrayList findCausaInterTram(String causaClave){
        proceEtapa = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT EI.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO) "
                    + "FROM DATOS_ETAPA_INICIAL_ADOJC EI "
                    + "JOIN DATOS_PROCESADOS_ADOJC P "
                    + "ON EI.CAUSA_CLAVE = P.CAUSA_CLAVE "
                    + "AND EI.PROCESADO_CLAVE = P.PROCESADO_CLAVE "
                    + "WHERE EI.CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND EI.ETAPA REGEXP '3|7' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proceEtapa.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proceEtapa;
    }
    
    public ArrayList findSolicitaMedi(String causaClave, String proceClave, String solicita){
        mediCau = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT SOLICITA_MEDIDA FROM DATOS_PMEDIDAS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND SOLICITA_MEDIDA = " + solicita + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                mediCau.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mediCau;
    }
    
    public ArrayList findMedidaDura(String causaClave, String proceClave, String solicita, String mediCautelar){
        mediCau = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT CAUTELARES, DURACION_MEDIDA, ESPECIFIQUE FROM DATOS_PMEDIDAS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND SOLICITA_MEDIDA = " + solicita + " "
                    + "AND CAUTELARES = " + mediCautelar + " ;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                mediCau.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mediCau;
    }
    
    public ArrayList findEtapaCausa(String causaClave){
        list = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT ETAPA FROM DATOS_ETAPA_INICIAL_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "ORDER BY 1";
            resul = conn.consultar(sql);
            while (resul.next()) {
                list.add(resul.getString("ETAPA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
