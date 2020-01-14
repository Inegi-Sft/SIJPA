/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showConclusiones;
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
@WebServlet(urlPatterns = {"/insrtConclusiones"})
public class insrtConclusiones extends HttpServlet {

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
    String sqlConclu,sqlDconclu;
    boolean insrtDConclu=false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            HttpSession sesion= request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
//        String posicion = request.getParameter("posicion");
        String entidad =(String) sesion.getAttribute("entidad");
        String municipio =(String) sesion.getAttribute("municipio");
        String numero =(String) sesion.getAttribute("numero");
        String jConcatenado =entidad+municipio+numero;
        String causaClave =(String) sesion.getAttribute("causaClave");
        
        String idProcesado = request.getParameter("idProcesado");
        String fechaResolu=request.getParameter("fechaReso");
        String tipoResolu = request.getParameter("resolucion");
        String tipoSobre = request.getParameter("tipoSobreseimto");
        String proceSobre = request.getParameter("proceSobreseimto");
        String excluAccion = request.getParameter("excluAccion");
        String tipoCondiSCP = request.getParameter("tipoCondiSCP");
        String fechaExtSCP = request.getParameter("fechaExtSCP");
        String tipoMecanismoAR = request.getParameter("tipoMecanismoAR");
        String fechaExtinAR = request.getParameter("fechaExtinAR");
        String tipoResolucionPA = request.getParameter("tipoResolucionPA");
        String privativa = request.getParameter("tipoMedidaPL");
        String noprivativa = request.getParameter("tipoMedidaNPL");
        String internamiento = request.getParameter("internamiento");
        String reparacion = request.getParameter("reparaDanio");
        String tipoRepara = request.getParameter("tipoReparaD");
        String multa = request.getParameter("montoReparaD");
        String impugnacion = request.getParameter("impugnacion");
        String tipoImpugnacion = request.getParameter("tipoImpugnacion");
        String fechaImpugna=request.getParameter("fechaImpugnacion");
        String personaImpugna = request.getParameter("personaImpugna");
        String comentario = request.getParameter("comentarios");
        
        // variables DCONCLUSIONES
        String[] delitoClave = request.getParameterValues("delitoConclu");
        
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            conn.Conectar();
            sqlConclu = "INSERT INTO DATOS_CONCLUSIONES_ADOJC VALUES ("+entidad+","+municipio+","+numero
                    + ",'"+causaClave+jConcatenado+"','"+idProcesado+"', '" + fechaResolu + "'," + tipoResolu + "," + tipoSobre + "," + proceSobre +","+excluAccion
                    + ","+ tipoCondiSCP +",'"+ fechaExtSCP +"',"+ tipoMecanismoAR +",'"+ fechaExtinAR +"',"+ tipoResolucionPA+","+ privativa +","+ noprivativa +"," + internamiento 
                    + ","+ reparacion + "," + tipoRepara + "," + multa + "," + impugnacion + "," + tipoImpugnacion + ",'" + fechaImpugna + "'," + personaImpugna + ",'" + comentario + "', (select YEAR(NOW())) )";
           
            System.out.println(sqlConclu);
            if (conn.escribir(sqlConclu)) {
                for (int i = 0; i < delitoClave.length; i++){
                    String resolDelito = request.getParameter("resolDelito"+i);
                    sqlDconclu = "INSERT INTO DATOS_DCONCLUSIONES_ADOJC VALUES ("+entidad+","+municipio+","+numero
                    + ",'"+causaClave+jConcatenado+"','"+idProcesado+"','"+ delitoClave[i] +"',"+tipoResolu+","+ resolDelito +", (select YEAR(NOW())) )";

                    System.out.println(sqlDconclu);
                }
                insrtDConclu=conn.escribir(sqlDconclu);
                
                conn.close();
            }
            if (insrtDConclu) {
                showConclusiones pro = new showConclusiones();
                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = pro.findConcluProce(idProcesado);
                JSONArray resp = new JSONArray();
//                resp.add(posicion);
                resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(pro.countConclusionesExp(causaClave + jConcatenado));
                out.write(resp.toJSONString());
                conn.close();
            } else {
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtConclusiones.class.getName()).log(Level.SEVERE, null, ex);
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
