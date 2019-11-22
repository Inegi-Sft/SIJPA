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
    String sql;
    showIntermedia cat = new showIntermedia();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String entidad = (String) sesion.getAttribute("entidad");
        String municipio = (String) sesion.getAttribute("municipio");
        String distrito = (String) sesion.getAttribute("distrito");
        String numero = (String) sesion.getAttribute("numero");
        String jConcatenado = entidad + municipio + distrito + numero;
        String expediente = (String) sesion.getAttribute("expediente");
        String procesado_clave = request.getParameter("idProcesado");
        String audiInter = request.getParameter("audiInterme");
        String fechaAudiInter;
        if (request.getParameter("fechaAudiinter") != null) {
            fechaAudiInter = request.getParameter("fechaAudiinter");
        } else {
            fechaAudiInter = "1899-09-09";
        }
        String fechaEscrito;
        if (request.getParameter("fechaEscrito") != null) {
            fechaEscrito = request.getParameter("fechaEscrito");
        } else {
            fechaEscrito = "1899-09-09";
        }
        String correEscrito = request.getParameter("correEscrito");
        String fechaCorreccion;
        if (request.getParameter("fechaCorreccion") != null) {
            fechaCorreccion = request.getParameter("fechaCorreccion");
        } else {
            fechaCorreccion = "1899-09-09";
        }
        String coadyuvante = request.getParameter("asesorCoady");
        String fechaCoady;
        if (request.getParameter("fechaCoady") != null) {
            fechaCoady = request.getParameter("fechaCoady");
        } else {
            fechaCoady = "1899-09-09";
        }
        String medioPrueba = request.getParameter("mediosPrueba");
        String tipoPrueba = request.getParameter("tipoPrueba");
        String excuMedios = request.getParameter("excuMedios");
        String probatorios = request.getParameter("acuerdosProba");
        String comentaInter = request.getParameter("comentarios");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
            sql = "UPDATE DATOS_ETAPAPROC_ADOJC SET AUDIENCIA_INTERMEDIA=" + audiInter + ", FECHA_AUDIENCIA_INTERMEDIA = '" + fechaAudiInter + "', FECHA_ESCRITO_ACUSACION = '"
                    + fechaEscrito + "', CORRECCION_ESCRITO_ACUSACION = " + correEscrito + ", FECHA_CORRECCION_ESCRITO ='" + fechaCorreccion + "', ASESOR_COADYUVANTE = " + coadyuvante + ","
                    + " FECHA_SOLICITUD_COADYUVANTE ='" + fechaCoady + "', PRESENTACION_PRUEBAS = " + medioPrueba + ", TIPO_PRUEBA = " + tipoPrueba + ", EXCLUSION_MEDIOS = " + excuMedios + ","
                    + " ACUERDO_PROBATORIO = " + probatorios + ", COMENTARIOS_INTERMEDIA ='" + comentaInter + "' WHERE PROCESADO_CLAVE = '" + procesado_clave + jConcatenado + "'";
            System.out.println(sql);
            if (conn.escribir(sql)) {

                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = cat.findIntermediaTabla(procesado_clave + jConcatenado);
                JSONArray resp = new JSONArray();
                resp.add(posicion);
                resp.add(lis.get(0)[0]);
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(cat.countIntermedia(expediente + jConcatenado));
                out.write(resp.toJSONString());
                conn.close();
            } else {

                conn.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
