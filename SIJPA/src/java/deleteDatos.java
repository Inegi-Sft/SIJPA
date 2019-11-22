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
        
        HttpSession sesion= request.getSession();
        
        String entidad =(String) sesion.getAttribute("entidad");
        String municipio =(String) sesion.getAttribute("municipio");
        String distrito =(String) sesion.getAttribute("distrito");
        String numero =(String) sesion.getAttribute("numero");
        String jConcatenado =entidad+municipio+distrito+numero;
        
        String idProConclusion = request.getParameter("proceConclusion");
        String idProTramite = request.getParameter("proceTramite");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //Condicion para eliminar conclusiones
        if(idProConclusion!=null){
            try{
                conn.Conectar();
                sql="DELETE FROM DATOS_CONCLUSIONES_ADOJC WHERE PROCESADO_CLAVE='"+idProConclusion+jConcatenado+"'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("conclusionDeleted");
                } else {
                conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        //Condicion para eliminar tramites
        if(idProTramite!=null){
            try{
                conn.Conectar();
                sql="DELETE FROM DATOS_TRAMITES_ADOJC WHERE PROCESADO_CLAVE='"+idProTramite+jConcatenado+"'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("tramiteDeleted");
                } else {
                conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
//        try {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet deleteDatos</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet deleteDatos at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        } finally {
//            out.close();
//        }
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
