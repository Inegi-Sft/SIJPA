/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showIntermedia;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
@WebServlet(urlPatterns = {"/insrtIntermedia"})
public class insrtIntermedia extends HttpServlet {

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
    String sql, sqlIntermedia, sqlMP, sqlAJ, sqlDefensa;
    boolean insertMP, insertAJ, insertDefensa;
    showIntermedia cat = new showIntermedia();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String entidad = (String) sesion.getAttribute("entidad");
        String municipio = (String) sesion.getAttribute("municipio");
        String numero = (String) sesion.getAttribute("numero");
        String jConcatenado = entidad + municipio + numero;
        String causaClave = (String) sesion.getAttribute("causaClave");
        String procesado_clave = request.getParameter("idProcesado");
        String fechaEscrito;
        if (request.getParameter("fechaEscrito") != null) {
            fechaEscrito = request.getParameter("fechaEscrito");
        } else {
            fechaEscrito = "1899-09-09";
        }
        String fechaContestacion;
        if (request.getParameter("contestaEscrito") != null) {
            fechaContestacion = request.getParameter("contestaEscrito");
        } else {
            fechaContestacion = "1899-09-09";
        }
        String descubrimiento = request.getParameter("decubreProba");
        String intermedia = request.getParameter("audiInterme");
        String fechaIntermedia;
        if (request.getParameter("fechaAudiinter") != null) {
            fechaIntermedia = request.getParameter("fechaAudiinter");
        } else {
            fechaIntermedia = "1899-09-09";
        }
        String separacion = request.getParameter("separaAcusa");
        int mediosPrueba = Integer.parseInt(request.getParameter("mediosPrueba"));
        int pruebaMP = Integer.parseInt(request.getParameter("pruebaMP"));
        int pruebaAJ = Integer.parseInt(request.getParameter("pruebaAJ"));
        int pruebaDefensa = Integer.parseInt(request.getParameter("pruebaDefensa"));
        String[] chkpruebaMP = request.getParameterValues("chkpruebaMP");
        String[] chkpruebaAJ = request.getParameterValues("chkpruebaAJ");
        String[] chkpruebaDefen = request.getParameterValues("chkpruebaDefen");
        String acuerdosProba = request.getParameter("acuerdosProba");
        String aperturaJO = request.getParameter("aperturaJO");
        String comentaInter = request.getParameter("comentarios");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
            sqlIntermedia = "INSERT INTO DATOS_ETAPA_INTERMEDIA_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'" + causaClave + jConcatenado
                    + "','" + procesado_clave + jConcatenado + "','" + fechaEscrito + "','" + fechaContestacion + "'," + descubrimiento + "," + intermedia + ",'" + fechaIntermedia
                    + "'," + separacion + "," + mediosPrueba + "," + pruebaMP + "," + pruebaAJ + "," + pruebaDefensa + "," + acuerdosProba + "," + aperturaJO
                    + ",'" + comentaInter + "',(select YEAR(NOW())))";
            System.out.println(sqlIntermedia);

            if (conn.escribir(sqlIntermedia)) {
                if (mediosPrueba == 1) {
                    if (pruebaMP == 1) {
                        for (int i = 0; i < chkpruebaMP.length; i++) {
                            sqlMP = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'" + causaClave + jConcatenado
                                    + "','" + procesado_clave + jConcatenado + "',1," + chkpruebaMP[i] + ",(select YEAR(NOW())))";
                            System.out.println(sqlMP);
                            insertMP = conn.escribir(sqlMP);

                        }
                    }
                    if (pruebaAJ == 1) {
                        for (int j = 0; j < chkpruebaAJ.length; j++) {
                            sqlAJ = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'" + causaClave + jConcatenado
                                    + "','" + procesado_clave + jConcatenado + "',2," + chkpruebaAJ[j] + ",(select YEAR(NOW())))";
                            System.out.println(sqlAJ);
                            insertAJ = conn.escribir(sqlAJ);
                        }
                    }
                    if (pruebaDefensa == 1) {
                        for (int k = 0; k < chkpruebaDefen.length; k++) {
                            sqlDefensa = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'" + causaClave + jConcatenado
                                    + "','" + procesado_clave + jConcatenado + "',3," + chkpruebaDefen[k] + ",(select YEAR(NOW())))";
                            System.out.println(sqlDefensa);
                            insertDefensa = conn.escribir(sqlDefensa);
                        }
                    }
                    if (insertMP || insertAJ || insertDefensa) {
                        conn.close();
                    }
                }

                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = cat.findIntermediaTabla(procesado_clave + jConcatenado);
                JSONArray resp = new JSONArray();
                resp.add(posicion);
                resp.add(lis.get(0)[0]);
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(cat.countIntermedia(causaClave + jConcatenado));
                resp.add(cat.countTotPasanInicial_Intermedia(causaClave + jConcatenado));
                out.write(resp.toJSONString());
                conn.close();
            } else {

                conn.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtIntermedia.class.getName()).log(Level.SEVERE, null, ex);
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
