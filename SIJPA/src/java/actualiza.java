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
@WebServlet(urlPatterns = {"/actualiza"})
public class actualiza extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            conn.Conectar();
            System.out.println("variable: " + request.getParameter("version"));
            if(request.getParameter("version") != null){
                //insertamos la version del sistema
                sql = "UPDATE VERSION_SISTEMA SET VERSION = '" + request.getParameter("version") + "';";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    sql = "TRUNCATE DATOS_AUDIENCIAS_ADOJC;";
                    conn.escribir(sql);
                    sql = "DELETE FROM CATALOGOS_AUDIENCIAS_INVESTIGACION;";
                    conn.escribir(sql);
                    sql = "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(-2,'No aplica'),"
                            + "(1,'Audiencias relacionadas con la competencia'),"
                            + "(2,'Audiencias relacionadas con técnicas de investigación'),"
                            + "(3,'Audiencias de prueba anticipada'),"
                            + "(4,'Audiencias de acumulación de procesos'),"
                            + "(5,'Audiencias de separación de procesos'),"
                            + "(6,'Audiencias de citación '),"
                            + "(7,'Audiencias de comparecencia'),"
                            + "(8,'Audiencias de aprehensión'),"
                            + "(9,'Audiencias de desistimiento de la acción penal'),"
                            + "(10,'Audiencias relacionadas con las medidas de protección'),"
                            + "(11,'Audiencia inicial - control de detención'),"
                            + "(12,'Audiencia inicial - formulación de la imputación'),"
                            + "(13,'Audiencia inicial - vinculación a proceso'),"
                            + "(14,'Audiencia inicial - imposición de medida cautelar'),"
                            + "(15,'Audiencia inicial - otras'),"
                            + "(16,'Audiencias de medida cautelar (revisión)'),"
                            + "(17,'Audiencias relacionadas con el procedimiento abreviado'),"
                            + "(18,'Audiencias relacionadas con la suspensión condicional del proceso'),"
                            + "(19,'Audiencias de cierre de la investigación complementaria'),"
                            + "(20,'Audiencias relacionadas con impugnaciones a determinaciones del ministerio público'),"
                            + "(21,'Audiencias relacionadas con acuerdos reparatorios'),"
                            + "(22,'Audiencias de solicitud y/o determinación de sobreseimiento'),"
                            + "(23,'Otras');";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC DROP FOREIGN KEY FK_AUDI_CAUSACLAVE;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC DROP INDEX FK_AUDI_CAUSACLAVE;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC ADD NUM_AUDI INT(11) NOT NULL AFTER JUEZ_CLAVE1;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC DROP PRIMARY KEY, ADD PRIMARY KEY (JUZGADO_CLAVE, CAUSA_CLAVE, JUEZ_CLAVE1, NUM_AUDI, AUDIENCIA_INVESTIGACION, AUDIENCIA_INTERMEDIA) USING BTREE;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO DROP FOREIGN KEY FK_AUDI_CAUSACLAVEJO;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO DROP INDEX FK_AUDI_CAUSACLAVEJO;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO ADD NUM_AUDI INT(11) NOT NULL AFTER JUEZ_CLAVE3;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO DROP PRIMARY KEY, ADD PRIMARY KEY (JUZGADO_CLAVE, CAUSA_CLAVEJO, JUEZ_CLAVE1, JUEZ_CLAVE2, JUEZ_CLAVE3, NUM_AUDI, AUDIENCIA_JUICIOORAL) USING BTREE;";
                    conn.escribir(sql);
                    out.write("1");
                    conn.close();
                }else{
                    out.write("0");
                    conn.close();
                }
            } 
        } catch (SQLException ex) {
            Logger.getLogger(actualiza.class.getName()).log(Level.SEVERE, null, ex);
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
