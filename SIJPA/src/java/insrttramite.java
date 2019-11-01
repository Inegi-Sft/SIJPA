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
/**
 *
 * @author CESAR.OSORIO
 */
@WebServlet(urlPatterns = {"/insrttramite"})
public class insrttramite extends HttpServlet {
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
      
        String procesado_clave = request.getParameter("pClave");
        String etapaProcesal = request.getParameter("eProcesal");
        String motivo = request.getParameter("eMotivo");
        String fechaActua;

        if (request.getParameter("uActua") != null) {
            fechaActua = request.getParameter("uActua");
        } else {
            fechaActua = "1899-09-09";
        }

        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_TRAMITES_ADOJC  VALUES( 12,12001,1,1,'002/2018-P14'," + etapaProcesal + ",'" + motivo + "','" + fechaActua + "',5)";
            if (conn.escribir(sql)) {
                String [] lista = null;
                System.out.println(sql);
                conn.close();
                
                lista[0] = etapaProcesal;
                lista[1] = motivo;
                lista[2] = fechaActua;
//                response.setContentType("text/html;charset=UTF-8");
//                PrintWriter out = response.getWriter();
//                try {
//                    /* TODO output your page here. You may use following sample code. */
//                    out.println("<tr>");
//                    out.println("<td>002/2018-P14</td>");
//                    out.println("<td>" + etapaProcesal + "</td>");
//                    out.println("<td>" + motivo + "</td>");
//                    out.println("<td>" + fechaActua + "</td>");
//                    out.println("<td><a class='pop' href='tramite.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
//                    out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
//                    out.println("</tr>");
//                } finally {
//                    out.close();
//                }
            } else {
                //regresa a insrttramite y maca error
                conn.close();
                //response.sendRedirect("tramite.jsp?error=si");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrttramite.class.getName()).log(Level.SEVERE, null, ex);
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
