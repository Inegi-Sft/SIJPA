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

public class showDelitos {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> deli;
    String sql;
    ResultSet resul;
    
    public ArrayList findDelitos(){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT * FROM DATOS_DELITOS_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                deli.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),
                    resul.getString(8),resul.getString(9),resul.getString(10),resul.getString(11),
                    resul.getString(12),resul.getString(13),resul.getString(14),resul.getString(15),
                    resul.getString(16),resul.getString(17),resul.getString(18),resul.getString(19),
                    resul.getString(20),resul.getString(21),resul.getString(22),resul.getString(23),
                    resul.getString(24),resul.getString(25),resul.getString(26),resul.getString(27)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    } 
    
    public ArrayList findDeliTabla(){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.DELITO_CLAVE, CCN.CODIGO, CDN.DELITO, CC.DESCRIPCION, CFC.DESCRIPCION, D.NUMERO_PROCESADOS, D.NUMERO_VICTIMAS FROM DATOS_DELITOS_ADOJC D,"
                + " CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC WHERE "
                + "D.DELITO_CODIGO_PENAL=CCN.ID AND D.DELITO_NORMA_TECNICA=CDN.ID AND D.GRADO_CONSUMACION=CC.CONSUMACION_ID AND D.FORMA_COMISION=CFC.COMISION_ID";
        resul = conn.consultar(sql);
        
        try {
            while(resul.next()){
                deli.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    } 
    
    public int countDelitosInsertados(String exp){
        int total=0;
        try {
            conn.Conectar();
            
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_DELITOS_ADOJC WHERE EXPEDIENTE_CLAVE = '"+exp+"';";
            
            resul = conn.consultar(sql);
            while (resul.next()) {
                total=resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    } 
    
    public ArrayList findDelitosExp(String exp){
        try {
            conn.Conectar();
            deli = new ArrayList();
            
            sql = "SELECT D.DELITO_CLAVE,TP.*, S.*, GE.*"
                + " FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_CONSIGNACION TP, CATALOGOS_SEXO S, CATALOGOS_GRADO_ESTUDIOS GE"
                + " WHERE TP.CONSIGNACION_ID=P.TIPO_CONSIGNACION"
                + " AND S.SEXO_ID=P.SEXO"
                + " AND GE.GRADO_ID=P.ULTIMO_GRADO_ESTUDIOS"
                + " AND EXPEDIENTE_CLAVE = '"+exp+"';";
            
            resul = conn.consultar(sql);
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString("PROCESADO_CLAVE"), resul.getString("TP.DESCRIPCION"), resul.getString("S.DESCRIPCION"), 
                    resul.getString("FECHA_NACIMIENTO"), resul.getString("GE.DESCRIPCION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    } 
}
