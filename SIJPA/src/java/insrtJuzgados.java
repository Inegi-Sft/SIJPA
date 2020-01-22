/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/insrtJuzgados"})
public class insrtJuzgados extends HttpServlet {

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
    ResultSet rs;
    String juzgadoClave;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        
        //Datos Organo Jurisdiccional
        String nomOrgano = request.getParameter("nomOrgano").toUpperCase();
        String numOrgano = request.getParameter("numOrgano");
        String jurisdiccion = request.getParameter("jurisdiccion");
        String funcionJuz = verificaVariable(request.getParameter("funcionJuz"));
        String ladaTel = verificaVariable(request.getParameter("ladaJuz") + request.getParameter("telJuz"));
        String correo = verificaVariable(request.getParameter("correo").toUpperCase());
        //Ubicacion de Organizacion del organo
        String entidadJ = request.getParameter("entidadJ");
        String municipioJ = request.getParameter("municipioJ");
        String fDivision = request.getParameter("fDivision");
        String regJudicial = request.getParameter("regJudicial").toUpperCase();
        String distJudicial = request.getParameter("distJudicial").toUpperCase();
        String partJudicial = request.getParameter("partJudicial").toUpperCase();
        //Domicilio
        String vialidad = request.getParameter("vialidad");
        String nomVialidad = request.getParameter("nomVialidad").toUpperCase();
        String asentamiento = request.getParameter("asentamiento");
        String nomAsentamiento = request.getParameter("nomAsentamiento").toUpperCase();
        String noExterior = verificaVariable(request.getParameter("noExterior"));
        String noInterior = verificaVariable(request.getParameter("noInterior"));
        String cp = verificaVariable(request.getParameter("cp"));
        //Datos Captura
        String nombreCap = request.getParameter("nombreCap").toUpperCase();
        String apaternoCap = request.getParameter("apaternoCap").toUpperCase();
        String amaternoCap = request.getParameter("amaternoCap").toUpperCase();
        String cargo = request.getParameter("cargo").toUpperCase();
        //Datos Generales
        String ejercicio = request.getParameter("ejercicio");
        String causasIngresa = verificaVariable(request.getParameter("causasIngresa"));
        String mediProteccion = verificaVariable(request.getParameter("mediProteccion"));
        String providenPrecauto = verificaVariable(request.getParameter("providenPrecauto"));
        String pruebaAnti = verificaVariable(request.getParameter("pruebaAnti"));
        String ordenesJudi = verificaVariable(request.getParameter("ordenesJudi"));
        String actosInvestiga = verificaVariable(request.getParameter("actosInvestiga"));
        String impugnaMp = verificaVariable(request.getParameter("impugnaMp"));
        String otros = verificaVariable(request.getParameter("otros"));
        String causasTram = verificaVariable(request.getParameter("causasTram"));
        String causasBaja = verificaVariable(request.getParameter("causasBaja"));
        
        juzgadoClave = entidadJ + "-" + municipioJ + "-" + numOrgano;
        
        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_JUZGADOS_ADOJC VALUES('" + juzgadoClave + "','" + nomOrgano + "'," + numOrgano + "," + jurisdiccion + ","
                    + funcionJuz + "," + ladaTel + ",'" + correo + "'," + entidadJ + "," + municipioJ + "," + fDivision + ",'" + regJudicial + "','"
                    + distJudicial + "','" + partJudicial + "'," + vialidad + ",'" + nomVialidad + "'," + asentamiento + ",'" + nomAsentamiento + "',"
                    + noExterior + "," + noInterior + "," + cp + ",'" + nombreCap + "','" + apaternoCap + "','" + amaternoCap + "','" + cargo + "'," 
                    + ejercicio + ")";
            System.out.println(sql);
            if(conn.escribir(sql)){
                sql = "INSERT INTO DATOS_INFORME_ADOJC VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                        + causasIngresa + "," + mediProteccion + "," + providenPrecauto + "," + pruebaAnti + "," + ordenesJudi + ","
                        + actosInvestiga + "," + impugnaMp + "," + otros + "," + causasTram + ","+ causasBaja + ",(select YEAR(NOW()))"
                        + ")";

                System.out.println(sql);
                if(conn.escribir(sql)){
                    conn.close();
                    sesion.setAttribute("juzgadoClave", juzgadoClave);
                    sesion.setMaxInactiveInterval(-1);
                    response.sendRedirect("causasPenales.jsp");
                }else{
                    conn.close();
                    response.sendRedirect("capturaJuzgado.jsp?error=100");
                }
            }else{
                conn.close();
                response.sendRedirect("capturaJuzgado.jsp?error=200");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String verificaVariable(String variable){
        String verificada = "";
        if(variable == null){
            verificada = "-9";
        }else if(variable.equals("")){
            verificada = "-9";
        }else{
            verificada = variable;
        }
        return verificada;
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
