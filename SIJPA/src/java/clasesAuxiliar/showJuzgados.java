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
    ArrayList<String[]> listaTabla, listaDatosJuz;
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
            sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                    + "WHERE ESTATUS = 1 "
                    + "ORDER BY 1;";
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
    
    public ArrayList findJuzgados(int tipoUsu, String usuActivo){
        try {
            conn.Conectar();
            lista = new ArrayList();
            if(tipoUsu == 1){
                sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                        + "WHERE ESTATUS = 1 "
                        + "ORDER BY 1;";
            }else{
                sql = "SELECT J.JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC J "
                        + "JOIN USUARIOS_JUZGADOS UJ ON J.JUZGADO_CLAVE = UJ.JUZGADO_CLAVE "
                        + "WHERE J.ESTATUS = 1 "
                        + "ORDER BY 1;";
            }
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
    
    public ArrayList findJuzgadosJC(int tipoUsu, String usuActivo){
        try {
            conn.Conectar();
            lista = new ArrayList();
            if(tipoUsu == 1){
                sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                        + "WHERE JUZGADO_FUNCION IN(1,3) "
                        + "AND ESTATUS = 1 "
                        + "ORDER BY 1;";
            }else{
                sql = "SELECT J.JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC J, USUARIOS_JUZGADOS UJ "
                        + "WHERE J.JUZGADO_CLAVE = UJ.JUZGADO_CLAVE "
                        + "AND J.JUZGADO_FUNCION IN(1,3) "
                        + "AND J.ESTATUS = 1 "
                        + "AND UJ.USUARIO = '" + usuActivo + "' "
                        + "ORDER BY 1;";
            }
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
    
    public ArrayList findJuzgadosJO(int tipoUsu, String usuActivo){
        try {
            conn.Conectar();
            lista = new ArrayList();
            if(tipoUsu == 1){
                sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                        + "WHERE JUZGADO_FUNCION IN(2,3) "
                        + "AND ESTATUS = 1 "
                        + "ORDER BY 1;";
            }else{
                sql = "SELECT J.JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC J, USUARIOS_JUZGADOS UJ "
                        + "WHERE J.JUZGADO_CLAVE = UJ.JUZGADO_CLAVE "
                        + "AND J.JUZGADO_FUNCION IN(2,3) "
                        + "AND J.ESTATUS = 1 "
                        + "AND UJ.USUARIO = '" + usuActivo + "' "
                        + "ORDER BY 1;";
            }
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
  
    public ArrayList findJuzgadosDifJO(String juzgadoOld){
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                + "WHERE ESTATUS = 1 "
                + "AND NOT JUZGADO_CLAVE = '" + juzgadoOld + "' "
                + "ORDER BY 1;";
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

    public int countCausasPenIn(String juzgado, int funJuzgado){
        int conteo = 0;
        try {
            conn.Conectar();
            if(funJuzgado == 1){
                sql = "SELECT COUNT(*) FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '"+juzgado+"'";
            }else{
                sql = "SELECT COUNT(*) FROM DATOS_CAUSAS_PENALES_ADOJO WHERE JUZGADO_CLAVEJO = '"+juzgado+"'";
            }
            rs = conn.consultar(sql);
            while (rs.next()) {
                conteo = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteo;
    }
    
    public boolean findJuzgadoExist(String juzgadoClave){
        try{
            conn.Conectar();
            sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '" + juzgadoClave + "';";
            rs = conn.consultar(sql);
            return rs.next();
        }catch(SQLException ex){
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public ArrayList findJuzgadoTabla(int tipoUsu, String usuActivo){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<>();
            if(tipoUsu == 1){
                sql = "SELECT DJ.JUZGADO_CLAVE, DJ.JUZGADO_NOMBRE, DJ.JUZGADO_NUMERO, CJ.DESCRIPCION, CEN.DESCRIPCION, CM.DESCRIPCION, CE.DESCRIPCION "
                        + "FROM DATOS_JUZGADOS_ADOJC DJ "
                        + "JOIN CATALOGOS_JURISDICCION CJ ON DJ.JUZGADO_JURISDICCION = CJ.JURISDICCION_ID "
                        + "JOIN CATALOGOS_FUNCION_JUZGADO CEN ON DJ.JUZGADO_FUNCION = CEN.FUNCION_JUZ_ID "
                        + "JOIN CATALOGOS_MUNICIPIOS CM ON DJ.MUNICIPIO = CM.MUNICIPIO_ID "
                        + "JOIN CATALOGOS_ESTATUS CE ON DJ.ESTATUS = CE.ESTATUS_ID "
                        + "ORDER BY 1";
            }else{
                sql = "SELECT DJ.JUZGADO_CLAVE, DJ.JUZGADO_NOMBRE, DJ.JUZGADO_NUMERO, CJ.DESCRIPCION, CEN.DESCRIPCION, CM.DESCRIPCION, CE.DESCRIPCION "
                        + "FROM DATOS_JUZGADOS_ADOJC DJ "
                        + "JOIN CATALOGOS_JURISDICCION CJ ON DJ.JUZGADO_JURISDICCION = CJ.JURISDICCION_ID "
                        + "JOIN CATALOGOS_FUNCION_JUZGADO CEN ON DJ.JUZGADO_FUNCION = CEN.FUNCION_JUZ_ID "
                        + "JOIN CATALOGOS_MUNICIPIOS CM ON DJ.MUNICIPIO = CM.MUNICIPIO_ID "
                        + "JOIN CATALOGOS_ESTATUS CE ON DJ.ESTATUS = CE.ESTATUS_ID "
                        + "JOIN USUARIOS_JUZGADOS UJ ON DJ.JUZGADO_CLAVE = UJ.JUZGADO_CLAVE "
                        + "ORDER BY 1";
            }
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaTabla.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                    rs.getString(7)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaTabla;
    }
    
    public ArrayList findJuzgadoDato(String juzgadoClave){
        try {
            conn.Conectar();
            listaDatosJuz = new ArrayList<>();
            sql = "SELECT * FROM DATOS_JUZGADOS_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '"+ juzgadoClave +"' "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaDatosJuz.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                    rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),
                    rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),
                    rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(23),rs.getString(24),
                    rs.getString(26)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDatosJuz;
    }
    
    public ArrayList findInformeJuz(String juzgadoClave, String funJuz){
        try {
            conn.Conectar();
            listaDatosJuz = new ArrayList<>();
            String tabla;
            if(funJuz.equalsIgnoreCase("2")){
                tabla = "DATOS_INFORME_ADOJO"; 
            }else{
                tabla = "DATOS_INFORME_ADOJC";
            }
            sql = "SELECT CAUSAS_PENALES_INGRESADAS, MEDIDAS_PROTECCION_ASIG, PROVIDENCIAS_PRECAUTORIAS, PRUEBA_ANTICIPADA,"
                    + "ORDENES_JUDICIALES, ACTOS_INVESTIGA, IMPUGNACION_MP, OTROS, CAUSAS_TRAMITE, CAUSAS_BAJAS, ANIO "
                    + "FROM " + tabla + " "
                    + "WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaDatosJuz.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                    rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),
                    rs.getString(11)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDatosJuz;
    }
    
    public int findFuncionJuz(String juzgadoClave){
        int funcion = 0;
        try {
            conn.Conectar();
            sql = "SELECT JUZGADO_FUNCION "
                    + "FROM DATOS_JUZGADOS_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while (rs.next()) {
                funcion = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return funcion;
    }
    
    public String findFuncionDes(String juzgadoClave){
        String funcion = "";
        try {
            conn.Conectar();
            sql = "SELECT CF.DESCRIPCION "
                    + "FROM DATOS_JUZGADOS_ADOJC JU "
                    + "JOIN CATALOGOS_FUNCION_JUZGADO CF ON JU.JUZGADO_FUNCION = CF.FUNCION_JUZ_ID "
                    + "WHERE JU.JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while (rs.next()) {
                funcion = rs.getString(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return funcion;
    }
    
}
