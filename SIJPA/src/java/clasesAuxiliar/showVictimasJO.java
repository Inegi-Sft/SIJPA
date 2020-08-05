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
public class showVictimasJO {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> vic, vicProce;
    ArrayList<String> vicDelito, vicIngre, vP;
    String sql;
    ResultSet resul;
    int conteoVic;
    
    public ArrayList findVictimasCausaJC(String causaClaveJC) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT DISTINCT VI.VICTIMA_CLAVE, VI.TIPO_VICTIMA, VI.SEXO, VI.FECHA_NACIMIENTO, CONCAT(VI.NACIMIENTO_MUNICIPIO,',',VI.NACIMIENTO_ENTIDAD,',',VI.NACIMIENTO_PAIS) "
                + "FROM DATOS_VICTIMAS_ADOJC VI, DATOS_VDELITOS_ADOJC VD, DATOS_PDELITOS_ADOJC PD, DATOS_CONCLUSIONES_ADOJC CO "
                + "WHERE VI.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                + "AND VI.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                + "AND VI.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND VD.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                + "AND VD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND VI.VICTIMA_CLAVE = VD.VICTIMA_CLAVE "
                + "AND VD.DELITO_CLAVE = PD.DELITO_CLAVE "
                + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND VI.CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public ArrayList findVictimasCausaJO(String causaClaveJC, String victimaCLave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT VI.VICTIMA_CLAVEJO, CTV.DESCRIPCION, CS.DESCRIPCION, VI.FECHA_NACIMIENTO, CONCAT(CPA.DESCRIPCION,',',CE.DESCRIPCION,',',CM.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJO VI, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_PAIS CPA, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE VI.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND VI.SEXO = CS.SEXO_ID "
                + "AND VI.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND VI.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND VI.NACIMIENTO_PAIS = CPA.PAIS_ID "
                + "AND VI.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                + "AND VI.VICTIMA_CLAVEJC = '" + victimaCLave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public ArrayList findVictimasJC(String causaClaveJC, String victimaClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT * FROM DATOS_VICTIMAS_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "AND VICTIMA_CLAVE = '" + victimaClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString("TIPO_VICTIMA"), resul.getString("TIPO_VICTIMA_MORAL"), resul.getString("CONTO_ASESOR"),
                    resul.getString("ASESOR"), resul.getString("SEXO"), resul.getString("FECHA_NACIMIENTO"), resul.getString("EDAD"),
                    resul.getString("VULNERABILIDAD"), resul.getString("NACIMIENTO_PAIS"), resul.getString("NACIMIENTO_ENTIDAD"),
                    resul.getString("NACIMIENTO_MUNICIPIO"), resul.getString("NACIONALIDAD"), resul.getString("RESIDENCIA_PAIS"),
                    resul.getString("RESIDENCIA_ENTIDAD"), resul.getString("RESIDENCIA_MUNICIPIO"), resul.getString("ESTADO_CIVIL"),
                    resul.getString("CONDICION_ALFABETISMO"), resul.getString("GRADO_ESTUDIOS"), resul.getString("HABLA_ESPANOL"),
                    resul.getString("LENGUA_EXTRANJERA"), resul.getString("HABLA_INDIGENA"), resul.getString("LENGUA_INDIGENA"),
                    resul.getString("INTERPRETE"), resul.getString("OCUPACION"), resul.getString("INGRESOS"), resul.getString("RANGO_INGRESOS"),
                    resul.getString("MEDIDAS_PROTECCION"), resul.getString("MEDIDAS_MUJER"), resul.getString("JUSTIFICA_DELITOS"),resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public ArrayList findVictimasJO(String causaClaveJO, String victimaClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT * FROM DATOS_VICTIMAS_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "AND VICTIMA_CLAVEJO = '" + victimaClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString("TIPO_VICTIMA"), resul.getString("TIPO_VICTIMA_MORAL"), resul.getString("CONTO_ASESOR"),
                    resul.getString("ASESOR"), resul.getString("SEXO"), resul.getString("FECHA_NACIMIENTO"), resul.getString("EDAD"),
                    resul.getString("VULNERABILIDAD"), resul.getString("NACIMIENTO_PAIS"), resul.getString("NACIMIENTO_ENTIDAD"),
                    resul.getString("NACIMIENTO_MUNICIPIO"), resul.getString("NACIONALIDAD"), resul.getString("RESIDENCIA_PAIS"),
                    resul.getString("RESIDENCIA_ENTIDAD"), resul.getString("RESIDENCIA_MUNICIPIO"), resul.getString("ESTADO_CIVIL"),
                    resul.getString("CONDICION_ALFABETISMO"), resul.getString("GRADO_ESTUDIOS"), resul.getString("HABLA_ESPANOL"),
                    resul.getString("LENGUA_EXTRANJERA"), resul.getString("HABLA_INDIGENA"), resul.getString("LENGUA_INDIGENA"),
                    resul.getString("INTERPRETE"), resul.getString("OCUPACION"), resul.getString("INGRESOS"), resul.getString("RANGO_INGRESOS"),
                    resul.getString("JUSTIFICA_DELITOS"), resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public ArrayList findVDelitoJC(String causaClaveJC, String proceClave, String victiClave, String deliClave){
        vicDelito = new ArrayList();
        try {
            conn.Conectar();
                sql = "SELECT DELITO_CLAVE FROM DATOS_VDELITOS_ADOJC "
                        + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                        + "AND DELITO_CLAVE = '" + deliClave + "' "
                        + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicDelito.add(resul.getString("DELITO_CLAVE"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicDelito;
    }
    
    public ArrayList findVDelitoJO(String causaClaveJO, String proceClave, String victiClave, String deliClave){
        vicDelito = new ArrayList();
        try {
            conn.Conectar();
                sql = "SELECT DELITO_CLAVE FROM DATOS_VDELITOS_ADOJO "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                        + "AND DELITO_CLAVE = '" + deliClave + "' "
                        + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicDelito.add(resul.getString("DELITO_CLAVE"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicDelito;
    }
    
    public ArrayList findVprocesadosJC(String causaClaveJC) {
        conn.Conectar();
        vicProce = new ArrayList();
        sql = "SELECT PR.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), PR.REINCIDENCIA, PR.SEXO, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJC PR, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE PR.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PR.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND PR.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vicProce.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicProce;
    }
    
    public ArrayList findVprocesadosJO(String causaClaveJO) {
        conn.Conectar();
        vicProce = new ArrayList();
        sql = "SELECT PROCESADO_CLAVEJO FROM DATOS_PROCESADOS_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vicProce.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicProce;
    }
    
    public ArrayList findViRelProcesadoJC(String causaClaveJC, String victiClave, String proceClave, String relacion){
        vicProce = new ArrayList();
        try {
            conn.Conectar();
                sql = "SELECT RELACION FROM DATOS_VPROCESADOS_ADOJC "
                        + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                        + "AND RELACION = " + relacion + " "
                        + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicProce.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicProce;
    }
    
    public ArrayList findViRelProcesadoJO(String causaClaveJO, String victiClave, String proceClave, String relacion){
        vP = new ArrayList();
        try {
            conn.Conectar();
            sql = "SELECT RELACION FROM DATOS_VPROCESADOS_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                    + "AND RELACION = " + relacion + " "
                    + "ORDER BY 1;";
            
            resul = conn.consultar(sql);
            while (resul.next()) {
                vP.add(resul.getString("RELACION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vP;
    }
    
    public ArrayList findVIngresosJC(String causaClaveJC, String victiClave, String ingreso) {
        try {
            conn.Conectar();
            vicIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_VFUENTE_INGRESOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND INGRESO = " + ingreso + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicIngre.add(resul.getString("INGRESO"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicIngre;
    }
    
    public ArrayList findVIngresosJO(String causaClaveJO, String victiClave, String ingreso) {
        try {
            conn.Conectar();
            vicIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_VFUENTE_INGRESOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJO + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND INGRESO = " + ingreso + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicIngre.add(resul.getString("INGRESO"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicIngre;
    }
    
    public int countVictimasJO(String causaClave) {
        try {
            conn.Conectar();
            conteoVic = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_VICTIMAS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClave + "' "
                    + "AND TIPO_VICTIMA <> -2;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoVic = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoVic;
    }
    
    public ArrayList findVictimasTablaJO(String victiClaveJO) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT V.VICTIMA_CLAVEJO, CTV.DESCRIPCION, CS.DESCRIPCION, V.FECHA_NACIMIENTO, CONCAT(CP.DESCRIPCION,',',CE.DESCRIPCION,',',CM.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJO V, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_PAIS CP, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE V.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND V.SEXO = CS.SEXO_ID "
                + "AND V.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND V.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND V.NACIMIENTO_PAIS = CP.PAIS_ID "
                + "AND V.VICTIMA_CLAVEJO = '" + victiClaveJO + "';";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;

    }
    
    public ArrayList findProcesadosJO(String causaClave) {
        conn.Conectar();
        vicProce = new ArrayList();
        sql = "SELECT PROCESADO_CLAVEJO, CONCAT(NOMBRE,' ',A_PATERNO,' ',A_MATERNO) FROM DATOS_PROCESADOS_ADOJO "
                + "WHERE CAUSA_CLAVEJO = '" + causaClave + "'";
        
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vicProce.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicProce;
    }
    public ArrayList findProcesadosJC(String causaClave) {
        conn.Conectar();
        vicProce = new ArrayList();
        sql = "SELECT P.PROCESADO_CLAVE, CONCAT(NOMBRE,' ',A_PATERNO,' ',A_MATERNO) "
            + " FROM DATOS_PROCESADOS_ADOJC P, DATOS_CONCLUSIONES_ADOJC C "
            + " WHERE P.CAUSA_CLAVE = C.CAUSA_CLAVE "
            + " AND P.PROCESADO_CLAVE = C.PROCESADO_CLAVE "
            + " AND C.TIPO_RESOLUCION = 5 "
            + " AND P.CAUSA_CLAVE = '" + causaClave + "'"
            + " ORDER BY 1;";
        
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vicProce.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicProce;
    }
}
