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
@WebServlet(urlPatterns = {"/insrtAudienciasJO"})
public class insrtAudienciasJO extends HttpServlet {

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
        String idAudi = request.getParameter("idAudiencia");//numero de la audiencia (id) que se va eliminar
        String anio = request.getParameter("anio");//año de la audiencia para eliminar, forma clave con el idAudi y el juzgado
        
        String juzgado = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgado.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        
        String causaClave = request.getParameter("causaJO");
        String[] jueces = request.getParameterValues("juezJO");
        String audiJO = request.getParameter("audiJO");
        String fechaCJO = request.getParameter("fechaCJO");
        String hrsJO = request.getParameter("hrsJO");
        String minJO = request.getParameter("minJO");
        
        String juez1 = "-2", juez2="-2", juez3="-2";
        
        if(jueces != null ){ 
            juez1 = jueces[0] ;
                    
            if(jueces.length == 2){
                juez2 = jueces[1];
            }else if(jueces.length == 3){
                juez2 = jueces[1];
                juez3 = jueces[2];
            }
        }
        
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            //****************************  I N S E R T A  *******************************************
            if(operacion.equals("insertar")){
                
                int maxAudi=0;
                sql = "SELECT IFNULL(MAX(NUM_AUDI),0) + 1 FROM DATOS_AUDIENCIAS_ADOJO WHERE JUZGADO_ENTIDAD_ID='"+juzgado+"' AND ANIO=(select YEAR(NOW()))";
                rs=conn.consultar(sql);
                while(rs.next()){
                    maxAudi=rs.getInt(1);
                }
                
                sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJO VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgado + "','"
                    + causaClave+"', "+ juez1 +", "+ juez2 +", "+ juez3 +", "+maxAudi+", "+ audiJO +", '"+ fechaCJO +"', "+ hrsJO +",'"+ minJO +"', (select YEAR(NOW())) );";
                System.out.println(sql);
                conn.escribir(sql);
                
                conn.close();
                                
            //*******************************  E L I M I N A  *********************************    
            }else if(operacion.equals("eliminar")){
                
                sql = "DELETE FROM DATOS_AUDIENCIAS_ADOJO WHERE JUZGADO_CLAVE='"+juzgado+"'"
                    + " AND ANIO = " + anio + " AND NUM_AUDI="+idAudi;
                System.out.println(sql);
                if(conn.escribir(sql)){
                    out.write("AudienciasDeleted");
                }else{
                    conn.close();
                }
                conn.close();
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(insrtAudienciasJO.class.getName()).log(Level.SEVERE, null, ex);
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
