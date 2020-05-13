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
import javax.servlet.http.HttpSession;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/insrtVolcadoJO"})
public class insrtVolcadoJO extends HttpServlet {

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
    boolean inserta = false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        
        String causaClave = (String) sesion.getAttribute("causaClave");
        String juzgadClave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String proceClave = request.getParameter("proceClave");
        System.out.println("Proceado en volcado: " + proceClave);
        
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
            sql = "SELECT CAUSA_CLAVEJC FROM DATOS_CAUSAS_PENALES_ADOJO "
                    + "WHERE CAUSA_CLAVEJC = '" + causaClave + "';";
            System.out.println(sql);
            rs = conn.consultar(sql);
            if(rs.next()){
                sql = "UPDATE";
            }else{
                sql = "SELECT CP.CAUSA_CLAVE, CP.FECHA_INGRESO, COUNT(PD.DELITO_CLAVE), COUNT(PD.PROCESADO_CLAVE), PD.NUMERO_VICTIMAS "
                        + "FROM `DATOS_CONCLUSIONES_ADOJC` PR, `DATOS_CAUSAS_PENALES_ADOJC` CP, `DATOS_PDELITOS_ADOJC` PD "
                        + "WHERE PR.CAUSA_CLAVE = CP.CAUSA_CLAVE "
                        + "AND PR.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                        + "AND CP.CAUSA_CLAVE = PD.CAUSA_CLAVE "
                        + "AND PR.PROCESADO_CLAVE = PD.PROCESADO_CLAVE "
                        + "AND PR.CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND PR.PROCESADO_CLAVE = '" + proceClave + jConcatenado + "' "
                        + "AND PR.TIPO_RESOLUCION = 5;";
                System.out.println(sql);
                rs = conn.consultar(sql);
                if(rs.next()){
                    sql = "INSERT INTO DATOS_CAUSAS_PENALES_ADOJO VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                            + juzgadClave + "','" + causaClave + "',-2,'" + rs.getString(2) + "',-2,-2,-2,-2,-2," + rs.getString(3) + ","
                            + rs.getString(4) + "," + rs.getString(5) + ",'',(select YEAR(NOW())) );";
                    System.out.println(sql);
                    conn.escribir(sql);
                }else{
                    System.err.println("No existe la causa penal del procesado " + proceClave + jConcatenado);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtVolcadoJO.class.getName()).log(Level.SEVERE, null, ex);
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
