/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/actualiza"})
public class actualiza extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql;
    ResultSet rs;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            conn.Conectar();
            System.out.println("variable: " + request.getParameter("actualizar"));
            if(request.getParameter("crear") != null){
                sql = "CREATE TABLE VERSION_SISTEMA ("
                        + "VERSION varchar(50) COLLATE utf8_bin NOT NULL,"
                        + "PRIMARY KEY (VERSION)"
                        + ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    sql = "INSERT INTO VERSION_SISTEMA VALUES('BETA');";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("1");
                        conn.close();
                    }else{
                        out.write("0");
                        conn.close();
                    }
                }else{
                    out.write("0");
                    conn.close();
                }
            }else if(request.getParameter("version") != null){
                sql = "UPDATE VERSION_SISTEMA "
                        + "SET VERSION = '" + request.getParameter("version") + "';";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    sql = "CREATE TABLE USUARIOS_JUZGADOS ("
                            + "USUARIO varchar(150) COLLATE utf8_bin NOT NULL,"
                            + "JUZGADO_CLAVE varchar(255) COLLATE utf8_bin NOT NULL,"
                            + "PRIMARY KEY (USUARIO,JUZGADO_CLAVE)"
                            + ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        sql = "RENAME TABLE TIPO_USUARIOS TO USUARIOS_TIPO;";
                        System.out.println(sql);
                        if(conn.escribir(sql)){
                            out.write("1");
                            conn.close();
                        }else{
                            out.write("0");
                            conn.close();
                        }
                    }else{
                        out.write("0");
                        conn.close();
                    }
                }else{
                    out.write("0");
                    conn.close();
                }
            } 
        } catch (SQLException ex) {
            Logger.getLogger(actualiza.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
