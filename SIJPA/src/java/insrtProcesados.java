/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showProcesados;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
        
        HttpSession sesion= request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String entidad =(String) sesion.getAttribute("entidad");
        String municipio =(String) sesion.getAttribute("municipio");
        String distrito =(String) sesion.getAttribute("distrito");
        String numero =(String) sesion.getAttribute("numero");
        String jConcatenado =entidad+municipio+distrito+numero;
        String expediente =(String) sesion.getAttribute("expediente");
        
        String proceClave = request.getParameter("proceClave");
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
        //***********************************INSERT*************************************************
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            sql = "INSERT INTO DATOS_PROCESADOS_ADOJC VALUES("+entidad+","+municipio+","+distrito+","+numero+",'" 
                    + expediente + jConcatenado + "','" + proceClave + jConcatenado+"',"
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
            System.out.println(sql);
            if (conn.escribir(sql)) {
                conn.close();
                showProcesados pro = new showProcesados();
                ArrayList<String[]> lis = new ArrayList<String[]>();
                lis = pro.findProcesasdosTabla(proceClave + jConcatenado);
                JSONArray resp = new JSONArray();
                resp.add(posicion);
                resp.add(lis.get(0)[0]);
                resp.add(lis.get(0)[1]);
                resp.add(lis.get(0)[2]);
                resp.add(lis.get(0)[3]);
                resp.add(pro.countProcesados(expediente + jConcatenado));
                out.write(resp.toJSONString());
            } else {//regresa a procesados.jsp y maca error
                conn.close();
            }
        } catch (IOException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
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
