/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        //Datos del Juez
        String nombreJ = request.getParameter("nombre");
        String apellidoPaJ = request.getParameter("apaterno");
        String apellidoMaJ = request.getParameter("amaterno");
        String gestion;
        if(request.getParameter("fGestion") != null){
            gestion = request.getParameter("fGestion");
        }else{
            gestion = "1899-09-09";
        }
        //Datos Organo Jurisdiccional
        String nomOrgano = request.getParameter("nomOrgano");
        String numJuzgado = request.getParameter("numJuzgado");
        String numDistrito = request.getParameter("numDistrito");
        String tel = verificaVariable(request.getParameter("tel"));
        String correo = verificaVariable(request.getParameter("correo"));
        //Forma de Organizacion del organo
        String fOrganiza = request.getParameter("fOrganiza");
        String regJudicial = request.getParameter("regJudicial");
        String distJudicial = request.getParameter("distJudicial");
        String partJudicial = request.getParameter("partJudicial");
        //Datos Geograficos
        String entidadJ = request.getParameter("entidadJ");
        String municipioJ = request.getParameter("municipioJ");
        String vialidad = request.getParameter("vialidad");
        String nomVialidad = request.getParameter("nomVialidad");
        String asentamiento = request.getParameter("asentamiento");
        String nomAsentamiento = request.getParameter("nomAsentamiento");
        String cp = verificaVariable(request.getParameter("cp"));
        String noExterior = verificaVariable(request.getParameter("noExterior"));
        String noInterior = verificaVariable(request.getParameter("noInterior"));
        //Datos Captura
        String nombreCap = request.getParameter("nombreCap");
        String apaternoCap = request.getParameter("apaternoCap");
        String amaternoCap = request.getParameter("amaternoCap");
        String cargo = request.getParameter("cargo");
        //Datos Generales
        String ejercicio = request.getParameter("ejercicio");
        String causasPena = verificaVariable(request.getParameter("causasPena"));
        String mediProteccion = verificaVariable(request.getParameter("mediProteccion"));
        String providenPrecauto = verificaVariable(request.getParameter("providenPrecauto"));
        String pruebaAnti = verificaVariable(request.getParameter("pruebaAnti"));
        String actosInvestiga = verificaVariable(request.getParameter("actosInvestiga"));
        String excusa = verificaVariable(request.getParameter("excusa"));
        String recusa = verificaVariable(request.getParameter("recusa"));
        String otras = verificaVariable(request.getParameter("otras"));
        String causasPenaPend = verificaVariable(request.getParameter("causasPenaPend"));
        String causasPenaBaja = verificaVariable(request.getParameter("causasPenaBaja"));
        
        juzgadoClave = entidadJ + "-" + municipioJ + "-" + numDistrito + "-" + numJuzgado;
        
        try {
            conn.Conectar();
            sql = "INSERT INTO DATOS_JUZGADOS_ADOJC VALUES('" + juzgadoClave + "','" + nombreJ + "','" + apellidoPaJ + "','" + apellidoMaJ +"','" + gestion + "',"
                    + numDistrito + "," + numJuzgado + ",'" + nomOrgano + "','" + tel + "','" + correo + "','" + fOrganiza + "','" + regJudicial + "','" 
                    + distJudicial + "','" + partJudicial + "'," + entidadJ + "," + municipioJ + "," + vialidad + ",'" +  nomVialidad + "'," + asentamiento + ",'" 
                    + nomAsentamiento + "'," + noExterior + "," + noInterior + ",'" + cp + "','" + nombreCap + "','" + apaternoCap + "','" + amaternoCap + "','"
                    + cargo + "'," + ejercicio + ")";
            if(conn.escribir(sql)){
                sql = "INSERT INTO DATOS_INFORME_ADOJC VALUES('" + juzgadoClave + "'," + causasPena + "," +mediProteccion + "," + providenPrecauto + ","
                        + pruebaAnti + "," + actosInvestiga + "," + excusa + "," + recusa + "," + otras + "," + causasPenaPend + ","
                        + causasPenaBaja +")";
                System.out.println(sql);
                if(conn.escribir(sql)){
                        conn.close();
//                        request.setAttribute("juzgadoClave", juzgadoClave);
//                        request.getRequestDispatcher("causasPenales.jsp").forward(request, response);
                        response.sendRedirect("causasPenales.jsp");
                }else{
                    conn.close();
                    response.sendRedirect("juzgados.jsp?errorInforme=si");
                }
            }else{
                conn.close();
                response.sendRedirect("juzgados.jsp?errorJuzgado=si");
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insrtJuzgados</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + sql + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
