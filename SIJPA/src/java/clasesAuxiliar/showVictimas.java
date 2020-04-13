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
public class showVictimas {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> vic;
    ArrayList<String> vicDelito, vicProce, vIngre, viMedida;
    String sql;
    ResultSet resul;
    int conteoVic;

    public ArrayList findVictimas(String causaClave, String victimaClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT * FROM DATOS_VICTIMAS_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
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
                    resul.getString("MEDIDAS_PROTECCION"), resul.getString("MEDIDAS_MUJER"), resul.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public ArrayList findVictimasCausa(String causaClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT V.VICTIMA_CLAVE, CTV.DESCRIPCION, CS.DESCRIPCION, V.FECHA_NACIMIENTO, CONCAT(CP.DESCRIPCION,',',CE.DESCRIPCION,',',CM.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJC V, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_PAIS CP, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE V.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND V.SEXO = CS.SEXO_ID "
                + "AND V.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND V.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND V.NACIMIENTO_PAIS = CP.PAIS_ID "
                + "AND V.CAUSA_CLAVE = '" + causaClave + "' "
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

    public ArrayList findVictimasTabla(String victiClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT V.VICTIMA_CLAVE, CTV.DESCRIPCION, CS.DESCRIPCION, V.FECHA_NACIMIENTO, CONCAT(CP.DESCRIPCION,',',CE.DESCRIPCION,',',CM.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJC V, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_PAIS CP, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE V.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND V.SEXO = CS.SEXO_ID "
                + "AND V.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND V.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND V.NACIMIENTO_PAIS = CP.PAIS_ID "
                + "AND V.VICTIMA_CLAVE = '" + victiClave + "';";
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

    public ArrayList findVprocesados(String causaClave) {
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT PROCESADO_CLAVE FROM DATOS_PROCESADOS_ADOJC "
                + "WHERE CAUSA_CLAVE = '" + causaClave + "'";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                vic.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }

    public int countVictimas(String causaClave) {
        try {
            conn.Conectar();
            conteoVic = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_VICTIMAS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
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
    
    public ArrayList findVDelito(String causaClave, String victiClave, String deliClave){
        vicDelito = new ArrayList();
        try {
            conn.Conectar();
                sql = "SELECT DELITO_CLAVE FROM DATOS_VDELITOS_ADOJC "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
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
    
    public ArrayList findVProcesado(String causaClave, String victiClave, String proceClave, String relacion){
        vicProce = new ArrayList();
        try {
            conn.Conectar();
                sql = "SELECT RELACION FROM DATOS_VPROCESADOS_ADOJC "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + "' "
                        + "AND RELACION = " + relacion + " "
                        + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vicDelito.add(resul.getString("RELACION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vicDelito;
    }
    
    public ArrayList findVIngresos(String causaClave, String victiClave, String ingreso) {
        try {
            conn.Conectar();
            vIngre = new ArrayList();
            sql = "SELECT INGRESO FROM DATOS_VFUENTE_INGRESOS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND INGRESO = " + ingreso + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                vIngre.add(resul.getString("INGRESO"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vIngre;
    }
    
    public ArrayList findVMedidas(String causaClave, String victiClave, String medida) {
        try {
            conn.Conectar();
            viMedida = new ArrayList();
            sql = "SELECT TIPO_MEDIDA_PROT FROM DATOS_VMEDIDAS_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND TIPO_MEDIDA_PROT = " + medida + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                viMedida.add(resul.getString("TIPO_MEDIDA_PROT"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return viMedida;
    }
    
    public ArrayList findVMedidasMuj(String causaClave, String victiClave, String medidaMuj) {
        try {
            conn.Conectar();
            viMedida = new ArrayList();
            sql = "SELECT TIPO_MEDIDA_MUJER FROM DATOS_VMEDIDAS_DMUJ_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND VICTIMA_CLAVE = '" + victiClave + "' "
                    + "AND TIPO_MEDIDA_MUJER = " + medidaMuj + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                viMedida.add(resul.getString("TIPO_MEDIDA_MUJER"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showVictimas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return viMedida;
    }
}
