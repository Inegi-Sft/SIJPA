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
        String juzgadoClaveJC = request.getParameter("jClaveJC");
        String juzgadoClaveJO = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadoClaveJO.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String causaClaveJC = request.getParameter("expClaveJC").toUpperCase();
        String causaClaveJO = request.getParameter("expClaveJO").toUpperCase();
        String fechaIngresoJC = request.getParameter("fIngresoJC");
        String fechaIngresoJO = request.getParameter("fIngresoJO");
        String totalDeli = request.getParameter("TdelitosJO");
        String totalAdo = request.getParameter("TadolescentesJO");
        String totalVic = request.getParameter("TvictimasJO");
        //String organoDiferente = request.getParameter("difeOrgano");
        //String juzgadoDiferente = request.getParameter("orgDif");
        String cantJuez = request.getParameter("cantJuez");
        String juezJO1 = request.getParameter("juezJO1");
        String juezJO2 = request.getParameter("juezJO2");
        String juezJO3 = request.getParameter("juezJO3");
        String comentario = request.getParameter("ComentaExpeJO");
        if(juezJO1==null)
            juezJO1="-2";
        if(juezJO2==null)
            juezJO2="-2";
        if(juezJO3==null)
            juezJO3="-2";
        
        try {         
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
  
            conn.Conectar();
            if(!opera.equals("actualizar")){//Si no hay causa entonces se inserta
                sql = "INSERT INTO DATOS_CAUSAS_PENALES_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + juzgadoClaveJC + "','" + juzgadoClaveJO + "','" + causaClaveJC + juzgadoClaveJC.replace("-", "") + "','" 
                        + causaClaveJO + jConcatenado + "','" + fechaIngresoJC + "','" + fechaIngresoJO + "',"
                        + totalDeli + "," + totalAdo + "," + totalVic + "," +cantJuez+ "," 
                        + juezJO1 + "," + juezJO2 + "," + juezJO3 + ",'" + comentario + "', (select YEAR(NOW())));";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    sesion.setAttribute("juzgadoClaveJC", juzgadoClaveJC);
                    sesion.setAttribute("causaClaveJO", causaClaveJO + jConcatenado);
                    sesion.setAttribute("causaClave", causaClaveJC + juzgadoClaveJC.replace("-", ""));
                    usuario usuario = new usuario();
                    usuario.insrtAvanceJO(causaClaveJC + juzgadoClaveJC.replace("-", ""), causaClaveJO + jConcatenado, 2);//Insertamos el avance de la causa penal
                    JSONArray resp = new JSONArray();
                    resp.add(jConcatenado);//regresamos juzgadoJO concatenado
                    resp.add(totalDeli);//regresamos total de delitos JO
                    resp.add(totalAdo);//regresamos total de adolescenetes JO
                    resp.add(totalVic);//regresamos total de victimas JO
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Existe causa entonces es actualizacion
                sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJO SET FECHA_INGRESOJO = '" + fechaIngresoJO + "', TOTAL_DELITOS = " + totalDeli + ", "
                        + "TOTAL_PROCESADOS = " + totalAdo + ", TOTAL_VICTIMAS = " + totalVic + ",CANTIDAD_JUECES = " + cantJuez + ", "
                        + "JUEZ_CLAVE_1 = "+ juezJO1 +"," + "JUEZ_CLAVE_2 = " + juezJO2 + ", JUEZ_CLAVE_3 = " + juezJO3 + ", "
                        + "COMENTARIOS = '" + comentario + "' "
                        + "WHERE JUZGADO_CLAVE = '" + juzgadoClaveJO + "' "
                        + "AND CAUSA_CLAVEJO = '" + sesion.getAttribute("causaClaveJO") + "';";
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
