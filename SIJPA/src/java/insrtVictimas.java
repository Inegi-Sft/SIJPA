/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showVictimas;
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
    String sqlVictimas, sqlVDelitos, sqlVProce, sqlVmedidas, sqlVmedidasMuj, sqlIngresos;
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
//        String entidad = (String) sesion.getAttribute("entidad");
//        String municipio = (String) sesion.getAttribute("municipio");
//        String numero = (String) sesion.getAttribute("numero");
//        String jConcatenado = entidad + municipio + numero;
//        String causaClave = (String) sesion.getAttribute("causaClave");
        
        String entidad = "12";
String municipio = "12001";
String numero = "1";
        String causaClave = "001/2019";
        String victiClave = "001/2019-V1";
        String jConcatenado = entidad + municipio + numero;

 //       String victiClave = request.getParameter("victiClave");
        String tipo_victima = request.getParameter("tipo_victima");
        String victima_moral = request.getParameter("tvic_moral");
        String conto_asesor = request.getParameter("con_asesor");
        String asesor = request.getParameter("asesor");
        String sexo = request.getParameter("sexo");
        String fecha_nacimiento;
        if (request.getParameter("fnacimiento") != null) {
            fecha_nacimiento = request.getParameter("fnacimiento");
        } else {
            fecha_nacimiento = "1899-09-09";
        }
        int edad = Integer.parseInt(request.getParameter("edad"));
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
        String rangoingresos = request.getParameter("rangoIngresos");
        String comentarios = request.getParameter("Comentavic");
        String[] deli = request.getParameterValues("inpDeli");
        String[] chk = request.getParameterValues("deliCometido");
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
            sqlVictimas = "INSERT INTO DATOS_VICTIMAS_ADOJC  VALUES(" + entidad + "," + municipio + "," + numero + ",'" + causaClave + jConcatenado
                    + "','" + victiClave + jConcatenado + "'," + tipo_victima + "," + victima_moral + "," + conto_asesor + "," + asesor + "," + sexo + ",'" + fecha_nacimiento 
                    + "'," + edad + "," + vulnerabilidad + "," + paisNacimiento + "," + entidadNacimiento + "," + muniNacimiento + "," + nacionalidad + "," + paisResi + ","
                    + entidadResi + "," + municipioResi + "," + conyugal + "," + alfabetismo + "," + estudios + "," + espanol + "," + indigena + "," + familia 
                    + "," + extrangera + "," + interprete + "," + ingresos + "," + rangoingresos + "," + ocupacion + "," + vmedidaMujer + "," + vmedidas + ",'"
                    + comentarios + "',(select YEAR(NOW())))";
            System.out.println(sqlVictimas);
            if (conn.escribir(sqlVictimas)) {
                for (int i = 0; i < chk.length; i++) {
                    sqlVDelitos = "INSERT INTO DATOS_VDELITOS_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'"
                            + causaClave + jConcatenado + "','" + victiClave + jConcatenado + "','"
                            + deli[i] + "','Si'" + ",(select YEAR(NOW())))";
                    insertaVDeli = conn.escribir(sqlVDelitos);
                    System.out.println(sqlVDelitos);
                }
                if (insertaVDeli) {
                    for (int j = 0; j < procesadoRela.length; j++) {
                        String[] chkRela = request.getParameterValues("chkRelaProce" + j);
                        for (int k = 0; k < chkRela.length; k++) {
                            sqlVProce = "INSERT INTO DATOS_VPROCESADOS_ADOJC VALUES (" + entidad + "," + municipio + "," + numero + ",'"
                                    + causaClave + jConcatenado + "','" + procesadoRela[j] + "','" + victiClave + jConcatenado
                                    + "'," + chkRela[k] + ", (select YEAR(NOW())))";
                            System.out.println(sqlVProce);
                            insertaVProce = conn.escribir(sqlVProce);
                        }
                    }
                    if (insertaVProce) {
                        if (vmedidas == 1) {
                            for (int i = 0; i < chkvmedida.length; i++) {
                                sqlVmedidas = "INSERT INTO DATOS_VMEDIDAS_ADOJC VALUES (" + entidad + "," + municipio + "," + numero
                                        + ",'" + causaClave + jConcatenado + "','" + victiClave + jConcatenado + "'," + chkvmedida[i] + ",(select YEAR(NOW())))";
                                System.out.println(sqlVmedidas);
                                insertavmedida = conn.escribir(sqlVmedidas);
                            }
                        }
                        if (vmedidaMujer == 1) {
                            for (int i = 0; i < chkvmedidaMujer.length; i++) {
                                sqlVmedidasMuj = "INSERT INTO DATOS_VMEDIDAS_DMUJ_ADOJC VALUES (" + entidad + "," + municipio + ","
                                        + numero + ",'" + causaClave + jConcatenado + "','" + victiClave + jConcatenado + "'," + chkvmedidaMujer[i] + ",(select YEAR(NOW())))";
                                System.out.println(sqlVmedidasMuj);
                                insertavmedidaMuj = conn.escribir(sqlVmedidasMuj);
                            }
                        }
                        if (ingresos == 1) {
                            for (int i = 0; i < chkIngresos.length; i++) {
                                sqlIngresos = "INSERT INTO DATOS_VFUENTE_INGRESOS_ADOJC VALUES (" + entidad + "," + municipio + ","
                                        + numero + ",'" + causaClave + jConcatenado + "','" + victiClave + jConcatenado + "'," + chkIngresos[i] + ",(select YEAR(NOW())))";
                                System.out.println(sqlIngresos);
                                insertavingresos = conn.escribir(sqlIngresos);
                            }
                        }
                        if (insertavmedida || insertavmedidaMuj || insertavingresos) {
                            conn.close();
                        }
                    }
                    //insertavmedida
                    //insertavmedidaMuj
                    //insertavingresos
                    showVictimas vic = new showVictimas();
                    ArrayList<String[]> lis = new ArrayList<String[]>();
                    lis = vic.findVictimasTabla(victiClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[0]);
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(vic.countVictimas(causaClave + jConcatenado));
                    out.write(resp.toJSONString());
                    conn.close();
                }
                conn.close();
            } else {
                //regresa a insrttramite y maca error
                conn.close();
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
