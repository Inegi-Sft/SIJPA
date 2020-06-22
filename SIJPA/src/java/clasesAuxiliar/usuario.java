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
public class usuario {
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql;
    ResultSet rs;
    ArrayList<String[]> listaTabla;
    
    public int findTotUsu(){
        int totUsu = 0;
        try {
            conn.Conectar();
            sql = "SELECT COUNT(*) FROM USUARIOS";
            rs = conn.consultar(sql);
            while(rs.next()){
                totUsu = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totUsu;
    }
    
    public boolean findUsuarioExist(String usuario){
        try{
            conn.Conectar();
            sql = "SELECT CORREO FROM USUARIOS WHERE CORREO = '" + usuario + "';";
            rs = conn.consultar(sql);
            return rs.next();
        } catch(SQLException ex){
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean findUsuario(String nomUsuario, String passUsuario){
        try {
            conn.Conectar();
            sql = "SELECT * FROM USUARIOS WHERE CORREO = '" + nomUsuario + "' "
                    + "AND CONTRASENIA = '" + passUsuario + "' "
                    + "AND ESTATUS = 1;";
            System.out.println(sql);
            rs = conn.consultar(sql);
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public int findTipoUsuario(String nomUsuario, String passUsuario){
        int tipo = 0;
        try {
            conn.Conectar();
            sql = "SELECT TIPO_USUARIO FROM USUARIOS WHERE CORREO = '" + nomUsuario + "' "
                    + "AND CONTRASENIA = '" + passUsuario + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while(rs.next()){
                tipo = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tipo;
    }
    
    public int findVisitaUsu(String nomUsuario){
        int visita = 0;
        try {
            conn.Conectar();
            sql = "SELECT VISITA FROM USUARIOS WHERE CORREO = '" + nomUsuario + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while(rs.next()){
                visita = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return visita;
    }
    
    public ArrayList findEntidad(){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<>();
            sql = "SELECT U.ENTIDAD, CE.DESCRIPCION FROM USUARIOS U JOIN CATALOGOS_ENTIDADES CE "
                    + "ON U.ENTIDAD = CE.ENTIDAD_ID "
                    + "WHERE U.TIPO_USUARIO = 1";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while(rs.next()){
                listaTabla.add(new String[]{
                    rs.getString(1),rs.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaTabla;
    }
    
    public ArrayList findUsuarioTabla(){
        try {
            conn.Conectar();
            listaTabla = new ArrayList<>();
            sql = "SELECT U.USUARIO_ID,CONCAT(U.NOMBRE,' ',U.APATERNO,' ',U.AMATERNO),U.EDAD,U.CORREO,CE.DESCRIPCION, TU.DESCRIPCION "
                    + "FROM USUARIOS U JOIN CATALOGOS_ENTIDADES CE "
                    + "ON U.ENTIDAD = CE.ENTIDAD_ID "
                    + "JOIN TIPO_USUARIOS TU "
                    + "ON U.TIPO_USUARIO = TU.TIPO_USUARIO_ID "
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
    
    public int findAvanceUsuario(String causaClave){
        int avance = 0;
        try {
            conn.Conectar();
            sql = "SELECT AVANCE FROM USUARIOS_CONTROL WHERE CAUSA_CLAVE = '" + causaClave + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                avance = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return avance;
    }
    
    public int findAvanceUsuarioJO(String causaClaveJO){
        int avance = 0;
        try {
            conn.Conectar();
            sql = "SELECT AVANCEJO FROM USUARIOS_CONTROL WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            while (rs.next()) {
                avance = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        return avance;
    }
    
    public void insrtAvance(String causaClave, int avance){
        try{
            conn.Conectar();
            if(avance == 2){
                sql = "INSERT INTO USUARIOS_CONTROL(CAUSA_CLAVE,AVANCE) VALUES('" + causaClave + "'," + avance + ");";
            }else{
                sql = "UPDATE USUARIOS_CONTROL SET AVANCE = " + avance + " WHERE CAUSA_CLAVE = '" + causaClave + "';";
            }
            System.out.println(sql);
            conn.escribir(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insrtAvanceJO(String causaClaveJC, String causaClaveJO, int avanceJO){
        try{
            conn.Conectar();
            sql = "UPDATE USUARIOS_CONTROL SET CAUSA_CLAVEJO = '" + causaClaveJO + "', AVANCEJO = " + avanceJO + " "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "';";
            System.out.println(sql);
            conn.escribir(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insrtRegDPV(String causaClave, String juzgadoClave, int totDel, int totPro, int totVict){
        try{
            int x;
            conn.Conectar();
            String jDividido[] = juzgadoClave.split("-"); //Esto separa en un array basandose en el separador que le pases
            String jEntidad = jDividido[0];
            String jMunicipio = jDividido[1];
            String jNumero = jDividido[2];
            String jConcatenado = jEntidad + jMunicipio + jNumero;
            for(x = 1; x <= totDel; x++){
                sql = "INSERT INTO DATOS_DELITOS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + causaClave + jConcatenado + "','" + causaClave + "-D" + x + jConcatenado + "'," 
                        + "-2,-2,-2,-2,-2,'1899-09-09','1899-09-09',-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,0,0,'REGNUEVO',(select YEAR(NOW())) )";
                System.out.println(sql);
                conn.escribir(sql);
            }
            for(x = 1; x <= totPro; x++){
                sql = "INSERT INTO DATOS_PROCESADOS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + causaClave + jConcatenado + "','" + causaClave + "-P" + x + jConcatenado + "'," 
                        + "-2,-2,-2,-2,-2,'1899-09-09',-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,"
                        + "-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,'REGNUEVO',(select YEAR(NOW())) )";
                System.out.println(sql);
                conn.escribir(sql);
                sql = "INSERT INTO DATOS_ETAPA_INICIAL_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + causaClave + jConcatenado + "','" + causaClave + "-P" + x + jConcatenado + "'," 
                        + "-2,-2,-2,'1899-09-09',-2,'1899-09-09',-2,'1899-09-09',-2,-2,-2,'1899-09-09',-2,-2,"
                        + "'1899-09-09',-2,-2,'1899-09-09',-2,-2,-2,-2,'1899-09-09',-2,-2,'REGNUEVO',(select YEAR(NOW())),0)";
                System.out.println(sql);
                conn.escribir(sql);
            }
            for(x = 1; x <= totVict; x++){
                sql = "INSERT INTO DATOS_VICTIMAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + causaClave + jConcatenado + "','" + causaClave + "-V" + x + jConcatenado + "'," 
                        + "-2,-2,-2,-2,-2,'1899-09-09',-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,"
                        + "-2,-2,-2,-2,-2,'REGNUEVO',(select YEAR(NOW())) )";
                System.out.println(sql);
                conn.escribir(sql);
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(showJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
