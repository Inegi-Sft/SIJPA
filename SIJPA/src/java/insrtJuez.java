/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/insrtJuez"})
public class insrtJuez extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion= request.getSession();
        
        String juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
        String[] juzSeparado = juzgadoClave.split("-");
        String entidad = juzSeparado[0];
        String mun = juzSeparado[1];
        String num = juzSeparado[2];
        int juezID = Integer.parseInt(request.getParameter("juezID"));
        String nombre = request.getParameter("nombre").toUpperCase();
        String apaterno = request.getParameter("apaterno").toUpperCase();
        String amaterno = request.getParameter("amaterno").toUpperCase();
        String fGestion;
        if (request.getParameter("fGestion") != null) {
            fGestion = request.getParameter("fGestion");
        } else {
            fGestion = "1899-09-09";
        }
        String sexoJuez = request.getParameter("sexoJuez");
        String edadJuez = request.getParameter("edadJuez");
        String estudioJuez = request.getParameter("estudioJuez");
        String funcionJuez = request.getParameter("funcionJuez");

        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_JUECES_ADOJC VALUES(" + entidad + "," + mun + "," + num + ",'" + juzgadoClave + "'," + juezID + ",'"
                    + nombre + "','" + apaterno + "','" + amaterno + "','" + fGestion + "'," + sexoJuez + "," + edadJuez + ","
                    + estudioJuez + "," + funcionJuez + ",(select YEAR(NOW()))"
                    + ")";
            System.out.println(sql);
            if(conn.escribir(sql)){
                conn.close();
                response.sendRedirect("causasPenales.jsp");
            }else{
                conn.close();
                response.sendRedirect("capturaJuez.jsp?error=100");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtJuzgados.class.getName()).log(Level.SEVERE, null, ex);
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
