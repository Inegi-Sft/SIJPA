/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showIntermedia;
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
@WebServlet(urlPatterns = {"/insrtIntermedia"})
public class insrtIntermedia extends HttpServlet {

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
    boolean insertMP, insertAJ, insertDefensa;
    int banderaEtapa = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        
        String fechaEscrito;
        if (request.getParameter("fechaEscrito") != null) {
            fechaEscrito = request.getParameter("fechaEscrito");
        } else {
            fechaEscrito = "1899-09-09";
        }
        String fechaContestacion;
        if (request.getParameter("contestaEscrito") != null) {
            fechaContestacion = request.getParameter("contestaEscrito");
        } else {
            fechaContestacion = "1899-09-09";
        }
        String descubrimiento = request.getParameter("decubreProba");
        int intermedia = Integer.parseInt(request.getParameter("audiInterme"));
        String fechaIntermedia;
        if (request.getParameter("fechaAudiinter") != null) {
            fechaIntermedia = request.getParameter("fechaAudiinter");
        } else {
            fechaIntermedia = "1899-09-09";
        }
        String separacion = request.getParameter("separaAcusa");
        int mediosPrueba = Integer.parseInt(request.getParameter("mediosPrueba"));
        int pruebaMP = Integer.parseInt(request.getParameter("pruebaMP"));
        int pruebaAJ = Integer.parseInt(request.getParameter("pruebaAJ"));
        int pruebaDefensa = Integer.parseInt(request.getParameter("pruebaDefensa"));
        String[] chkpruebaMP = request.getParameterValues("chkpruebaMP");
        String[] chkpruebaAJ = request.getParameterValues("chkpruebaAJ");
        String[] chkpruebaDefen = request.getParameterValues("chkpruebaDefen");
        String acuerdosProba = request.getParameter("acuerdosProba");
        int aperturaJO = Integer.parseInt(request.getParameter("aperturaJO"));
        String comentarios = request.getParameter("comentarios");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            //Control para saber la etapa donde sera enviado si llega a esta etapa
            if (aperturaJO == 1) {
                banderaEtapa = 6;//pasa a Conclusiones
            } else if (intermedia == 2 || intermedia == 9) {
                banderaEtapa = 7;//pasa a Tramite
            }

            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
               sql = "INSERT INTO DATOS_ETAPA_INTERMEDIA_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                        + "','" + proceClave + jConcatenado + "','" + fechaEscrito + "','" + fechaContestacion + "'," + descubrimiento + "," + intermedia
                        + ",'" + fechaIntermedia + "'," + separacion + "," + mediosPrueba + "," + pruebaMP + "," + pruebaAJ + "," + pruebaDefensa
                        + "," + acuerdosProba + "," + aperturaJO + ",'" + comentarios + "',(select YEAR(NOW())));";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (mediosPrueba == 1) {
                        if (pruebaMP == 1) {
                            for (String chkpruebaMP1 : chkpruebaMP) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',1," + chkpruebaMP1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertMP = conn.escribir(sql);
                            }
                        }
                        if (pruebaAJ == 1) {
                            for (String chkpruebaAJ1 : chkpruebaAJ) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',2," + chkpruebaAJ1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertAJ = conn.escribir(sql);
                            }
                        }
                        if (pruebaDefensa == 1) {
                            for (String chkpruebaDefen1 : chkpruebaDefen) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',3," + chkpruebaDefen1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertDefensa = conn.escribir(sql);
                            }
                        }
                    }
                    //ACTUALIZAMOS LA ETAPA A NIVEL PROCESADO EN ETAPA INICIAL
                    sql="UPDATE DATOS_ETAPA_INICIAL_ADOJC SET ETAPA = " + banderaEtapa + " "
                            + "WHERE CAUSA_CLAVE = '" + causaClave + "' AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";

                    if(conn.escribir(sql)){
                        showIntermedia inter = new showIntermedia();
                        ArrayList<String[]> lis = new ArrayList<String[]>();
                        int totInterInsrt = inter.countIntermedia(causaClave);
                        lis = inter.findIntermediaTabla(proceClave + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(proceClave);//Se usa para agregar el procesado a la etapa correspondiente
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        resp.add(lis.get(0)[4]);
                        resp.add(banderaEtapa);
                        resp.add(totInterInsrt);
                        out.write(resp.toJSONString());
                        conn.close();
                    }else{
                        conn.close();
                    }
                } else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_ETAPA_INTERMEDIA_ADOJC SET FECHA_ESCRITO_ACUSACION = '" + fechaEscrito + "',FECHA_CONTESTACION = '" + fechaContestacion + "',"
                        + "DESCUBRIMIENTO_PROBATORIO = " + descubrimiento + ",AUDIENCIA_INTERMEDIA = " + intermedia + ","
                        + "FECHA_AUDIENCIA_INTERMEDIA = '" + fechaIntermedia + "',SEPARACION_ACUSACION = " + separacion + ","
                        + "PRESENTACION_MPRUEBA = " + mediosPrueba + ",PRESENTA_MP_MINISTERIO = " + pruebaMP + ",PRESENTA_MP_ASESOR = " + pruebaAJ + ","
                        + "PRESENTA_MP_DEFENSA = " + pruebaDefensa + ",ACUERDOS_PROBATORIOS = " + acuerdosProba + ","
                        + "APERTURA_JUICIO_ORAL = " + aperturaJO + ",COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos medios prueba por si se actualizan o bien se modifica el disparador
                    sql = "DELETE FROM DATOS_PRESENTA_MP_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                    conn.escribir(sql);
                    if (mediosPrueba == 1) {
                        if (pruebaMP == 1) {
                            for (String chkpruebaMP1 : chkpruebaMP) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',1," + chkpruebaMP1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertMP = conn.escribir(sql);
                            }
                        }
                        if (pruebaAJ == 1) {
                            for (String chkpruebaAJ1 : chkpruebaAJ) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',2," + chkpruebaAJ1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertAJ = conn.escribir(sql);
                            }
                        }
                        if (pruebaDefensa == 1) {
                            for (String chkpruebaDefen1 : chkpruebaDefen) {
                                sql = "INSERT INTO DATOS_PRESENTA_MP_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'" + causaClave
                                        + "','" + proceClave + jConcatenado + "',3," + chkpruebaDefen1 + ",(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertDefensa = conn.escribir(sql);
                            }
                        }
                    }
                    //ACTUALIZAMOS LA ETAPA A NIVEL PROCESADO EN ETAPA INICIAL
                    sql="UPDATE DATOS_ETAPA_INICIAL_ADOJC SET ETAPA = " + banderaEtapa + " "
                            + "WHERE CAUSA_CLAVE = '" + causaClave + "' AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";

                    if(conn.escribir(sql)){
                        showIntermedia inter = new showIntermedia();
                        ArrayList<String[]> lis = new ArrayList<String[]>();
                        int totInterInsrt = inter.countIntermedia(causaClave);
                        lis = inter.findIntermediaTabla(proceClave + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(proceClave);//Se usa para agregar el procesado a la etapa correspondiente
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        resp.add(lis.get(0)[4]);
                        resp.add(banderaEtapa);
                        resp.add(totInterInsrt);
                        out.write(resp.toJSONString());
                        conn.close();
                    }else{
                        conn.close();
                    }
                } else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtIntermedia.class.getName()).log(Level.SEVERE, null, ex);
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
