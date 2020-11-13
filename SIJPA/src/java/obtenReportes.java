/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.catalogos;
import clasesAuxiliar.showJuzgados;
import clasesAuxiliar.showReportes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/obtenReportes"})
public class obtenReportes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ArrayList<String> lista;
    ArrayList<String[]> listas, desReporte;
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            //Diferente de null(vacio o con dato) quiere decir que envio el formulario entonces hacemos las consultas
            if(request.getParameter("juzReporClave") != null){
                catalogos cat = new catalogos();
                showReportes sRepor = new showReportes();
                if(request.getParameter("juzReporClave").equals("")){//Si juzgado viene vacio entonces hacemos consulta general por sistema
                    listas = sRepor.findReportesGral(request.getParameter("sisRepor"), request.getParameter("anioReporClave"));
                }else{//Si juzgado viene lleno entonces hacemos consulta por sistema y por juzgado
                    listas = sRepor.findReportesJuz(request.getParameter("sisRepor"), request.getParameter("anioReporClave"), request.getParameter("juzReporClave"));
                }
                //Traemos las descripciones de los catalogos para los reportes
                desReporte = cat.findReportes();
                for(int x = 0; x < desReporte.size(); x++){
                    out.println("<tr>");
                    out.println("<td>" + desReporte.get(x)[0] + "</td><td>" + desReporte.get(x)[1] + "</td><td>" + listas.get(0)[x] + "</td>");
                    out.println("</tr>");
                }
            }else if(request.getParameter("sisReporAnio") != null){//Si el sistema viene diferente de null entonces nada mas llenamos los años
                showReportes sRepor = new showReportes();
                out.println("<option value=''>--Seleccione--</option>");
                lista = sRepor.findCausasAnios(request.getParameter("sisReporAnio"));
                for(String ls : lista){
                    out.println("<option value='" + ls + "'>" + ls + "</option>");
                }
            }else if(request.getParameter("sisRepor") != null){//Si el sistema viene diferente de null entonces nada mas llenamos los juzgados
                showJuzgados sJuz = new showJuzgados();
                out.println("<option value=''>--Seleccione--</option>");
                if(request.getParameter("sisRepor").equals("1")){//Juzgado de control
                    lista = sJuz.findJuzgadosJC((Integer)sesion.getAttribute("tipoUsuario"), (String)sesion.getAttribute("usuActivo"));
                    for(String ls : lista){
                        out.println("<option value='" + ls + "'>" + ls + "</option>");
                    }
                }else if(request.getParameter("sisRepor").equals("2")){//Juicio oral
                    lista = sJuz.findJuzgadosJO((Integer)sesion.getAttribute("tipoUsuario"), (String)sesion.getAttribute("usuActivo"));
                    for(String ls : lista){
                        out.println("<option value='" + ls + "'>" + ls + "</option>");
                    }
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(obtenReportes.class.getName()).log(Level.SEVERE, null, ex);
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
