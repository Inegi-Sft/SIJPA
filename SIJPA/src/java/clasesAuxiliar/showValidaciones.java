/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

/**
 *
 * @author FERMIN.GOMEZ
 */
import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class showValidaciones {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet resul;
    
    public ArrayList Imputados_Faltantes(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT * FROM( "
                + "SELECT JUZGADO_CLAVE, CAUSA_CLAVE, TOTAL_PROCESADOS, COMPETENCIA FROM DATOS_CAUSAS_PENALES_ADOJC ORDER BY  1 ) A "
                + "INNER JOIN( "
                + "SELECT CAUSA_CLAVE, COUNT(*) FALTAN FROM DATOS_PROCESADOS_ADOJC WHERE NOMBRE='-2' GROUP BY CAUSA_CLAVE  ORDER BY 1 ) B "
                + " ON (A.CAUSA_CLAVE = B.CAUSA_CLAVE) WHERE A.COMPETENCIA=1";
        }else{
            sql = "SELECT A.JUZGADO_CLAVEJO, A.CAUSA_CLAVEJO, A.TOT_P, A.TOT_P - IFNULL(B.EXISTEN,0) FALTAN FROM( "
                + "SELECT JUZGADO_CLAVEJO, CAUSA_CLAVEJO, TOTAL_PROCESADOS TOT_P FROM DATOS_CAUSAS_PENALES_ADOJO ORDER BY  1 ) A "
                + "LEFT JOIN( "
                + "SELECT CAUSA_CLAVEJO, COUNT(*) EXISTEN FROM DATOS_PROCESADOS_ADOJO GROUP BY CAUSA_CLAVEJO  ORDER BY 1 ) B "
                + "ON (A.CAUSA_CLAVEJO = B.CAUSA_CLAVEJO) WHERE (A.TOT_P - IFNULL(B.EXISTEN,0)) <> 0";
            
        }
        
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1),resul.getString(2),resul.getString(3),resul.getString("FALTAN"),
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList Delitos_Faltantes(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT * FROM( "
                + "SELECT JUZGADO_CLAVE, CAUSA_CLAVE, TOTAL_DELITOS,COMPETENCIA FROM DATOS_CAUSAS_PENALES_ADOJC ORDER BY  1 ) A "
                + "INNER JOIN( "
                + "SELECT CAUSA_CLAVE, COUNT(*) FALTAN FROM DATOS_DELITOS_ADOJC WHERE DELITO_CODIGO_PENAL=-2 GROUP BY CAUSA_CLAVE  ORDER BY 1 ) B "
                + "ON A.CAUSA_CLAVE = B.CAUSA_CLAVE WHERE A.COMPETENCIA=1";
        }else{
            sql = "SELECT A.JUZGADO_CLAVEJO, A.CAUSA_CLAVEJO, A.TOT_D, A.TOT_D - IFNULL(B.EXISTEN,0) FALTAN FROM( "
                + "SELECT JUZGADO_CLAVEJO, CAUSA_CLAVEJO, TOTAL_DELITOS TOT_D FROM DATOS_CAUSAS_PENALES_ADOJO ORDER BY  1 ) A "
                + "LEFT JOIN( "
                + "SELECT CAUSA_CLAVEJO, COUNT(*) EXISTEN FROM DATOS_DELITOS_ADOJO GROUP BY CAUSA_CLAVEJO  ORDER BY 1 ) B "
                + "ON A.CAUSA_CLAVEJO = B.CAUSA_CLAVEJO WHERE (A.TOT_D - IFNULL(B.EXISTEN,0)) <> 0";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString("FALTAN")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Victimas_Faltantes(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT * FROM( "
                + "SELECT JUZGADO_CLAVE, CAUSA_CLAVE, TOTAL_VICTIMAS,COMPETENCIA FROM DATOS_CAUSAS_PENALES_ADOJC ORDER BY  1 ) A "
                + "INNER JOIN( "
                + "SELECT CAUSA_CLAVE, COUNT(*) FALTAN FROM DATOS_VICTIMAS_ADOJC WHERE TIPO_VICTIMA=-2 GROUP BY CAUSA_CLAVE  ORDER BY 1 ) B "
                + "ON A.CAUSA_CLAVE = B.CAUSA_CLAVE WHERE A.COMPETENCIA=1";
        }else{
            sql = "SELECT A.JUZGADO_CLAVEJO, A.CAUSA_CLAVEJO, A.TOT_V, A.TOT_V - IFNULL(B.EXISTEN,0) FALTAN FROM( "
                + "SELECT JUZGADO_CLAVEJO, CAUSA_CLAVEJO, TOTAL_VICTIMAS TOT_V FROM DATOS_CAUSAS_PENALES_ADOJO ORDER BY  1 ) A "
                + "LEFT JOIN( "
                + "SELECT CAUSA_CLAVEJO, COUNT(*) EXISTEN FROM DATOS_VICTIMAS_ADOJO GROUP BY CAUSA_CLAVEJO  ORDER BY 1 ) B "
                + "ON A.CAUSA_CLAVEJO = B.CAUSA_CLAVEJO WHERE (A.TOT_V - IFNULL(B.EXISTEN,0)) <> 0";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString("FALTAN")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Imputados_Faltan_C_o_T(String sistema){
        conn.Conectar();
        lista = new ArrayList<>(); 
        
        if(sistema.equals("JC")){
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) J_CLAVE, CAUSA_CLAVE, PROCESADO_CLAVE "
                + "FROM DATOS_PROCESADOS_ADOJC WHERE PROCESADO_CLAVE "
                + "NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_CONCLUSIONES_ADOJC) AND PROCESADO_CLAVE "
                + "NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_TRAMITES_ADOJC)";
        }else{
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) J_CLAVE, CAUSA_CLAVEJO, PROCESADO_CLAVEJO "
                + "FROM DATOS_PROCESADOS_ADOJO WHERE PROCESADO_CLAVEJO "
                + "NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_CONCLUSIONES_ADOJO) AND PROCESADO_CLAVEJO "
                + "NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_TRAMITES_ADOJO)";
        } 
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Victima_Delito(String sistema){
        conn.Conectar();
        lista = new ArrayList<>(); 
        
        if(sistema.equals("JC")){
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) J_CLAVE, CAUSA_CLAVE, VICTIMA_CLAVE "
                + "FROM DATOS_VICTIMAS_ADOJC WHERE VICTIMA_CLAVE " 
                + "NOT IN(SELECT DISTINCT VICTIMA_CLAVE FROM DATOS_VDELITOS_ADOJC) ORDER BY 1";
        }else{
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) J_CLAVE, CAUSA_CLAVEJO, VICTIMA_CLAVEJO "
                + "FROM DATOS_VICTIMAS_ADOJO WHERE VICTIMA_CLAVEJO " 
                + "NOT IN(SELECT DISTINCT VICTIMA_CLAVE FROM DATOS_VDELITOS_ADOJO) ORDER BY 1";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Imputado_Delito(String sistema){
        conn.Conectar();
        lista = new ArrayList<>(); 
        
        if(sistema.equals("JC")){
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) JUZGADO_CLAVE, CAUSA_CLAVE, PROCESADO_CLAVE "
                + "FROM DATOS_PROCESADOS_ADOJC WHERE PROCESADO_CLAVE " 
                + "NOT IN(SELECT DISTINCT PROCESADO_CLAVE FROM DATOS_PDELITOS_ADOJC) ORDER BY 1";
        }else{
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) JUZGADO_CLAVE, CAUSA_CLAVEJO, PROCESADO_CLAVEJO "
                + "FROM DATOS_PROCESADOS_ADOJO WHERE PROCESADO_CLAVEJO " 
                + "NOT IN(SELECT DISTINCT PROCESADO_CLAVE FROM DATOS_PDELITOS_ADOJO) ORDER BY 1";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Fecha_Ingreso(String sistema){
        conn.Conectar();
        lista = new ArrayList<>(); 
        
        if(sistema.equals("JC")){
            sql = "SELECT JUZGADO_CLAVE, CAUSA_CLAVE, FECHA_INGRESO FROM DATOS_CAUSAS_PENALES_ADOJC "
                + "WHERE NOT FECHA_INGRESO ='1899-09-09' AND (FECHA_INGRESO < '1900-01-01' OR FECHA_INGRESO > CURDATE())";
        }else{
            sql = "SELECT JUZGADO_CLAVEJO, CAUSA_CLAVEJO, FECHA_INGRESOJO FROM DATOS_CAUSAS_PENALES_ADOJO "
                + "WHERE NOT FECHA_INGRESOJO ='1899-09-09' AND (FECHA_INGRESOJO < '1900-01-01' OR FECHA_INGRESOJO > CURDATE())";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList Fecha_Ocurrencia(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT E.JUZGADO_CLAVE, E.CAUSA_CLAVE, D.DELITO_CLAVE, D.FECHA_OCURRENCIA, E.FECHA_INGRESO FROM DATOS_DELITOS_ADOJC D "
                + "INNER JOIN DATOS_CAUSAS_PENALES_ADOJC E ON D.CAUSA_CLAVE = E.CAUSA_CLAVE "
                + "WHERE D.FECHA_OCURRENCIA <> '1899-09-09' AND D.FECHA_OCURRENCIA <> '1799-09-09' "
                + "AND E.FECHA_INGRESO <> '1899-09-09' AND D.FECHA_OCURRENCIA > E.FECHA_INGRESO";
        }else{
            sql = "SELECT E.JUZGADO_CLAVEJO, E.CAUSA_CLAVEJO, D.DELITO_CLAVEJO, D.FECHA_OCURRENCIA, E.FECHA_INGRESOJO FROM DATOS_DELITOS_ADOJO D "
                + "INNER JOIN DATOS_CAUSAS_PENALES_ADOJO E ON D.CAUSA_CLAVEJO = E.CAUSA_CLAVEJO "
                + "WHERE D.FECHA_OCURRENCIA <> '1899-09-09' AND D.FECHA_OCURRENCIA <> '1799-09-09' "
                + "AND E.FECHA_INGRESOJO <> '1899-09-09' AND D.FECHA_OCURRENCIA > E.FECHA_INGRESOJO";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(3), resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Fecha_Conclusion(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT E.JUZGADO_CLAVE, E.CAUSA_CLAVE, C.PROCESADO_CLAVE, C.FECHA_CONCLUSION, E.FECHA_INGRESO FROM DATOS_CAUSAS_PENALES_ADOJC E "
                + "INNER JOIN DATOS_CONCLUSIONES_ADOJC C ON E.CAUSA_CLAVE = C.CAUSA_CLAVE "
                + "WHERE C.FECHA_CONCLUSION <> '1899-09-09' AND C.FECHA_CONCLUSION <> '1799-09-09' "
                + "AND C.FECHA_CONCLUSION <= E.FECHA_INGRESO";
        }else{
            sql = "SELECT E.JUZGADO_CLAVEJO, E.CAUSA_CLAVEJO, C.PROCESADO_CLAVE, C.FECHA_CONCLUSION, E.FECHA_INGRESOJO FROM DATOS_CAUSAS_PENALES_ADOJO E "
                + "INNER JOIN DATOS_CONCLUSIONES_ADOJO C ON E.CAUSA_CLAVEJO = C.CAUSA_CLAVEJO "
                + "WHERE C.FECHA_CONCLUSION <> '1899-09-09' AND C.FECHA_CONCLUSION <> '1799-09-09' "
                + "AND C.FECHA_CONCLUSION <= E.FECHA_INGRESOJO";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(3), resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Fecha_Tramite(String sistema){
        conn.Conectar();
        lista = new ArrayList<>(); 
        if(sistema.equals("JC")){
            sql = "SELECT E.JUZGADO_CLAVE, E.CAUSA_CLAVE, T.PROCESADO_CLAVE, T.FECHA_ACTO_PROCESAL, E.FECHA_INGRESO FROM DATOS_CAUSAS_PENALES_ADOJC E "
                + "INNER JOIN DATOS_TRAMITES_ADOJC T ON E.CAUSA_CLAVE = T.CAUSA_CLAVE "
                + "WHERE T.FECHA_ACTO_PROCESAL <> '1899-09-09' AND T.FECHA_ACTO_PROCESAL <> '1799-09-09' "
                + "AND T.FECHA_ACTO_PROCESAL < E.FECHA_INGRESO";
        }else{
            sql = "SELECT E.JUZGADO_CLAVEJO, E.CAUSA_CLAVEJO, T.PROCESADO_CLAVE, T.FECHA_ACTO_PROCESAL, E.FECHA_INGRESOJO FROM DATOS_CAUSAS_PENALES_ADOJO E "
                + "INNER JOIN DATOS_TRAMITES_ADOJO T ON E.CAUSA_CLAVEJO = T.CAUSA_CLAVEJO "
                + "WHERE T.FECHA_ACTO_PROCESAL <> '1899-09-09' AND T.FECHA_ACTO_PROCESAL <> '1799-09-09' "
                + "AND T.FECHA_ACTO_PROCESAL < E.FECHA_INGRESOJO";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(3), resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList Fecha_Impugnacion(String sistema){
        conn.Conectar();
        lista = new ArrayList<>();
        
        if(sistema.equals("JC")){
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) JUZGADO_CLAVE, "
                + "CAUSA_CLAVE, PROCESADO_CLAVE, FECHA_IMPUGNACION, FECHA_CONCLUSION "
                + "FROM DATOS_CONCLUSIONES_ADOJC WHERE FECHA_IMPUGNACION <> '1899-09-09' "
                + "AND FECHA_IMPUGNACION <> '1799-09-09' AND FECHA_IMPUGNACION < FECHA_CONCLUSION";
        }else{
            sql = "SELECT CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) JUZGADO_CLAVE, "
                + "CAUSA_CLAVEJO, PROCESADO_CLAVE, FECHA_IMPUGNACION, FECHA_CONCLUSION "
                + "FROM DATOS_CONCLUSIONES_ADOJO WHERE FECHA_IMPUGNACION <> '1899-09-09' "
                + "AND FECHA_IMPUGNACION <> '1799-09-09' AND FECHA_IMPUGNACION < FECHA_CONCLUSION";
        }
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(3), resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
}
