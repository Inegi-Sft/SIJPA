/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenalesJO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/obtenCausasJC"})
public class obtenCausasJC extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    showCausasPenalesJO sCausasJC = new showCausasPenalesJO();
    ArrayList<String[]> lista;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("expClaveJC") != null){
                response.setContentType("text/json;charset=UTF-8");
                String jCalveJC = request.getParameter("jClaveJC");
                String expClaveJC = request.getParameter("expClaveJC");
                lista = sCausasJC.findCausaPenalJC(jCalveJC, expClaveJC);
                JSONArray resp = new JSONArray();
                resp.add(lista.get(0)[0]);
                resp.add(lista.get(0)[1]);
                resp.add(lista.get(0)[2]);
                resp.add(lista.get(0)[3]);
                out.write(resp.toJSONString());
            }else if(request.getParameter("jClaveJC") != null){//Vamos por las causas penales del juzgado
                response.setContentType("text/html;charset=UTF-8");
                String jCalveJC = request.getParameter("jClaveJC");
                out.println("<option value=''>--Seleccione--</option>");
                lista = sCausasJC.findCausasJOenJC(jCalveJC);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0] + "'>" + ls[0].replace(jCalveJC.replace("-", ""), "") + "</option>");
                }
            }
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
