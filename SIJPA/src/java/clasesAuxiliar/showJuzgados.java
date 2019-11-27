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
    ArrayList<String[]> listaTabla;
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
    
    public ArrayList findjuzgadoTabla(){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<String[]>();
            sql = "SELECT JUZGADO_CLAVE,JUZGADO_NOMBRE,JUZGADO_NUMERO,ENTIDAD,MUNICIPIO "
                    + "FROM DATOS_JUZGADOS_ADOJC ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaTabla.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaTabla;
    }
}
