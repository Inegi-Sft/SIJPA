/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CESAR.OSORIO
 */
@WebServlet(urlPatterns = {"/insrtCausaPenal"})
public class insrtCausaPenal extends HttpServlet {

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
    boolean insrtExpe;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession sesion= request.getSession();

        String juzgado_clave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgado_clave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        
        sesion.setAttribute("entidad", jEntidad);
        sesion.setAttribute("municipio", jMunicipio);
        sesion.setAttribute("numero", jNumero);
        
        String carpInvestiga = request.getParameter("CarpInves");
        String causaClave = request.getParameter("expClave");
        sesion.setAttribute("causaClave",causaClave);
        String fecha_ingreso;
        if (request.getParameter("fIngreso") != null) {
            fecha_ingreso = request.getParameter("fIngreso");
        } else {
            fecha_ingreso = "1899-09-09";
        }
        String nomJuez = request.getParameter("nomJuez");
        String particular = request.getParameter("Pparticular");
        String acomulado = request.getParameter("ExpAcomu");
        String referencia = request.getParameter("ExpRefe");
        int competencia = Integer.parseInt(request.getParameter("compe"));
        String incompetencia = request.getParameter("Tincompe");
        String totalDeli = request.getParameter("Tdelitos");
        String totalAdo = request.getParameter("Tadolescentes");
        String totalVic = request.getParameter("Tvictimas");
        String comentario = request.getParameter("ComentaExpe");
      
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            sql = "INSERT INTO DATOS_CAUSAS_PENALES_ADOJC VALUES ("+ jEntidad +","+ jMunicipio +"," + jNumero
                    + ",'" + juzgado_clave + "','" + carpInvestiga + "','" + causaClave + jConcatenado + "','" + fecha_ingreso + "','" 
                    + nomJuez + "'," + particular+ "," + competencia + "," + incompetencia + "," + acomulado + ",'" + referencia + "'," 
                    + totalDeli + "," + totalAdo + "," + totalVic + ",'" + comentario + "', (select YEAR(NOW())))";
            System.out.println(sql);
            if (conn.escribir(sql)) {
                out.write(request.getParameter("compe"));
                conn.close();
            } else {
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtCausaPenal.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insrtCausaPenal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insrtCausaPenal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
