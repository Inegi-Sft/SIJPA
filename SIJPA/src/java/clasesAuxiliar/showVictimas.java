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
    String sql;
    ResultSet resul;
    int conteoVic;
    
    public ArrayList findVictimas(){
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT * FROM DATOS_VICTIMAS_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                vic.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),
                    resul.getString(8),resul.getString(9),resul.getString(10),resul.getString(11),
                    resul.getString(12),resul.getString(13),resul.getString(14),resul.getString(15),
                    resul.getString(16),resul.getString(17),resul.getString(18),resul.getString(19),
                    resul.getString(20),resul.getString(21),resul.getString(22),resul.getString(23),
                    resul.getString(24),resul.getString(25),resul.getString(26),resul.getString(27),
                    resul.getString(28),resul.getString(29),resul.getString(30),resul.getString(31),
                    resul.getString(32),resul.getString(33)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    } 
    
    public ArrayList findVictimasTabla(String victi){
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT V.VICTIMA_CLAVE, CTV.DESCRIPCION, CS.DESCRIPCION, V.FECHA_NACIMIENTO, CONCAT(CM.DESCRIPCION,', ',CE.DESCRIPCION) "
                + "FROM DATOS_VICTIMAS_ADOJC V, CATALOGOS_TIPO_VICTIMA CTV, CATALOGOS_SEXO CS, CATALOGOS_MUNICIPIOS CM, CATALOGOS_ENTIDADES CE "
                + "WHERE V.TIPO_VICTIMA = CTV.VICTIMA_ID "
                + "AND V.SEXO = CS.SEXO_ID "
                + "AND V.NACIMIENTO_MUNICIPIO = CM.MUNICIPIO_ID "
                + "AND V.NACIMIENTO_ENTIDAD = CE.ENTIDAD_ID "
                + "AND V.VICTIMA_CLAVE = '" + victi + "';";
        resul = conn.consultar(sql);
         try {
            while(resul.next()){
                vic.add(new String[]{
                    resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
        
    }
    
    public ArrayList findVdelitos(String exp){
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT P.PROCESADO_CLAVE, D.DELITO_CLAVE, C.CODIGO FROM DATOS_PROCESADOS_ADOJC P "
                + "INNER JOIN DATOS_DELITOS_ADOJC D ON P.EXPEDIENTE_CLAVE = D.EXPEDIENTE_CLAVE "
                + "INNER JOIN CATALOGOS_CODIGO_NORMA C ON D.DELITO_CODIGO_PENAL = C.ID "
                + "WHERE P.EXPEDIENTE_CLAVE = D.EXPEDIENTE_CLAVE "
                + "AND P.EXPEDIENTE_CLAVE = '" + exp + "'" ;
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                vic.add(new String[]{
                    resul.getString(1), resul.getString(2),resul.getString(3)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    } 
     
    public ArrayList findVprocesados(String exp){
        conn.Conectar();
        vic = new ArrayList();
        sql = "SELECT PROCESADO_CLAVE FROM DATOS_PROCESADOS_ADOJC "
                + "WHERE EXPEDIENTE_CLAVE = '" + exp + "'" ;
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                vic.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vic;
    }
    
    public int countVictimas(String exp){
        try{
            conn.Conectar();
            conteoVic = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_VICTIMAS_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoVic = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoVic;
    }
}
