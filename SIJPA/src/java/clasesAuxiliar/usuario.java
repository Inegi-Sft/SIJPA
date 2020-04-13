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
            sql = "SELECT * FROM USUARIOS WHERE CORREO = '" + nomUsuario + "' AND CONTRASENIA = '" + passUsuario + "' AND ESTATUS = 1;";
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
            sql = "SELECT TIPO_USUARIO FROM USUARIOS WHERE CORREO = '" + nomUsuario + "' AND CONTRASENIA = '" + passUsuario + "';";
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
            listaTabla = new ArrayList<String[]>();
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
            listaTabla = new ArrayList<String[]>();
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
    
    public void insrtAvance(String causaClave, int avance){
        try{
            conn.Conectar();
            if(avance == 1){
                sql = "INSERT INTO USUARIOS_CONTROL VALUES('" + causaClave + "'," + avance + ");";
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
}
