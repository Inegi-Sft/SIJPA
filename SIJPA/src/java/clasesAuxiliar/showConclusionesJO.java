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
public class showConclusionesJO {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> conc;
    ArrayList<String> concPA;
    String sql;
    ResultSet resul;
    
    public ArrayList findConclusionJO(String causaClaveJO, String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT * FROM DATOS_CONCLUSIONES_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString("FECHA_CONCLUSION"), resul.getString("TIPO_RESOLUCION"),resul.getString("TIPO_SOBRESEIMIENTO"),
                    resul.getString("PROCEDENCIA_SOBRESEIMIENTO"),resul.getString("EXCLUSION_ACCIONP"),
                    resul.getString("FECHA_SENTENCIA"), resul.getString("TIPO_SENTENCIA"), resul.getString("MEDIDA_PRIVATIVA"),
                    resul.getString("MEDIDA_NOPRIVATIVA"), resul.getString("TIEMPO_INTERNAMIENTO"), resul.getString("REPARACION_DANIO"),
                    resul.getString("TIPO_REPARACION_DANIO"), resul.getString("MONTO_REPARA"), resul.getString("IMPUGNACION"),
                    resul.getString("TIPO_IMPUGNACION"), resul.getString("FECHA_IMPUGNACION"), resul.getString("PERSONA_IMPUGNA"),
                    resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;
    }
    
    public ArrayList findConcluCausaJC(String causaClaveJC) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT CO.PROCESADO_CLAVE, CONCAT(PR.NOMBRE, ' ', PR.A_PATERNO, ' ', PR.A_MATERNO), CO.FECHA_CONCLUSION, CO.TIPO_RESOLUCION "
                + "FROM DATOS_CONCLUSIONES_ADOJC CO, DATOS_PROCESADOS_ADOJC PR "
                + "WHERE CO.CAUSA_CLAVE = PR.CAUSA_CLAVE "
                + "AND CO.PROCESADO_CLAVE = PR.PROCESADO_CLAVE "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND CO.CAUSA_CLAVE = '" + causaClaveJC + "' "
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
    
    public ArrayList findConcluCausaJO(String causaClaveJC, String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT CO.PROCESADO_CLAVE, CONCAT(PR.NOMBRE, ' ', PR.A_PATERNO, ' ', PR.A_MATERNO), CO.FECHA_CONCLUSION, CO.TIPO_RESOLUCION "
                + "FROM DATOS_CONCLUSIONES_ADOJO CO, DATOS_PROCESADOS_ADOJO PR, DATOS_CAUSAS_PENALES_ADOJO CP "
                + "WHERE CO.CAUSA_CLAVEJO = PR.CAUSA_CLAVEJO "
                + "AND CO.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND PR.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND CO.PROCESADO_CLAVE = PR.PROCESADO_CLAVEJO "
                + "AND CP.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                + "AND CO.PROCESADO_CLAVE = '" + proceClave + "' "
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
    
    public ArrayList findConcluTablaJO(String proceClave) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.PROCESADO_CLAVE, CONCAT(P.NOMBRE, ' ', P.A_PATERNO, ' ', P.A_MATERNO), C.FECHA_CONCLUSION, TR.DESCRIPCION "
                + "FROM DATOS_CONCLUSIONES_ADOJO C, DATOS_PROCESADOS_ADOJO P, CATALOGOS_TIPO_RESOLUCION TR "
                + "WHERE C.PROCESADO_CLAVE = P.PROCESADO_CLAVEJO "
                + "AND C.TIPO_RESOLUCION = TR.RESOLUCION_ID "
                + "AND C.PROCESADO_CLAVE = '" + proceClave + "';";
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
    
    public ArrayList findConcluAJO(String causaClaveJO, String proceClave, String deliClave){
        concPA = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT TIPO_SENTENCIA FROM DATOS_DCONCLUSIONES_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND DELITO_CLAVE = '" + deliClave + "' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            if(resul.next()) {
               concPA.add(resul.getString("TIPO_SENTENCIA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return concPA;
    }
    
    public int countConclusionesExpJO(String causaClaveJO) {
        int conteoConclu = 0;
        try{
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_CONCLUSIONES_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";
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
