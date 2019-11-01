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
public class showTramite {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> trami;
    String sql;
    ResultSet resul;
    
    public ArrayList findTramite(){
        conn.Conectar();
        trami = new ArrayList();
        sql = "SELECT * FROM DATOS_TRAMITES_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                trami.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),resul.getString(8),resul.getString(9)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showTramite.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trami;
    } 
    
}
