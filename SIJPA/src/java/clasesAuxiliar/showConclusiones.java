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
public class showConclusiones {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> conc;
    ArrayList<String> concPA;
    String sql;
    ResultSet resul;
    int conteoConclu;

    public ArrayList findConclusion(String causaClave, String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT * FROM DATOS_CONCLUSIONES_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString("FECHA_CONCLUSION"), resul.getString("TIPO_RESOLUCION"),resul.getString("TIPO_SOBRESEIMIENTO"),
                    resul.getString("PROCEDENCIA_SOBRESEIMIENTO"),resul.getString("EXCLUSION_ACCIONP"),resul.getString("SUSPENCION_CONDICIONAL"),
                    resul.getString("FECHA_SUSPENCION"), resul.getString("MECANISMO_ACUERDO"), resul.getString("FECHA_ACUERDO"),
                    resul.getString("TIPO_CONCLUSION_PA"), resul.getString("MEDIDA_PRIVATIVA"), resul.getString("MEDIDA_NOPRIVATIVA"),
                    resul.getString("TIEMPO_INTERNAMIENTO"), resul.getString("REPARACION_DANIO"), resul.getString("TIPO_REPARACION_DANIO"),
                    resul.getString("MONTO_REPARA"), resul.getString("IMPUGNACION"), resul.getString("TIPO_IMPUGNACION"),
                    resul.getString("FECHA_IMPUGNACION"), resul.getString("PERSONA_IMPUGNA"), resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;
    }
    
    public ArrayList findConcluCausa(String causaClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.PROCESADO_CLAVE, C.FECHA_CONCLUSION, C.PROCESADO_CLAVE, CAT.DESCRIPCION "
                + "FROM DATOS_CONCLUSIONES_ADOJC C, CATALOGOS_TIPO_RESOLUCION CAT "
                + "WHERE C.TIPO_RESOLUCION=CAT.RESOLUCION_ID "
                + "AND CAUSA_CLAVE = '" + causaClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString(1), resul.getString(2),resul.getString(3),resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;

    }
    
    public ArrayList findConcluTabla(String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.PROCESADO_CLAVE, CONCAT(P.NOMBRE, ' ', P.A_PATERNO, ' ', P.A_MATERNO), C.FECHA_CONCLUSION, TR.DESCRIPCION "
                + " FROM DATOS_CONCLUSIONES_ADOJC C, DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_RESOLUCION TR"
                + " WHERE C.PROCESADO_CLAVE=P.PROCESADO_CLAVE"
                + " AND C.TIPO_RESOLUCION=TR.RESOLUCION_ID"
                + " AND C.PROCESADO_CLAVE='" + proceClave + "'";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString(1), resul.getString(2),resul.getString(3),resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;
    }
    
    public ArrayList findConcluProce(String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.PROCESADO_CLAVE, CONCAT(P.NOMBRE, ' ', P.A_PATERNO, ' ', P.A_MATERNO), C.FECHA_CONCLUSION, TR.DESCRIPCION "
                + " FROM DATOS_CONCLUSIONES_ADOJC C, DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_RESOLUCION TR"
                + " WHERE C.PROCESADO_CLAVE=P.PROCESADO_CLAVE"
                + " AND C.TIPO_RESOLUCION=TR.RESOLUCION_ID"
                + " AND C.PROCESADO_CLAVE='" + proceClave + "';";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString(1), resul.getString(2)+" "+resul.getString(3)+" "+resul.getString(4)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;
    }
    
    public int countConclusionesExp(String causaClave) {
        try{
            conn.Conectar();
            conteoConclu = 0;
            sql = "SELECT COUNT(*) FROM DATOS_CONCLUSIONES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoConclu = resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showConclusiones .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoConclu;
    }
    
    public ArrayList findConcluPA(String causaClave, String proceClave, String deliClave){
        concPA = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT TIPO_CONCLUSION_PA FROM DATOS_DCONCLUSIONES_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND DELITO_CLAVE = '" + deliClave + "' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            if(resul.next()) {
               concPA.add(resul.getString("TIPO_CONCLUSION_PA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return concPA;
    }
    
    public int countConclusionesProc(String causaClave,String procesadoClave) {
        try{
            conn.Conectar();
            conteoConclu = 0;
            sql = "SELECT COUNT(*) FROM DATOS_CONCLUSIONES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'"
                    + "AND PROCESADO_CLAVE='"+ procesadoClave +"'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoConclu = resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showConclusiones .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoConclu;
    }
    
}
