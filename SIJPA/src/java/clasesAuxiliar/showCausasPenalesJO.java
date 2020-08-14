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
    ArrayList<String> lis;
    String sql, JCmin;
    ResultSet rs, resul;
    int total;
    
    public ArrayList findCausaPenalJC(String juzgadoClave, String causaClaveJC){
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT CO.CAUSA_CLAVE, CP.FECHA_INGRESO, COUNT(DISTINCT PD.DELITO_CLAVE) AS TOT_DELI, COUNT(DISTINCT CO.PROCESADO_CLAVE) AS TOT_PROCE, COUNT(DISTINCT VD.VICTIMA_CLAVE) AS TOT_VICT "
                    + "FROM DATOS_CAUSAS_PENALES_ADOJC CP, DATOS_PDELITOS_ADOJC PD, DATOS_VDELITOS_ADOJC VD, DATOS_CONCLUSIONES_ADOJC CO "
                    + "WHERE CP.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                    + "AND CP.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                    + "AND CP.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PD.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                    + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND VD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                    + "AND PD.DELITO_CLAVE = VD.DELITO_CLAVE "
                    + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND CP.JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "AND CP.CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while(rs.next()){
                causas.add(new String[]{
                    rs.getString("CP.FECHA_INGRESO"), rs.getString("TOT_DELI"), rs.getString("TOT_PROCE"),
                    rs.getString("TOT_VICT")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }
    
    public ArrayList findCausaPenalJO(String juzgadoClave, String causaClaveJO){
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE JUZGADO_CLAVEJO = '" + juzgadoClave + "' "
                    + "AND CAUSA_CLAVEJO = '" + causaClaveJO + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while(rs.next()){
                causas.add(new String[]{
                    rs.getString("JUZGADO_CLAVEJC"), rs.getString("FECHA_INGRESOJC"), rs.getString("FECHA_INGRESOJO"), 
                    rs.getString("TOTAL_DELITOS"), rs.getString("TOTAL_PROCESADOS"), rs.getString("TOTAL_VICTIMAS"), 
                    rs.getString("ATENDIDA_ORGDIFERENTE"), rs.getString("JUZGADO_DIFERENTE"), rs.getString("CANTIDAD_JUECES"), 
                    rs.getString("JUEZ_CLAVE_1"), rs.getString("JUEZ_CLAVE_2"), rs.getString("JUEZ_CLAVE_3"), 
                    rs.getString("COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }
    
    public ArrayList findCausasJOenJC(String juzgadoClave) {
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT CO.CAUSA_CLAVE, CP.FECHA_INGRESO, COUNT(DISTINCT PD.DELITO_CLAVE) AS TOT_DELI, COUNT(DISTINCT CO.PROCESADO_CLAVE) AS TOT_PROCE, COUNT(DISTINCT VD.VICTIMA_CLAVE) AS TOT_VICT "
                    + "FROM DATOS_CONCLUSIONES_ADOJC CO, DATOS_PDELITOS_ADOJC PD, DATOS_VDELITOS_ADOJC VD, DATOS_CAUSAS_PENALES_ADOJC CP "
                    + "WHERE CO.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                    + "AND CO.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                    + "AND PD.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                    + "AND CO.CAUSA_CLAVE = CP.CAUSA_CLAVE "
                    + "AND PD.CAUSA_CLAVE = CP.CAUSA_CLAVE "
                    + "AND VD.CAUSA_CLAVE = CP.CAUSA_CLAVE "
                    + "AND CO.PROCESADO_CLAVE = PD.PROCESADO_CLAVE "
                    + "AND PD.DELITO_CLAVE = VD.DELITO_CLAVE "
                    + "AND CO.TIPO_RESOLUCION = 5 "
                    + "AND CP.JUZGADO_CLAVE = '" + juzgadoClave + "' "
                    + "GROUP BY CO.CAUSA_CLAVE "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while (rs.next()) {
                causas.add(new String[]{
                    rs.getString("CO.CAUSA_CLAVE"), rs.getString("CP.FECHA_INGRESO"), rs.getString("TOT_DELI"), 
                    rs.getString("TOT_PROCE"), rs.getString("TOT_VICT")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }
    
    public ArrayList findJuzgadosEnJO(String juzClave){
        try {
            conn.Conectar();
            lis = new ArrayList();
            sql = "SELECT DISTINCT JU.JUZGADO_CLAVE "
                    + "FROM DATOS_CONCLUSIONES_ADOJC CO "
                    + "JOIN DATOS_CAUSAS_PENALES_ADOJC CP ON CO.CAUSA_CLAVE = CP.CAUSA_CLAVE "
                    + "JOIN DATOS_JUZGADOS_ADOJC JU ON CP.JUZGADO_CLAVE = JU.JUZGADO_CLAVE "
                    + "WHERE CO.TIPO_RESOLUCION = 5 "
                    + "AND JU.JUZGADO_CLAVE <> '" + juzClave + "' "
                    + "ORDER BY 1;";
            rs = conn.consultar(sql);
            while (rs.next()) {
                lis.add(rs.getString(1));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lis;
    }
    
    public ArrayList findCausasPenalesJO(String juzgadoClave, String causaClaveJC) {
        try {
            conn.Conectar();
            causas = new ArrayList();
            sql = "SELECT CAUSA_CLAVEJC, CAUSA_CLAVEJO, FECHA_INGRESOJC, TOTAL_DELITOS, TOTAL_PROCESADOS, TOTAL_VICTIMAS "
                    + "FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE JUZGADO_CLAVEJO = '" + juzgadoClave + "' "
                    + "AND CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                    + "ORDER BY 1";
            rs = conn.consultar(sql);
            while (rs.next()) {
                causas.add(new String[]{
                    rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return causas;
    }
    
    public int countCausasPenalesJO(String juzgadoClave) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE JUZGADO_CLAVEJO = '" + juzgadoClave + "'";

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
    
    public int countTotalDelitosJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_DELITOS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";
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
    
    public int countTotalProcesadosJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_PROCESADOS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "';";
            rs = conn.consultar(sql);
            if (rs.next()) {
                total = rs.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showCausasPenales.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public int countTotalVictimasJC(String causaClaveJC) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(DISTINCT VI.VICTIMA_CLAVE) AS TOTAL "
                + "FROM DATOS_VICTIMAS_ADOJC VI, DATOS_VDELITOS_ADOJC VD, DATOS_PDELITOS_ADOJC PD, DATOS_CONCLUSIONES_ADOJC CO "
                + "WHERE VI.CAUSA_CLAVE = VD.CAUSA_CLAVE "
                + "AND VI.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                + "AND VI.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND VD.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                + "AND VD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND VI.VICTIMA_CLAVE = VD.VICTIMA_CLAVE "
                + "AND VD.DELITO_CLAVE = PD.DELITO_CLAVE "
                + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND VI.CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "ORDER BY 1;";

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
  
    public int countTotalVictimasJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT TOTAL_VICTIMAS AS TOTAL FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";

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
    

    public boolean carpetaInvesJO(String juzgadoClave, String numcarpetaJO) {
        boolean Exis = false;
        try {
            conn.Conectar();
            sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + numcarpetaJO + "' "
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
        
        public String FechaIngJO(String juzgadoClave, String causaClaveJO) {
        String FechaIngreso = "";
        try {
            conn.Conectar();
            sql = "SELECT FECHA_INGRESO FROM DATOS_CAUSAS_PENALES_ADOJO WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' AND "
                    + "CAUSA_CLAVEJO = '" + causaClaveJO + "'";
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
   
    public int total_reg_DelitosJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_DELITOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";
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

    public int total_reg_ProcesadosJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_PROCESADOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";
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

    public int total_reg_VictimasJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_VICTIMAS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";

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
    
    public int total_reg_etaInicialJO(String causaClaveJO) {
        total = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM DATOS_ETAPA_ORAL_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "'";

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