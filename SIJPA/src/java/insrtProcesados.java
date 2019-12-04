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
    boolean insertP;
    
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
        
        // VARIABLES PROCESADOS
        String proceClave = request.getParameter("proceClave");
        String nombre = request.getParameter("nombre");
        String apaterno = request.getParameter("apaterno");
        String amaterno = request.getParameter("amaterno");
        String alias = request.getParameter("alias");
        String curp = request.getParameter("curp");
        String sexo = request.getParameter("sexo");
        String edad = request.getParameter("edad");
        String fNacimiento = request.getParameter("fNacimiento");
        if (fNacimiento == null) {
            fNacimiento = "1899-09-09";
        }
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
        String lenExtranjera = request.getParameter("lenExtranjera");
        String traductorPro = request.getParameter("traductorPro");
        String ingresosPro = request.getParameter("ingresosPro");
        String rangoIngresosPro = request.getParameter("rangoIngresosPro");
        String ocupacion = request.getParameter("ocupacion");
        String condicionActi = request.getParameter("condicionActi");
        String presentAdo = request.getParameter("presentAdo");
        String tipoDetencion = request.getParameter("tipoDetencion");
        String formaConduc = request.getParameter("formaConduc");
        String participacion = request.getParameter("participacion");
        String reincidencia = request.getParameter("reincidencia");
        String psicofisico = request.getParameter("psicofisico");
        String delictivo = request.getParameter("delictivo");
        String grupoDelictivo = request.getParameter("grupoDelictivo");
        String defensor = request.getParameter("defensor");
        String representante = request.getParameter("representante");
        String comentarios = request.getParameter("comentarios");
        
        //VARIABLES PINGRESOS
        String[] chkIngresosPro = request.getParameterValues("chkIngresosPro");
        
        //VARIABLES PDELITOS
        String[] arrayDelito = request.getParameterValues("arrayDelito");
        String[] arrayNumVic = request.getParameterValues("arrayNumVic");
        
        
        //***********************************INSERT*************************************************
        try {
            response.setContentType("text/json;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            sql = "INSERT INTO DATOS_PROCESADOS_ADOJC VALUES("+entidad+","+municipio+","+distrito+","+numero+",'" 
                    + expediente + jConcatenado + "','" + proceClave + jConcatenado+"','"
                    + nombre + "','"
                    + apaterno + "','"
                    + amaterno + "','"
                    + alias + "','"
                    + curp + "','"
                    + fNacimiento + "',"
                    + sexo + ","
                    + edad + ","
                    + nPais + ","
                    + nEntidad + ","
                    + nMunicipio + ","
                    + nacionalidad + ","
                    + residencia + ","
                    + rEntidad + ","
                    + rMunicipio + ","
                    + edoCivil + ","
                    + discapacidad + ","
                    + alfabet + ","
                    + estudios + ","
                    + condiEstudiante + ","
                    + hablaEsp + ","
                    + poblaIndigena + ","
                    + puebloIndigena + ","
                    + hablaIndigena + ","
                    + lenguaIndigena + ","
                    + lenExtranjera + ","
                    + traductorPro + ","
                    + ingresosPro + ","
                    + rangoIngresosPro + ","
                    + ocupacion + ","
                    + condicionActi + ","
                    + presentAdo + ","
                    + tipoDetencion + ","
                    + formaConduc + ","
                    + participacion + ","
                    + reincidencia + ","
                    + psicofisico + ","
                    + delictivo + ","
                    + grupoDelictivo + ","
                    + defensor + ","
                    + representante + ",'"
                    + comentarios + "',"
                    + " (select YEAR(NOW())) );";
            System.out.println(sql);
            if (conn.escribir(sql)) {
                //INSERT DE PDELITOS
                for (String chkIngresosPro1 : chkIngresosPro) {
                    sql = "INSERT INTO DATOS_PFUENTE_INGRESOS_ADOJC VALUES(" + entidad + "," + municipio + "," + distrito + "," + numero+",'"
                            + expediente + jConcatenado + "','" + proceClave + jConcatenado + "'," + chkIngresosPro1 + ","
                            + "(select YEAR(NOW())) )";
                    System.out.println(sql);
                    insertP = conn.escribir(sql);
                }
                if(insertP){
                    for(int i=0; i<arrayDelito.length;i++){
                        if(!arrayNumVic[i].equals("0")){//inserta el procesado que haya tenido un numero de victimas mayor a 0
                            sql = "INSERT INTO DATOS_PDELITOS_ADOJC VALUES (" + entidad + "," + municipio + "," + distrito + "," + numero + ",'"
                                    + expediente + jConcatenado + "','" + proceClave + jConcatenado + "','" + arrayDelito[i] + "',"
                                    + arrayNumVic[i] + ",(select YEAR(NOW())) )";
                            System.out.println(sql);
                            insertP=conn.escribir(sql);
                        }
                    }
                    if(insertP){
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
                        conn.close();
                    }else{
                        conn.close();
                    }
                }else{
                    conn.close();
                }
            } else {
                conn.close();
            }
        } 
        catch (SQLException ex) {
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
