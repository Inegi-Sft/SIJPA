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
import javax.servlet.http.HttpSession;

/**
 *
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/insrtAudiencias"})
public class insrtAudiencias extends HttpServlet {

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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        
        String operacion = request.getParameter("operacion");//Control para saber si se inserta o se actualiza
        String tipoAudiencia = request.getParameter("tipoAudiencia");//Control para saber si se inserta inicial o intermedia
        String idAudi = request.getParameter("idAudiencia");//numero de la audiencia (id) que se va eliminar
        
        String juzgado = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgado.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String causa = request.getParameter("causa");
        String juez = request.getParameter("juez");
        String audiInves = request.getParameter("audiInves");
        String fechaAInvesI = request.getParameter("fInvesI");
        String fechaAInvesF = request.getParameter("fInvesF");
        
        String audiInter = request.getParameter("audiInter");
        String fechaAInterI = request.getParameter("fInterI");
        String fechaAInterF = request.getParameter("fInterF");
        
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            //****************************  I N S E R T A  *******************************************
            if(operacion.equals("insertar")){
                int maxAudi=0;
                sql = "SELECT IFNULL(MAX(NUM_AUDI),0) + 1 FROM DATOS_AUDIENCIAS_ADOJC WHERE JUZGADO_ENTIDAD_ID='"+juzgado+"'";
                rs=conn.consultar(sql);
                while(rs.next()){
                    maxAudi=rs.getInt(1);
                }
                if(tipoAudiencia.equals("Investigacion")){
                    sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgado + "','"
                        + causa+"', "+ juez +","+maxAudi+", "+ audiInves +", -2, '"+ fechaAInvesI +"', '"+ fechaAInvesF +"', (select YEAR(NOW())) );";
                    System.out.println(sql);
                    conn.escribir(sql);
                    
                }else{
                    sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgado + "','"
                        + causa+ "', "+ juez +","+maxAudi+", -2, "+ audiInter +", '"+ fechaAInterI +"', '"+ fechaAInterF +"', (select YEAR(NOW())) );";
                    System.out.println(sql);
                    conn.escribir(sql);
                }   
                conn.close();
                  
           
            //*******************************  E L I M I N A  *********************************    
            }else if(operacion.equals("eliminar")){
                
                sql = "DELETE FROM DATOS_AUDIENCIAS_ADOJC WHERE JUZGADO_CLAVE='"+juzgado+"'"
                    + " AND CAUSA_CLAVE = '" + causa + "' AND NUM_AUDI="+idAudi;
                System.out.println(sql);
                if(conn.escribir(sql)){
                    out.write("AudienciasDeleted");
                }else{
                    conn.close();
                }
                conn.close();
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(insrtAudiencias.class.getName()).log(Level.SEVERE, null, ex);
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
