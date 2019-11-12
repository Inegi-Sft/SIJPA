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
 * @author CESAR.OSORIO
 */
@WebServlet(urlPatterns = {"/instVictimas"})
public class instVictimas extends HttpServlet {

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

        HttpSession sesion = request.getSession();

        String entidadJuz = (String) sesion.getAttribute("entidad");
        String municipioJuz = (String) sesion.getAttribute("municipio");
        String distritoJuz = (String) sesion.getAttribute("distrito");
        String numeroJuz = (String) sesion.getAttribute("numero");
        String victima_clave = request.getParameter("victima_clave");
        String tipo_victima = request.getParameter("tipo_victima");
        String victima_moral = request.getParameter("tvic_moral");
        String asesor = request.getParameter("con_asesor");
        String sexo = request.getParameter("sexo");
        String fecha_nacimiento;
        if (request.getParameter("fnacimiento") != null) {
            fecha_nacimiento = request.getParameter("fnacimiento");
        } else {
            fecha_nacimiento = "1899-09-09";
        }
        int edad = Integer.parseInt(request.getParameter("edad"));
        String vulnerabilidad = request.getParameter("vulnera");
        String paisNacimiento = request.getParameter("Pnacimiento");
        String entidadNacimiento = request.getParameter("Enacimiento");
        String muniNacimiento = request.getParameter("Mnacimiento");
        String nacionalidad = request.getParameter("naciona");
        String paisResi = request.getParameter("Preside");
        String entidadResi = request.getParameter("Ereside");
        String municipioResi = request.getParameter("Mreside");
        String conyugal = request.getParameter("conyugal");
        String discapacidad = request.getParameter("discapacidad");
        String alfabetismo = request.getParameter("alfabetismo");
        String estudios = request.getParameter("estudios");
        String interprete = request.getParameter("interprete");
        String espanol = request.getParameter("hablaesp");
        String indigena = request.getParameter("indigena");
        String familia = request.getParameter("familia");
        String ocupacion = request.getParameter("ocupa");
        String comentarios = request.getParameter("Comentavic");
        String[] procesa = request.getParameterValues("inpPro");
        String[] deli = request.getParameterValues("inpDeli");
        String[] chk = request.getParameterValues("deliCometido");
        String[] procesadoRela = request.getParameterValues("proRela");
        String[] chkRela = request.getParameterValues("chkRelaProce");

        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_VICTIMAS_ADOJC  VALUES(" + entidadJuz + "," + municipioJuz + "," + distritoJuz + "," + numeroJuz + ",'002/2018'"
                    + "," + victima_clave + "," + tipo_victima + "," + victima_moral + "," + sexo + "," + fecha_nacimiento + "," + edad + "," + vulnerabilidad
                    + "," + paisNacimiento + "," + entidadNacimiento + "," + muniNacimiento + "," + nacionalidad + "," + paisResi + "," + entidadResi + "," + municipioResi
                    + "," + conyugal + "," + discapacidad + "," + alfabetismo + "," + estudios + "," + interprete + "," + espanol + "," + indigena + "," + familia
                    + "," + ocupacion + asesor + "," + comentarios + "6" + "(select YEAR(NOW()))" + ")";

            System.out.println(sql);
            if (conn.escribir(sql)) {
                for (int i = 0; i < chk.length; i++) {
                    sql = "INSERT INTO DATOS_VDELITOS_ADOJC VALUES " + entidadJuz + "," + municipioJuz + "," + distritoJuz + "," + numeroJuz + ",'002/2018'"
                            + "," + victima_clave + "," + procesa[i] + "," + deli[i] + ",'Si',6)";

                    System.out.println(sql);
            if(conn.escribir(sql)){
                for(int j=0; j < procesadoRela.length; j++){
                    for(int k=0; k < chkRela.length; k++){
                        sql="INSERT INTO DATOS_VPROCESADOS_ADOJC VALUES (" + entidadJuz + "," + municipioJuz + "," + distritoJuz + "," + numeroJuz + ",'002/2018'"
                                + "";
                    }
                }
            }
                    if (conn.escribir(sql)) {
                        conn.close();
                        response.sendRedirect("elementosPrincipales.jsp?seinserto=si");
                    }
                }
                conn.close();
            } else {
                //regresa a insrttramite y maca error
                conn.close();
                response.sendRedirect("victimas.jsp?error=si");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrttramite.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet instVictimas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + entidadJuz + "</h1>");
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
            Logger.getLogger(instVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(instVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
