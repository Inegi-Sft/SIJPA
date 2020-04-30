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
    String ExtrA�o=null;
    int A�oOcurr=0;
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
                ExtrA�o = String.valueOf(fechaOcurr).substring(0,4);
                A�oOcurr=Integer.parseInt(ExtrA�o);
                Date fechaing = Date.valueOf(penales.FechaIng(juzgadoClave, causaClave));
                FechaIngreso = fechaing.toString();
                ver = fechaing.after(fechaOcurr);
                if (FechaIngreso.equals("1899-09-09")) {
                     System.out.print("entro con a�o de ingreso 1899 ");
                    char numca[] = causaClave.toCharArray();
                    int m = 0;
                    for (int i = 0; i < causaClave.length(); i++) {
                        if (numca[i] == '/') {
                            m++;
                        }
                    }
                    System.out.println("numero de / " + m);
                    if (m == 0) {
                        System.out.println("esta en validacion 0");
                        out.write("0");
                    } else if (m == 1) {
                        System.out.println("esta en validacion 1 yea");
                        String[] parts = causaClave.split("/");
                        String part1 = parts[0];
                        String part2 = parts[1];
                        int ValA�o = Integer.parseInt(part2.substring(0, 4));
                        System.out.println("A�O DE INGRESOS= " + ValA�o);
                        System.out.println("A�O DE OCURRENCIA= " + ExtrA�o);
                        if ((ValA�o > 1915) && (ValA�o < 2020)) {
                            if (ValA�o < A�oOcurr) {
                                out.write("1");
                            }
                        } else {
                            out.write("0");
                        }
                    } else if (m == 2) {
                        System.out.println("esta en validacion 2");
                        String[] parts = causaClave.split("/");
                        String part1 = parts[0];
                        String part2 = parts[1];
                        String part3 = parts[2];
                        int ValA�o = Integer.parseInt(part2.substring(0, 4));
                        if ((ValA�o > 1915) && (ValA�o < 2020)) {
                            if (ValA�o < A�oOcurr) {
                                out.write("1");
                            }
                        } else {
                            out.write("0");
                        }
                    }
                } else {
                    if ((fechaing.after(fechaOcurr) == false) && (!fechaing.equals(fechaOcurr))) {
                        out.write("1");
                        System.out.println(ver + " FECHA OCURENCIA:" + fechaOcurr + " FECHA INGRESO:" + fechaing);
                    } else {
                        out.write("0");
                    }
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
