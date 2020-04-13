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

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/obtenCausaJC"})
public class obtenCausaJC extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    showCausasPenalesJO cat = new showCausasPenalesJO();
    ArrayList<String[]> lista;
    String juzClave = null;
    String causaClave = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("juzClave") != null) {
                juzClave = request.getParameter("juzClave");
                out.println("<option value='" + juzClave + "'>--Seleccione--</option>");

                lista = cat.findcausaClaveJC(juzClave);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                }
            } else if (request.getParameter("causaClave") != null) {
                causaClave = request.getParameter("causaClave");
                out.println("<option value='" + causaClave + "'>--Seleccione--</option>");

                juzClave = request.getParameter("jClave");
                switch (Integer.parseInt(request.getParameter("bandera"))) {
                    case 1:
                        lista = cat.findTotalDelitos(juzClave, causaClave);
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                        }
                        break;
                    case 2:
                        lista = cat.findTotalProce(causaClave);
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                        }
                        break;
                    case 3:
                        lista = cat.findTotalVic(causaClave);
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                        }
                        break;
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
