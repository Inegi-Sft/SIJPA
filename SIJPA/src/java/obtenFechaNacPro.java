/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showCausasPenalesJO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/obtenFechaNacPro"})
public class obtenFechaNacPro extends HttpServlet {

    String FechExpe=null,FechOcurr=null;
    LocalDate  fechaIngreso=null,fechaNacimiento=null,LDONI=null;
    int edad=0;
    Boolean Numeric;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
        String causaClave = (String) sesion.getAttribute("causaClave");
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        showCausasPenales penales = new showCausasPenales();
        showCausasPenalesJO penalesJO = new showCausasPenalesJO();
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd",Locale.ENGLISH);

        try {
            
            if (request.getParameter("Fnac") != null) {
                String Sistema = (String) sesion.getAttribute("Sistema");
                    if (Sistema.equals("JC")) {
                        //queda pendiente fecha de ocurrencia para la version 2.0 ya que no se puede saber la relacion de procesado-delito cometido
                        //fechaOcurrencia=(Date) new SimpleDateFormat("yyyy-MM-dd").parse(penales.fechaOcurr(juzgadoClave,causaClave)); 
                        fechaIngreso = LocalDate.parse(penales.FechaIng(juzgadoClave, causaClave), formatter);
                    }else if (Sistema.equals("JO")) {
                        fechaIngreso = LocalDate.parse(penalesJO.FechaIngJO(juzgadoClave, causaClaveJO), formatter);
                    }
                    LDONI = LocalDate.parse("1899-09-09", formatter);         
                if (!fechaIngreso.isEqual(LDONI)==true) {                    
                    fechaNacimiento = LocalDate.parse(request.getParameter("Fnac"), formatter);
                    LocalDate LDOJuz = LocalDate.of(fechaIngreso.getYear(), fechaIngreso.getMonth(), fechaIngreso.getDayOfMonth());
                    LocalDate LDOFechaNac = LocalDate.of(fechaNacimiento.getYear(), fechaNacimiento.getMonth(), fechaNacimiento.getDayOfMonth());
                    Period diff = Period.between(LDOFechaNac, LDOJuz);

                    if (diff.getYears() < 0) {
                        out.write("2");
                    } else {
                        out.println(diff.getYears());
                    }

                } else {
                    out.write("3");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(obtenFechaNacPro.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(obtenFechaNacPro.class.getName()).log(Level.SEVERE, null, ex);
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
