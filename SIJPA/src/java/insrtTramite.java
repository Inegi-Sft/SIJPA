/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showTramite;
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
@WebServlet(urlPatterns = {"/insrtTramite"})
public class insrtTramite extends HttpServlet {
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
            throws ServletException, IOException {
        
        HttpSession sesion= request.getSession();
        
        String entidad =(String) sesion.getAttribute("entidad");
        String municipio =(String) sesion.getAttribute("municipio");
        String distrito =(String) sesion.getAttribute("distrito");
        String numero =(String) sesion.getAttribute("numero");
        String jConcatenado =entidad+municipio+distrito+numero;
        String claveCausa =(String) sesion.getAttribute("claveCausa");
        
        String idProcesado = request.getParameter("idProcesado");
        String etapaProcesal = request.getParameter("eProcesal");
        String estInvesti = request.getParameter("estInvesti");
        String estIntermedia = request.getParameter("estIntermedia");
        String especifique = request.getParameter("especifique");
        String fechaActo=request.getParameter("uActo");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            conn.Conectar();
            sql = "INSERT INTO DATOS_TRAMITES_ADOJC  VALUES("+entidad+","+municipio+","+distrito+","+numero+","
                    + "'"+claveCausa+jConcatenado+"','"+idProcesado+"',"+ etapaProcesal +","+estInvesti+","+estIntermedia+"'" 
                    + especifique +"','" + fechaActo +"', (select YEAR(NOW())) )";
            System.out.println(sql);
            if (conn.escribir(sql)) {
                showTramite pro = new showTramite();
                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = pro.findTramiteProce(idProcesado);
                JSONArray resp = new JSONArray();
                
                resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(lis.get(0)[4]);
                resp.add(pro.countTramiteExp(claveCausa + jConcatenado));
                out.write(resp.toJSONString());
                conn.close();
            } else {
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtTramite.class.getName()).log(Level.SEVERE, null, ex);
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
