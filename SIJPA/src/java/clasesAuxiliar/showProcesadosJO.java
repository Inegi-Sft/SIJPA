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
public class showProcesadosJO {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> proce;
    ArrayList<String> pIngre, pDelito;
    String sql;
    ResultSet resul;
    
    public ArrayList findProcesasdosCausaJCyJO(String causaClaveJC){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PR.PROCESADO_CLAVE, '--' AS PROCESADO_CLAVEJO, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), PR.REINCIDENCIA, PR.SEXO, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJC PR, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE PR.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PR.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND PR.PROCESADO_CLAVE NOT IN(SELECT PROCESADO_CLAVEJC FROM DATOS_PROCESADOS_ADOJO WHERE CAUSA_CLAVEJC = '" + causaClaveJC + "') "
                    + "AND PR.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "UNION ALL "
                    + "SELECT PR.PROCESADO_CLAVEJC, PR.PROCESADO_CLAVEJO, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), RE.DESCRIPCION, S.DESCRIPCION, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJO PR, CATALOGOS_REINCIDENCIA RE, CATALOGOS_SEXO S "
                    + "WHERE PR.REINCIDENCIA = RE.REINCIDENCIA_ID "
                    + "AND PR.SEXO = S.SEXO_ID "
                    + "AND PR.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                    + "ORDER BY 1, 2;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proce.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), 
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
//    public ArrayList findProcesasdosCausaJO(String causaClaveJC, String proceClave){
//        try {
//            conn.Conectar();
//            proce = new ArrayList();
//            sql = "SELECT PR.PROCESADO_CLAVEJO, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), RE.DESCRIPCION, S.DESCRIPCION, PR.FECHA_NACIMIENTO "
//                    + "FROM DATOS_PROCESADOS_ADOJO PR, CATALOGOS_REINCIDENCIA RE, CATALOGOS_SEXO S "
//                    + "WHERE PR.REINCIDENCIA = RE.REINCIDENCIA_ID "
//                    + "AND PR.SEXO = S.SEXO_ID "
//                    + "AND PR.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
//                    + "AND PR.PROCESADO_CLAVEJC = '" + proceClave + "' "
//                    + "ORDER BY 1;";
//            resul = conn.consultar(sql);
//            while (resul.next()) {
//                proce.add(new String[]{
//                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4),
//                    resul.getString(5)
//                });
//            }
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return proce;
//    }
    
    public ArrayList findProcesasdosTablaJO(String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PR.PROCESADO_CLAVEJO, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), RE.DESCRIPCION, S.DESCRIPCION, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJO PR, CATALOGOS_REINCIDENCIA RE, CATALOGOS_SEXO S "
                    + "WHERE PR.REINCIDENCIA = RE.REINCIDENCIA_ID "
                    + "AND PR.SEXO = S.SEXO_ID "
                    + "AND PR.PROCESADO_CLAVEJO = '" + proceClave + "' "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                proce.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3), resul.getString(4),
                    resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findProcesadosJC(String causaClaveJC, String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.* FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_MUNICIPIOS CM "
                    + "WHERE P.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "AND P.PROCESADO_CLAVE = '" + proceClave + "';";
            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("P.NOMBRE"), resul.getString("P.A_PATERNO"), resul.getString("P.A_MATERNO"), resul.getString("P.ALIAS"),
                    resul.getString("P.CURP"), resul.getString("P.FECHA_NACIMIENTO"), resul.getString("P.SEXO"), resul.getString("P.EDAD_DELITO"),
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
                    resul.getString("P.COMENTARIOS"), resul.getString("P.EDAD_INGRESO")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public ArrayList findProcesadosJO(String causaClaveJO, String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT P.* FROM DATOS_PROCESADOS_ADOJO P "
                    + "WHERE P.CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND P.PROCESADO_CLAVEJO = '" + proceClave + "';";
            resul = conn.consultar(sql);
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("P.NOMBRE"), resul.getString("P.A_PATERNO"), resul.getString("P.A_MATERNO"), resul.getString("P.ALIAS"),
                    resul.getString("P.CURP"), resul.getString("P.FECHA_NACIMIENTO"), resul.getString("P.SEXO"), resul.getString("P.EDAD_DELITO"),
                    resul.getString("P.NACIMIENTO_PAIS"), resul.getString("P.NACIMIENTO_ENTIDAD"), resul.getString("P.NACIMIENTO_MUNICIPIO"),
                    resul.getString("P.NACIONALIDAD"), resul.getString("P.RESIDENCIA_PAIS"), resul.getString("P.RESIDENCIA_ENTIDAD"),
                    resul.getString("P.RESIDENCIA_MUNICIPIO"), resul.getString("P.ESTADO_CIVIL"), resul.getString("P.DISCAPACIDAD"),
                    resul.getString("P.CONDICION_ALFABETISMO"), resul.getString("P.ULTIMO_GRADO_ESTUDIOS"), resul.getString("P.CONDICION_ESTUDIANTE"),
                    resul.getString("P.HABLA_ESPANOL"), resul.getString("P.POBLACION_INDIGENA"), resul.getString("P.TIPO_PUEBLO_INDIGENA"),
                    resul.getString("P.HABLA_INDIGENA"), resul.getString("P.FAMILIA_LINGUISTICA"), resul.getString("P.LENGUA_EXTRANJERA"),
                    resul.getString("P.INTERPRETE"), resul.getString("P.INGRESOS"), resul.getString("P.RANGO_INGRESOS"),
                    resul.getString("P.OCUPACION"), resul.getString("P.CONDICION_ACTIVIDAD"), resul.getString("P.GRADO_PARTICIPACION"),
                    resul.getString("P.REINCIDENCIA"), resul.getString("P.ESTADO_PSICOFISICO"), resul.getString("P.DELICTIVO"),
                    resul.getString("P.GRUPO_DELICTIVO"), resul.getString("P.TIPO_DEFENSOR"), resul.getString("P.PERSONA_RESPONSABLE"),
                    resul.getString("P.COMENTARIOS"),resul.getString("P.EDAD_INGRESO")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
    
    public int countProcesadosJO(String causaClaveJO){
        int conteoPro = 0; 
        try{
            conn.Conectar();
            conteoPro = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_PROCESADOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
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
    
    public ArrayList findPIngresosJC(String causaClaveJC, String proceCLave, String ingreso) {
        try {
            conn.Conectar();
            pIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_PFUENTE_INGRESOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
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
    
    public ArrayList findPIngresosJO(String causaClaveJO, String proceCLave, String ingreso) {
        try {
            conn.Conectar();
            pIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_PFUENTE_INGRESOS_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
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
    
    public int findNumVictiJC(String causaClaveJC, String proceCLave, String delitoClave) {
        int numVictiPro = 0;
        try {
            conn.Conectar(); 
            sql = "SELECT NUMERO_VICTIMAS FROM DATOS_PDELITOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
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
    
    public int findNumVictiJO(String causaClaveJO, String proceCLave, String delitoClave) {
        int numVictiPro = 0;
        try {
            conn.Conectar(); 
            sql = "SELECT NUMERO_VICTIMAS FROM DATOS_PDELITOS_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
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
    
    public ArrayList findProcesadoDelitosJO(String causaClaveJO, String proceClave) {
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PD.DELITO_CLAVE, CN.CODIGO "
                    + "FROM DATOS_PDELITOS_ADOJO PD, DATOS_DELITOS_ADOJO D, CATALOGOS_CODIGO_NORMA CN "
                    + "WHERE PD.CAUSA_CLAVEJO = D.CAUSA_CLAVEJO "
                    + "AND PD.DELITO_CLAVE = D.DELITO_CLAVEJO "
                    + "AND D.DELITO_CODIGO_PENAL = CN.ID_CODIGO "
                    + "AND PD.CAUSA_CLAVEJO = '" + causaClaveJO + "' "
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
    
    public ArrayList findPDelitosJC(String causaClave, String proceCLave, String delitoClave) {
        pDelito = new ArrayList();
        try {
            conn.Conectar(); 
            sql = "SELECT DELITO_CLAVE FROM DATOS_PDELITOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceCLave + "' "
                    + "AND DELITO_CLAVE = '" + delitoClave + "';";
            resul = conn.consultar(sql);
            while (resul.next()) {
                pDelito.add(resul.getString("DELITO_CLAVE"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pDelito;
    }
    
    public ArrayList findPDelitosJO(String causaClave, String proceCLave, String delitoClave) {
        pDelito = new ArrayList();
        try {
            conn.Conectar(); 
            sql = "SELECT DELITO_CLAVE FROM DATOS_PDELITOS_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceCLave + "' "
                    + "AND DELITO_CLAVE = '" + delitoClave + "';";
            resul = conn.consultar(sql);
            while (resul.next()) {
                pDelito.add(resul.getString("DELITO_CLAVE"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pDelito;
    }
}
