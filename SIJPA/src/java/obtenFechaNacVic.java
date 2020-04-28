/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenales;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ANTONIO.CORIA
 */
public class obtenFechaNacVic extends HttpServlet {

    String FechExpe=null;
    int edad=0;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
        String causaClave = (String) sesion.getAttribute("causaClave");
        showCausasPenales penales = new showCausasPenales();
        
         try {
          if (request.getParameter("FechaNac") != null) {
             String FechNac = request.getParameter("FechaNac");
                String AnoNac = FechNac.substring(0, 4);
                FechExpe = penales.FechaIng(juzgadoClave, causaClave);
                String AnoIngreso = FechExpe.substring(0, 4);
                System.out.println("año de ingreso="+FechExpe); 
              if (FechExpe.equals("1899-09-09")){
                  out.write("0");
              }else{
                  edad = Integer.parseInt(AnoIngreso) - Integer.parseInt(AnoNac);
                  out.println(edad);
              }
              
              
          }   
             
             
             
         }finally {
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
