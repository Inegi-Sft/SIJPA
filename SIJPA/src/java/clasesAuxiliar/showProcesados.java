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
 * @author CESAR.OSORIO
 */
public class showProcesados {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> proce;
    ArrayList<String> pIngre;
    String sql;
    ResultSet resul;
    int conteoPro;
    
    public ArrayList findProcesados(String causaClave, String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.* FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_MUNICIPIOS CM "
                    + "WHERE P.CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND P.PROCESADO_CLAVE = '" + proceClave + "';";
            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("P.NOMBRE"), resul.getString("P.A_PATERNO"), resul.getString("P.A_MATERNO"), resul.getString("P.ALIAS"),
                    resul.getString("P.CURP"), resul.getString("P.FECHA_NACIMIENTO"), resul.getString("P.SEXO"), resul.getString("P.EDAD"),
                    resul.getString("P.NACIMIENTO_PAIS"), resul.getString("P.NACIMIENTO_ENTIDAD"), resul.getString("P.NACIMIENTO_MUNICIPIO"),
                    resul.getString("P.NACIONALIDAD"), resul.getString("P.RESIDENCIA_PAIS"), resul.getString("P.RESIDENCIA_ENTIDAD"),
                    resul.getString("P.RESIDENCIA_MUNICIPIO"), resul.getString("P.ESTADO_CIVIL"), resul.getString("P.DISCAPACIDAD"),
                    resul.getString("P.CONDICION_ALFABETISMO"), resul.getString("P.ULTIMO_GRADO_ESTUDIOS"), resul.getString("P.CONDICION_ESTUDIANTE"),
                    resul.getString("P.HABLA_ESPANOL"), resul.getString("P.POBLACION_INDIGENA"), resul.getString("P.TIPO_PUEBLO_INDIGENA"),
                    resul.getString("P.HABLA_INDIGENA"), resul.getString("P.FAMILIA_LINGUISTICA"), resul.getString("P.LENGUA_EXTRANJERA"),
                    resul.getString("P.INTERPRETE"), resul.getString("P.INGRESOS"), resul.getString("P.RANGO_INGRESOS"),
                    resul.getString("P.OCUPACION"), resul.getString("P.CONDICION_ACTIVIDAD"), resul.getString("P.INICIO_IMPUTADO"),
                    resul.getString("P.TIPO_DETENCION"), resul.getString("P.FORMA_CONDUCCION"), resul.getString("P.GRADO_PARTICIPACION"),
                    resul.getString("P.REINCIDENCIA"), resul.getString("P.ESTADO_PSICOFISICO"), resul.getString("P.DELICTIVO"),
                    resul.getString("P.GRUPO_DELICTIVO"), resul.getString("P.TIPO_DEFENSOR"), resul.getString("P.PERSONA_RESPONSABLE"),
                    resul.getString("P.COMENTARIOS")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findProcesasdosCausa(String causaClve){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), TC.DESCRIPCION, S.DESCRIPCION,P.FECHA_NACIMIENTO"
                    + " FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_CONSIGNACION TC, CATALOGOS_SEXO S"
                    + " WHERE P.INICIO_IMPUTADO = TC.CONSIGNACION_ID"
                    + " AND P.SEXO = S.SEXO_ID"
                    + " AND P.CAUSA_CLAVE = '" + causaClve + "'"
                    + " ORDER BY 1;";
            
            resul = conn.consultar(sql);
            while (resul.next()) {
                proce.add(new String[]{
                    resul.getString(1),resul.getString(2),resul.getString(3),resul.getString(4),resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findProcesasdosTabla(String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.PROCESADO_CLAVE, CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO), TC.DESCRIPCION, S.DESCRIPCION,P.FECHA_NACIMIENTO"
                    + " FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_CONSIGNACION TC, CATALOGOS_SEXO S"
                    + " WHERE P.INICIO_IMPUTADO = TC.CONSIGNACION_ID"
                    + " AND P.SEXO = S.SEXO_ID"
                    + " AND P.PROCESADO_CLAVE = '" + proceClave + "'"
                    + " ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proce.add(new String[]{
                    resul.getString(1),resul.getString(2),resul.getString(3),resul.getString(4),resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
  
    public int countProcesados(String causaClave){
        try{
            conn.Conectar();
            conteoPro = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_PROCESADOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND NOMBRE <> -2";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoPro = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoPro;
    }
    
    public ArrayList listProcesadoInsertConclusion(String causaClave) {
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.PROCESADO_CLAVE, P.NOMBRE,P.A_PATERNO,P.A_MATERNO "
                    + " FROM DATOS_PROCESADOS_ADOJC P,DATOS_ETAPA_INICIAL_ADOJC INI"
                    + " WHERE P.PROCESADO_CLAVE=INI.PROCESADO_CLAVE"
                    + " AND P.CAUSA_CLAVE='"+causaClave+"'"
                    + " AND NOT INI.FECHA_CIERRE_INVESTIGACION='1699-09-09'"//Fecha En Proceso
                    + " AND NOT INI.REAPERTURA_PROCESO IN (2,9)"// No, No identificado
                    + " AND NOT INI.AUDIENCIA_INICIAL IN (2,9)"// No, No identificado
                    + " AND P.PROCESADO_CLAVE NOT IN ( SELECT ITM.PROCESADO_CLAVE FROM DATOS_ETAPA_INTERMEDIA_ADOJC ITM "
                                                    + " WHERE ITM.AUDIENCIA_INTERMEDIA IN (2,9) AND CAUSA_CLAVE='"+causaClave+"')"//No,No identificado
                    + " AND P.PROCESADO_CLAVE NOT IN ( SELECT C.PROCESADO_CLAVE FROM DATOS_CONCLUSIONES_ADOJC C "
                                                    + " WHERE C.CAUSA_CLAVE='"+causaClave+"')"//Que no este agregado en Conclusiones
                    + " AND P.PROCESADO_CLAVE NOT IN ( SELECT T.PROCESADO_CLAVE FROM DATOS_TRAMITES_ADOJC T "
                                                    + " WHERE T.CAUSA_CLAVE='"+causaClave+"')"//Que no este agregado en Tramite
                    + " ORDER BY P.PROCESADO_CLAVE";

            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("PROCESADO_CLAVE"), resul.getString("NOMBRE")+" "+resul.getString("A_PATERNO")+" "+resul.getString("A_MATERNO")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList listProcesadoInsertTramite(String causaClave) {
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.PROCESADO_CLAVE, P.NOMBRE,P.A_PATERNO,P.A_MATERNO"
                    + " FROM DATOS_PROCESADOS_ADOJC P, DATOS_ETAPA_INICIAL_ADOJC INI"
                    + " WHERE P.PROCESADO_CLAVE=INI.PROCESADO_CLAVE"
                    + " AND P.CAUSA_CLAVE='"+causaClave+"'"
                    + " AND NOT INI.SOBRESEIMIENTO_CAUSAP=1"//sobreseimiento: Si
                    + " AND P.PROCESADO_CLAVE NOT IN (SELECT ITM.PROCESADO_CLAVE FROM DATOS_ETAPA_INTERMEDIA_ADOJC ITM "
                                                    + " WHERE ITM.APERTURA_JUICIO_ORAL=1 AND CAUSA_CLAVE='"+causaClave+"')"//Apertura JO: Si
                    + " AND P.PROCESADO_CLAVE NOT IN ( SELECT C.PROCESADO_CLAVE FROM DATOS_CONCLUSIONES_ADOJC C "
                                                    + " WHERE C.CAUSA_CLAVE='"+causaClave+"')"//Que no este agregado en Conclusiones
                    + " AND P.PROCESADO_CLAVE NOT IN ( SELECT T.PROCESADO_CLAVE FROM DATOS_TRAMITES_ADOJC T "
                                                    + " WHERE T.CAUSA_CLAVE='"+causaClave+"')"//Que no este agregado en Tramite
                    + " ORDER BY P.PROCESADO_CLAVE";

            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("PROCESADO_CLAVE"), resul.getString("NOMBRE")+" "+resul.getString("A_PATERNO")+" "+resul.getString("A_MATERNO")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findProcesadoDelitos(String causaClave, String proceClave) {
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PD.DELITO_CLAVE, CN.CODIGO FROM DATOS_PDELITOS_ADOJC PD, DATOS_DELITOS_ADOJC D, CATALOGOS_CODIGO_NORMA CN "
                    + "WHERE PD.CAUSA_CLAVE = D.CAUSA_CLAVE AND PD.DELITO_CLAVE=D.DELITO_CLAVE "
                    + "AND D.DELITO_CODIGO_PENAL = CN.ID_CODIGO "
                    + "AND PD.CAUSA_CLAVE= '" + causaClave + "' "
                    + "AND PD.PROCESADO_CLAVE = '" + proceClave + "';";

            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findPIngresos(String causaClave, String proceCLave, String ingreso) {
        try {
            conn.Conectar();
            pIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_PFUENTE_INGRESOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceCLave + "' "
                    + "AND INGRESO = " + ingreso + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                pIngre.add(resul.getString("INGRESO"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pIngre;
    }
    
    public int findPDelitos(String causaClave, String proceCLave, String delitoClave) {
        int numVictiPro = 0;
        try {
            conn.Conectar(); 
            sql = "SELECT NUMERO_VICTIMAS FROM DATOS_PDELITOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceCLave + "' "
                    + "AND DELITO_CLAVE = '" + delitoClave + "';";
            resul = conn.consultar(sql);
            while (resul.next()) {
                numVictiPro = resul.getInt("NUMERO_VICTIMAS");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numVictiPro;
    }
    
}
