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
@WebServlet(urlPatterns = {"/insrtJuez"})
public class insrtJuez extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion= request.getSession();
        
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String juzgadoClave = (String) sesion.getAttribute("juzgadoClave");
        String[] juzSeparado = juzgadoClave.split("-");
        String entidad = juzSeparado[0];
        String mun = juzSeparado[1];
        String num = juzSeparado[2];
        int juezID = Integer.parseInt(request.getParameter("juezID"));
        String nombre = request.getParameter("nombre").toUpperCase();
        String apaterno = request.getParameter("apaterno").toUpperCase();
        String amaterno = request.getParameter("amaterno").toUpperCase();
        String fGestion;
        if (request.getParameter("fGestion") != null) {
            fGestion = request.getParameter("fGestion");
        } else {
            fGestion = "1899-09-09";
        }
        String sexoJuez = request.getParameter("sexoJuez");
        String edadJuez = request.getParameter("edadJuez");
        String estudioJuez = request.getParameter("estudioJuez");
        String funcionJuez = request.getParameter("funcionJuez");

        try {
            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_JUECES_ADOJC VALUES(" + entidad + "," + mun + "," + num + ",'" + juzgadoClave + "',"
                        + juezID + ",'" + nombre + "','" + apaterno + "','" + amaterno + "','" + fGestion + "',"
                        + sexoJuez + "," + edadJuez + "," + estudioJuez + "," + funcionJuez + ",1,(select YEAR(NOW()))"
                        + ")";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    //Si es el primer juez actualizamos la visita del ususario y lo mandamos al capturar el juez
                    if(juezID == 1){
                        conn.close();
                        //Si se inserta correctamente lo mandamos a causas penales JC ya que es el primer juez
                        response.sendRedirect("causasPenales.jsp?insert=100");
                    }else{
                        conn.close();
                        response.sendRedirect("jueces.jsp?insert=100");
                    }
                }else{
                    conn.close();
                    response.sendRedirect("jueces.jsp?insert=200");
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_JUECES_ADOJC SET NOMBRE_JUEZ = '" + nombre + "',APELLIDOP_JUEZ = '" + apaterno + "',"
                        + "APELLIDOM_JUEZ = '" + amaterno + "',FECHA_GESTION = '" + fGestion + "',SEXO = " + sexoJuez + ","
                        + "EDAD = " + edadJuez + ",GRADO_ESTUDIOS = " + estudioJuez + ",FUNCION_DESEMPENA = " + funcionJuez + " "
                        + "WHERE JUZGADO_CLAVE = '" + juzgadoClave + "' "
                        + "AND JUEZ_CLAVE = " + juezID + ";";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    conn.close();
                    response.sendRedirect("jueces.jsp?insert=101");
                }else{
                    conn.close();
                    response.sendRedirect("jueces.jsp?insert=201");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtJuzgados.class.getName()).log(Level.SEVERE, null, ex);
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
