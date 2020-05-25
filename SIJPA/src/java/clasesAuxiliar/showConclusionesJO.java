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
    String sql;
    ResultSet resul;
    
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
}
