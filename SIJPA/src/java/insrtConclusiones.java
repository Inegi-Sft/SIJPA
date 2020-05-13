/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showConclusiones;
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
 * @author CESAR.OSORIO
 */
@WebServlet(urlPatterns = {"/insrtConclusiones"})
public class insrtConclusiones extends HttpServlet {

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
    boolean insrtDConclu=false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession sesion= request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String juzgadClave = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String causaClave = (String) sesion.getAttribute("causaClave");
        String proceClave = request.getParameter("proceClave");
        
        String fechaResolu=request.getParameter("fechaReso");
        String tipoResolu = request.getParameter("resolucion");
        String tipoSobre = request.getParameter("tipoSobreseimto");
        String proceSobre = request.getParameter("proceSobreseimto");
        String excluAccion = request.getParameter("excluAccion");
        String tipoCondiSCP = request.getParameter("tipoCondiSCP");
        String fechaExtSCP = request.getParameter("fechaExtSCP");
        String tipoMecanismoAR = request.getParameter("tipoMecanismoAR");
        String fechaExtinAR = request.getParameter("fechaExtinAR");
        String tipoResolucionPA = request.getParameter("tipoResolucionPA");
        String privativa = request.getParameter("tipoMedidaPL");
        String noprivativa = request.getParameter("tipoMedidaNPL");
        String internamiento = request.getParameter("internamiento");
        String reparacion = request.getParameter("reparaDanio");
        String tipoRepara = request.getParameter("tipoReparaD");
        String multa = request.getParameter("montoReparaD");
        String impugnacion = request.getParameter("impugnacion");
        String tipoImpugnacion = request.getParameter("tipoImpugnacion");
        String fechaImpugna=request.getParameter("fechaImpugnacion");
        String personaImpugna = request.getParameter("personaImpugna");
        String comentario = request.getParameter("comentarios");
        
        // variables DCONCLUSIONES
        String[] delitoClave = request.getParameterValues("delitoConclu");
        
        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_CONCLUSIONES_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                        + causaClave + "','" + proceClave + jConcatenado + "','" + fechaResolu + "'," + tipoResolu + "," + tipoSobre + "," + proceSobre + ","
                        + excluAccion + "," + tipoCondiSCP + ",'" + fechaExtSCP + "'," + tipoMecanismoAR + ",'" + fechaExtinAR + "'," + tipoResolucionPA + ","
                        + privativa + "," + noprivativa + "," + internamiento + "," + reparacion + "," + tipoRepara + "," + multa + "," + impugnacion + ","
                        + tipoImpugnacion + ",'" + fechaImpugna + "'," + personaImpugna + ",'" + comentario + "', (select YEAR(NOW())) )";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if(tipoResolu.equals("4")){
                        for (int i = 0; i < delitoClave.length; i++){
                            String resolDelito = request.getParameter("resolDelito" + i);
                            sql = "INSERT INTO DATOS_DCONCLUSIONES_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                    + proceClave + jConcatenado + "','" + delitoClave[i] + "'," + tipoResolu + "," + resolDelito + ", (select YEAR(NOW())) )";
                            System.out.println(sql);
                            insrtDConclu=conn.escribir(sql);
                        }
                    }
                    //Solo se actualizan los que estan volando (etapa 5)
                    sql = "UPDATE DATOS_ETAPA_INICIAL_ADOJC SET ETAPA = 2 "
                            + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "' "
                            + "AND ETAPA = 5;";
                    System.out.println(sql);
                    if(conn.escribir(sql)){
                        showConclusiones con = new showConclusiones();
                        ArrayList<String[]> lis = new ArrayList();
                        int totConcluInsrt = con.countConclusionesExp(causaClave);
                        lis = con.findConcluTabla(proceClave + jConcatenado);
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
                sql = "UPDATE DATOS_CONCLUSIONES_ADOJC SET FECHA_CONCLUSION = '" + fechaResolu + "',TIPO_RESOLUCION = " + tipoResolu + ","
                        + "TIPO_SOBRESEIMIENTO = " + tipoSobre + ",PROCEDENCIA_SOBRESEIMIENTO = " + proceSobre + ",EXCLUSION_ACCIONP = " + excluAccion + ","
                        + "SUSPENCION_CONDICIONAL = " + tipoCondiSCP + ",FECHA_SUSPENCION = '" + fechaExtSCP + "',"
                        + "MECANISMO_ACUERDO = " + tipoMecanismoAR + ",FECHA_ACUERDO = '" + fechaExtinAR + "',TIPO_CONCLUSION_PA = " + tipoResolucionPA + ","
                        + "TIPO_CONCLUSION_PA = " + privativa + ",MEDIDA_NOPRIVATIVA = " + noprivativa + ",TIEMPO_INTERNAMIENTO = " + internamiento + ","
                        + "REPARACION_DANIO = " + reparacion + ",TIPO_REPARACION_DANIO = " + tipoRepara + ",MONTO_REPARA = " + multa + ","
                        + "IMPUGNACION = " + impugnacion + ",TIPO_IMPUGNACION = " + tipoImpugnacion + ",FECHA_IMPUGNACION = '" + fechaImpugna + "',"
                        + "PERSONA_IMPUGNA = " + personaImpugna + ",COMENTARIOS = '" + comentario + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos medios prueba por si se actualizan o bien se modifica el disparador
                    sql = "DELETE FROM DATOS_DCONCLUSIONES_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                    conn.escribir(sql);
                    if(tipoResolu.equals("4")){
                        for (int i = 0; i < delitoClave.length; i++){
                            String resolDelito = request.getParameter("resolDelito" + i);
                            sql = "INSERT INTO DATOS_DCONCLUSIONES_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                    + proceClave + jConcatenado + "','" + delitoClave[i] + "'," + tipoResolu + "," + resolDelito + ", (select YEAR(NOW())) )";
                            System.out.println(sql);
                            insrtDConclu=conn.escribir(sql);
                        }
                    }
                    showConclusiones con = new showConclusiones();
                    ArrayList<String[]> lis = new ArrayList<>();
                    int totConcluInsrt = con.countConclusionesExp(causaClave);
                    lis = con.findConcluTabla(proceClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(totConcluInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
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
