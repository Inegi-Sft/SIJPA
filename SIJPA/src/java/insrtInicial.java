/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showInicial;
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
@WebServlet(urlPatterns = {"/insrtInicial"})
public class insrtInicial extends HttpServlet {

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
    boolean insrtPmedida;
    boolean updateVdeli;
    int totalProcesa;
    showInicial cat = new showInicial();
    ArrayList<String[]> vdeli;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

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
        String detencion = request.getParameter("ctrlDetencion");
        String fechadetencion;
        if (request.getParameter("fechaCtrlDeten") != null) {
            fechadetencion = request.getParameter("fechaCtrlDeten");
        } else {
            fechadetencion = "1899-09-09";
        }
        String legaldetencion = request.getParameter("legalDeten");
        String audiInicial = request.getParameter("audiInicial");
        String conducinicial = request.getParameter("conducAudi");
        String fechaimputa;
        if (request.getParameter("fechaFormuImpu") != null) {
            fechaimputa = request.getParameter("fechaFormuImpu");
        } else {
            fechaimputa = "1899-09-09";
        }
        String declaro = request.getParameter("declaro");
        String fechadeclara;
        if (request.getParameter("fechDeclara") != null) {
            fechadeclara = request.getParameter("fechDeclara");
        } else {
            fechadeclara = "1899-09-09";
        }
        String plazoconsti = request.getParameter("huboPlazo");
        String Plazo = request.getParameter("plazo");
        String autovincula = request.getParameter("autoVin");
        String fechavincula;
        if (request.getParameter("fechAuto") != null) {
            fechavincula = request.getParameter("fechAuto");
        } else {
            fechavincula = "1899-09-09";
        }
        String cierreinvestiga = request.getParameter("soliPlazo");
        String fechaplazo;
        if (request.getParameter("fechSoliPlazo") != null) {
            fechaplazo = request.getParameter("fechSoliPlazo");
        } else {
            fechaplazo = "1899-09-09";
        }
        String plazofijado = request.getParameter("plazoFijadoC");
        String fechainvestiga;
        if (request.getParameter("fechCierreI") != null) {
            fechainvestiga = request.getParameter("fechCierreI");
        } else {
            fechainvestiga = "1899-09-09";
        }
        String comentaInicial;
        if (request.getParameter("comentarios") != null) {
            comentaInicial = request.getParameter("comentarios");
        } else {
            comentaInicial = "-2";
        }
        int mcautelar = Integer.parseInt(request.getParameter("drecretaMC"));
        String[] chk = request.getParameterValues("apliMedidaCau");
        String especificar = request.getParameter("MCespecificar");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
            totalProcesa = cat.countVdelitos(expediente + jConcatenado);
            if (totalProcesa == 0) {
                vdeli = cat.findVdelitos(expediente + jConcatenado);
                for (String[] ls : vdeli) {
                    sql = "UPDATE DATOS_DELITOS_ADOJC SET NUMERO_PROCESADOS = " + ls[1] + ", NUMERO_VICTIMAS = " + ls[2] + " WHERE DELITO_CLAVE ='" + ls[0] + "'";
                    System.out.println(sql);
                    updateVdeli = conn.escribir(sql);
                }
            }
            if (updateVdeli) {
                sql = "INSERT INTO DATOS_ETAPAPROC_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'" + expediente + jConcatenado + "','"
                        + procesado_clave + jConcatenado + "'," + detencion + ",'" + fechadetencion + "'," + legaldetencion + "," + audiInicial + "," + conducinicial + ",'" + fechaimputa
                        + "'," + declaro + ",'" + fechadeclara + "'," + plazoconsti + "," + Plazo + "," + autovincula + ",'" + fechavincula + "'," + cierreinvestiga + ",'" + fechaplazo
                        + "'," + plazofijado + ",'" + fechainvestiga + "',-2,'1899-09-09','1899-09-09',-2,'1899-09-09',-2,'1899-09-09',-2,-2,-2,-2,'" + comentaInicial + "','-2',(select YEAR(NOW())))";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (mcautelar == 1) {
                        for (int i = 0; i < chk.length; i++) {
                            System.out.println("entra");
                            if (chk[i].equals("13")) {
                                sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'" + expediente + jConcatenado + "','"
                                        + procesado_clave + jConcatenado + "'," + chk[i] + ",'" + especificar + "', (select YEAR(NOW())))";
                                System.out.println(sql);
                                insrtPmedida = conn.escribir(sql);
                            } else {
                                sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'" + expediente + jConcatenado + "','"
                                        + procesado_clave + jConcatenado + "'," + chk[i] + ", -2, (select YEAR(NOW())))";
                                System.out.println(sql);
                                insrtPmedida = conn.escribir(sql);
                            }
                        }
                        if (insrtPmedida) {
                            conn.close();
                        }
                    }
                }
                //showInicial inicio = new showInicial();
                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = cat.findInicialTabla(procesado_clave + jConcatenado);
                JSONArray resp = new JSONArray();
                resp.add(posicion);
                resp.add(lis.get(0)[0]);
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(cat.countInicial(expediente + jConcatenado));
                out.write(resp.toJSONString());

                conn.close();
            } else {

                conn.close();

            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtInicial.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
