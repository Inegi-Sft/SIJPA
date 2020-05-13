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
    
    public ArrayList findProceJuicioJO(String causaClaveJC, String proceClave){
        try {
            conn.Conectar();
            juicio = new ArrayList();
            sql = "SELECT EO.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), EO.MEDIDAS_DISCIPLINARIAS, EO.INCIDENTES_AUDIENCIA, EO.SUSPENCION_AUDIENCIA, EO.SENTIDO_FALLO "
                    + "FROM DATOS_ETAPA_ORAL_ADOJO EO, DATOS_PROCESADOS_ADOJO PR, DATOS_CAUSAS_PENALES_ADOJO CP "
                    + "WHERE EO.CAUSA_CLAVEJO = PR.CAUSA_CLAVEJO "
                    + "AND EO.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                    + "AND PR.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                    + "AND EO.PROCESADO_CLAVE = PR.PROCESADO_CLAVE " 
                    + "AND CP.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
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
}
