/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class LeeSIJPA {
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql;
    
    public void ejecutaScript(String script) throws SQLException, FileNotFoundException, IOException{
        String sCadena;
        conn.Conectar();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(script), "ISO-8859-1"))) {
            while ((sCadena = in.readLine()) != null) {
                if(sCadena.startsWith("LOCK") || sCadena.startsWith("/*!40000 ALTER") || sCadena.startsWith("REPLACE") || sCadena.startsWith("UNLOCK") || sCadena.startsWith("/*!40014")){
                    System.out.println("cadena: " + sCadena);
                    conn.escribir(sCadena);
                }
            }
        }
        conn.close();
    }
    
    public void borraBase(){
        try {
            conn.Conectar();
            sql = "DELETE FROM DATOS_JUZGADOS_ADOJC;";
            if(conn.escribir(sql)){
                System.out.println("Se borro la base de datos chido one");
            }else{
                System.out.println("no se borro la Base :l");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(LeeSIJPA.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
