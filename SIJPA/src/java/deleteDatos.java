/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/deleteDatos"})
public class deleteDatos extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession sesion = request.getSession();
        
        String tabla = request.getParameter("tabla");
        String num = request.getParameter("num");
        
        //Condicion para eliminar causas penales
        if(tabla.equals("causas")){
            System.out.println("Borramos Causa Penal");
            try{
                String causaClave = request.getParameter("clave");
                conn.Conectar();
                sql="DELETE FROM DATOS_CAUSAS_PENALES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("causas");
                    conn.close();
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //Condicion para eliminar delitos
        if(tabla.equals("tablaDeli")){
            System.out.println("Borramos Delitos");
            try{
                String clave = request.getParameter("clave");
                conn.Conectar();
                sql="DELETE FROM DATOS_DELITOS_ADOJC WHERE DELITO_CLAVE = '" + clave + "'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJC SET TOTAL_DELITOS = " + num
                            + " WHERE CAUSA_CLAVE = '" + sesion.getAttribute("causaClave") + "';";
                    System.out.println(sql);
                    if (conn.escribir(sql)) {
                        out.write("tablaDeli");
                        conn.close();
                    }else{
                        conn.close();
                    }
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //Condicion para eliminar procesados
        if(tabla.equals("tablaProcesa")){
            System.out.println("Borramos Procesados");
            try{
                String clave = request.getParameter("clave");
                conn.Conectar();
                sql="DELETE FROM DATOS_PROCESADOS_ADOJC WHERE PROCESADO_CLAVE = '" + clave + "'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJC SET TOTAL_PROCESADOS = " + num
                            + " WHERE CAUSA_CLAVE = '" + sesion.getAttribute("causaClave") + "';";
                    System.out.println(sql);
                    if (conn.escribir(sql)) {
                        out.write("tablaProcesa");
                        conn.close();
                    }else{
                        conn.close();
                    }
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //Condicion para eliminar victimas
        if(tabla.equals("tablaVictimas")){
            System.out.println("Borramos Victimas");
            try{
                String clave = request.getParameter("clave");
                conn.Conectar();
                sql="DELETE FROM DATOS_VICTIMAS_ADOJC WHERE VICTIMA_CLAVE = '" + clave + "'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJC SET TOTAL_VICTIMAS = " + num
                            + " WHERE CAUSA_CLAVE = '" + sesion.getAttribute("causaClave") + "';";
                    System.out.println(sql);
                    if (conn.escribir(sql)) {
                        out.write("tablaVictimas");
                        conn.close();
                    }else{
                        conn.close();
                    }
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
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
