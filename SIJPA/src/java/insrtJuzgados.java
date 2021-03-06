/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/insrtJuzgados"})
public class insrtJuzgados extends HttpServlet {

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
    String sql,sql2;
    ResultSet rs;
    String juzgadoClave;
    boolean resul;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        
        String opera = request.getParameter("opera");//Control para saber si se inserta o se actualiza
        String usuActivo = request.getParameter("usuActivo");//Control para relacionar el juzgado reien insertado con el usuario
        String jClaveR = request.getParameter("jClaveR");//Recibimos juzgado clave para el Update
        //Datos Organo Jurisdiccional
        String nomOrgano = request.getParameter("nomOrgano").toUpperCase();
        String numOrgano = request.getParameter("numOrgano");
        String jurisdiccion = request.getParameter("jurisdiccion");
        String funcionJuz = verificaVariable(request.getParameter("funcionJuz"));
        String ladaTel = verificaVariable(request.getParameter("telJuz"));
        String correo = request.getParameter("correo");
        //Ubicacion de Organizacion del organo
        String entidadJ = request.getParameter("entidadJ");
        String municipioJ = request.getParameter("municipioJ");
        String fDivision = request.getParameter("fDivision");
        String regJudicial = request.getParameter("regJudicial").toUpperCase();
        String distJudicial = request.getParameter("distJudicial").toUpperCase();
        String partJudicial = request.getParameter("partJudicial").toUpperCase();
        //Domicilio
        String vialidad = request.getParameter("vialidad");
        String nomVialidad = request.getParameter("nomVialidad").toUpperCase();
        String asentamiento = request.getParameter("asentamiento");
        String nomAsentamiento = request.getParameter("nomAsentamiento").toUpperCase();
        String noExterior = verificaVariable(request.getParameter("noExterior"));
        String noInterior = verificaVariable(request.getParameter("noInterior"));
        String cp = verificaVariable(request.getParameter("cp"));
        //Datos Captura
        String nombreCap = request.getParameter("nombreCap").toUpperCase();
        String apaternoCap = request.getParameter("apaternoCap").toUpperCase();
        String amaternoCap = request.getParameter("amaternoCap").toUpperCase();
        String cargo = request.getParameter("cargo").toUpperCase();
        String ejercicio = request.getParameter("ejercicio");
        //Informción General Juzgado de Control
        String causasIngresaJC = verificaVariable(request.getParameter("causasIngresaJC"));
        String mediProteccionJC = verificaVariable(request.getParameter("mediProteccionJC"));
        String providenPrecautoJC = verificaVariable(request.getParameter("providenPrecautoJC"));
        String pruebaAntiJC = verificaVariable(request.getParameter("pruebaAntiJC"));
        String ordenesJudiJC = verificaVariable(request.getParameter("ordenesJudiJC"));
        String actosInvestigaJC = verificaVariable(request.getParameter("actosInvestigaJC"));
        String impugnaMpJC = verificaVariable(request.getParameter("impugnaMpJC"));
        String otrosJC = verificaVariable(request.getParameter("otrosJC"));
        String causasTramJC = verificaVariable(request.getParameter("causasTramJC"));
        String causasBajaJC = verificaVariable(request.getParameter("causasBajaJC"));
        //Informción General Juicio Oral
        String causasIngresaJO = verificaVariable(request.getParameter("causasIngresaJO"));
        String excusasJO = verificaVariable(request.getParameter("excusasJO"));
        String recusacionesJO = verificaVariable(request.getParameter("recusacionesJO"));
        String otrosJO = verificaVariable(request.getParameter("otrosJO"));
        String causasTramJO = verificaVariable(request.getParameter("causasTramJO"));
        String causasBajaJO = verificaVariable(request.getParameter("causasBajaJO"));
        
        juzgadoClave = entidadJ + "-" + municipioJ + "-" + numOrgano;
        System.out.println("La entidad es: "+juzgadoClave);
          
        try {
            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_JUZGADOS_ADOJC VALUES('" + juzgadoClave + "','" + nomOrgano + "'," + numOrgano + "," + jurisdiccion + ","
                        + funcionJuz + ",'" + ladaTel + "','" + correo + "'," + entidadJ + "," + municipioJ + "," + fDivision + ",'" + regJudicial + "','"
                        + distJudicial + "','" + partJudicial + "'," + vialidad + ",'" + nomVialidad + "'," + asentamiento + ",'" + nomAsentamiento + "','"
                        + noExterior + "','" + noInterior + "'," + cp + ",'" + nombreCap + "','" + apaternoCap + "','" + amaternoCap + "','" + cargo + "'," 
                        + "1," + ejercicio + ")";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    //Validamos la funcion del organo para saber en donde insertarlo
                    if(funcionJuz.equals("1") || funcionJuz.equals("3")){//Control o Mixto
                        sql = "INSERT INTO DATOS_INFORME_ADOJC VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJC + "," + mediProteccionJC + "," + providenPrecautoJC + "," + pruebaAntiJC + "," + ordenesJudiJC + ","
                                + actosInvestigaJC + "," + impugnaMpJC + "," + otrosJC + "," + causasTramJC + ","+ causasBajaJC + ",(select YEAR(NOW()))"
                                + ")";
                        System.out.println(sql);
                        resul = conn.escribir(sql);
                    }
                    if(funcionJuz.equals("2") || funcionJuz.equals("3")){//Enjuiciamiento o Mixto
                        sql = "INSERT INTO DATOS_INFORME_ADOJO VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJO + "," + excusasJO + "," + recusacionesJO + "," + otrosJO + "," + causasTramJO + ","+ causasBajaJO + ",(select YEAR(NOW()))"
                                + ")";
                        System.out.println(sql);
                        resul = conn.escribir(sql);
                    }
                    if(resul){
                        //insertamos el juzgado al usuario que lo capturo para su relacion
                        sql = "INSERT INTO USUARIOS_JUZGADOS VALUES('" + usuActivo + "','" + juzgadoClave + "')";
                        System.out.println(sql);
                        conn.escribir(sql);
                        
                        //inserta un juez no aplica de acuerdo a el juzgado necesario para que funcionen los no identificados
                        sql = "INSERT INTO DATOS_JUECES_ADOJC VALUES (" + entidadJ + "," + municipioJ + ","
                                + numOrgano + ",'" + juzgadoClave + "', -2, '-2', '-2', '-2', '1899-09-09', -2, -2, -2, -2, 1, (select YEAR(NOW())))";
                        System.out.println(sql);
                        if(conn.escribir(sql)){
                            System.out.println("Juez No aplica insertado!");
                            conn.close();
                            sesion.setAttribute("juzgadoClave", juzgadoClave);
                            sesion.setMaxInactiveInterval(-1);
                            //Si se inserta correctamente lo mandamos a capturar el primer juez por que no tiene
                            response.sendRedirect("capturaJuez.jsp?insert=100");
                        }else{
                            conn.close();
                            response.sendRedirect("juzgados.jsp?insert=200");
                        }
                    }else{
                        conn.close();
                        response.sendRedirect("juzgados.jsp?insert=200");
                    }
                }else{
                    conn.close();
                    response.sendRedirect("juzgados.jsp?insert=200");
                } 
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_JUZGADOS_ADOJC SET JUZGADO_NOMBRE = '" + nomOrgano + "',JUZGADO_JURISDICCION = " + jurisdiccion + ","
                        + "JUZGADO_FUNCION = " + funcionJuz + ",LADATEL = '" + ladaTel + "',CORREO = '" + correo + "',FORMA_DIVISION = " + fDivision + ","
                        + "REGION_JUDICIAL = '" + regJudicial + "',DISTRITO_JUDICIAL = '" + distJudicial + "',"
                        + "PARTIDO_JUDICIAL = '" + partJudicial + "',TIPO_VIALIDAD = " + vialidad + ",NOMBRE_VIALIDAD = '" + nomVialidad + "',"
                        + "ASENTAMIENTO_HUMANO = " + asentamiento + ",NOMBRE_ASENTAMIENTO = '" + nomAsentamiento + "',NUMERO_EXT = '" + noExterior + "',"
                        + "NUMERO_INT = '" + noInterior + "',CODIGO_POSTAL = " + cp + ",NOMBRE_CAP = '" + nombreCap + "',"
                        + "APELLIDOP_CAP = '" + apaternoCap + "',APELLIDOM_CAP = '" + amaternoCap + "',CARGO_CAP = '" + cargo + "' "
                        + "WHERE JUZGADO_CLAVE = '" + jClaveR + "'; ";
                System.out.println(sql);
                if(conn.escribir(sql)){
                    //Validamos la funcion del organo para saber en donde actualizarlo
                    if(funcionJuz.equals("1")){//Control
                        sql2 = "DELETE FROM DATOS_INFORME_ADOJO WHERE JUZGADO_CLAVE='"+jClaveR+"'";
                        sql = "REPLACE INTO DATOS_INFORME_ADOJC VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJC + "," + mediProteccionJC + "," + providenPrecautoJC + "," + pruebaAntiJC + "," + ordenesJudiJC + ","
                                + actosInvestigaJC + "," + impugnaMpJC + "," + otrosJC + "," + causasTramJC + ","+ causasBajaJC + ",(select YEAR(NOW()))"
                                + ")";
                        System.out.println(sql);
                    }
                    if(funcionJuz.equals("2")){//Enjuiciamiento
                        sql2 = "DELETE FROM DATOS_INFORME_ADOJC WHERE JUZGADO_CLAVE='"+jClaveR+"'";
                        sql =  "REPLACE INTO DATOS_INFORME_ADOJO VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJO + "," + excusasJO + "," + recusacionesJO + "," + otrosJO + "," + causasTramJO + ","+ causasBajaJO + ",(select YEAR(NOW()))"
                                + ")";
                        System.out.println(sql);
                    }
                    if(funcionJuz.equals("3")){ //Mixto
                        sql = "REPLACE INTO DATOS_INFORME_ADOJC VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJC + "," + mediProteccionJC + "," + providenPrecautoJC + "," + pruebaAntiJC + "," + ordenesJudiJC + ","
                                + actosInvestigaJC + "," + impugnaMpJC + "," + otrosJC + "," + causasTramJC + ","+ causasBajaJC + ",(select YEAR(NOW()))"
                                + ")";
                        sql2 = "REPLACE INTO DATOS_INFORME_ADOJO VALUES(" + entidadJ + "," + municipioJ + "," + numOrgano + ",'" + juzgadoClave + "',"
                                + causasIngresaJO + "," + excusasJO + "," + recusacionesJO + "," + otrosJO + "," + causasTramJO + ","+ causasBajaJO + ",(select YEAR(NOW()))"
                                + ")";
                    }
                    if(conn.escribir(sql) && conn.escribir(sql2)){
                        conn.close();
                        response.sendRedirect("juzgados.jsp?insert=101");
                    }else{
                        conn.close();
                        response.sendRedirect("juzgados.jsp?insert=201");
                    }
                }else{
                    conn.close();
                    response.sendRedirect("juzgados.jsp?insert=201");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtJuzgados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String verificaVariable(String variable){
        String verificada;
        if(variable == null){
            verificada = "0";
        }else if(variable.equals("")){
            verificada = "0";
        }else{
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
