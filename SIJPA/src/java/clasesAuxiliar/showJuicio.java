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
public class showJuicio {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> juicio;
    String sql;
    ResultSet resul;
    int totProcesa;
    
    public ArrayList findProceJuicioJC(String causaClaveJC){
        try {
            conn.Conectar();
            juicio = new ArrayList();
            sql = "SELECT PR.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO) "
                    + "FROM DATOS_PROCESADOS_ADOJC PR, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE PR.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PR.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND PR.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                juicio.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return juicio;
    }
    
    public ArrayList findProceJuicioJO(String proceClave){
        try {
            conn.Conectar();
            juicio = new ArrayList();
            sql = "SELECT EO.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSM.DESCRIPCION, RSI.DESCRIPCION, RSS.DESCRIPCION, RSF.DESCRIPCION "
                + "FROM DATOS_ETAPA_ORAL_ADOJO EO, DATOS_PROCESADOS_ADOJO P, CATALOGOS_RESPUESTA_SIMPLE RSM, CATALOGOS_RESPUESTA_SIMPLE RSI, CATALOGOS_RESPUESTA_SIMPLE RSS, CATALOGOS_RESPUESTA_SIMPLE RSF "
                + "WHERE EO.PROCESADO_CLAVE = P.PROCESADO_CLAVEJO "
                + "AND EO.MEDIDAS_DISCIPLINARIAS = RSM.RESPUESTA_ID "
                + "AND EO.INCIDENTES_AUDIENCIA = RSI.RESPUESTA_ID "
                + "AND EO.SUSPENCION_AUDIENCIA = RSS.RESPUESTA_ID "
                + "AND EO.DELIBERACION = RSF.RESPUESTA_ID "
                + "AND EO.PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                juicio.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4),
                    resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return juicio;
    }
    public int countProcesadosOral(String causaClave) {
        try {
            conn.Conectar();
            totProcesa = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_ETAPA_ORAL_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClave + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                totProcesa = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totProcesa;
    }
    
    public ArrayList findOralTabla(String proceClave) {
        conn.Conectar();
        juicio = new ArrayList();
        sql = "SELECT EO.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), RSM.DESCRIPCION, RSI.DESCRIPCION, RSS.DESCRIPCION, RSF.DESCRIPCION "
                + "FROM DATOS_ETAPA_ORAL_ADOJO EO, DATOS_PROCESADOS_ADOJO P, CATALOGOS_RESPUESTA_SIMPLE RSM, CATALOGOS_RESPUESTA_SIMPLE RSI, CATALOGOS_RESPUESTA_SIMPLE RSS, CATALOGOS_RESPUESTA_SIMPLE RSF "
                + "WHERE EO.PROCESADO_CLAVE = P.PROCESADO_CLAVEJO "
                + "AND EO.MEDIDAS_DISCIPLINARIAS = RSM.RESPUESTA_ID "
                + "AND EO.INCIDENTES_AUDIENCIA = RSI.RESPUESTA_ID "
                + "AND EO.SUSPENCION_AUDIENCIA = RSS.RESPUESTA_ID "
                + "AND EO.DELIBERACION = RSF.RESPUESTA_ID "
                + "AND EO.PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                juicio.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return juicio;
    }
    
    public ArrayList findAllEtapaOral(String causaClave, String proceClave) {
        conn.Conectar();
        juicio = new ArrayList();
        sql = "SELECT * FROM DATOS_ETAPA_ORAL_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                juicio.add(new String[]{
                    resul.getString("FECHA_APERTURA_JUICIOORAL"), resul.getString("FECHA_AUDIENCIA_JUICIO"), resul.getString("MEDIDAS_DISCIPLINARIAS"),
                    resul.getString("TIPO_DISCIPLINARIA"), resul.getString("INCIDENTES_AUDIENCIA"), resul.getString("FECHA_RESOLUCION_INCIDENTE"),
                    resul.getString("PROMUEVE_INCIDENTE"), resul.getString("PD_TESTIMONIAL"), resul.getString("PD_PERICIAL"),
                    resul.getString("PD_DECLARACION_ACUSADO"), resul.getString("PD_DOCUMENTAL_MATERIAL"), resul.getString("PD_OTRA_PRUEBA"),
                    resul.getString("SUSPENCION_AUDIENCIA"), resul.getString("FECHA_SUSPENCION"), resul.getString("FECHA_REANUDACION"),
                    resul.getString("DELIBERACION"), resul.getString("FECHA_DELIBERACION"), resul.getString("SENTIDO_FALLO"),resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return juicio;
    }
}
