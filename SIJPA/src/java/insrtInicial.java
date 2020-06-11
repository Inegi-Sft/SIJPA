/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showInicial;
import clasesAuxiliar.usuario;
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
@WebServlet(urlPatterns = {"/insrtInicial"})
public class insrtInicial extends HttpServlet {

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
    boolean insrtPmedida;
    int banderaEtapa = 0;
    String banderaDesc = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession sesion = request.getSession();
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

        int audiInicial = Integer.parseInt(request.getParameter("audiInicial"));
        String detencion = request.getParameter("ctrlDetencion");
        String legaldetencion = request.getParameter("legalDeten");
        String fechaAutoLiber = request.getParameter("fechaAutoLiber");
        String formuImputa = request.getParameter("formuImputa");
        String fechaFormuImpu = request.getParameter("fechaFormuImpu");
        String declaro = request.getParameter("declaro");
        String fechDeclara = request.getParameter("fechDeclara");
        String huboPlazo = request.getParameter("huboPlazo");
        String Plazo = request.getParameter("plazo");
        String autovincula = request.getParameter("autoVin");
        String fechavincula = request.getParameter("fechAuto");

        int drecretaMC = Integer.parseInt(request.getParameter("drecretaMC"));
        String[] chkSoliMedi = request.getParameterValues("chkSoliMedi");

        String cierreinvestiga = request.getParameter("soliPlazo");
        String fechaplazo = request.getParameter("fechSoliPlazo");
        String soliProrroga = request.getParameter("soliProrroga");
        String plazofijado = request.getParameter("plazoFijadoC");
        String fechCierreI = request.getParameter("fechCierreI");
        int dictoSobresei = Integer.parseInt(request.getParameter("dictoSobresei"));
        String suspenProceso = request.getParameter("suspenProceso");
        String causasSuspension = request.getParameter("causasSuspension");
        int huboReapertura = Integer.parseInt(request.getParameter("huboReapertura"));
        String fechaReapertura = request.getParameter("fechaReapertura");
        String quienSoliApertura = request.getParameter("quienSoliApertura");
        int formulaAcusacion = Integer.parseInt(request.getParameter("formulaAcusacion"));
        String comentarios = request.getParameter("comentarios");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            //Control para saber la etapa donde sera enviado
            if (formulaAcusacion == 1) {
                banderaEtapa = 1;//pasa a Intermedia
                banderaDesc = "Intermedia";
            } else if (dictoSobresei == 1 || formulaAcusacion == 2) {
                banderaEtapa = 2;//pasa a Conclusiones
                banderaDesc = "Conclusiones";
            } else if (audiInicial == 2 || audiInicial == 9 || fechCierreI.equals("1699-09-09") || huboReapertura == 2 || huboReapertura == 9) {
                banderaEtapa = 3;//pasa a Tramite
                banderaDesc = "Tramite";
            } else if (formulaAcusacion == 9){
                banderaEtapa = 4;//finaliza la causa para el procesado
                banderaDesc = "Fin de Causa";
            } else{
                banderaEtapa = 5;//volando
                banderaDesc = "S/Estatus";
            }

            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "UPDATE DATOS_ETAPA_INICIAL_ADOJC SET AUDIENCIA_INICIAL = " + audiInicial + ",CTRL_DETENCION = " + detencion + ","
                        + "DETENCION_LEGAL = " + legaldetencion + ",FECHA_LIBERTAD = '" + fechaAutoLiber + "',FORMULACION_IMPUTACION = " + formuImputa + ","
                        + "FECHA_IMPUTACION = '" + fechaFormuImpu + "',IMPUTADO_DECLARO = " + declaro + ",FECHA_DECLARACION = '" + fechDeclara + "',"
                        + "PLAZO_CONSTITUCIONAL = " + huboPlazo + ",TIEMPO_PLAZO = " + Plazo + ",AUTO_VINCULACION = " + autovincula + ","
                        + "FECHA_VINCULACION = '" + fechavincula + "',IMPUSO_MCAUTELARES = " + drecretaMC + ",INVESTIGACION_COMPLEMENTARIA = " + cierreinvestiga + ","
                        + "FECHA_PLAZO_INVESTIGACION = '" + fechaplazo + "',PRORROGA_PLAZO_CIERRE = " + soliProrroga + ","
                        + "PLAZO_CIERRE_INVESTIGACION = " + plazofijado + ",FECHA_CIERRE_INVESTIGACION = '" + fechCierreI + "',"
                        + "SOBRESEIMIENTO_CAUSAP = " + dictoSobresei + ",SUSPENSION_PROCESO = " + suspenProceso + ","
                        + "CAUSA_SUSPENSION_PROCESO = " + causasSuspension + ",REAPERTURA_PROCESO = " + huboReapertura + ","
                        + "FECHA_REAPERTURA_PROCESO = '" + fechaReapertura + "',SOLICITO_REAPERTURA = " + quienSoliApertura + ","
                        + "FORMULO_ACUSACION = " + formulaAcusacion + ",COMENTARIOS = '" + comentarios + "',ETAPA = " + banderaEtapa + " "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (drecretaMC == 1) {
                        for (String soliMedi : chkSoliMedi) {
                            //Recibimos la variables de medidas cautelares dentro del for para llamar lista por lista
                            String[] chkMediCau = request.getParameterValues("chkMediCau" + soliMedi);
                            String[] duraMedi = request.getParameterValues("duraMedi" + soliMedi);
                            String especiMC = verificaVariable(request.getParameter("especiMC" + soliMedi));
                            for (int x = 0; x < chkMediCau.length; x++) {
                                if(chkMediCau[x].equals("13")){
                                    sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                            + proceClave + jConcatenado + "'," + soliMedi + "," + chkMediCau[x] + "," + duraMedi[x] + ",'"
                                            + especiMC + "', (select YEAR(NOW())))";
                                    System.out.println(sql);
                                }else{
                                    sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                            + proceClave + jConcatenado + "'," + soliMedi + "," + chkMediCau[x] + "," + duraMedi[x] + ","
                                            + "-2, (select YEAR(NOW())))";
                                    System.out.println(sql);
                                }
                                if(!conn.escribir(sql)){//Si algun caso da false cerramos la conexion para envio de error
                                    conn.close();
                                }
                            }
                        }
                    }
                    
                    showInicial inicial = new showInicial();
                    ArrayList<String[]> lis = new ArrayList<>();
                    showCausasPenales causa = new showCausasPenales();
                    int totInicialInsrt = inicial.countInicial(causaClave);
                    int totInicial = causa.countTotalProcesados(causaClave);
                    if(totInicial == totInicialInsrt){
                        usuario usuario = new usuario();
                        usuario.insrtAvance(causaClave, 6);//Actualizamos el avance de la causa penal
                    }
                    lis = inicial.findInicialTabla(proceClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(proceClave);//Se usa para agregar el procesado a la etapa correspondiente
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(banderaDesc);//Descripcion de la bandera para la tabla
                    resp.add(banderaEtapa);//dato para saber a que etapa se agrega el procesado
                    resp.add(totInicialInsrt);
                    out.write(resp.toJSONString());

                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_ETAPA_INICIAL_ADOJC SET AUDIENCIA_INICIAL = " + audiInicial + ",CTRL_DETENCION = " + detencion + ","
                        + "DETENCION_LEGAL = " + legaldetencion + ",FECHA_LIBERTAD = '" + fechaAutoLiber + "',FORMULACION_IMPUTACION = " + formuImputa + ","
                        + "FECHA_IMPUTACION = '" + fechaFormuImpu + "',IMPUTADO_DECLARO = " + declaro + ",FECHA_DECLARACION = '" + fechDeclara + "',"
                        + "PLAZO_CONSTITUCIONAL = " + huboPlazo + ",TIEMPO_PLAZO = " + Plazo + ",AUTO_VINCULACION = " + autovincula + ","
                        + "FECHA_VINCULACION = '" + fechavincula + "',IMPUSO_MCAUTELARES = " + drecretaMC + ",INVESTIGACION_COMPLEMENTARIA = " + cierreinvestiga + ","
                        + "FECHA_PLAZO_INVESTIGACION = '" + fechaplazo + "',PRORROGA_PLAZO_CIERRE = " + soliProrroga + ","
                        + "PLAZO_CIERRE_INVESTIGACION = " + plazofijado + ",FECHA_CIERRE_INVESTIGACION = '" + fechCierreI + "',"
                        + "SOBRESEIMIENTO_CAUSAP = " + dictoSobresei + ",SUSPENSION_PROCESO = " + suspenProceso + ","
                        + "CAUSA_SUSPENSION_PROCESO = " + causasSuspension + ",REAPERTURA_PROCESO = " + huboReapertura + ","
                        + "FECHA_REAPERTURA_PROCESO = '" + fechaReapertura + "',SOLICITO_REAPERTURA = " + quienSoliApertura + ","
                        + "FORMULO_ACUSACION = " + formulaAcusacion + ",COMENTARIOS = '" + comentarios + "',ETAPA = " + banderaEtapa + " "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos medidas cautelares por si se actualizan o bien se modifica el disparador
                    sql = "DELETE FROM DATOS_PMEDIDAS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                    conn.escribir(sql);
                    if (drecretaMC == 1) {
                        for (String soliMedi : chkSoliMedi) {
                            //Recibimos la variables de medidas cautelares dentro del for para llamar lista por lista
                            String[] chkMediCau = request.getParameterValues("chkMediCau" + soliMedi);
                            String[] duraMedi = request.getParameterValues("duraMedi" + soliMedi);
                            String especiMC = verificaVariable(request.getParameter("especiMC" + soliMedi));
                            for (int x = 0; x < chkMediCau.length; x++) {
                                if(chkMediCau[x].equals("13")){
                                    sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                            + proceClave + jConcatenado + "'," + soliMedi + "," + chkMediCau[x] + "," + duraMedi[x] + ",'"
                                            + especiMC + "', (select YEAR(NOW())))";
                                    System.out.println(sql);
                                }else{
                                    sql = "INSERT INTO DATOS_PMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave + "','"
                                            + proceClave + jConcatenado + "'," + soliMedi + "," + chkMediCau[x] + "," + duraMedi[x] + ","
                                            + "-2, (select YEAR(NOW())))";
                                    System.out.println(sql);
                                }
                                if(!conn.escribir(sql)){//Si algun caso da false cerramos la conexion para envio de error
                                    conn.close();
                                }
                            }
                        }
                    }

                    showInicial inicial = new showInicial();
                    ArrayList<String[]> lis = new ArrayList<>();
                    int totInicialInsrt = inicial.countInicial(causaClave);
                    lis = inicial.findInicialTabla(proceClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(proceClave);//Se usa para agregar el procesado a la etapa correspondiente
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(banderaDesc);//Descripcion de la bandera para la tabla
                    resp.add(0);//dato para saber a que etapa se agrega el procesado
                    resp.add(totInicialInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtInicial.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String verificaVariable(String variable) {
        String verificada = "";
        if (variable == null) {
            verificada = "-2";
        } else if (variable.equals("")) {
            verificada = "-2";
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
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
