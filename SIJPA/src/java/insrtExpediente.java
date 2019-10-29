/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CESAR.OSORIO
 */
@WebServlet(urlPatterns = {"/insrtExpediente"})
public class insrtExpediente extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        String juzgado_clave = request.getParameter("jClave");
        String carpInvestiga = request.getParameter("CarpInves");
        String expediente_clave = request.getParameter("expClave");
        String fecha_ingreso;
        if (request.getParameter("fIngreso") != null) {
            fecha_ingreso = request.getParameter("fIngreso");
        } else {
            fecha_ingreso = "1899-09-09";
        }
        int competencia = Integer.parseInt(request.getParameter("compe"));
        String incompetencia = request.getParameter("Tincompe");
        String acomulado = request.getParameter("ExpAcomu");
        String referencia = request.getParameter("ExpRefe");
        String particular = request.getParameter("Pparticular");
        String tProcedimiento = request.getParameter("Tprocedi");
        String totalDeli = request.getParameter("Tdelitos");
        String totalAdo = request.getParameter("Tadolescentes");
        String totalVic = request.getParameter("Tvictimas");
        String comentario = request.getParameter("ComentaExpe");
        String[] chk = request.getParameterValues("aplAudi");
//        
        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_EXPEDIENTES_ADOJC VALUES (12,12001,1,1,'" + expediente_clave + "','" + juzgado_clave + "','" + carpInvestiga + "','" + fecha_ingreso
                    + "'," + particular + "," + competencia + "," + incompetencia + "," + acomulado + ",'" + referencia + "'," + tProcedimiento
                    + "," + totalDeli + "," + totalAdo + "," + totalVic + ",'" + comentario + "',6)";

            System.out.println(sql);
            if (conn.escribir(sql)) {
                if(competencia == 1 ){
                for (int i = 0; i < chk.length; i++) {
                    String valor = "cantAudi" + chk[i];
                    sql = "INSERT INTO DATOS_TAUDIENCIAS_ADOJC VALUES (12,12001,1,1," + chk[i] + "," + request.getParameter(valor) + ",'" + expediente_clave + "')";
                    System.out.println(sql);
                    if (!conn.escribir(sql)) {
                        conn.close();
                        response.sendRedirect("capturaExpediente.jsp?error=si");
                    }
                }
                }
                conn.close();
                response.sendRedirect("capturaExpediente.jsp?seinserto=si");
            } else {
                conn.close();
                response.sendRedirect("capturaExpediente.jsp?error=si");
            }

        } catch (SQLException ex) {
            Logger.getLogger(insrtExpediente.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insrtExpediente</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
            Logger.getLogger(insrtExpediente.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insrtExpediente.class.getName()).log(Level.SEVERE, null, ex);
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
