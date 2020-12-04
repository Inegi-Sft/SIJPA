/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenalesJO;
import clasesAuxiliar.showDelitosJO;
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
 * @author ANTONIO.CORIA
 */
@WebServlet(urlPatterns = {"/insrtDelitosJO"})
public class insrtDelitosJO extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        //posicion de la fila de la tabla.vista donde se inserta el dato
        String posicion = request.getParameter("posicion");
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        
        String juzgadoClaveJC = (String) sesion.getAttribute("juzgadoClaveJC");
        String juzgadoClaveJO = (String) sesion.getAttribute("juzgadoClave");
        String jDividido[] = juzgadoClaveJO.split("-"); //Esto separa en un array basandose en el separador que le pases
        String jEntidad = jDividido[0];
        String jMunicipio = jDividido[1];
        String jNumero = jDividido[2];
        String jConcatenado = jEntidad + jMunicipio + jNumero;
        String causaClaveJC = (String) sesion.getAttribute("causaClave");
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        String delitoClaveJC = request.getParameter("delitoClaveJC");
        String delitoClaveJO = request.getParameter("delitoClaveJO");
        
        String delitoCP = request.getParameter("delitoCP");
        String fuero = request.getParameter("fuero");
        String articuloCP = request.getParameter("articuloCP");
        String reclasificaDel = request.getParameter("reclasificaDel");
        String fechaReclaDel = verificaVariable(request.getParameter("fechaReclaDel"));
        int delitoNT = Integer.parseInt(request.getParameter("delitoNT"));
        String ocurrencia = verificaVariable(request.getParameter("ocurrencia"));
        String sitioO = verificaVariable(request.getParameter("sitioO"));
        String especifiqueO = verificaSitio(request.getParameter("sitioOE"), sitioO);
        String consumacion = request.getParameter("consumacion");
        String calificacion = request.getParameter("calificacion");
        String clasificacion = request.getParameter("clasificacion");
        String concurso = request.getParameter("concurso");
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
                //Validamos que proce JC es null entonces es nuevo registro de JO y se utiliza un operador ternario
                String deliClavJC = (delitoClaveJC != null)? "'" + delitoClaveJC + juzgadoClaveJC.replace("-", "") + "'" : null;
                sql="INSERT INTO DATOS_DELITOS_ADOJO VALUES(" + jEntidad + "," + jMunicipio + ",'" + jNumero + "','"
                        + causaClaveJC + "','" + causaClaveJO + "'," + deliClavJC + ",'"
                        + delitoClaveJO + jConcatenado + "'," + delitoCP + ",'" + articuloCP + "',"
                        + delitoNT + "," + fuero + "," + reclasificaDel + ",'" + fechaReclaDel + "','" + ocurrencia + "',"
                        + sitioO + ",'" + especifiqueO+ "'," + consumacion + "," + calificacion + "," + clasificacion + "," + concurso + ","
                        + comision + "," + accion + "," + modalidad + "," + instrumentos + "," + entidadD + ","
                        + municipioD + ",0,0,'" + comentarios + "',(select YEAR(NOW())) );";                
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (delitoNT == 31) {
                        for (String chkCR1 : chkCR) {
                            sql = "INSERT INTO DATOS_DROBO_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','" + delitoClaveJO + jConcatenado + "'," + chkCR1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    if (delitoNT == 1 || delitoNT == 4) {
                        for (String chkCS1 : chkCS) {
                            sql = "INSERT INTO DATOS_DHOMICIDIO_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','"+ delitoClaveJO + jConcatenado + "'," + chkCS1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    showDelitosJO deli = new showDelitosJO();
                    ArrayList<String[]> lis;
                    showCausasPenalesJO causa = new showCausasPenalesJO();
                    int totDelInsrt = deli.countDelitosInsertadosJO(causaClaveJO);
                    int totDel = causa.countTotalDelitosJO(causaClaveJO);
                    if(totDel == totDelInsrt){
                        usuario usuario = new usuario();
                        usuario.insrtAvanceJO(causaClaveJC, causaClaveJO, 3);//Actualizamos el avance de la causa penal JO
                    }
                    lis = deli.findDeliTablaJO(delitoClaveJO + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    //resp.add(lis.get(0)[0].replace(jConcatenado, ""));
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
                sql = "UPDATE DATOS_DELITOS_ADOJO SET DELITO_CODIGO_PENAL = " + delitoCP + ",ART_CODIGO_PENAL = '" + articuloCP + "',"
                        + "DELITO_NORMA_TECNICA = " + delitoNT + ",TIPO_FUERO = " + fuero + ",DELITO_RECLASIFICADO = " + reclasificaDel + ","
                        + "FECHA_RECLASIFICACION = '" +fechaReclaDel + "',FECHA_OCURRENCIA = '" + ocurrencia + "',SITIO_OCURRENCIA = " + sitioO + ","
                        + "ESPECIFIQUE_SITIO= '"+especifiqueO + "',GRADO_CONSUMACION = " + consumacion + ",CALIFICACION = " + calificacion + ","
                        + "CLASIFICACION = " + clasificacion + "," + "CONCURSO = " +concurso + ",FORMA_COMISION = " + comision + ","
                        + "FORMA_ACCION = " + accion + ",MODALIDAD = " + modalidad + "," + "INSTRUMENTO_COMISION = " + instrumentos + ","
                        + "OCURRIO_ENTIDAD = " + entidadD + ",OCURRIO_MUNICIPIO = " + municipioD + ","
                        + "COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                        + "AND DELITO_CLAVEJO = '" + delitoClaveJO + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos la tabla de robo y homicidios por si en la actualizacion cambio el delito o bien por si sufren actualizaciones dichas tablas
                    sql = "DELETE FROM DATOS_DROBO_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND DELITO_CLAVE = '" + delitoClaveJO + jConcatenado + "';";
                    conn.escribir(sql);
                    sql = "DELETE FROM DATOS_DHOMICIDIO_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND DELITO_CLAVE = '" + delitoClaveJO + jConcatenado + "';";
                    conn.escribir(sql);
                    if (delitoNT == 31) {
                        for (String chkCR1 : chkCR) {
                            sql = "INSERT INTO DATOS_DROBO_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','"+ delitoClaveJO + jConcatenado + "'," + chkCR1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }else if (delitoNT == 1 || delitoNT == 4) {
                        for (String chkCS1 : chkCS) {
                            sql = "INSERT INTO DATOS_DHOMICIDIO_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','"+ delitoClaveJO + jConcatenado + "'," + chkCS1 + " ,(select YEAR(NOW())) );";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    showDelitosJO deli = new showDelitosJO();
                    ArrayList<String[]> lis;
                    int totDelInsrt = deli.countDelitosInsertadosJO(causaClaveJO);
                    lis = deli.findDeliTablaJO(delitoClaveJO + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    //resp.add(lis.get(0)[0].replace(jConcatenado, ""));
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
        } catch (IOException | SQLException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public String verificaVariable(String variable) {
        String verificada;
        if (variable == null) {
            verificada = "1899-09-09";
        } else if (variable.equals("")) {
            verificada = "1899-09-09";
        } else {
            verificada = variable;
        }
        return verificada;
    }
    
    public String verificaSitio(String variable, String variable2) {
        String verificada = "";
        if ((variable == null) || (variable2.compareTo("12") > 0)) {
            verificada = "-2";
        } else if (variable.equals("") || (variable2.compareTo("12") > 0)) {
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
