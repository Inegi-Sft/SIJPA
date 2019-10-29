/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public boolean findUsuario(){
        try {
            conn.Conectar();
            sql = "SELECT * FROM USUARIOS WHERE USUARIO = '" + System.getProperty("user.name") + "' AND ESTATUS = 1;";
            rs = conn.consultar(sql);
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
