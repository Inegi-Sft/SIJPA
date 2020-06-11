<%-- 
    Document   : botonesPrinci.jsp
    Created on : 29/01/2020, 02:54:53 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJuicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.usuario"%>
<%
    if(request.getParameter("causaClaveJO") != null){
        String juzgadoClave = (String)session.getAttribute("juzgadoClave");
        ArrayList <String> etapas = new ArrayList();
        showJuicio sEtapaOral = new showJuicio();
        usuario usu = new usuario();
        int avance = usu.findAvanceUsuarioJO(request.getParameter("causaClaveJO") + juzgadoClave.replace("-", ""));
        etapas = sEtapaOral.findEtapaCausaJO(request.getParameter("causaClaveJO") + juzgadoClave.replace("-", ""));
        String [] pestanas = {"Causa Penal","Delitos","Adolescentes","Victimas","Juicio Oral",
            "Conclusión y/o Terminación","Tramite"};
        
        out.println("<button class='pestanaLinks active' onclick=\"openPestana('btn1', 'p1')\" id='btn1'>" + pestanas[0] + "</button>");
        
        for(int x = 2; x <= 5; x++){
            if(x <= avance){
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn" + x + "', 'p" + x + "')\" id='btn" + x + "'>" + pestanas[x-1] + "</button>");
            }else{
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn" + x + "', 'p" + x + "')\" id='btn" + x + "' disabled>" + pestanas[x-1] + "</button>");
            }
        }
        
        //Buscaremos los indices para conclusion o tramite para saber cual activar
        if(etapas.size() != 0){
            //Si tenemos procesados en etapa oral, entonces procedemos a validarlo
            if(etapas.indexOf("3") > -1){//Existe en Tramite
                if(etapas.indexOf("2") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                }
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
            }else if(etapas.indexOf("2") > -1){//Existe en Conclusion
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
            }else{
                //los mostramos vacios si etapa es 0 ya que aun no se tiene nada registrado en etapa inicial
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
            }
        }else{
            //Si no tenemos procesados registrados en etapa oral, entonces mostramos el resto del menu vacio
            out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
            out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
        }
        out.println("<button class='pestanaLinks oculto' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>Volando</button>");
    }else{
%>
    <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Causa Penal</button>
    <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2" disabled>Delitos</button>
    <button class="pestanaLinks" onclick="openPestana('btn3', 'p3')" id="btn3" disabled>Adolescentes</button>
    <button class="pestanaLinks" onclick="openPestana('btn4', 'p4')" id="btn4" disabled>Victimas</button>
    <button class="pestanaLinks" onclick="openPestana('btn5', 'p5')" id="btn5" disabled>Juicio Oral</button>
    <button class="pestanaLinks" onclick="openPestana('btn6', 'p6')" id="btn6" disabled>Conclusion</button>
    <button class="pestanaLinks" onclick="openPestana('btn7', 'p7')" id="btn7" disabled>Tramite</button>
    <button class="pestanaLinks oculto" onclick="openPestana('btn8', 'p8')" id="btn8" disabled>Volando</button>
<%
    }
%>