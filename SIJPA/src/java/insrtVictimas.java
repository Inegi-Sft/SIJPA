/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenales;
import clasesAuxiliar.showVictimas;
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
@WebServlet(urlPatterns = {"/insrtVictimas"})
public class insrtVictimas extends HttpServlet {

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
    boolean insertaVDeli;
    boolean insertaVProce;
    boolean insertavmedida = true;
    boolean insertavmedidaMuj = true;
    boolean insertavingresos = true;

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
        String victiClave = request.getParameter("victiClave");
        String tipoVictima = request.getParameter("tipoVictima");
        String victima_moral = verificaVariable(request.getParameter("tvic_moral"));
        String conto_asesor = request.getParameter("con_asesor");
        String asesor = verificaVariable(request.getParameter("asesor"));
        String sexoV = request.getParameter("sexoV");
        String fecha_nacimiento;
        if (request.getParameter("fnacimientoV") != null) {
            fecha_nacimiento = request.getParameter("fnacimientoV");
        } else {
            fecha_nacimiento = "1899-09-09";
        }
        int edad = Integer.parseInt(request.getParameter("edadVi"));
        String vulnerabilidad = request.getParameter("vulnera");
        String paisNacimiento = request.getParameter("Pnacimiento");
        String entidadNacimiento = request.getParameter("Enacimiento");
        String muniNacimiento = verificaVariable(request.getParameter("Mnacimiento"));
        String nacionalidad = request.getParameter("naciona");
        String paisResi = request.getParameter("Preside");
        String entidadResi = request.getParameter("Ereside");
        String municipioResi = verificaVariable(request.getParameter("Mreside"));
        String conyugal = request.getParameter("conyugal");
        String alfabetismo = request.getParameter("alfabetismo");
        String estudios = request.getParameter("estudios");
        String ocupacion = request.getParameter("ocupa");
        String espanol = request.getParameter("hablaesp");
        String indigena = request.getParameter("indigena");
        String familia = request.getParameter("familia");
        String extrangera = request.getParameter("extrangera");
        String interprete = request.getParameter("interprete");
        int ingresos = Integer.parseInt(request.getParameter("ingresos"));
        String rangoingresos = verificaVariable(request.getParameter("rangoIngresos"));
        String justificacion = request.getParameter("justificaDeli");
        String comentarios = request.getParameter("Comentavic");
        String[] chkDeliCom = request.getParameterValues("deliCometido");
        String[] procesadoRela = request.getParameterValues("proRela");
        int vmedidas = Integer.parseInt(request.getParameter("mProtect"));
        String[] chkvmedida = request.getParameterValues("aplicaMedida");
        int vmedidaMujer = Integer.parseInt(request.getParameter("mujProtect"));
        String[] chkvmedidaMujer = request.getParameterValues("aplicaMedidaMuj");
        String[] chkIngresos = request.getParameterValues("chkIngresos");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "UPDATE DATOS_VICTIMAS_ADOJC SET TIPO_VICTIMA = " + tipoVictima + ",TIPO_VICTIMA_MORAL = " + victima_moral + ","
                        + "CONTO_ASESOR = " + conto_asesor + ",ASESOR = " + asesor + ",SEXO = " + sexoV + ",FECHA_NACIMIENTO = '" + fecha_nacimiento + "',"
                        + "EDAD = " + edad + ",VULNERABILIDAD = " + vulnerabilidad + ",NACIMIENTO_PAIS = " + paisNacimiento + ","
                        + "NACIMIENTO_ENTIDAD = " + entidadNacimiento + ",NACIMIENTO_MUNICIPIO = " + muniNacimiento + ",NACIONALIDAD = " + nacionalidad + ","
                        + "RESIDENCIA_PAIS = " + paisResi + ",RESIDENCIA_ENTIDAD = " + entidadResi + ",RESIDENCIA_MUNICIPIO = " + municipioResi + ","
                        + "ESTADO_CIVIL = " + conyugal + ",CONDICION_ALFABETISMO = " + alfabetismo + ",GRADO_ESTUDIOS = " + estudios + ","
                        + "HABLA_ESPANOL = " + espanol + ",HABLA_INDIGENA = " + indigena + ",LENGUA_INDIGENA = " + familia + ","
                        + "LENGUA_EXTRANJERA = " + extrangera + ",INTERPRETE = " + interprete + ",INGRESOS = " + ingresos + ","
                        + "RANGO_INGRESOS = " + rangoingresos + ",OCUPACION = " + ocupacion + ",MEDIDAS_MUJER = " + vmedidaMujer + ","
                        + "MEDIDAS_PROTECCION = " + vmedidas + ",JUSTIFICA_DELITOS='"+ justificacion+ "', COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    for (String chkDeliCom1 : chkDeliCom) {
                        String vDel[] = chkDeliCom1.split("@@@");//separa procesado y delito para poder insertarse
                        sql = "INSERT INTO DATOS_VDELITOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                + causaClave + "','" + vDel[0] + "','" + victiClave + jConcatenado + "','" + vDel[1] + "',(select YEAR(NOW())))";
                        insertaVDeli = conn.escribir(sql);
                        System.out.println(sql);
                    }
                    if(insertaVDeli) {
                        for (int j = 0; j < procesadoRela.length; j++) {
                            String[] chkRela = request.getParameterValues("chkRelaProce" + j);
                            for (String chkRela1 : chkRela) {
                                sql = "INSERT INTO DATOS_VPROCESADOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                        + causaClave + "','" + victiClave + jConcatenado + "','" + procesadoRela[j] + "'," + chkRela1 + ", "
                                        + "(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertaVProce = conn.escribir(sql);
                            }
                        }
                        if (insertaVProce) {
                            if (vmedidas == 1) {
                                for (String chkvmedida1 : chkvmedida) {
                                    sql = "INSERT INTO DATOS_VMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero
                                            + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkvmedida1
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavmedida = conn.escribir(sql);
                                }
                            }
                            if (vmedidaMujer == 1) {
                                for (String chkvmedidaMujer1 : chkvmedidaMujer) {
                                    sql = "INSERT INTO DATOS_VMEDIDAS_DMUJ_ADOJC VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkvmedidaMujer1
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavmedidaMuj = conn.escribir(sql);
                                }
                            }
                            if (ingresos == 1) {
                                for (String chkIngreso : chkIngresos) {
                                    sql = "INSERT INTO DATOS_VFUENTE_INGRESOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkIngreso
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavingresos = conn.escribir(sql);
                                }
                            }
                            if (insertavmedida || insertavmedidaMuj || insertavingresos) {
                                conn.close();
                            }
                        }
                        conn.close();
                    }
                    showVictimas vic = new showVictimas();
                    ArrayList<String[]> lis;
                    showCausasPenales causa = new showCausasPenales();
                    int totVictiInsrt = vic.countVictimas(causaClave);
                    int totVicti = causa.countTotalVictimas(causaClave);
                    if(totVicti == totVictiInsrt){
                        usuario usuario = new usuario();
                        usuario.insrtAvance(causaClave, 5);//Actualizamos el avance de la causa penal
                    }
                    lis = vic.findVictimasTabla(victiClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(totVictiInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_VICTIMAS_ADOJC SET TIPO_VICTIMA = " + tipoVictima + ",TIPO_VICTIMA_MORAL = " + victima_moral + ","
                        + "CONTO_ASESOR = " + conto_asesor + ",ASESOR = " + asesor + ",SEXO = " + sexoV + ",FECHA_NACIMIENTO = '" + fecha_nacimiento + "',"
                        + "EDAD = " + edad + ",VULNERABILIDAD = " + vulnerabilidad + ",NACIMIENTO_PAIS = " + paisNacimiento + ","
                        + "NACIMIENTO_ENTIDAD = " + entidadNacimiento + ",NACIMIENTO_MUNICIPIO = " + muniNacimiento + ",NACIONALIDAD = " + nacionalidad + ","
                        + "RESIDENCIA_PAIS = " + paisResi + ",RESIDENCIA_ENTIDAD = " + entidadResi + ",RESIDENCIA_MUNICIPIO = " + municipioResi + ","
                        + "ESTADO_CIVIL = " + conyugal + ",CONDICION_ALFABETISMO = " + alfabetismo + ",GRADO_ESTUDIOS = " + estudios + ","
                        + "HABLA_ESPANOL = " + espanol + ",HABLA_INDIGENA = " + indigena + ",LENGUA_INDIGENA = " + familia + ","
                        + "LENGUA_EXTRANJERA = " + extrangera + ",INTERPRETE = " + interprete + ",INGRESOS = " + ingresos + ","
                        + "RANGO_INGRESOS = " + rangoingresos + ",OCUPACION = " + ocupacion + ",MEDIDAS_MUJER = " + vmedidaMujer + ","
                        + "MEDIDAS_PROTECCION = " + vmedidas + ",JUSTIFICA_DELITOS='"+ justificacion+ "', COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                        + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Se borra todo de vdelitos de la victima por si sufre alguna actualizacion o bien se modifica
                    sql = "DELETE FROM DATOS_VDELITOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                            + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                    conn.escribir(sql);
                    for (String chkDeliCom1 : chkDeliCom) {           
                        String vDel[] = chkDeliCom1.split("@@@");//separa procesado y delito para poder insertarse
                        sql = "INSERT INTO DATOS_VDELITOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                + causaClave + "','" + vDel[0] + "','" + victiClave + jConcatenado + "','" + vDel[1] + "',(select YEAR(NOW())))";
                        insertaVDeli = conn.escribir(sql);
                        System.out.println(sql);
                    }
                    if (insertaVDeli) {
                        //Se borra vprocesados por si algun dato cambia o bien el disparador cambia
                        sql = "DELETE FROM DATOS_VPROCESADOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                                + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                        conn.escribir(sql);
                        for (int j = 0; j < procesadoRela.length; j++) {
                            String[] chkRela = request.getParameterValues("chkRelaProce" + j);
                            for (String chkRela1 : chkRela) {
                                sql = "INSERT INTO DATOS_VPROCESADOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                        + causaClave + "','" + victiClave + jConcatenado + "','" + procesadoRela[j] + "'," + chkRela1 + ", "
                                        + "(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertaVProce = conn.escribir(sql);
                            }
                        }
                        if (insertaVProce) {
                            //Se borra vmedidas por si algun dato cambia o bien el disparador cambia
                            sql = "DELETE FROM DATOS_VMEDIDAS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                                    + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                            conn.escribir(sql);
                            if (vmedidas == 1) {
                                for (String chkvmedida1 : chkvmedida) {
                                    sql = "INSERT INTO DATOS_VMEDIDAS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero
                                            + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkvmedida1
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavmedida = conn.escribir(sql);
                                }
                            }
                            
                            //Se borra vmedidas de mujeres por si algun dato cambia o bien el disparador cambia
                            sql = "DELETE FROM DATOS_VMEDIDAS_DMUJ_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                                    + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                            conn.escribir(sql);
                            if (vmedidaMujer == 1) {
                                for (String chkvmedidaMujer1 : chkvmedidaMujer) {
                                    sql = "INSERT INTO DATOS_VMEDIDAS_DMUJ_ADOJC VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkvmedidaMujer1
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavmedidaMuj = conn.escribir(sql);
                                }
                            }
                            
                            //Se borra fuentes ingresos de victimas por si algun dato cambia o bien el disparador cambia
                            sql = "DELETE FROM DATOS_VFUENTE_INGRESOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                                    + "AND VICTIMA_CLAVE = '" + victiClave + jConcatenado + "';";
                            conn.escribir(sql);
                            if (ingresos == 1) {
                                for (String chkIngreso : chkIngresos) {
                                    sql = "INSERT INTO DATOS_VFUENTE_INGRESOS_ADOJC VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClave + "','" + victiClave + jConcatenado + "'," + chkIngreso
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavingresos = conn.escribir(sql);
                                }
                            }
                            if (insertavmedida || insertavmedidaMuj || insertavingresos) {
                                conn.close();
                            }
                        }
                        conn.close();
                    }
                    showVictimas vic = new showVictimas();
                    ArrayList<String[]> lis;
                    int totVictiInsrt = vic.countVictimas(causaClave);
                    lis = vic.findVictimasTabla(victiClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(totVictiInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtVictimas.class.getName()).log(Level.SEVERE, null, ex);
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
