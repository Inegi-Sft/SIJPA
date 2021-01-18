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
    ArrayList<String> juez;

    String sql;
    ResultSet resul;
     
    public ArrayList findCausasJC(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        
        sql = "SELECT CAUSA_CLAVE FROM DATOS_CAUSAS_PENALES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "'"
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
    
    public ArrayList recuperaAudienciasInvestigacion(String juzgado) {
        conn.Conectar();
        audiencias = new ArrayList<>();
        
        sql = "SELECT A.NUM_AUDI, CONCAT(I.AUDIENCIA_ID,'.- ',I.DESCRIPCION), CONCAT(J.APELLIDOP_JUEZ,' ',J.APELLIDOM_JUEZ,' ', J.NOMBRE_JUEZ), "
            + "A.CAUSA_CLAVE, A.FECHA_INICIO, A.FECHA_FINALIZO FROM DATOS_AUDIENCIAS_ADOJC A "
            + "INNER JOIN CATALOGOS_AUDIENCIAS_INVESTIGACION I ON A.AUDIENCIA_INVESTIGACION=I.AUDIENCIA_ID "
            + "INNER JOIN DATOS_JUECES_ADOJC J ON J.JUEZ_CLAVE=A.JUEZ_CLAVE1 "
            + "WHERE A.JUZGADO_CLAVE = '" + juzgado + "' AND J.JUZGADO_CLAVE='" + juzgado + "' AND A.AUDIENCIA_INVESTIGACION <>-2";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                audiencias.add(new String[]{
                    resul.getString(1),resul.getString(2), resul.getString(3), 
                    resul.getString(4),resul.getString(5),resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audiencias;
    }
    
    public ArrayList recuperaAudienciasIntermedia(String juzgado) {
        conn.Conectar();
        audiencias = new ArrayList<>();
        
        sql = "SELECT A.NUM_AUDI, CONCAT(I.AUDIENCIA_ID,'.- ',I.DESCRIPCION), CONCAT(J.APELLIDOP_JUEZ,' ',J.APELLIDOM_JUEZ,' ', J.NOMBRE_JUEZ), "
            + "A.CAUSA_CLAVE, A.FECHA_INICIO, A.FECHA_FINALIZO FROM DATOS_AUDIENCIAS_ADOJC A "
            + "INNER JOIN CATALOGOS_AUDIENCIAS_INTERMEDIA I ON A.AUDIENCIA_INTERMEDIA=I.AUDIENCIA_ID "
            + "INNER JOIN DATOS_JUECES_ADOJC J ON J.JUEZ_CLAVE=A.JUEZ_CLAVE1 "
            + "WHERE A.JUZGADO_CLAVE = '" + juzgado + "' AND J.JUZGADO_CLAVE='" + juzgado + "' AND A.AUDIENCIA_INTERMEDIA <>-2";
        
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                audiencias.add(new String[]{
                    resul.getString(1),resul.getString(2), resul.getString(3), 
                    resul.getString(4),resul.getString(5),resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audiencias;
    }
    
    public ArrayList findJueces(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        
        sql = "SELECT JUEZ_CLAVE, APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ FROM DATOS_JUECES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "' "
            + "AND JUEZ_CLAVE <> -2 AND ESTATUS = 1 "
            + "ORDER BY APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2),
                    resul.getString(3),resul.getString(4)
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
                existe = resul.getInt("EXISTE");
            }
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
    
   
    //********************** J U I C I O  O R A L ********************
    public ArrayList recuperaAudienciasJO(String juzgado) {
        conn.Conectar();
        lista = new ArrayList<>();
        sql = "SELECT NUM_AUDI, CONCAT(JO.AUDIENCIA_ID,'.- ',JO.DESCRIPCION), CAUSA_CLAVEJO, "
            + " CONCAT(J.APELLIDOP_JUEZ,' ', J.APELLIDOM_JUEZ,' ',J.NOMBRE_JUEZ) AS JUEZ1,"
            + " CONCAT(J2.APELLIDOP_JUEZ,' ', J2.APELLIDOM_JUEZ,' ',J2.NOMBRE_JUEZ) AS JUEZ2,"
            + " CONCAT(J3.APELLIDOP_JUEZ,' ', J3.APELLIDOM_JUEZ,' ',J3.NOMBRE_JUEZ) AS JUEZ3,"
            + " FECHA_INICIO, FECHA_FINALIZO"
            + " FROM DATOS_AUDIENCIAS_ADOJO A "
            + " INNER JOIN CATALOGOS_AUDIENCIAS_JUICIOORAL JO ON A.AUDIENCIA_JUICIOORAL=JO.AUDIENCIA_ID "
            + " INNER JOIN DATOS_JUECES_ADOJC J ON A.JUZGADO_CLAVE=J.JUZGADO_CLAVE AND A.JUEZ_CLAVE1=J.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J2 ON A.JUZGADO_CLAVE=J2.JUZGADO_CLAVE AND A.JUEZ_CLAVE2=J2.JUEZ_CLAVE"
            + " INNER JOIN DATOS_JUECES_ADOJC J3 ON A.JUZGADO_CLAVE=J3.JUZGADO_CLAVE AND A.JUEZ_CLAVE3=J3.JUEZ_CLAVE"
            + " WHERE A.JUZGADO_CLAVE='"+juzgado+"' ";
        
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
                    resul.getString("NUM_AUDI"), resul.getString(2), resul.getString("CAUSA_CLAVEJO"),
                    resul.getString("JUEZ1"), juez2, juez3, 
                    resul.getString("FECHA_INICIO"), resul.getString("FECHA_FINALIZO")
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
        sql = "SELECT CAUSA_CLAVEJO, CAUSA_CLAVEJC FROM DATOS_CAUSAS_PENALES_ADOJO WHERE JUZGADO_CLAVEJO = '" + juzgado + "' "
            + " ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findJuecesJO(String juzgado, String causa, String operacion) {
        conn.Conectar();
        lista = new ArrayList<>();
        
        sql = "SELECT JUEZ_CLAVE, APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ FROM DATOS_JUECES_ADOJC WHERE JUZGADO_CLAVE = '" + juzgado + "' "
        + "AND JUEZ_CLAVE <> -2 "
        + "AND ESTATUS = 1 "
        + "ORDER BY APELLIDOP_JUEZ, APELLIDOM_JUEZ, NOMBRE_JUEZ";

        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2),
                    resul.getString(3),resul.getString(4)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findJuezAtendioJC(String causa, String juzgadoJO) {
        juez = new ArrayList();
        conn.Conectar();
        sql = "SELECT DISTINCT JUEZ_CLAVE1 FROM DATOS_AUDIENCIAS_ADOJC WHERE CAUSA_CLAVE='"+causa+"' "
            + "AND JUZGADO_CLAVE='"+juzgadoJO+"'";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                juez.add(resul.getString(1));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return juez;
    }
}
