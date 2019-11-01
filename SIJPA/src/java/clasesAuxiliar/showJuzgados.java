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
public class showJuzgados {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String> lista;
    String sql;
    ResultSet rs;
    
    public ArrayList findJuzgados(){
        try {
            conn.Conectar();
            lista = new ArrayList();
            
            sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC ORDER BY 1;";
            
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(rs.getString(1));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
