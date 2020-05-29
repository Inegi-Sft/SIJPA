/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.usuario;
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
import org.json.simple.JSONArray;

/**
 *
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/insrtCausaPenalJO"})
public class insrtCausaPenalJO extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String juzgadClave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String causaClaveJC = request.getParameter("expClaveJC").toUpperCase();
        String causaClaveJO = request.getParameter("expClaveJO");
        System.out.println("La causa clave es="+causaClaveJO);
        String fecha_ingreso = request.getParameter("fIngresoJO");
        String totalDeli = request.getParameter("TdelitosJO");
        String totalAdo = request.getParameter("TadolescentesJO");
        String totalVic = request.getParameter("TvictimasJO");
        String organoDiferente = request.getParameter("difeOrgano");
        String juzgadoDiferente = request.getParameter("orgDif");
        String cantJuez = request.getParameter("cantJuez");
        String juezJO1 = request.getParameter("juezJO1");
        String juezJO2 = request.getParameter("juezJO2");
        String juezJO3 = request.getParameter("juezJO3");
        String comentario = request.getParameter("ComentaExpeJO");
        

        try {         
               response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
  
        conn.Conectar();
            
            if(!opera.equals("actualizar")){//Si no hay causa entonces se inserta
                sesion.setAttribute("causaClaveJO", causaClaveJO + jConcatenado);
                sql = "INSERT INTO DATOS_CAUSAS_PENALES_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + juzgadClave + "','" + causaClaveJC + jConcatenado +"','" + causaClaveJO + jConcatenado + "','" + fecha_ingreso + "',"
                        + totalDeli + "," + totalAdo + "," + totalVic + ","+ organoDiferente +",'"+ juzgadoDiferente +"',"+cantJuez+"," 
                        + juezJO1 +","+ juezJO2 +","+ juezJO3 +",'"+ comentario + "', (select YEAR(NOW())));";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    usuario usuario = new usuario();
                    usuario.insrtAvanceJO(causaClaveJC + jConcatenado, causaClaveJO + jConcatenado, 2);//Insertamos el avance de la causa penal
                    out.write("1");
                    conn.close();
                } else {
                    conn.close();
                }
            }else{
                sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJO SET FECHA_INGRESO = '"+ fecha_ingreso +"', TOTAL_DELITOS = "+ totalDeli +","
                    + " TOTAL_PROCESADOS = "+ totalAdo +", TOTAL_VICTIMAS = "+ totalVic +", ATENDIDA_ORGDIFERENTE = "+ organoDiferente +","
                    + " JUZGADO_DIFERENTE = '"+ juzgadoDiferente +"', CANTIDAD_JUECES = "+ cantJuez +", JUEZ_CLAVE_1 = "+ juezJO1 +","
                    + " JUEZ_CLAVE_2 = "+ juezJO2 +", JUEZ_CLAVE_3 = "+ juezJO3 +", COMENTARIOS = '" + comentario + "'"
                    + " WHERE JUZGADO_CLAVE = '" + juzgadClave + "'"
                    + " AND CAUSA_CLAVEJO = '" + sesion.getAttribute("causaClaveJO") + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("0");
                    conn.close();
                } else {
                    conn.close();
                }
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
