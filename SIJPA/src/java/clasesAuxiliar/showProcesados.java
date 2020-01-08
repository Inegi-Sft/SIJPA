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
    String sql;
    ResultSet resul;
    int conteoPro;
    
    public ArrayList findProcesados(){
        conn.Conectar();
        proce = new ArrayList();
        sql = "SELECT * FROM DATOS_PROCESADOS_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                proce.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),
                    resul.getString(8),resul.getString(9),resul.getString(10),resul.getString(11),
                    resul.getString(12),resul.getString(13),resul.getString(14),resul.getString(15),
                    resul.getString(16),resul.getString(17),resul.getString(18),resul.getString(19),
                    resul.getString(20),resul.getString(21),resul.getString(22),resul.getString(23),
                    resul.getString(24),resul.getString(25),resul.getString(26),resul.getString(27),
                    resul.getString(28),resul.getString(29),resul.getString(30),resul.getString(31),
                    resul.getString(32),resul.getString(33),resul.getString(34),resul.getString(35),
                    resul.getString(36),resul.getString(37),resul.getString(38),resul.getString(39),
                    resul.getString(40),resul.getString(41),resul.getString(42),resul.getString(43),
                    resul.getString(44),resul.getString(45),resul.getString(46),resul.getString(47)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    } 
    
    public ArrayList findProcesasdosTabla(String pro){
        try {
            conn.Conectar();
            proce = new ArrayList();
            sql = "SELECT CONCAT(P.NOMBRE,' ',P.A_PATERNO,' ',P.A_MATERNO),TP.DESCRIPCION, S.DESCRIPCION,P.FECHA_NACIMIENTO"
                + " FROM DATOS_PROCESADOS_ADOJC P, CATALOGOS_IMPUTABILIDAD TP, CATALOGOS_SEXO S"
                + " WHERE TP.IMPUTABILIDAD_ID=P.PRESENTACION_ADO"
                + " AND S.SEXO_ID=P.SEXO"
                + " AND P.PROCESADO_CLAVE = '" + pro + "';";
            
            resul = conn.consultar(sql);
            while (resul.next()) {
                proce.add(new String[]{
                    resul.getString(1),resul.getString(2),resul.getString(3),resul.getString(4)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;
    }
  
    public int countProcesados(String exp){
        try{
            conn.Conectar();
            conteoPro = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_PROCESADOS_ADOJC WHERE CAUSA_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoPro = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoPro;
    }
    
    public ArrayList findProcesadoExp(String exp) {
        conn.Conectar();
        proce = new ArrayList();
        sql = "SELECT * FROM DATOS_PROCESADOS_ADOJC WHERE CAUSA_CLAVE='"+exp+"' "
                + " AND PROCESADO_CLAVE NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_CONCLUSIONES_ADOJC WHERE CAUSA_CLAVE='"+exp+"')"
                + " AND PROCESADO_CLAVE NOT IN (SELECT PROCESADO_CLAVE FROM DATOS_TRAMITES_ADOJC WHERE CAUSA_CLAVE='"+exp+"')";
        
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                proce.add(new String[]{
                    resul.getString("PROCESADO_CLAVE"), resul.getString("NOMBRE")+" "+resul.getString("A_PATERNO")+" "+resul.getString("A_MATERNO")
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return proce;

    }
}
