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
public class showCausasPenales {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> causas;
    ArrayList<Integer[]> Total;
    int total;
    String sql;
    ResultSet rs;
    
    public ArrayList findCausaPenal(String juzgadoClave, String causaClave){
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' AND "
                    + "CAUSA_CLAVE = '" + causaClave + "';";
            rs = conn.consultar(sql);
            while(rs.next()){
                causas.add(new String[]{
                    rs.getString("CARPETA_INVESTIGA"), rs.getString("FECHA_INGRESO"), rs.getString("JUEZ_CLAVE"),
                    rs.getString("DERIVA_ACCION_PENAL"), rs.getString("EXPEDIENTE_ACUMULADO"), rs.getString("EXPEDIENTE_REFERENCIA"),
                    rs.getString("COMPETENCIA"), rs.getString("TIPO_INCOMPETENCIA"), rs.getString("TOTAL_DELITOS"),
                    rs.getString("TOTAL_PROCESADOS"), rs.getString("TOTAL_VICTIMAS"), rs.getString("COMENTARIOS"),
                    rs.getString("INTEGRACION_CAUSA")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }

    public ArrayList findCausasPenales(String juzgado) {
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT E.*, C.DESCRIPCION "
                    + " FROM DATOS_CAUSAS_PENALES_ADOJC E, CATALOGOS_RESPUESTA_SIMPLE C"
                    + " WHERE C.RESPUESTA_ID = E.COMPETENCIA"
                    + " AND JUZGADO_CLAVE = '" + juzgado + "' ORDER BY 1;";

            rs = conn.consultar(sql);
            while (rs.next()) {
                causas.add(new String[]{
                    rs.getString("CAUSA_CLAVE"), rs.getString("FECHA_INGRESO"), rs.getString("TOTAL_DELITOS"), 
                    rs.getString("TOTAL_PROCESADOS"), rs.getString("TOTAL_VICTIMAS"), rs.getString("C.DESCRIPCION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }

    public int countCausasPenales(String juzgado) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "'";

            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int countTotalDelitos(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_DELITOS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";      
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int countTotalProcesados(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_PROCESADOS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int countTotalVictimas(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_VICTIMAS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";

            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public String FechaIng(String juzgadoClave, String causaClave) {
        String FechaIngreso = "";
        try {
            conn.Conectar();
            sql = "SELECT FECHA_INGRESO FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' AND "
                    + "CAUSA_CLAVE = '" + causaClave + "'";
            rs = conn.consultar(sql);
            if (rs.next()) {
                FechaIngreso = rs.getString("FECHA_INGRESO");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return FechaIngreso;
    }
    
//    public String FechaOcurr(String causaClave) {
//        String Fecha_Ocurrencia = "";
//        try {
//            conn.Conectar();
//            sql = "SELECT FECHA_OCURRENCIA FROM DATOS_DELITOS_ADOJC WHERE  "
//                    + "CAUSA_CLAVE = '" + causaClave + "'";
//            System.out.println(sql);
//            rs = conn.consultar(sql);
//            if (rs.next()) {
//                Fecha_Ocurrencia = rs.getString("FECHA_OCURRENCIA");
//            }
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return Fecha_Ocurrencia;
//    }
    
    public boolean carpetaInves(String juzgadoClave, String numcarpeta) {
        boolean Exis = false;
        try {
            conn.Conectar();
            sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + numcarpeta + "' "
                    + "AND JUZGADO_CLAVE = '" + juzgadoClave + "'";
            rs = conn.consultar(sql);
            if (rs.next()) {
                Exis = true;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Exis;
    }
    
   public int total_reg_Delitos(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_DELITOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'"
                  + " AND COMENTARIOS<>'REGNUEVO'";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int total_reg_Procesados(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_PROCESADOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'"
                    + " AND COMENTARIOS<>'REGNUEVO'";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int total_reg_Victimas(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_VICTIMAS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'"
                    + " AND COMENTARIOS<>'REGNUEVO'";

            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int total_reg_etaInicial(String causaClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_ETAPA_INICIAL_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'"
                    + " AND COMENTARIOS<>'REGNUEVO'";

            rs = conn.consultar(sql);
            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
}

