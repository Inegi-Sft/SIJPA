/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(urlPatterns = {"/estatusDatos"})
public class estatusDatos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession sesion = request.getSession();
        //Validamos que la causa penal este llena para evitar el error
        String juzgadoClave = "";
        if(sesion.getAttribute("juzgadoClave") != null){
            juzgadoClave = (String)sesion.getAttribute("juzgadoClave");
        }
        
        String tabla = request.getParameter("tabla");
        String clave = request.getParameter("clave");
        String valorEs = request.getParameter("valorEs");
        int valorNuevo = 0;
        
        if(valorEs.equals("Inactivo")){
            valorNuevo = 1;//No necesia llaves por que solo tiene una instruccion sin else
        }
        
        //Condicion para cambiar estatus de Juzgados
        if(tabla.equals("tablaJuzgados")){
            System.out.println("Cambiamos estatus de Juzgado");
            try{
                conn.Conectar();
                sql="UPDATE DATOS_JUZGADOS_ADOJC SET ESTATUS = " + valorNuevo
                        + " WHERE JUZGADO_CLAVE = '" + clave + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("tablaJuzgados");
                    conn.close();
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        //Condicion para cambiar estatus de Jueces
        if(tabla.equals("tablaJuez")){
            System.out.println("Cambiamos estatus dej juez");
            try{
                conn.Conectar();
                sql="UPDATE DATOS_JUECES_ADOJC SET ESTATUS = " + valorNuevo
                        + " WHERE JUEZ_CLAVE = " + clave
                        + " AND JUZGADO_CLAVE = '" + juzgadoClave + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    out.write("tablaJuez");
                    conn.close();
                } else {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(deleteDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
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
