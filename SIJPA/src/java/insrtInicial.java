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
    String sql,sqlVD,sqlInicial,sqlPM;
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
        String claveCausa = (String) sesion.getAttribute("claveCausa");
        String procesado_clave = request.getParameter("idProcesado");
       
        String audiInicial = request.getParameter("audiInicial");
        String detencion = request.getParameter("ctrlDetencion");
        String legaldetencion = request.getParameter("legalDeten");
        String fechaAutoLiber = request.getParameter("fechaAutoLiber");
        String formuImputa = request.getParameter("formuImputa");
        String fechaFormuImpu = request.getParameter("fechaFormuImpu");
        String declaro = request.getParameter("declaro");
        String fechDeclara = request.getParameter("fechDeclara");
        String huboPlazo = request.getParameter("huboPlazo");
        String Plazo = request.getParameter("plazo");
        String autovincula = request.getParameter("autoVin");
        String fechavincula = request.getParameter("fechAuto");
        String fechAutoLib = request.getParameter("fechAutoLib");
        
        int mcautelar = Integer.parseInt(request.getParameter("drecretaMC"));
        String[] chkMedidaC = request.getParameterValues("apliMedidaCau");
        String especificar = request.getParameter("MCespecificar");
        
        String cierreinvestiga = request.getParameter("soliPlazo");
        String fechaplazo = request.getParameter("fechSoliPlazo");
        String soliProrroga = request.getParameter("soliProrroga");
        String plazofijado = request.getParameter("plazoFijadoC");
        String fechCierreI = request.getParameter("fechCierreI");
        String dictoSobresei = request.getParameter("dictoSobresei");
        String suspenProceso = request.getParameter("suspenProceso");
        String causasSuspension = request.getParameter("causasSuspension");
        String huboReapertura = request.getParameter("huboReapertura");
        String fechaReapertura = request.getParameter("fechaReapertura");
        String quienSoliApertura = request.getParameter("quienSoliApertura");
        String formulaAcusacion = request.getParameter("formulaAcusacion");
        String comentarios = request.getParameter("comentarios");
        
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
//            totalProcesa = cat.countVdelitos(claveCausa + jConcatenado);
//            if (totalProcesa == 0) {
//                vdeli = cat.findVdelitos(claveCausa + jConcatenado);
//                for (String[] ls : vdeli) {
//                    sqlVD = "UPDATE DATOS_DELITOS_ADOJC SET NUMERO_PROCESADOS = " + ls[1] + ", NUMERO_VICTIMAS = " + ls[2] + " WHERE DELITO_CLAVE ='" + ls[0] + "'";
//                    System.out.println(sqlVD);
//                    updateVdeli = conn.escribir(sqlVD);
//                }
//            }
//            if (updateVdeli) {
                sqlInicial = "INSERT INTO DATOS_ETAPAPROC_ADOJC VALUES ("+ entidad +","+ municipio +","+ distrito +","+ numero +",'"+ claveCausa+jConcatenado +"','"
                    + procesado_clave+jConcatenado +"',"+audiInicial+","+ detencion +","+legaldetencion+",'"+ fechaAutoLiber +"',"+formuImputa+",'"+ fechaFormuImpu+"',"
                    + declaro +",'"+ fechDeclara +"',"+ huboPlazo +","+ Plazo +","+ autovincula +",'"+ fechavincula +"','"+ fechAutoLib +"'," + cierreinvestiga + ",'" 
                    + fechaplazo +"',"+soliProrroga+","+ plazofijado +",'"+ fechCierreI +"',"+ dictoSobresei +","+ suspenProceso +","+ causasSuspension +","+huboReapertura+",'"
                    + fechaReapertura +"',"+ quienSoliApertura +","+ formulaAcusacion +",'"+ comentarios +"',(select YEAR(NOW())))";
                System.out.println(sqlInicial);
//                if (conn.escribir(sqlInicial)) {
                    if (mcautelar == 1) {
                        for (int i = 0; i < chkMedidaC.length; i++) {
                            if (chkMedidaC[i].equals("13")) {
                                sqlPM = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'" + claveCausa + jConcatenado + "','"
                                        + procesado_clave + jConcatenado + "'," + chkMedidaC[i] + ",'" + especificar + "', (select YEAR(NOW())))";
                                System.out.println(sqlPM);
//                                insrtPmedida = conn.escribir(sqlPM);
                            } else {
                                sqlPM = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'" + claveCausa + jConcatenado + "','"
                                        + procesado_clave + jConcatenado + "'," + chkMedidaC[i] + ", -2, (select YEAR(NOW())))";
                                System.out.println(sqlPM);
//                                insrtPmedida = conn.escribir(sqlPM);
                            }
                        }
                        if (insrtPmedida) {
                            conn.close();
                        }
//                    }
                }
                //showInicial inicio = new showInicial();
                /*ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = cat.findInicialTabla(procesado_clave + jConcatenado);
                JSONArray resp = new JSONArray();
                resp.add(posicion);
                resp.add(lis.get(0)[0]);
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(cat.countInicial(claveCausa + jConcatenado));
                out.write(resp.toJSONString());
                conn.close();
            } else {
                conn.close();
            }*/
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
