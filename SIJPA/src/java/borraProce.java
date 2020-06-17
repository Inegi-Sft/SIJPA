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
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/borraProce"})
public class borraProce extends HttpServlet {

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
        HttpSession sesion= request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String proceClave = request.getParameter("proceClave");
            String nomTabla = request.getParameter("nomTabla");
            String juzgadoClave = (String)sesion.getAttribute("juzgadoClave");
            conn.Conectar();
            switch (nomTabla) {
                case "inter":
                    sql = "DELETE FROM DATOS_ETAPA_INTERMEDIA_ADOJC "
                            + "WHERE PROCESADO_CLAVE = '" + proceClave + juzgadoClave.replace("-", "") + "';";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("Procesado Borrado de Intermedia");
                    }   conn.close();
                    break;
                case "conclu":
                    sql = "DELETE FROM DATOS_CONCLUSIONES_ADOJC "
                            + "WHERE PROCESADO_CLAVE = '" + proceClave + juzgadoClave.replace("-", "") + "';";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("Procesado Borrado de Conclusiones");
                    }   conn.close();
                    break;
                case "tramite":
                    sql = "DELETE FROM DATOS_TRAMITES_ADOJC "
                            + "WHERE PROCESADO_CLAVE = '" + proceClave + juzgadoClave.replace("-", "") + "';";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("Procesado Borrado de Tramite");
                    }   conn.close();
                    break;
                case "concluJO":
                    sql = "DELETE FROM DATOS_CONCLUSIONES_ADOJO "
                            + "WHERE PROCESADO_CLAVE = '" + proceClave + juzgadoClave.replace("-", "") + "';";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("Procesado Borrado de Conclusiones JO");
                    }   conn.close();
                    break;
                case "tramiteJO":
                    sql = "DELETE FROM DATOS_TRAMITES_ADOJO "
                            + "WHERE PROCESADO_CLAVE = '" + proceClave + juzgadoClave.replace("-", "") + "';";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        out.write("Procesado Borrado de Tramite JO");
                    }   conn.close();
                    break;
                default:
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(borraProce.class.getName()).log(Level.SEVERE, null, ex);
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
