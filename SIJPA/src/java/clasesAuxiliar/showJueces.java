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
 * @author CARLOS.SANCHEZG
 */
public class showJueces {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    ArrayList<String[]> listaTabla;
    String sql;
    ResultSet rs;
    
    public ArrayList findJuezDatos(int juezCave, String juzgadoClave){
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT NOMBRE_JUEZ, APELLIDOP_JUEZ, APELLIDOM_JUEZ, FECHA_GESTION, SEXO, EDAD, GRADO_ESTUDIOS, FUNCION_DESEMPENA "
                    + "FROM DATOS_JUECES_ADOJC "
                    + "WHERE JUEZ_CLAVE = " + juezCave + " "
                    + "AND JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findJuez(String juzClave){
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT JUEZ_CLAVE, CONCAT(NOMBRE_JUEZ,' ',APELLIDOP_JUEZ,' ',APELLIDOM_JUEZ) AS NOMBRE_JUEZ "
                    + "FROM DATOS_JUECES_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '" + juzClave + "' "
                    + "AND ESTATUS = 1 "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString(1), rs.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList findJuezJO(String juzClave, String causa){
        try {
            conn.Conectar();
            lista = new ArrayList();
            sql = "SELECT JUEZ_CLAVE, CONCAT(NOMBRE_JUEZ,' ',APELLIDOP_JUEZ,' ',APELLIDOM_JUEZ) AS NOMBRE_JUEZ "
                + "FROM DATOS_JUECES_ADOJC "
                + "WHERE JUZGADO_CLAVE = '" + juzClave + "' "
                + "AND NOT JUEZ_CLAVE= (SELECT JUEZ_CLAVE FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE='"+causa+"') "
                + "AND ESTATUS = 1 "
                + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lista.add(new String[]{
                    rs.getString(1), rs.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findJuezTabla(String juzClave){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<>();
            sql = "SELECT DJ.JUEZ_CLAVE,CONCAT(DJ.NOMBRE_JUEZ,' ',DJ.APELLIDOP_JUEZ,' ',DJ.APELLIDOM_JUEZ), "
                    + "DJ.EDAD,DJ.FECHA_GESTION,DJ.GRADO_ESTUDIOS,CF.DESCRIPCION,CE.DESCRIPCION "
                    + "FROM DATOS_JUECES_ADOJC DJ "
                    + "JOIN CATALOGOS_FUNCION_JUZGADO CF ON DJ.FUNCION_DESEMPENA = CF.FUNCION_JUZ_ID "
                    + "JOIN CATALOGOS_ESTATUS CE ON DJ.ESTATUS = CE.ESTATUS_ID "
                    + "WHERE JUZGADO_CLAVE = '" + juzClave + "' AND JUEZ_CLAVE <> -2 "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                listaTabla.add(new String[]{
                    rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
                    rs.getString(5),rs.getString(6),rs.getString(7)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaTabla;
    }
    
    public int findMaxJuez(String juzClave){
        int max = 0;
        try {
            conn.Conectar();
            sql = "SELECT MAX(JUEZ_CLAVE) "
                    + "FROM DATOS_JUECES_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '" + juzClave + "' "
                    + "ORDER BY JUEZ_CLAVE";
            rs = conn.consultar(sql);
            while (rs.next()) {
                max = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return max;
    }
    
    public int findTotJuez(String juzClave){
        int tot = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) "
                    + "FROM DATOS_JUECES_ADOJC "
                    + "WHERE JUZGADO_CLAVE = '" + juzClave + "' "
                    + "ORDER BY JUEZ_CLAVE";
            rs = conn.consultar(sql);
            while (rs.next()) {
                tot = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJueces.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tot;
    }
    
}
