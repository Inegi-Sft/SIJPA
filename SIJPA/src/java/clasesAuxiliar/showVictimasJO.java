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
    ArrayList<String[]> vic;
    String sql;
    ResultSet resul;
    
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
        sql = "SELECT VI.VICTIMA_CLAVE, CTV.DESCRIPCION, CS.DESCRIPCION, VI.FECHA_NACIMIENTO, CONCAT(CPA.DESCRIPCION,',',CE.DESCRIPCION,',',CM.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJO VI, DATOS_CAUSAS_PENALES_ADOJO CP, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_PAIS CPA, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE VI.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND VI.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND VI.SEXO = CS.SEXO_ID "
                + "AND VI.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND VI.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND VI.NACIMIENTO_PAIS = CPA.PAIS_ID "
                + "AND CP.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
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
}
