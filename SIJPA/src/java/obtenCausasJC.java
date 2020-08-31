/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.showCausasPenalesJO;
import clasesAuxiliar.showDelitosJO;
import clasesAuxiliar.showProcesadosJO;
import clasesAuxiliar.showVictimasJO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/obtenCausasJC"})
public class obtenCausasJC extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    showCausasPenalesJO sCausasJC = new showCausasPenalesJO();
    showDelitosJO sDelJC = new showDelitosJO();
    showProcesadosJO sProJC = new showProcesadosJO();
    showVictimasJO sVicJC = new showVictimasJO();
    ArrayList<String[]> lista, lisDel, lisPro, lisVic;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("expClaveJC") != null){
                response.setContentType("text/json;charset=UTF-8");
                String jClaveJC = request.getParameter("jClaveJC");
                String juzSimple = jClaveJC.replace("-", "");
                String expClaveJC = request.getParameter("expClaveJC");
                lista = sCausasJC.findCausaPenalJC(jClaveJC, expClaveJC + juzSimple);
                JSONObject resp = new JSONObject();
                resp.put("fechaJC", lista.get(0)[0]);
                resp.put("totDelJC", lista.get(0)[1]);
                resp.put("totProJC", lista.get(0)[2]);
                resp.put("totVicJC", lista.get(0)[3]);
                
                //Delitos JC
                lisDel = sDelJC.findDeliCausasJCyJO(expClaveJC + juzSimple);
                JSONArray del = new JSONArray();
                for (String[] lisD : lisDel) {
                    del.add("<tr><td>" + lisD[0].replace(juzSimple, "") + "</td><td></td><td></td><td></td><td></td><td></td>"
                            + "<td><a class='pop' href=''><img src='img/editar.png' title='Modificar'/></a></td>"
                            + "</tr>");
                }
                resp.put("del", del);
                
                //Procesados JC y Etapa Oral
                lisPro = sProJC.findProcesasdosCausaJCyJO(expClaveJC + juzSimple);
                JSONArray pro = new JSONArray();
                for (String[] lisP : lisPro) {
                    pro.add("<tr><td>" + lisP[0].replace(juzSimple, "") + "</td><td>" + lisP[1] + "</td><td></td><td></td><td></td>"
                            + "<td><a class='pop' href=''><img src='img/editar.png' title='Modificar'/></a></td>"
                            + "</tr>");
                }
                resp.put("pro", pro);
                
                //Victimas
                lisVic = sVicJC.findVictimasCausaJCyJO(expClaveJC + jClaveJC.replace("-", ""));
                JSONArray vic = new JSONArray();
                for (String[] lisV : lisVic) {
                    vic.add("<tr><td>" + lisV[0].replace(juzSimple, "") + "</td><td></td><td></td><td></td><td></td>"
                            + "<td><a class='pop' href=''><img src='img/editar.png' title='Modificar'/></a></td>"
                            + "</tr>");
                }
                resp.put("vic", vic);
                
                out.write(resp.toJSONString());
            }else 
                if(request.getParameter("jClaveJC") != null){//Vamos por las causas penales del juzgado
                response.setContentType("text/html;charset=UTF-8");
                String jClaveJC = request.getParameter("jClaveJC");
                out.println("<option value=''>--Seleccione--</option>");
                lista = sCausasJC.findCausasPenalesJC(jClaveJC);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0].replace(jClaveJC.replace("-", ""), "") + "'>"
                            + ls[0].replace(jClaveJC.replace("-", ""), "") + "</option>");
                }
            }
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
