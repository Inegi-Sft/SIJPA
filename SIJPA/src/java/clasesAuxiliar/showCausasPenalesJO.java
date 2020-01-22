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
public class showCausasPenalesJO {
    
     Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> causas, lista;

    String sql, JCmin;
    ResultSet rs, resul;
    
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
     public ArrayList findcausaClaveJC(String juzgado_clave) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        
        sql = "SELECT REPLACE(CAUSA_CLAVE,REPLACE('" + juzgado_clave + "','-',''),'') FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado_clave + "' ORDER BY 1";
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
     public ArrayList findTotalDelitos(String juzgado_clave, String CausaClaveJC) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT TOTAL_DELITOS FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE = '" + CausaClaveJC + "' || REPLACE('" + juzgado_clave + "','-','')";
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
     public ArrayList findTotalProce(String CausaClaveJC) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT COUNT(CP.TOTAL_PROCESADOS) FROM DATOS_CAUSAS_PENALES_ADOJC CP, DATOS_CONCLUSIONES_ADOJC C WHERE "
                + " CP.CAUSA_CLAVE = C.CAUSA_CLAVE AND C.TIPO_RESOLUCION = 5 AND C.CAUSA_CLAVE='" + CausaClaveJC + "';";
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
         public ArrayList findTotalVic(String CausaClaveJC) {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT TOTAL_VICTIMAS FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE='" + CausaClaveJC + "';";
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
}
