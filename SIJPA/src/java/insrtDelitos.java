/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showDelitos;
import clasesAuxiliar.usuario;
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
@WebServlet(urlPatterns = {"/insrtDelitos"})
public class insrtDelitos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    showCausasPenales cp = new showCausasPenales();
    showDelitos sd = new showDelitos();
    Conexion_Mysql conn = new Conexion_Mysql();

    String sql;
    ResultSet rs;
    int deliExp;
    int deliInsertados;

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
        String delitoClave = request.getParameter("delitoClave");
        String delitoCP = request.getParameter("delitoCP");
        String articuloCP = request.getParameter("articuloCP");
        int delitoNT = Integer.parseInt(request.getParameter("delitoNT"));
        String fuero = request.getParameter("fuero");
        String reclasificaDel = request.getParameter("reclasificaDel");
        String fechaReclaDel = verificaVariable(request.getParameter("fechaReclaDel"));
        String ocurrencia = verificaVariable(request.getParameter("ocurrencia"));
        String sitioO = verificaVariable(request.getParameter("sitioO"));
        String consumacion = request.getParameter("consumacion");
        String calificacion = request.getParameter("calificacion");
        String concurso = request.getParameter("concurso");
        String clasificacion = request.getParameter("clasificacion");
        String comision = request.getParameter("comision");
        String accion = request.getParameter("accion");
        String modalidad = request.getParameter("modalidad");
        String instrumentos = request.getParameter("instrumentos");
        String entidadD = request.getParameter("entidadD");
        String municipioD = request.getParameter("municipioD");
        String[] chkCR = request.getParameterValues("cosaRobada");
        String[] chkCS = request.getParameterValues("contextoSitua");
        String comentarios = request.getParameter("comentarios");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            if(!opera.equals("actualizar")){//Se guarda el dato ya que es nuevo
                sql = "UPDATE DATOS_DELITOS_ADOJC SET DELITO_CODIGO_PENAL = " + delitoCP + ",ART_CODIGO_PENAL = '" + articuloCP + "',"
                        + "DELITO_NORMA_TECNICA = " + delitoNT + ",TIPO_FUERO = " + fuero + ",DELITO_RECLASIFICADO = " + reclasificaDel + ","
                        + "FECHA_RECLASIFICACION = '" +fechaReclaDel + "',FECHA_OCURRENCIA = '" + ocurrencia + "',SITIO_OCURRENCIA = " + sitioO + ","
                        + "GRADO_CONSUMACION = " + consumacion + ",CALIFICACION = " + calificacion + ",CLASIFICACION = " + clasificacion + ","
                        + "CONCURSO = " +concurso + ",FORMA_COMISION = " + comision + ",FORMA_ACCION = " + accion + ",MODALIDAD = " + modalidad + ","
                        + "INSTRUMENTO_COMISION = " + instrumentos + ",OCURRIO_ENTIDAD = " + entidadD + ",OCURRIO_MUNICIPIO = " + municipioD + ","
                        + "COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND DELITO_CLAVE = '" + delitoClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (delitoNT == 31) {
                        for (String chkCR1 : chkCR) {
                            sql = "INSERT INTO DATOS_DROBO_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClave + "','" + delitoClave + jConcatenado + "'," + chkCR1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    if (delitoNT == 1 || delitoNT == 4) {
                        for (String chkCS1 : chkCS) {
                            sql = "INSERT INTO DATOS_DHOMICIDIO_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClave + "','"+ delitoClave + jConcatenado + "'," + chkCS1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }

                    showDelitos deli = new showDelitos();
                    ArrayList<String[]> lis = new ArrayList<>();
                    showCausasPenales causa = new showCausasPenales();
                    int totDelInsrt = deli.countDelitosInsertados(causaClave);
                    int totDel = causa.countTotalDelitos(causaClave);
                    if(totDel == totDelInsrt){
                        usuario usuario = new usuario();
                        usuario.insrtAvance(causaClave, 3);//Actualizamos el avance de la causa penal
                    }
                    lis = deli.findDeliTabla(delitoClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(lis.get(0)[5]);
                    resp.add(totDelInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_DELITOS_ADOJC SET DELITO_CODIGO_PENAL = " + delitoCP + ",ART_CODIGO_PENAL = '" + articuloCP + "',"
                        + "DELITO_NORMA_TECNICA = " + delitoNT + ",TIPO_FUERO = " + fuero + ",DELITO_RECLASIFICADO = " + reclasificaDel + ","
                        + "FECHA_RECLASIFICACION = '" +fechaReclaDel + "',FECHA_OCURRENCIA = '" + ocurrencia + "',SITIO_OCURRENCIA = " + sitioO + ","
                        + "GRADO_CONSUMACION = " + consumacion + ",CALIFICACION = " + calificacion + ",CLASIFICACION = " + clasificacion + ","
                        + "CONCURSO = " +concurso + ",FORMA_COMISION = " + comision + ",FORMA_ACCION = " + accion + ",MODALIDAD = " + modalidad + ","
                        + "INSTRUMENTO_COMISION = " + instrumentos + ",OCURRIO_ENTIDAD = " + entidadD + ",OCURRIO_MUNICIPIO = " + municipioD + ","
                        + "COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND DELITO_CLAVE = '" + delitoClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos la tabla de robo y homicidios por si en la actualizacion cambio el delito o bien por si sufren actualizaciones dichas tablas
                    sql = "DELETE FROM DATOS_DROBO_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND DELITO_CLAVE = '" + delitoClave + jConcatenado + "';";
                    conn.escribir(sql);
                    sql = "DELETE FROM DATOS_DHOMICIDIO_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND DELITO_CLAVE = '" + delitoClave + jConcatenado + "';";
                    conn.escribir(sql);
                    if (delitoNT == 31) {
                        for (String chkCR1 : chkCR) {
                            sql = "INSERT INTO DATOS_DROBO_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClave + "','"+ delitoClave + jConcatenado + "'," + chkCR1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }else if (delitoNT == 1 || delitoNT == 4) {
                        for (String chkCS1 : chkCS) {
                            sql = "INSERT INTO DATOS_DHOMICIDIO_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClave + "','"+ delitoClave + jConcatenado + "'," + chkCS1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    showDelitos deli = new showDelitos();
                    ArrayList<String[]> lis = new ArrayList<String[]>();
                    int totDelInsrt = deli.countDelitosInsertados(causaClave);
                    lis = deli.findDeliTabla(delitoClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(lis.get(0)[5]);
                    resp.add(totDelInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                }else {
                    conn.close();
                }
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
            verificada = "1899-09-09";
        } else if (variable.equals("")) {
            verificada = "1899-09-09";
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
