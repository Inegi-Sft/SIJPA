/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
    ArrayList<String[]> listas;
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Diferente de null quiere decir que envio el formulario entonces hacemos las consultas
            if(request.getParameter("juzReporClave") != null){
                showReportes sRepor = new showReportes();
                if(request.getParameter("juzReporClave").equals("")){//Si juzgado viene vacio entonces hacemos consulta general por sistema
                    listas = sRepor.findReportesGral(request.getParameter("sisRepor"));
                }else{//Si juzgado viene lleno entonces hacemos consulta por sistema y por juzgado
                    listas = sRepor.findReportesJuz(request.getParameter("sisRepor"), request.getParameter("juzReporClave"));
                }
                for(String []lis : listas){
                    out.println("<tr>");
                    out.println("<td>1</td><td>Total de Causas Penales Ingresadas atendidas</td><td>" + lis[0] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>2</td><td>Total de Delitos en las Causas Penales Ingresadas atendidas</td><td>" + lis[1] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>3</td><td>Delitos Consumados</td><td>" + lis[2] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>4</td><td>Delitos en Grado de Tentativa</td><td>" + lis[3] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>5</td><td>Delitos con Grado de Consumación No Identificado</td><td>" + lis[4] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>6</td><td>Total de Victimas en las Causas Penales Ingresadas atendidas</td><td>" + lis[5] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>7</td><td>Victimas personas fisicas Hombres</td><td>" + lis[6] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>8</td><td>Victimas personas fisicas Mujeres</td><td>" + lis[7] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>9</td><td>Victimas personas fisicas No Identificadas</td><td>" + lis[8] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>10</td><td>Victimas personas morales</td><td>" + lis[9] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>11</td><td>Victimas sociedad en</td><td>" + lis[10] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>12</td><td>Victimas estado</td><td>" + lis[11] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>13</td><td>Victimas otro</td><td>" + lis[12] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>14</td><td>Victimas No Identificadas</td><td>" + lis[13] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>15</td><td>Total de Procesados en las Causas Penales Ingresadas</td><td>" + lis[14] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>16</td><td>Procesados Concluidos en el año</td><td>" + lis[15] + "</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>17</td><td>Procesados en Tramite en el año</td><td>" + lis[16] + "</td>");
                    out.println("</tr>");
                }
            }else if(request.getParameter("sisRepor") != null){//Si el sistema viene diferente de null entonces nada mas llenamos los juzgados
                showJuzgados sJuz = new showJuzgados();
                out.println("<option value=''>--Seleccione--</option>");
                if(request.getParameter("sisRepor").equals("1")){//Juzgado de control
                    lista = sJuz.findJuzgadosJC();
                    for(String ls : lista){
                        out.println("<option value='" + ls + "'>" + ls + "</option>");
                    }
                }else if(request.getParameter("sisRepor").equals("2")){//Juicio oral
                    lista = sJuz.findJuzgadosJO();
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
