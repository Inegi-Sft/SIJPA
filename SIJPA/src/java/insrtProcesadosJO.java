/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenalesJO;
import clasesAuxiliar.showProcesadosJO;
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
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/insrtProcesadosJO"})
public class insrtProcesadosJO extends HttpServlet {

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
    boolean insertPD;
    
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
        String causaClaveJC = (String) sesion.getAttribute("causaClave");
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        String proceClave = request.getParameter("proceClave");
        
        String nombre = request.getParameter("nombre").toUpperCase();
        String apaterno = request.getParameter("apaterno").toUpperCase();
        String amaterno = request.getParameter("amaterno").toUpperCase();
        String alias = request.getParameter("alias").toUpperCase();
        String curp = request.getParameter("curp").toUpperCase();
        String fNacimiento = request.getParameter("fNacimiento");
        String sexo = request.getParameter("sexo");
        String edad = request.getParameter("edad");
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
        String estudios = request.getParameter("estudiosPro");
        String condiEstudiante = request.getParameter("condiEstudiante");
        String hablaEsp = request.getParameter("hablaEsp");
        String poblaIndigena = request.getParameter("poblaIndigena");
        String puebloIndigena = request.getParameter("puebloIndigena");
        String hablaIndigena = request.getParameter("hablaIndigena");
        String lenguaIndigena = request.getParameter("lenguaIndigena");
        String lenExtranjera = request.getParameter("lenExtranjera");
        String traductorPro = request.getParameter("traductorPro");
        int ingresosPro = Integer.parseInt(request.getParameter("ingresosPro"));
        String rangoIngresosPro = request.getParameter("rangoIngresosPro");
        String ocupacion = request.getParameter("ocupacion");
        String condicionActi = request.getParameter("condicionActi");
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
            
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                //Al ser la primera vez que se guarda JO se crea la clave de procesado JO para ser insertada
                String causaClaveJOSimple = causaClaveJO.replace(jConcatenado, "");// causa clave simple sin concatenar
                String proceClaveJO = causaClaveJOSimple + proceClave.substring(proceClave.indexOf("-P"));
                sql = "INSERT INTO DATOS_PROCESADOS_ADOJO VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                        + causaClaveJC + "','" + proceClave + jConcatenado + "','" + causaClaveJO + "','"
                        + proceClaveJO + jConcatenado + "','" + nombre + "','"+ apaterno + "','" + amaterno + "','"
                        + alias + "','" + curp + "','" + fNacimiento + "'," + sexo + "," + edad + "," + nPais + "," + nEntidad + ","
                        + nMunicipio + "," + nacionalidad + "," + residencia + "," + rEntidad + "," + rMunicipio + "," + edoCivil + ","
                        + discapacidad + "," + alfabet + "," + estudios + "," + condiEstudiante + "," + hablaEsp + ","
                        + poblaIndigena + "," + puebloIndigena + "," + hablaIndigena + "," + lenguaIndigena + "," + lenExtranjera + ","
                        + traductorPro + "," + ingresosPro + "," + rangoIngresosPro + "," + ocupacion + "," + condicionActi + ","
                        + participacion + "," + reincidencia + "," + psicofisico + "," + grupoDelictivo + ",'" + delictivo + "',"
                        + defensor + "," + representante + ",'" + comentarios + "', (select YEAR(NOW())));";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    if (ingresosPro == 1) {
                        for (String chkIngresosPro1 : chkIngresosPro) {
                            sql = "INSERT INTO DATOS_PFUENTE_INGRESOS_ADOJO VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','" + proceClaveJO + jConcatenado + "'," + chkIngresosPro1 + ","
                                    + "(select YEAR(NOW())) )";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    for (int i = 0; i < arrayDelito.length; i++) {
                        if (!arrayNumVic[i].equals("0")) {//inserta el procesado que haya tenido un numero de victimas mayor a 0
                            String []arrayDelSepara =  arrayDelito[i].split("-");
                            String delitoJO = causaClaveJO.replace(jConcatenado, "") + "-" + arrayDelSepara[1];
                            sql = "INSERT INTO DATOS_PDELITOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','" + proceClaveJO + jConcatenado + "','" + delitoJO + "',"
                                    + arrayNumVic[i] + ",(select YEAR(NOW())) );";
                            System.out.println(sql);
                            insertPD = conn.escribir(sql);
                        }
                    }
                    if(insertPD){
                        showProcesadosJO pro = new showProcesadosJO();
                        ArrayList<String[]> lis = new ArrayList<>();
                        showCausasPenalesJO causa = new showCausasPenalesJO();
                        int totProceInsrt = pro.countProcesadosJO(causaClaveJO);
                        int totProce = causa.countTotalProcesadosJO(causaClaveJO);
                        if(totProce == totProceInsrt){
                            usuario usuario = new usuario();
                            usuario.insrtAvanceJO(causaClaveJO, causaClaveJO, 4);//Actualizamos el avance de la causa penal JO
                        }
                        lis = pro.findProcesasdosTablaJO(proceClaveJO + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        resp.add(lis.get(0)[4]);
                        resp.add(totProceInsrt);
                        out.write(resp.toJSONString());
                    }
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_PROCESADOS_ADOJO SET NOMBRE = '" + nombre + "',A_PATERNO = '"+ apaterno + "',A_MATERNO ='" + amaterno + "',"
                        + "ALIAS = '" + alias + "',CURP = '" + curp + "',FECHA_NACIMIENTO = '" + fNacimiento + "',SEXO = " + sexo + ","
                        + "EDAD = " + edad + ",NACIMIENTO_PAIS = " + nPais + ",NACIMIENTO_ENTIDAD = " + nEntidad + ",NACIMIENTO_MUNICIPIO = " + nMunicipio + ","
                        + "NACIONALIDAD = " + nacionalidad + ",RESIDENCIA_PAIS = " + residencia + ",RESIDENCIA_ENTIDAD = " + rEntidad + ","
                        + "RESIDENCIA_MUNICIPIO = " + rMunicipio + ",ESTADO_CIVIL = " + edoCivil + ",DISCAPACIDAD = " + discapacidad + ","
                        + "CONDICION_ALFABETISMO = " + alfabet + ",ULTIMO_GRADO_ESTUDIOS = " + estudios + ",CONDICION_ESTUDIANTE = " + condiEstudiante + ","
                        + "HABLA_ESPANOL = " + hablaEsp + ",POBLACION_INDIGENA = " + poblaIndigena + ",TIPO_PUEBLO_INDIGENA = " + puebloIndigena + ","
                        + "HABLA_INDIGENA = " + hablaIndigena + ",FAMILIA_LINGUISTICA = " + lenguaIndigena + ",LENGUA_EXTRANJERA = " + lenExtranjera + ","
                        + "INTERPRETE = " + traductorPro + ",INGRESOS = " + ingresosPro + ",RANGO_INGRESOS = " + rangoIngresosPro + ","
                        + "OCUPACION = " + ocupacion + ",CONDICION_ACTIVIDAD = " + condicionActi + "," + "GRADO_PARTICIPACION = " + participacion + ","
                        + "REINCIDENCIA = " + reincidencia + ",ESTADO_PSICOFISICO = " + psicofisico + ",DELICTIVO = " + grupoDelictivo + ","
                        + "GRUPO_DELICTIVO = '" + delictivo + "',TIPO_DEFENSOR = " + defensor + ",PERSONA_RESPONSABLE = " + representante + ","
                        + "COMENTARIOS = '" + comentarios + "' "
                        + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                        + "AND PROCESADO_CLAVEJO = '" + proceClave + jConcatenado + "';";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    //Borramos los Pingresos por si sufren de acutliazcion o bien se cambie que no tuve ingresos
                    sql = "DELETE FROM DATOS_PFUENTE_INGRESOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                    conn.escribir(sql);
                    //Borramos pdelitos por si sufre actualizacion se inserten los nuevos o bien cambie de opcion
                    sql = "DELETE FROM DATOS_PDELITOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                            + "AND PROCESADO_CLAVE = '" + proceClave + jConcatenado + "';";
                    conn.escribir(sql);
                    if (ingresosPro == 1) {
                        for (String chkIngresosPro1 : chkIngresosPro) {
                            sql = "INSERT INTO DATOS_PFUENTE_INGRESOS_ADOJO VALUES(" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','" + proceClave + jConcatenado + "'," + chkIngresosPro1 + ","
                                    + "(select YEAR(NOW())) )";
                            System.out.println(sql);
                            conn.escribir(sql);
                        }
                    }
                    for (int i = 0; i < arrayDelito.length; i++) {
                        if (!arrayNumVic[i].equals("0")) {//inserta el procesado que haya tenido un numero de victimas mayor a 0
                            sql = "INSERT INTO DATOS_PDELITOS_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                                    + causaClaveJO + "','" + proceClave + jConcatenado + "','" + arrayDelito[i] + "',"
                                    + arrayNumVic[i] + ",(select YEAR(NOW())) )";
                            System.out.println(sql);
                            insertPD = conn.escribir(sql);
                        }
                    }
                    if(insertPD){
                        showProcesadosJO pro = new showProcesadosJO();
                        ArrayList<String[]> lis = new ArrayList<>();
                        int totProceInsrt = pro.countProcesadosJO(causaClaveJO);
                        lis = pro.findProcesasdosTablaJO(proceClave + jConcatenado);
                        JSONArray resp = new JSONArray();
                        resp.add(posicion);
                        resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                        resp.add(lis.get(0)[1]);
                        resp.add(lis.get(0)[2]);
                        resp.add(lis.get(0)[3]);
                        resp.add(lis.get(0)[4]);
                        resp.add(totProceInsrt);
                        out.write(resp.toJSONString());
                    }
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtProcesados.class.getName()).log(Level.SEVERE, null, ex);
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
