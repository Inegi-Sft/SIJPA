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
                            + "(11,'Audiencia inicial'),"
                            + "(12,'Audiencias de medida cautelar (revisión)'),"
                            + "(13,'Audiencias relacionadas con el procedimiento abreviado'),"
                            + "(14,'Audiencias relacionadas con la suspensión condicional del proceso'),"
                            + "(15,'Audiencias de cierre de la investigación complementaria'),"
                            + "(16,'Audiencias relacionadas con impugnaciones a determinaciones del ministerio público'),"
                            + "(17,'Audiencias relacionadas con acuerdos reparatorios'),"
                            + "(18,'Audiencias de solicitud y/o determinación de sobreseimiento'),"
                            + "(19,'Otras(especifique)');";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_INFORME_ADOJO CHANGE MEDIDAS_PROTECCION_ASIG EXCUSAS INT(5) NOT NULL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_INFORME_ADOJO CHANGE PROVIDENCIAS_PRECAUTORIAS RECUSACIONES INT(5) NOT NULL, CHANGE PRUEBA_ANTICIPADA OTRAS INT(5) NOT NULL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_INFORME_ADOJO DROP ORDENES_JUDICIALES,  DROP ACTOS_INVESTIGA,  DROP IMPUGNACION_MP,  DROP OTROS;";
                    conn.escribir(sql);
                    sql = "INSERT INTO CATALOGOS_COLONIASMUN ('ENTIDAD_ID', 'MUNICIPIO_ID', 'COLONIA_ID', 'DESCRIPCION') VALUES ('99', '99999', '9999-9999', 'No identificado');";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_PRESENTA_MP_ADOJC ADD NUM_MPRUEBA INT(2) NOT NULL AFTER PROCESADO_CLAVE;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_INTERMEDIA_ADOJC DROP FOREIGN KEY FK_EINTERMEDIA_MP_MP;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_INTERMEDIA_ADOJC DROP FOREIGN KEY FK_EINTERMEDIA_PRESENTA_MP_ASESOR;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_INTERMEDIA_ADOJC DROP FOREIGN KEY FK_EINTERMEDIA_PRESENTA_MP_DEFENSA;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_INTERMEDIA_ADOJC "
                            + "DROP 'PRESENTA_MP_MINISTERIO',"
                            + "DROP 'PRESENTA_MP_ASESOR',"
                            + "DROP 'PRESENTA_MP_DEFENSA';";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_ORAL_ADOJO ADD CANTIDAD_TEST INT NOT NULL AFTER PD_TESTIMONIAL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_ORAL_ADOJO ADD CANTIDAD_PERI INT NOT NULL AFTER PD_PERICIAL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_ORAL_ADOJO ADD CANTIDAD_DECLA INT NOT NULL AFTER PD_DECLARACION_ACUSADO;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_ORAL_ADOJO ADD CANTIDAD_DOCU INT NOT NULL AFTER PD_DOCUMENTAL_MATERIAL;";
                    conn.escribir(sql);
                    sql = "ALTER TABLE DATOS_ETAPA_ORAL_ADOJO ADD CANTIDAD_OTRO INT NOT NULL AFTER PD_OTRA_PRUEBA;";
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
