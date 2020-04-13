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
public class showAudiencias {
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> causas, lista;

    String sql;
    ResultSet resul;
    
     public ArrayList findJuzgados() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT JUZGADO_CLAVE FROM datos_juzgados_adojc ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
     
    public ArrayList findCausas(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT CAUSA_CLAVE FROM datos_causas_penales_adojc  where juzgado_clave='"+juzgado+"' ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public ArrayList findJueces(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM datos_jueces_adojc where juzgado_clave='"+juzgado+"' ORDER BY APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString("JUEZ_CLAVE"), resul.getString("APELLIDOP_JUEZ"),resul.getString("APELLIDOM_JUEZ"),resul.getString("NOMBRE_JUEZ")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
