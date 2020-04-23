/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenales;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(urlPatterns = {"/obtenFechaOcurr"})
public class obtenFechaOcurr extends HttpServlet {

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
    String FechaIngreso=null;
    String FechaOcurrencia=null;
    String juzgadoClave=null;
    String causaClave=null;
    Boolean ver;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        try {
            System.out.println("Entrando al servlet");

            if (request.getParameter("fechaOcurren") != null) {
                juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
                causaClave = (String) sesion.getAttribute("causaClave");
                Date fechaOcurr = Date.valueOf(request.getParameter("fechaOcurren"));
                Date fechaing = Date.valueOf(penales.FechaIng(juzgadoClave, causaClave));
                ver = fechaing.after(fechaOcurr);

                if ((fechaing.after(fechaOcurr) == false) && (!fechaing.equals(fechaOcurr))) {
                    out.write("1");
                    System.out.println(ver + " FECHA OCURENCIA:" + fechaOcurr + " FECHA INGRESO:" + fechaing);
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
