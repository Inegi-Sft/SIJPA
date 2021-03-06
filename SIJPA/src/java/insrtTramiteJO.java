/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showTramiteJO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * @author ANTONIO.CORIA
 */
@WebServlet(urlPatterns = {"/insrtTramiteJO"})
public class insrtTramiteJO extends HttpServlet {

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
        HttpSession sesion= request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String juzgadClaveJO = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClaveJO.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        String proceClaveJO = request.getParameter("proceClave");
        String estInvesti = request.getParameter("estInvestiJO");
        String especifique = request.getParameter("especifiqueJO");
        String fechaActo=request.getParameter("uActoJO");
        
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_TRAMITES_ADOJO  VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                        + causaClaveJO + "','" + proceClaveJO + jConcatenado + "'," + estInvesti + ",'" 
                        + especifique + "','" + fechaActo + "', (select YEAR(NOW())) );";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    showTramiteJO tram = new showTramiteJO();
                    ArrayList<String[]> lis;
                    //int totTramiteInsrt = tram.countTramiteExp(causaClave);
                    lis = tram.findTramiteTablaJO(proceClaveJO + jConcatenado); 
                    JSONArray resp = new JSONArray();

                    resp.add(posicion);
                    resp.add(lis.get(0)[0].replace(jConcatenado, ""));  
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    //resp.add(totTramiteInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                }else{
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_TRAMITES_ADOJO SET ESTATUS = " + estInvesti+ ","
                        + "ESPECIFIQUE = '" + especifique + "',"
                        + "FECHA_ACTO_PROCESAL = '" + fechaActo + "' "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' " 
                        + "AND PROCESADO_CLAVE = '" + proceClaveJO + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    showTramiteJO tram = new showTramiteJO();
                    ArrayList<String[]> lis;
                    //int totTramiteInsrt = tram.countTramiteExp(causaClave);
                    lis = tram.findTramiteTablaJO(proceClaveJO + jConcatenado); 
                        JSONArray resp = new JSONArray();                   
                        resp.add(posicion);
                        resp.add(lis.get(0)[0].replace(jConcatenado, ""));  
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                    //resp.add(totTramiteInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtTramite.class.getName()).log(Level.SEVERE, null, ex);
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
