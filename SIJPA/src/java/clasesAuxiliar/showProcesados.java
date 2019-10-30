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
 * @author FERMIN.GOMEZ
 */
public class showProcesados {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet rs;
    
    public ArrayList findProcesados(String exp){
        try {
            conn.Conectar();
            lista = new ArrayList();
            
            sql = "SELECT P.*,TP.*, S.*, GE.*"
                + " FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_CONSIGNACION TP, CATALOGOS_SEXO S, CATALOGOS_GRADO_ESTUDIOS GE"
                + " WHERE TP.CONSIGNACION_ID=P.TIPO_CONSIGNACION"
                + " AND S.SEXO_ID=P.SEXO"
                + " AND GE.GRADO_ID=P.ULTIMO_GRADO_ESTUDIOS"
                + " AND EXPEDIENTE_CLAVE = '"+exp+"';";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString("PROCESADO_CLAVE"), rs.getString("TP.DESCRIPCION"), rs.getString("S.DESCRIPCION"), 
                    rs.getString("FECHA_NACIMIENTO"), rs.getString("GE.DESCRIPCION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
