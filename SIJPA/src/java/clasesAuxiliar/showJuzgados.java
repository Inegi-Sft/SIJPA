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
    ArrayList<String[]> listaTabla,ListaDatosJuz;
    String sql;
    ResultSet rs;
    
    public int findTotJuzgado(){
        int tot = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_JUZGADOS_ADOJC ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                tot = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tot;
    }
    
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
    
    public boolean findJuzgadoExist(String juzgadoClave){
        try{
            conn.Conectar();
            sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC WHERE JUZGADO_CLAVE = '" + juzgadoClave + "';";
            rs = conn.consultar(sql);
            return rs.next();
        }catch(SQLException ex){
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ArrayList findJuzgadoTabla(){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<String[]>();
            sql = "SELECT JUZGADO_CLAVE,JUZGADO_NOMBRE,JUZGADO_NUMERO,JUZGADO_JURISDICCION,ENTIDAD,MUNICIPIO "
                    + "FROM DATOS_JUZGADOS_ADOJC DJ "
                    + "JOIN CATALOGOS_JURISDICCION CJ "
                    + "ON DJ.JUZGADO_JURISDICCION = CJ.JURISDICCION_ID "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaTabla.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaTabla;
    }
    public ArrayList findDatosJuzgado(String juzgadoClave){
        try {
            conn.Conectar();
            ListaDatosJuz = new ArrayList<String[]>();
            sql = "SELECT *  "
                    + "FROM DATOS_JUZGADOS_ADOJC WHERE JUZGADO_CLAVE='"+ juzgadoClave +"' "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                ListaDatosJuz.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                    rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),
                    rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),
                    rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),
                    rs.getString(23),rs.getString(24),
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListaDatosJuz;
    }
    
}
