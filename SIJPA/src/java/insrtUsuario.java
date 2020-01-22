/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/insrtUsuario"})
public class insrtUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql;
    ResultSet rs;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(request.getParameter("tipoUsuario") != null){
            int tipoUsuario = Integer.parseInt(request.getParameter("tipoUsuario"));
            String nom = request.getParameter("nom").toUpperCase();
            String paterno = request.getParameter("paterno").toUpperCase();
            String materno = request.getParameter("materno").toUpperCase();
            String edad = request.getParameter("edad");
            String correo = request.getParameter("correo").toUpperCase();
            String entidad = request.getParameter("entidad");
            String pass = request.getParameter("pass");
            
            //Validacion para que se inserte el Administrador por primera vez
            conn.Conectar();
            sql = "INSERT INTO USUARIOS VALUES(null,'" + nom + "','" + paterno + "','" + materno + "'," + edad + ",'"
                    + correo + "'," + entidad + ",SHA1('" + pass + "')," + tipoUsuario + ",0,1"
                    + ")";
            System.out.println(sql);
            if(conn.escribir(sql)){
                if(tipoUsuario == 1){
                    response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect("usuario.jsp");
                }
            }else{
                response.sendRedirect("index.jsp?errorbd=si");
            }
        }
        
        //Validacion si aceptan el acuerdo en la pagina de bienvenida se actualiza para que no se vuelva a mostrar
        if(request.getParameter("aceptarAcuerdo") != null){
            HttpSession sesion = request.getSession();
            String usuario = (String) sesion.getAttribute("usuActivo");
            conn.Conectar();
            sql = "UPDATE USUARIOS SET VISITA = 1 WHERE CORREO = '" + usuario + "';";
            System.out.println(sql);
            if(conn.escribir(sql)){
                int visita = 1;
                sesion.setAttribute("visitaUsuario", visita);
                sesion.setMaxInactiveInterval(-1);
                response.sendRedirect("causasPenales.jsp");
            }else{
                response.sendRedirect("index.jsp?errorbd=si");
            }
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
