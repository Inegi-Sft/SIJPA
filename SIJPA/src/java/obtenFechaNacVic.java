/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.FechaMax;
import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showCausasPenalesJO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
@WebServlet(urlPatterns = {"/obtenFechaNacVic"})
public class obtenFechaNacVic extends HttpServlet {

    String FechExpe=null;
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
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
        String causaClave = (String) sesion.getAttribute("causaClave");
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        showCausasPenales penales = new showCausasPenales();
        showCausasPenalesJO penalesJO = new showCausasPenalesJO();
        FechaMax Fech = new FechaMax();
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        
        try {
            if (request.getParameter("FechaNac") != null) {
                String FechNac = request.getParameter("FechaNac");
                String AnoNac = FechNac.substring(0, 4);
                String Sistema = (String) sesion.getAttribute("Sistema");

                if (Sistema.equals("JC")) {
                    FechExpe = penales.FechaIng(juzgadoClave, causaClave);
                } else if (Sistema.equals("JO")) {
                    FechExpe = penalesJO.FechaIngJO(juzgadoClave, causaClaveJO);
                }
                String AnoIngreso = FechExpe.substring(0, 4);
                System.out.println("a�o de ingreso=" + FechExpe);
                if (FechExpe.equals("1899-09-09")) {
                    System.out.print("entro con a�o de ingreso 1899 " + FechExpe);
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
                        System.out.println("esta en validacion 1 yesssssss");
                        String[] parts = causaClave.split("/");
                        String part1 = parts[0];
                        String part2 = parts[1];
                        Numeric = Fech.isNumeric(part2.substring(0, 4));
                        if (Numeric == true) {
                            int ValA�o = Integer.parseInt(part2.substring(0, 4));
                            if ((ValA�o > 1915) && (ValA�o < ano + 1)) {
                                edad = Integer.parseInt(part2.substring(0, 4)) - Integer.parseInt(AnoNac);
                                System.out.println("la causa Clave=" + causaClave + " " + part1 + " " + part2);
                                out.println(edad);
                            } else {
                                out.write("0");       
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
                        Numeric = Fech.isNumeric(part2.substring(0, 4));
                        if (Numeric == true) {
                            int ValA�o = Integer.parseInt(part2.substring(0, 4));
                            if ((ValA�o > 1915) && (ValA�o < ano + 1)) {
                                edad = Integer.parseInt(part3.substring(0, 4)) - Integer.parseInt(AnoNac);
                                out.println(edad);
                            } else {
                                out.write("0");
                            }
                        } else {
                            out.write("0");
                        }
                    }
                } else {
                    edad = Integer.parseInt(AnoIngreso) - Integer.parseInt(AnoNac);
                    System.out.println("la edad es mira" + edad);
                    out.println(edad);
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
