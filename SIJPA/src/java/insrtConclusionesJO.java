/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showConclusionesJO;
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
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/insrtConclusionesJO"})
public class insrtConclusionesJO extends HttpServlet {

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
    boolean insrtDConclu = true;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        
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
        
        String fechaReso = request.getParameter("fechaReso");
        String resolucion = request.getParameter("resolucion");
        String fechaSenten = request.getParameter("fechaSenten");
        String tipoSobreseimto = request.getParameter("tipoSobreseimto");
        String proceSobreseimto = request.getParameter("proceSobreseimto");
        String excluAccion = request.getParameter("excluAccion");
        String tipoSentencia = request.getParameter("tipoSentencia");
        String tipoMedidaPL = request.getParameter("tipoMedidaPL");
        String tipoMedidaNPL = request.getParameter("tipoMedidaNPL");
        String internamiento = request.getParameter("internamiento");
        String reparaDanio = request.getParameter("reparaDanio");
        String tipoReparaD = request.getParameter("tipoReparaD");
        String montoReparaD = request.getParameter("montoReparaD");
        String impugnacion = request.getParameter("impugnacion");
        String tipoImpugnacion = request.getParameter("tipoImpugnacion");
        String fechaImpugnacion = request.getParameter("fechaImpugnacion");
        String personaImpugna = request.getParameter("personaImpugna");
        String comentarios = request.getParameter("comentarios");
        
        // variables DCONCLUSIONES
        String[] delitoClave = request.getParameterValues("delitoConclu");
        
        try{
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_CONCLUSIONES_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                        + causaClaveJO + "','" + proceClaveJO + jConcatenado + "','" + fechaReso + "'," + resolucion + ","
                        + tipoSobreseimto + "," + proceSobreseimto + "," + excluAccion + ",'" + fechaSenten + "',"
                        + tipoSentencia + "," + tipoMedidaPL + "," + tipoMedidaNPL + "," + internamiento + ","
                        + reparaDanio + "," + tipoReparaD + "," + montoReparaD + "," + impugnacion + "," + tipoImpugnacion + ",'"
                        + fechaImpugnacion + "'," + personaImpugna + ",'" + comentarios + "', (select YEAR(NOW())) )";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if(resolucion.equals("2")){
                        insrtDConclu=false;
                        for (int i = 0; i < delitoClave.length; i++){
                            String resolDelito = request.getParameter("resolDelito" + i);
                            sql = "INSERT INTO DATOS_DCONCLUSIONES_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClaveJO + "','"
                                    + proceClaveJO + jConcatenado + "','" + delitoClave[i] + "'," + tipoSentencia + "," + resolDelito + ", (select YEAR(NOW())) )";
                            System.out.println(sql);
                            insrtDConclu = conn.escribir(sql);
                        }
                    }
                    if(insrtDConclu){
                        showConclusionesJO con = new showConclusionesJO();
                        ArrayList<String[]> lis;
                        int totConcluInsrt = con.countConclusionesExpJO(causaClaveJO);
                        lis = con.findConcluTablaJO(proceClaveJO + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        //resp.add(tipoResolu);//Tipo de resolucion
                        resp.add(totConcluInsrt);
                        out.write(resp.toJSONString());
                        conn.close();        
                    } else {
                        conn.close();
                    } 
                }else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_CONCLUSIONES_ADOJO SET FECHA_CONCLUSION = '" + fechaReso + "',TIPO_RESOLUCION = " + resolucion + ","
                        + "TIPO_SOBRESEIMIENTO = " + tipoSobreseimto + ",PROCEDENCIA_SOBRESEIMIENTO = " + proceSobreseimto + ","
                        + "EXCLUSION_ACCIONP = " + excluAccion + ",FECHA_SENTENCIA = '" + fechaSenten + "',TIPO_SENTENCIA = " + tipoSentencia + ","
                        + "MEDIDA_PRIVATIVA = " + tipoMedidaPL + ",MEDIDA_NOPRIVATIVA = " + tipoMedidaNPL + ",TIEMPO_INTERNAMIENTO = " + internamiento + ","
                        + "REPARACION_DANIO = " + reparaDanio + ",TIPO_REPARACION_DANIO = " + tipoReparaD + ",MONTO_REPARA = " + montoReparaD + ","
                        + "IMPUGNACION = " + impugnacion + ",TIPO_IMPUGNACION = " + tipoImpugnacion + ",FECHA_IMPUGNACION = '" + fechaImpugnacion + "',"
                        + "PERSONA_IMPUGNA = " + personaImpugna + ",COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClaveJO + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos deconclusiones por si se actualizan o bien se modifica el disparador
                    sql = "DELETE FROM DATOS_DCONCLUSIONES_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClaveJO + jConcatenado + "';";
                    System.out.println(sql);
                    conn.escribir(sql);
                    if(resolucion.equals("2")){
                        insrtDConclu=false;
                        for (int i = 0; i < delitoClave.length; i++){
                            String resolDelito = request.getParameter("resolDelito" + i);
                            sql = "INSERT INTO DATOS_DCONCLUSIONES_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClaveJO + "','"
                                    + proceClaveJO + jConcatenado + "','" + delitoClave[i] + "'," + tipoSentencia + "," + resolDelito + ", (select YEAR(NOW())) )";
                            System.out.println(sql);
                            insrtDConclu=conn.escribir(sql);
                        }
                    }
                    if(insrtDConclu){
                        showConclusionesJO con = new showConclusionesJO();
                        ArrayList<String[]> lis;
                        int totConcluInsrt = con.countConclusionesExpJO(causaClaveJO);
                        lis = con.findConcluTablaJO(proceClaveJO + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        resp.add(totConcluInsrt);
                        out.write(resp.toJSONString());
                        conn.close();
                    }else{
                       conn.close(); 
                    }
                }else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtConclusiones.class.getName()).log(Level.SEVERE, null, ex);
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
