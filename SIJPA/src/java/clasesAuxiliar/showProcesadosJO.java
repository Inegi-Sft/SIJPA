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
    String sql;
    ResultSet resul;
    
    public ArrayList findProcesasdosCausaJC(String causaClaveJC){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PR.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), PR.REINCIDENCIA, PR.SEXO, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJC PR, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE PR.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PR.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND PR.CAUSA_CLAVE = '" + causaClaveJC + "' "
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
    
    public ArrayList findProcesasdosCausaJO(String causaClaveJC, String proceClave){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT PR.PROCESADO_CLAVE, CONCAT(PR.NOMBRE,' ',PR.A_PATERNO,' ',PR.A_MATERNO), RE.DESCRIPCION, S.DESCRIPCION, PR.FECHA_NACIMIENTO "
                    + "FROM DATOS_PROCESADOS_ADOJO PR, DATOS_CAUSAS_PENALES_ADOJO CP, CATALOGOS_REINCIDENCIA RE, CATALOGOS_SEXO S "
                    + "WHERE PR.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                    + "AND PR.REINCIDENCIA = RE.REINCIDENCIA_ID "
                    + "AND PR.SEXO = S.SEXO_ID "
                    + "AND CP.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                    + "AND PR.PROCESADO_CLAVE = '" + proceClave + "' "
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
}
