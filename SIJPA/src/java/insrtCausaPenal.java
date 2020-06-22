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
        HttpSession sesion = request.getSession();
        
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String juzgadClave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String carpInvestiga = request.getParameter("carpInves").toUpperCase();
        String causaClave = request.getParameter("expClave").toUpperCase();
        String fechaIngreso;
        if (request.getParameter("fIngreso") != null) {
            fechaIngreso = request.getParameter("fIngreso");
        } else {
            fechaIngreso = "1899-09-09";
        }
        String nomJuez = request.getParameter("nomJuez");
        String particular = request.getParameter("Pparticular");
        String acomulado = request.getParameter("ExpAcomu");
        String referencia = verificaVariable(request.getParameter("ExpRefe"));
        String competencia = request.getParameter("compe");
        String incompetencia = verificaVariable(request.getParameter("Tincompe"));
        String totalDeli = verificaVariable(request.getParameter("Tdelitos"));
        String totalAdo = verificaVariable(request.getParameter("Tadolescentes"));
        String totalVic = verificaVariable(request.getParameter("Tvictimas"));
        String comentario = request.getParameter("ComentaExpe");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            if(!opera.equals("actualizar")){//Si no hay causa entonces se inserta
                sesion.setAttribute("causaClave", causaClave + jConcatenado);
                sql = "INSERT INTO DATOS_CAUSAS_PENALES_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" 
                        + juzgadClave + "','" + carpInvestiga + "','" + causaClave + jConcatenado + "','" + fechaIngreso + "',"
                        + nomJuez + "," + particular + "," + competencia + "," + incompetencia + "," + acomulado + ",'" + referencia + "',"
                        + totalDeli + "," + totalAdo + "," + totalVic + ",'" + comentario + "', (select YEAR(NOW())))";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    usuario usuario = new usuario();
                    usuario.insrtAvance(causaClave + jConcatenado, 2);//Insertamos el avance de la causa penal
                    usuario.insrtRegDPV(causaClave, juzgadClave, Integer.parseInt(totalDeli), Integer.parseInt(totalAdo), Integer.parseInt(totalVic));
                    JSONArray resp = new JSONArray();
                    resp.add(competencia);//regresamos competencia
                    resp.add(jConcatenado);//regresamos juzgado concatenado
                    resp.add(totalDeli);//regresamos total de delitos
                    resp.add(totalAdo);//regresamos total de adolescenetes
                    resp.add(totalVic);//regresamos total de victimas
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Si hay causa entonces es actulizacion
                sql = "UPDATE DATOS_CAUSAS_PENALES_ADOJC SET CARPETA_INVESTIGA = '" + carpInvestiga + "',FECHA_INGRESO = '" + fechaIngreso + "',"
                        + "JUEZ_CLAVE = " + nomJuez + ",DERIVA_ACCION_PENAL = " + particular + ",COMPETENCIA = " + competencia + ","
                        + "TIPO_INCOMPETENCIA = " + incompetencia + ",EXPEDIENTE_ACUMULADO = " + acomulado + ",EXPEDIENTE_REFERENCIA = '" + referencia + "',"
                        + "TOTAL_DELITOS = " + totalDeli + ",TOTAL_PROCESADOS = " + totalAdo + ",TOTAL_VICTIMAS = " + totalVic + ","
                        + "COMENTARIOS = '" + comentario + "' "
                        + "WHERE JUZGADO_CLAVE = '" + juzgadClave + "' "
                        + "AND CAUSA_CLAVE = '" + sesion.getAttribute("causaClave") + "';";
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
    
    public String verificaVariable(String variable) {
        String verificada = "";
        if (variable == null) {
            verificada = "-2";
        } else if (variable.equals("")) {
            verificada = "-2";
        } else {
            verificada = variable;
        }
        return verificada;
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
