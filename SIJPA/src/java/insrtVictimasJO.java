/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenalesJO;
import clasesAuxiliar.showVictimasJO;
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
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/insrtVictimasJO"})
public class insrtVictimasJO extends HttpServlet {

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
        String causaClaveJC = (String) sesion.getAttribute("causaClave");
        String victiClaveJC = request.getParameter("victiClaveJC");
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        String victiClaveJO = request.getParameter("victiClaveJO");
        System.out.println("causaJC "+ causaClaveJC);
        System.out.println("vicitmaJC "+ victiClaveJC);
        System.out.println("causaJO "+ causaClaveJO);
        System.out.println("vicitmaJC "+ victiClaveJO);
        String tipoVictima = request.getParameter("tipoVictima");
        String victima_moral = request.getParameter("tvic_moral");
        String conto_asesor = request.getParameter("con_asesor");
        String asesor = request.getParameter("asesor");
        String sexoV = request.getParameter("sexoV");
        String fecha_nacimiento = request.getParameter("fnacimientoV");
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
        String espanol = request.getParameter("hablaesp");
        String indigena = request.getParameter("indigena");
        String familia = request.getParameter("familia");
        String extrangera = request.getParameter("extrangera");
        String interprete = request.getParameter("interprete");
        int ingresos = Integer.parseInt(request.getParameter("ingresos"));
        String rangoingresos = request.getParameter("rangoIngresos");
        String ocupacion = request.getParameter("ocupa");
        String comentarios = request.getParameter("Comentavic");
        
        String[] chkDeliCom = request.getParameterValues("deliCometido");
        String[] procesadoRela = request.getParameterValues("proRela");
        String[] chkIngresos = request.getParameterValues("chkIngresos");

        try {
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            conn.Conectar();
            
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_VICTIMAS_ADOJO VALUES ("+ jEntidad + "," + jMunicipio + "," + jNumero + ",'"+ causaClaveJC +"','"+ victiClaveJC + jConcatenado+"','"
                    + causaClaveJO +"','"+ victiClaveJO + jConcatenado+"',"+ tipoVictima + "," + victima_moral + ","+ conto_asesor + "," + asesor + "," + sexoV + ",'" + fecha_nacimiento + "',"
                    + edad + "," + vulnerabilidad + "," + paisNacimiento + "," + entidadNacimiento + "," + muniNacimiento + "," + nacionalidad + ","
                    + paisResi + "," + entidadResi + "," + municipioResi + ","+ conyugal + "," + alfabetismo + "," + estudios + ","
                    + espanol + "," + indigena + "," + familia + ","+ extrangera + "," + interprete + "," + ingresos + ","+ rangoingresos + ","
                    + ocupacion + ",'" + comentarios + "', (select YEAR(NOW())))";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    for (String chkDeliCom1 : chkDeliCom) {
                        sql = "INSERT INTO DATOS_VDELITOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                + causaClaveJO + "','" + victiClaveJO + jConcatenado + "','" + chkDeliCom1 + "',(select YEAR(NOW())))";
                        insertaVDeli = conn.escribir(sql);
                        System.out.println(sql);
                    }
                    if (insertaVDeli) {
                        for (int j = 0; j < procesadoRela.length; j++) {
                            String[] chkRela = request.getParameterValues("chkRelaProce" + j);
                            for (String chkRela1 : chkRela) {
                                sql = "INSERT INTO DATOS_VPROCESADOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                        + causaClaveJO + "','" + victiClaveJO + jConcatenado + "','" + procesadoRela[j] + "'," + chkRela1 + ", "
                                        + "(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertaVProce = conn.escribir(sql);
                            }
                        }
                        if (insertaVProce) {
                            if (ingresos == 1) {
                                for (String chkIngreso : chkIngresos) {
                                    sql = "INSERT INTO DATOS_VFUENTE_INGRESOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClaveJO + "','" + victiClaveJO + jConcatenado + "'," + chkIngreso
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavingresos = conn.escribir(sql);
                                }
                            }
                            if (insertavingresos) {
                                conn.close();
                            }
                        }
                        conn.close();
                    }
                    showVictimasJO vic = new showVictimasJO();
                    ArrayList<String[]> lis = new ArrayList<>();
                    showCausasPenalesJO causa = new showCausasPenalesJO();
                    int totVictiInsrt = vic.countVictimasJO(causaClaveJO);
//                    int totVicti = causa.countTotalVictimasJO(causaClaveJO);
//                    if(totVicti == totVictiInsrt){
//                        usuario usuario = new usuario();
//                        usuario.insrtAvance(causaClaveJO, 5);//Actualizamos el avance de la causa penal
//                    }
                    lis = vic.findVictimasTablaJO(victiClaveJO + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[0].replace(jConcatenado, ""));
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
                sql = "UPDATE DATOS_VICTIMAS_ADOJO SET TIPO_VICTIMA = " + tipoVictima + ",TIPO_VICTIMA_MORAL = " + victima_moral + ","
                        + "CONTO_ASESOR = " + conto_asesor + ",ASESOR = " + asesor + ",SEXO = " + sexoV + ",FECHA_NACIMIENTO = '" + fecha_nacimiento + "',"
                        + "EDAD = " + edad + ",VULNERABILIDAD = " + vulnerabilidad + ",NACIMIENTO_PAIS = " + paisNacimiento + ","
                        + "NACIMIENTO_ENTIDAD = " + entidadNacimiento + ",NACIMIENTO_MUNICIPIO = " + muniNacimiento + ",NACIONALIDAD = " + nacionalidad + ","
                        + "RESIDENCIA_PAIS = " + paisResi + ",RESIDENCIA_ENTIDAD = " + entidadResi + ",RESIDENCIA_MUNICIPIO = " + municipioResi + ","
                        + "ESTADO_CIVIL = " + conyugal + ",CONDICION_ALFABETISMO = " + alfabetismo + ",GRADO_ESTUDIOS = " + estudios + ","
                        + "HABLA_ESPANOL = " + espanol + ",HABLA_INDIGENA = " + indigena + ",LENGUA_INDIGENA = " + familia + ","
                        + "LENGUA_EXTRANJERA = " + extrangera + ",INTERPRETE = " + interprete + ",INGRESOS = " + ingresos + ","
                        + "RANGO_INGRESOS = " + rangoingresos + ",OCUPACION = " + ocupacion + ",COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                        + "AND VICTIMA_CLAVEJO = '" + victiClaveJO + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Se borra todo de vdelitos de la victima por si sufre alguna actualizacion o bien se modifica
                    sql = "DELETE FROM DATOS_VDELITOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND VICTIMA_CLAVE = '" + victiClaveJO + jConcatenado + "';";
                    conn.escribir(sql);
                    for (String chkDeliCom1 : chkDeliCom) {
                        sql = "INSERT INTO DATOS_VDELITOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                + causaClaveJO + "','" + victiClaveJO + jConcatenado + "','" + chkDeliCom1 + "',(select YEAR(NOW())))";
                        insertaVDeli = conn.escribir(sql);
                        System.out.println(sql);
                    }
                    if (insertaVDeli) {
                        //Se borra vprocesados por si algun dato cambia o bien el disparador cambia
                        sql = "DELETE FROM DATOS_VPROCESADOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                                + "AND VICTIMA_CLAVE = '" + victiClaveJO + jConcatenado + "';";
                        conn.escribir(sql);
                        for (int j = 0; j < procesadoRela.length; j++) {
                            String[] chkRela = request.getParameterValues("chkRelaProce" + j);
                            for (String chkRela1 : chkRela) {
                                sql = "INSERT INTO DATOS_VPROCESADOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                        + causaClaveJO + "','" + victiClaveJO + jConcatenado + "','" + procesadoRela[j] + "'," + chkRela1 + ", "
                                        + "(select YEAR(NOW())))";
                                System.out.println(sql);
                                insertaVProce = conn.escribir(sql);
                            }
                        }
                        if (insertaVProce) {
                            //Se borra fuentes ingresos de victimas por si algun dato cambia o bien el disparador cambia
                            sql = "DELETE FROM DATOS_VFUENTE_INGRESOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                                    + "AND VICTIMA_CLAVE = '" + victiClaveJO + jConcatenado + "';";
                            conn.escribir(sql);
                            if (ingresos == 1) {
                                for (String chkIngreso : chkIngresos) {
                                    sql = "INSERT INTO DATOS_VFUENTE_INGRESOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + ","
                                            + jNumero + ",'" + causaClaveJO + "','" + victiClaveJO + jConcatenado + "'," + chkIngreso
                                            + ",(select YEAR(NOW())))";
                                    System.out.println(sql);
                                    insertavingresos = conn.escribir(sql);
                                }
                            }
                            if (insertavingresos) {
                                conn.close();
                            }
                        }
                        conn.close();
                    }
                    showVictimasJO vic = new showVictimasJO();
                    ArrayList<String[]> lis = new ArrayList<>();
                    int totVictiInsrt = vic.countVictimasJO(causaClaveJO);
                    lis = vic.findVictimasTablaJO(victiClaveJO + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[0].replace(jConcatenado, ""));
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
