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
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/insrtProcesados"})
public class insrtProcesados extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        int evento = Integer.parseInt(request.getParameter("evento"));
        String expediente = "BORRAME/2019";
        String procesado = request.getParameter("procesado");
        
        String presentAdo = request.getParameter("presentAdo");
        String tipoDetencion = request.getParameter("tipoDetencion");
        String imputable = request.getParameter("imputable");
        String participacion = request.getParameter("participacion");
        String reincidencia = request.getParameter("reincidencia");
        String psicofisico = request.getParameter("psicofisico");
        String interprete = request.getParameter("interprete");
        String defensor = request.getParameter("defensor");
        String representante = request.getParameter("representante");
        String nombre = request.getParameter("nombre");
        String apaterno = request.getParameter("apaterno");
        String amaterno = request.getParameter("amaterno");
        String alias = request.getParameter("alias");
        String curp = request.getParameter("curp");
        String sexo = request.getParameter("sexo");
        String edad = request.getParameter("edad");
        String fNacimiento = request.getParameter("fNacimiento");
        String nPais = request.getParameter("nPais");
        String nEntidad = request.getParameter("nEntidad");
        String nMunicipio = verificaVariable(request.getParameter("nMunicipio"));
        String nacionalidad = request.getParameter("nacionalidad");
        String residencia = request.getParameter("residencia");
        String rEntidad = request.getParameter("rEntidad");
        String rMunicipio = verificaVariable(request.getParameter("rMunicipio"));
        String edoCivil = request.getParameter("edoCivil");
        String discapacidad = request.getParameter("discapacidad");
        String alfabet = request.getParameter("alfabet");
        String estudios = request.getParameter("estudios");
        String condiEstudiante = request.getParameter("condiEstudiante");
        String hablaEsp = request.getParameter("hablaEsp");
        String poblaIndigena = request.getParameter("poblaIndigena");
        String puebloIndigena = request.getParameter("puebloIndigena");
        String hablaIndigena = request.getParameter("hablaIndigena");
        String lenguaIndigena = request.getParameter("lenguaIndigena");
        String ocupacion = request.getParameter("ocupacion");
        String condicionActi = request.getParameter("condicionActi");
        String comentarios = request.getParameter("comentarios");
        if (fNacimiento == null) {
            fNacimiento = "1899-09-09";
        }

        String arrayFecha[] = fNacimiento.split("-"); //Esto separa en un array basándose en el separador que le pases
        String dia = arrayFecha[2];
        String mes = arrayFecha[1];
        String anio = arrayFecha[0];
        
        switch (evento) {
            case 1: //***********************************INSERT*************************************************
                try {
                    String proceClave=generaProcesadoClave(expediente)+1;
                    conn.Conectar();
                    sql = "INSERT INTO DATOS_PROCESADOS_ADOJC VALUES(12,12001,1,1,'"+expediente+"','"+proceClave+"',"
                            + presentAdo + ","
                            + tipoDetencion + ","
                            + imputable + ","
                            + participacion + ","
                            + reincidencia + ","
                            + psicofisico + ","
                            + interprete + ","
                            + defensor + ","
                            + representante + ","
                            + "'" + apaterno + "',"
                            + "'" + amaterno + "',"
                            + "'" + nombre + "',"
                            + "'" + alias + "',"
                            + "'" + curp + "',"
                            + sexo + ","
                            + edad + ","
                            + "'" + fNacimiento + "',"
                            + dia + ","
                            + mes + ","
                            + anio + ","
                            + nPais + ","
                            + nEntidad + ","
                            + nMunicipio + ","
                            + edoCivil + ","
                            + nacionalidad + ","
                            + residencia + ","
                            + rEntidad + ","
                            + rMunicipio + ","
                            + discapacidad + ","
                            + alfabet + ","
                            + estudios + ","
                            + condiEstudiante + ","
                            + hablaEsp + ","
                            + poblaIndigena + ","
                            + puebloIndigena + ","
                            + hablaIndigena + ","
                            + lenguaIndigena + ","
                            + ocupacion + ","
                            + condicionActi + ","
                            + "'" + comentarios + "',"
                            + " (select YEAR(NOW())) );";

                    if (conn.escribir(sql)) {// si se inserta redirige a elementosPrincipales.jsp
                        conn.close();
                        response.sendRedirect("elementosPrincipales.jsp?insertado=true");
                    } else {//regresa a procesados.jsp y maca error
                        conn.close();
                        response.sendRedirect("procesados.jsp?insertado=false");
                    }
                } catch (Exception ex) {
                    Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;

            case 2: //******************************** DELETE ****************************************************
                try {
                    conn.Conectar();
                    sql = "DELETE FROM DATOS_PROCESADOS_ADOJC WHERE PROCESADO_CLAVE='" + procesado + "';";
                    if (conn.escribir(sql)) {
                        conn.close();
                        response.sendRedirect("elementosPrincipales.jsp?eliminado=true");
                    } else {
                        conn.close();
                        response.sendRedirect("elementosPrincipales.jsp?eliminado=false");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insrtProcesados</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insrtProcesados at " + request.getContextPath() + "</h1>");
            /*out.println(sql);
            out.println("<br>presentacion: " + presentAdo);
            out.println("<br>tipo detencion: " + tipoDetencion);
            out.println("<br>imputable: " + imputable);
            out.println("<br>participacion: " + participacion);
            out.println("<br>reincidencia: " + reincidencia);
            out.println("<br>psicofisico: " + psicofisico);
            out.println("<br>interprete: " + interprete);
            out.println("<br>defensor: " + defensor);
            out.println("<br>representante: " + representante);
            out.println("<br>apaterno: " + apaterno);
            out.println("<br>amaterno: " + amaterno);
            out.println("<br>nombre: " + nombre);
            out.println("<br>alias: " + alias);
            out.println("<br>curp: " + curp);
            out.println("<br>sexo: " + sexo);
            out.println("<br>edad: " + edad);
            out.println("<br>nacimiento: " + fNacimiento);
            out.println("<br>dia: " + dia);
            out.println("<br>mes: " + mes);
            out.println("<br>anio: " + anio);
            out.println("<br>nac pais: " + nPais);
            out.println("<br>nac entidad: " + nEntidad);
            out.println("<br>nac Municipio: " + nMunicipio);
            out.println("<br>edo civil: " + edoCivil);
            out.println("<br>nacionalidad: " + nacionalidad);
            out.println("<br>residencia: " + residencia);
            out.println("<br>resi Entidad: " + rEntidad);
            out.println("<br>resi Municipio: " + rMunicipio);
            out.println("<br>discapacidad: " + discapacidad);
            out.println("<br>alfabet: " + alfabet);
            out.println("<br>estudios: " + estudios);
            out.println("<br>condi Estudiante: " + condiEstudiante);
            out.println("<br>habla esp: " + hablaEsp);
            out.println("<br>poblacion Indigena: " + poblaIndigena);
            out.println("<br>pueblo Indig: " + puebloIndigena);
            out.println("<br>habla Indi: " + hablaIndigena);
            out.println("<br>lengua Indige: " + lenguaIndigena);
            out.println("<br>ocupacion: " + ocupacion);
            out.println("<br>condicionActiv: " + condicionActi);
            out.println("<br>comentarios: " + comentarios);*/
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }


    public String verificaVariable(String variable) {
        String verificada = "";
        if (variable == null) {
            verificada = "0";
        } else if (variable.equals("")) {
            verificada = "0";
        } else {
            verificada = variable;
        }
        return verificada;
    }
    
    public String generaProcesadoClave(String exp) throws SQLException {

        int maxPro = 0;
        String procesadoClave="";
        
        conn.Conectar();
        String sql = "SELECT MAX("
                            + "SUBSTR( PROCESADO_CLAVE, INSTR(PROCESADO_CLAVE,'P')+1, length(PROCESADO_CLAVE) )" 
                        + " ) AS NUMERO" 
                    + " FROM DATOS_PROCESADOS_ADOJC WHERE EXPEDIENTE_CLAVE='"+exp+"';";
        rs = conn.consultar(sql);
        if (rs.next()) {
            maxPro = rs.getInt("NUMERO");
        }
        
        int newPro=maxPro+1;
        procesadoClave=exp+"-P"+newPro;
        return procesadoClave;
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
        }
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
