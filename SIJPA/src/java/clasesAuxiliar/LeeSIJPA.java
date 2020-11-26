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
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.ibatis.jdbc.ScriptRunner;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class LeeSIJPA {
    
    public void ejecutaScript(String script) throws SQLException, FileNotFoundException, IOException{
        //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        //String mysqlUrl = "jdbc:mysql://localhost/sijpa_db";
        //Connection con = DriverManager.getConnection(mysqlUrl, "root", "InegiSijpa2020");
        String sCadena, sql = "";
        System.out.println("Conexión estabecida......");
        Conexion_Mysql conn = new Conexion_Mysql();
        conn.Conectar();
        //Connection mycon = conn.getConexion();
        //ScriptRunner sr = new ScriptRunner(mycon);
        //ScriptRunner sr = new ScriptRunner(con);
        BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(script), "ISO-8859-1"));
        //Reader reader = new BufferedReader(new FileReader(script));
        while ((sCadena = in.readLine()) != null) {
            if(sCadena.startsWith("LOCK") || sCadena.startsWith("/*!40000 ALTER") || sCadena.startsWith("REPLACE") || sCadena.startsWith("UNLOCK") || sCadena.startsWith("/*!40014")){
                System.out.println("cadena: " + sCadena);
                conn.escribir(sCadena);
            }
        }
        in.close();
        conn.close();
    }
    
}
