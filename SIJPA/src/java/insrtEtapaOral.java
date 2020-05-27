/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.showCausasPenalesJO;
import clasesAuxiliar.showJuicio;
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
@WebServlet(urlPatterns = {"/insrtEtapaOral"})
public class insrtEtapaOral extends HttpServlet {

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
    int banderaEtapa = 0;
    String banderaDesc = "";
    
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
        String causaClaveJO = (String) sesion.getAttribute("causaClaveJO");
        String proceClave = request.getParameter("proceClave");
        String autoApertura = request.getParameter("autoApertura");
        String celebracionA = request.getParameter("celebracionA");
        String medidasDis = request.getParameter("medidasDis");
        String tipoMedida = request.getParameter("tipoMedida");
        String incidentes = request.getParameter("incidentes");
        String resoIncidente = request.getParameter("resoIncidente");
        String promueveIncidente = request.getParameter("promueveIncidente");
        String testimonial = request.getParameter("testimonial");
        String pericial = request.getParameter("pericial");
        String declaracion = request.getParameter("declaracion");
        String documental = request.getParameter("documental");
        String otro = request.getParameter("otro");
        String suspencionA = request.getParameter("suspencionA");
        String fechaSuspencion = request.getParameter("fechaSuspencion");
        String fechaReanudacion = request.getParameter("fechaReanudacion");
        int deliberacion = Integer.parseInt(request.getParameter("deliberacion"));
        String fechaDeliberacion = request.getParameter("fechaDeliberacion");
        String sentidoFallo = request.getParameter("sentidoFallo");
        String comentarios = request.getParameter("comentarios");
        
        try{
            response.setContentType("text/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            //Control para saber la etapa donde sera enviado
            if (deliberacion == 2) {
                banderaEtapa = 3;//pasa a Tramite JO
                banderaDesc = "Tramite";
            } else{
                banderaEtapa = 2;//pasa a Conclusiones JO
                banderaDesc = "Conclusiones";
            }
            
            conn.Conectar();
            if(!opera.equals("actualizar")){//Se inserta el dato ya que es nuevo
                sql = "INSERT INTO DATOS_ETAPA_ORAL_ADOJO VALUES (" + jEntidad + "," + jMunicipio + "," + jNumero + ",'"
                        + causaClaveJO + "','" + proceClave + jConcatenado + "','" + autoApertura + "','" + celebracionA + "',"
                        + medidasDis + ","+ tipoMedida + "," + incidentes + ",'" + resoIncidente + "'," + promueveIncidente + ","
                        + testimonial + "," + pericial + "," + declaracion + "," + documental + "," + otro + "," + suspencionA +",'"
                        + fechaSuspencion + "','" + fechaReanudacion + "'," + deliberacion + ",'" + fechaDeliberacion + "',"
                        + sentidoFallo + ",'" + comentarios + "', (select YEAR(NOW()))" + banderaEtapa + " )";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    showJuicio sEO = new showJuicio();
                    ArrayList<String[]> lis = new ArrayList<>();
                    showCausasPenalesJO causa = new showCausasPenalesJO();
                    int totProceInsrt = sEO.countProcesadosOral(causaClaveJO);
                    int totProce = causa.countTotalProcesadosJO(causaClaveJO);
                    if(totProce == totProceInsrt){
                        usuario usuario = new usuario();
                        usuario.insrtAvanceJO(causaClaveJO, causaClaveJO, 6);//Actualizamos el avance de la causa penal JO
                    }
                    lis = sEO.findOralTabla(proceClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(proceClave);//Se usa para agregar el procesado a la etapa correspondiente JO
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(lis.get(0)[5]);
                    resp.add(banderaDesc);//Descripcion de la bandera para la tabla
                    resp.add(banderaEtapa);//dato para saber a que etapa se agrega el procesado
                    resp.add(totProceInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }else{//Se actualiza el dato que viene de recuperacion
                sql = "UPDATE DATOS_ETAPA_ORAL_ADOJO SET FECHA_APERTURA_JUICIOORAL='"+ autoApertura +"', FECHA_AUDIENCIA_JUICIO='"+ celebracionA +"',"
                    + "MEDIDAS_DISCIPLINARIAS="+ medidasDis +", TIPO_DISCIPLINARIA="+ tipoMedida +", INCIDENTES_AUDIENCIA="+ incidentes +","
                    + "FECHA_RESOLUCION_INCIDENTE='"+ resoIncidente +"', PROMUEVE_INCIDENTE="+promueveIncidente +", PD_TESTIMONIAL="+ testimonial +","
                    + "PD_PERICIAL="+ pericial +", PD_DECLARACION_ACUSADO="+ declaracion +", PD_DOCUMENTAL_MATERIAL="+ documental +","
                    + "PD_OTRA_PRUEBA="+ otro +", SUSPENCION_AUDIENCIA="+ suspencionA +", FECHA_SUSPENCION='"+ fechaSuspencion +"',FECHA_REANUDACION='" 
                    + fechaReanudacion +"', DELIBERACION="+ deliberacion +", FECHA_DELIBERACION='"+ fechaDeliberacion +"', SENTIDO_FALLO="+ sentidoFallo
                    + ", COMENTARIOS='"+ comentarios +"'";
                System.out.println(sql);
                if (conn.escribir(sql)) {
                    showJuicio sEO = new showJuicio();
                    ArrayList<String[]> lis = new ArrayList<>();
                    int totProcInsrt = sEO.countProcesadosOral(causaClaveJO);
                    lis = sEO.findOralTabla(proceClave + jConcatenado);
                    JSONArray resp = new JSONArray();
                    resp.add(posicion);
                    resp.add(lis.get(0)[0].replace(jConcatenado, ""));
                    resp.add(lis.get(0)[1]);
                    resp.add(lis.get(0)[2]);
                    resp.add(lis.get(0)[3]);
                    resp.add(lis.get(0)[4]);
                    resp.add(lis.get(0)[5]);
                    resp.add(totProcInsrt);
                    out.write(resp.toJSONString());
                    conn.close();
                } else {
                    conn.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(insrtEtapaOral.class.getName()).log(Level.SEVERE, null, ex);
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
