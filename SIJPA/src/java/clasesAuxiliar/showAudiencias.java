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
    ArrayList<String[]> lista, jueces,audiencias;

    String sql;
    ResultSet resul;
    
     public ArrayList findJuzgados() {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT JUZGADO_CLAVE FROM DATOS_JUZGADOS_ADOJC ORDER BY 1";
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
     
    public ArrayList findCausasJC(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT CAUSA_CLAVE FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "' "
            + " AND CAUSA_CLAVE NOT IN (SELECT DISTINCT CAUSA_CLAVE FROM DATOS_AUDIENCIAS_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "')"
            + " ORDER BY 1";
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
    public ArrayList findAllCausaAudiencias(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT CAUSA_CLAVE, "
            + " CASE SUM(case AUDIENCIA_INVESTIGACION when -2 then 0 else AUDIENCIA_INVESTIGACION end)" 
            + " WHEN 0 THEN 'NO' ELSE 'SI' END INICIAL,"
            + " CASE SUM(case AUDIENCIA_INTERMEDIA when -2 then 0 else AUDIENCIA_INTERMEDIA end)" 
            + " WHEN 0 THEN 'NO' ELSE 'SI' END INTERMEDIA,"
            + " CONCAT(J.APELLIDOP_JUEZ,' ', J.APELLIDOM_JUEZ,' ',J.NOMBRE_JUEZ) AS JUEZ1,"
            + " CONCAT(J2.APELLIDOP_JUEZ,' ', J2.APELLIDOM_JUEZ,' ',J2.NOMBRE_JUEZ) AS JUEZ2,"
            + " CONCAT(J3.APELLIDOP_JUEZ,' ', J3.APELLIDOM_JUEZ,' ',J3.NOMBRE_JUEZ) AS JUEZ3"
            + " FROM DATOS_AUDIENCIAS_ADOJC A "
            + " INNER JOIN DATOS_JUECES_ADOJC J ON A.JUZGADO_CLAVE=J.JUZGADO_CLAVE AND A.JUEZ_CLAVE1=J.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J2 ON A.JUZGADO_CLAVE=J2.JUZGADO_CLAVE AND A.JUEZ_CLAVE2=J2.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J3 ON A.JUZGADO_CLAVE=J3.JUZGADO_CLAVE AND A.JUEZ_CLAVE3=J3.JUEZ_CLAVE"
            + " WHERE A.JUZGADO_CLAVE='"+juzgado+"' GROUP BY A.CAUSA_CLAVE ORDER BY CAUSA_CLAVE";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                String juez2 = resul.getString("JUEZ2");
                String juez3 = resul.getString("JUEZ3");
                if(juez2.equals("-2 -2 -2")){
                    juez2="- - -";
                }
                if(juez3.equals("-2 -2 -2")){
                    juez3="- - -";
                }
                   
                lista.add(new String[]{
                    resul.getString("CAUSA_CLAVE"),
                    resul.getString("JUEZ1"),
                    juez2,
                    juez3,
                    resul.getString("INICIAL"),
                    resul.getString("INTERMEDIA")
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
        lista = new ArrayList<>();
        sql = "SELECT * FROM DATOS_JUECES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "' AND JUEZ_CLAVE <> -2 ORDER BY APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ";	
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
    
    public void compruebaJuezNA(String juzgado) {
        conn.Conectar();
        int existe=0;
        String jDividido[] = juzgado.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        
        sql = "SELECT COUNT(*) EXISTE FROM DATOS_JUECES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "' AND JUEZ_CLAVE= -2";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                existe=resul.getInt("EXISTE");
            }
            System.out.println(existe);
            if(existe==0){
                sql = "INSERT INTO DATOS_JUECES_ADOJC  VALUES (" 
                        + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgado + "', -2, '-2', '-2', '-2', '1899-09-09', -2, -2, -2, -2, -2)";
                System.out.println(sql);
                if(conn.escribir(sql))
                    System.out.println("Juez No aplica insertado!");
            }
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList recuperaJuez(String juzgado, String causa) {
        conn.Conectar();
        jueces = new ArrayList<>();
        sql = "SELECT DISTINCT JUEZ_CLAVE1, JUEZ_CLAVE2, JUEZ_CLAVE3 FROM DATOS_AUDIENCIAS_ADOJC"
            + " WHERE JUZGADO_CLAVE = '" + juzgado + "' AND CAUSA_CLAVE = '" + causa + "'";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                jueces.add(new String[]{
                    resul.getString("JUEZ_CLAVE1"), resul.getString("JUEZ_CLAVE2"), resul.getString("JUEZ_CLAVE3")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jueces;
    }
    
    public ArrayList recuperaAudiencias(String juzgado, String causa, String columna, String audi) {
        conn.Conectar();
        audiencias = new ArrayList<>();
        sql = "SELECT AUDIENCIA_" + columna + ",FECHA_CELEBRACION,DURACION FROM DATOS_AUDIENCIAS_ADOJC"
            + " WHERE JUZGADO_CLAVE = '" + juzgado + "' AND CAUSA_CLAVE = '" + causa + "' AND AUDIENCIA_" + columna + "=" + audi;
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                audiencias.add(new String[]{
                    resul.getString("AUDIENCIA_"+columna), resul.getString("FECHA_CELEBRACION"), resul.getString("DURACION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audiencias;
    }
    
    //********************** J U I C I O  O R A L ********************
    public ArrayList findAllCausaAudienciasJO(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT CAUSA_CLAVEJO, "
            + " CONCAT(J.APELLIDOP_JUEZ,' ', J.APELLIDOM_JUEZ,' ',J.NOMBRE_JUEZ) AS JUEZ1,"
            + " CONCAT(J2.APELLIDOP_JUEZ,' ', J2.APELLIDOM_JUEZ,' ',J2.NOMBRE_JUEZ) AS JUEZ2,"
            + " CONCAT(J3.APELLIDOP_JUEZ,' ', J3.APELLIDOM_JUEZ,' ',J3.NOMBRE_JUEZ) AS JUEZ3"
            + " FROM DATOS_AUDIENCIAS_ADOJO A "
            + " INNER JOIN DATOS_JUECES_ADOJC J ON A.JUZGADO_CLAVE=J.JUZGADO_CLAVE AND A.JUEZ_CLAVE1=J.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J2 ON A.JUZGADO_CLAVE=J2.JUZGADO_CLAVE AND A.JUEZ_CLAVE2=J2.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J3 ON A.JUZGADO_CLAVE=J3.JUZGADO_CLAVE AND A.JUEZ_CLAVE3=J3.JUEZ_CLAVE"
            + " WHERE A.JUZGADO_CLAVE='"+juzgado+"' GROUP BY A.CAUSA_CLAVEJO ORDER BY CAUSA_CLAVEJO";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                String juez2 = resul.getString("JUEZ2");
                String juez3 = resul.getString("JUEZ3");
                if(juez2.equals("-2 -2 -2")){
                    juez2="- - -";
                }
                if(juez3.equals("-2 -2 -2")){
                    juez3="- - -";
                }
                   
                lista.add(new String[]{
                    resul.getString("CAUSA_CLAVEJO"),
                    resul.getString("JUEZ1"),
                    juez2,
                    juez3
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findCausasJO(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT CAUSA_CLAVEJO FROM DATOS_CAUSAS_PENALES_ADOJO WHERE JUZGADO_CLAVE = '" + juzgado + "' "
            + " AND CAUSA_CLAVEJO NOT IN (SELECT DISTINCT CAUSA_CLAVEJO FROM DATOS_AUDIENCIAS_ADOJO WHERE JUZGADO_CLAVE = '" + juzgado + "')"
            + " ORDER BY 1";
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
    
    public ArrayList recuperaJuezJO(String juzgado, String causa) {
        conn.Conectar();
        jueces = new ArrayList<>();
        sql = "SELECT DISTINCT JUEZ_CLAVE1, JUEZ_CLAVE2, JUEZ_CLAVE3 FROM DATOS_AUDIENCIAS_ADOJO"
            + " WHERE JUZGADO_CLAVE = '" + juzgado + "' AND CAUSA_CLAVEJO = '" + causa + "'";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                jueces.add(new String[]{
                    resul.getString("JUEZ_CLAVE1"), resul.getString("JUEZ_CLAVE2"), resul.getString("JUEZ_CLAVE3")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jueces;
    }
    
    public ArrayList recuperaAudienciasJO(String juzgado, String causa, String audi) {
        conn.Conectar();
        audiencias = new ArrayList<>();
        sql = "SELECT AUDIENCIA_JUICIOORAL,FECHA_CELEBRACION,DURACION FROM DATOS_AUDIENCIAS_ADOJO"
            + " WHERE JUZGADO_CLAVE = '" + juzgado + "' AND CAUSA_CLAVEJO = '" + causa + "' AND AUDIENCIA_JUICIOORAL = " + audi;
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                audiencias.add(new String[]{
                    resul.getString("AUDIENCIA_JUICIOORAL"), resul.getString("FECHA_CELEBRACION"), resul.getString("DURACION")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audiencias;
    }
}
