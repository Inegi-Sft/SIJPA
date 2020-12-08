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
            System.out.println("variable: " + request.getParameter("version:"));
            if(request.getParameter("version") != null){
                //insertamos la version del sistema
                sql = "UPDATE VERSION_SISTEMA SET VERSION = '" + request.getParameter("version") + "';";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    sql = "CREATE TABLE CATALOGOS_COLONIASMUN ("
                            + "ENTIDAD_ID int(2) NOT NULL,"
                            + "MUNICIPIO_ID int(5) NOT NULL,"
                            + "COLONIA_ID varchar(30) NOT NULL,"
                            + "DESCRIPCION varchar(150) COLLATE utf8_bin NOT NULL,"
                            + "PRIMARY KEY (COLONIA_ID)"
                            + ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_PROCESADOS_ADOJC ADD RESIDENCIA_COL VARCHAR(30) NOT NULL AFTER RESIDENCIA_MUNICIPIO;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_PROCESADOS_ADOJO ADD RESIDENCIA_COL VARCHAR(30) NOT NULL AFTER RESIDENCIA_MUNICIPIO;";
                    conn.escribir(sql);
                    sql = "TRUNCATE DATOS_AUDIENCIAS_ADOJC;";
                    conn.escribir(sql);
                    sql = "DELETE FROM CATALOGOS_AUDIENCIAS_INVESTIGACION;";
                    conn.escribir(sql);
                    sql = "TRUNCATE DATOS_AUDIENCIAS_ADOJO;";
                    conn.escribir(sql);
                    sql ="ALTER TABLE DATOS_AUDIENCIAS_ADOJO DROP HORAS, DROP MINUTOS;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO CHANGE FECHA_CELEBRACION FECHA_INICIO DATE NOT NULL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJO ADD FECHA_FINALIZO DATE NOT NULL AFTER FECHA_INICIO;";
                    conn.escribir(sql);
                    sql = "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(-2,'No aplica');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(1,'Audiencias relacionadas con la competencia');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(2,'Audiencias relacionadas con técnicas de investigación');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(3,'Audiencias de prueba anticipada');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(4,'Audiencias de acumulación de procesos');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(5,'Audiencias de separación de procesos');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(6,'Audiencias de citación ');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(7,'Audiencias de comparecencia');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(8,'Audiencias de aprehensión');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(9,'Audiencias de desistimiento de la acción penal');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(10,'Audiencias relacionadas con las medidas de protección');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(11,'Audiencia inicial');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(12,'Audiencias de medida cautelar (revisión)');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(13,'Audiencias relacionadas con el procedimiento abreviado');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(14,'Audiencias relacionadas con la suspensión condicional del proceso');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(15,'Audiencias de cierre de la investigación complementaria');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(16,'Audiencias relacionadas con impugnaciones a determinaciones del ministerio público');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(17,'Audiencias relacionadas con acuerdos reparatorios');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(18,'Audiencias de solicitud y/o determinación de sobreseimiento');"
                            + "INSERT INTO CATALOGOS_AUDIENCIAS_INVESTIGACION (AUDIENCIA_ID, DESCRIPCION) VALUES(19,'Otras(especifique)');";
                    System.out.println(sql);
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC DROP HORAS, DROP MINUTOS;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC CHANGE FECHA_CELEBRACION FECHA_INICIO DATE NOT NULL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_AUDIENCIAS_ADOJC ADD FECHA_FINALIZO DATE NOT NULL AFTER FECHA_INICIO;";
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
