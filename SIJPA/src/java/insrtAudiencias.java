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
import org.json.simple.JSONArray;

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
        String juzgadClave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado=jEntidad+jMunicipio+jNumero;
        
        String causaClave = request.getParameter("causaClave");
        String[] jueces = request.getParameterValues("chkJuez");
        String[] audiInves = request.getParameterValues("chkInves");
        String[] fechaAInves = request.getParameterValues("fechaInves");
        String[] duracionAInves = request.getParameterValues("duracionInves");
        String[] audiInter = request.getParameterValues("chkInter");
        String[] fechaAInter = request.getParameterValues("fechaInter");
        String[] duracionAInter = request.getParameterValues("duracionInter");
        
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
            if (operacion.equals("insertar")){
                
                if(audiInves != null){
                    for(int i=0; i<audiInves.length; i++){
                        sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgadClave + "','"
                            + causaClave+"', "+ juez1 +", "+ juez2 +", "+ juez3 +", "+ audiInves[i] +", -2, '"+ fechaAInves[i] +"', '"+ duracionAInves[i] +"'," + " (select YEAR(NOW())) );";
                        System.out.println(sql);
                        conn.escribir(sql);
                    }
                }
                if(audiInter != null){
                    for(int i=0; i<audiInter.length; i++){
                        sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgadClave + "','"
                            + causaClave+ "', "+ juez1 +", "+ juez2 +", "+ juez3 +", -2, "+ audiInter[i] +", '"+ fechaAInter[i] +"', '"+ duracionAInter[i] +"'," + " (select YEAR(NOW())) );";
                        System.out.println(sql);
                        conn.escribir(sql);
                    }
                }
                conn.close();
                
            //****************************  A C T U A L I Z A  ***************************************    
            }else if (operacion.equals("actualizar")){
                
                sql = "DELETE FROM DATOS_AUDIENCIAS_ADOJC WHERE JUZGADO_CLAVE='"+juzgadClave+"'"
                    + " AND CAUSA_CLAVE = '"+ causaClave+jConcatenado +"'";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    if(audiInves != null){
                        for(int i=0; i<audiInves.length; i++){
                            sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgadClave + "','"
                                + causaClave+jConcatenado+"', "+ juez1 +", "+ juez2 +", "+ juez3 +", "+ audiInves[i] +", -2, '"+ fechaAInves[i] +"', '"+ duracionAInves[i] +"'," + " (select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    if(audiInter != null){
                        for(int i=0; i<audiInter.length; i++){
                            sql = "INSERT INTO DATOS_AUDIENCIAS_ADOJC VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + juzgadClave + "','"
                                + causaClave+jConcatenado +"', "+ juez1 +", "+ juez2 +", "+ juez3 +", -2, "+ audiInter[i] +", '"+ fechaAInter[i] +"', '"+ duracionAInter[i] +"'," + " (select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                }else{
                    conn.close();
                }
                conn.close();
                
            //*******************************  E L I M I N A  *********************************    
            }else if(operacion.equals("eliminar")){
                
                sql = "DELETE FROM DATOS_AUDIENCIAS_ADOJC WHERE JUZGADO_CLAVE='"+juzgadClave+"'"
                    + " AND CAUSA_CLAVE = '" + causaClave + "'";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    out.write("AudienciasDeleted");
                }else{
                    conn.close();
                }
                conn.close();
            }
        
        } catch (IOException ex) {
            Logger.getLogger(insrtAudiencias.class.getName()).log(Level.SEVERE, null, ex);
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
