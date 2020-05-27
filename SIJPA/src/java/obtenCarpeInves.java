/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showCausasPenalesJO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANTONIO.CORIA
 */
@WebServlet(urlPatterns = {"/obtenCarpeInves"})
public class obtenCarpeInves extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    showCausasPenales penales = new showCausasPenales();
    showCausasPenalesJO penalesJO = new showCausasPenalesJO();
    String causaClave=null;
    String causaClaveJO=null;
    String Sistema=null;
    String juzgadoClave=null;
    Boolean Existe;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
       PrintWriter out = response.getWriter();
       Sistema=(String) sesion.getAttribute("Sistema");
       
        try {
            response.setContentType("text/html;charset=UTF-8");            
            if ((request.getParameter("CarpInvestiga") != null) && (Sistema.equals("JC"))){
                juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
                causaClave = request.getParameter("CarpInvestiga") + juzgadoClave.replace("-", "");
                Existe = penales.CarpetaInves(juzgadoClave, causaClave);
                System.out.println("Causa_clave:" + causaClave + "juzgado_clave:" + juzgadoClave + "Existe:" + Existe);
                if (Existe == true) {
                    out.write("1");
                } else {
                    out.write("0");
                }
            }else if ((request.getParameter("CarpInvestiga") != null) && (Sistema.equals("JO"))){
             juzgadoClave = (String) sesion.getAttribute("juzgadoClave"); 
             causaClaveJO= request.getParameter("CarpInvestiga") + juzgadoClave.replace("-", "");
             Existe = penalesJO.CarpetaInvesJO(juzgadoClave, causaClaveJO);
             System.out.println("Causa_claveJO:" + causaClaveJO + "juzgado_clave:" + juzgadoClave + "Existe:" + Existe);
            if (Existe == true) {
                    out.write("1");
                } else {
                    out.write("0");
                }
            }
        } finally {
            out.close();
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
