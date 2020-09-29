<%-- 
    Document   : botonesPrinci.jsp
    Created on : 29/01/2020, 02:54:53 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.showInicial"%>
<%@page import="clasesAuxiliar.usuario"%>
<%
    if(request.getParameter("causaClave") != null){
        String juzgadoClave = (String)session.getAttribute("juzgadoClave");
        ArrayList <String> etapas = new ArrayList();
        showInicial sIni = new showInicial();
        usuario usu = new usuario();
        int avance = usu.findAvanceUsuario(request.getParameter("causaClave") + juzgadoClave.replace("-", ""));
        etapas = sIni.findEtapaCausa(request.getParameter("causaClave") + juzgadoClave.replace("-", ""));
        String [] pestanas = {"Causa Penal","Delitos","Imputados","Victimas","Inicial","Intermedia",
            "Conclusión y/o Terminación","Trámite"};
        
        out.println("<button class='pestanaLinks active' onclick=\"openPestana('btn1', 'p1')\" id='btn1'>" + pestanas[0] + "</button>");
        
        for(int x = 2; x <= 5; x++){
            if(x <= avance){
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn" + x + "', 'p" + x + "')\" id='btn" + x + "'>" + pestanas[x-1] + "</button>");
            }else{
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn" + x + "', 'p" + x + "')\" id='btn" + x + "' disabled>" + pestanas[x-1] + "</button>");
            }
        }
        
        //Buscaremos los indices para intermedia, conclusion o tramite para saber cual aactivar
        if(etapas.size() != 0){
            //Si tenemos procesados en etapa inicial, entonces procedemos a validarlo
            if(etapas.indexOf("8") > -1){//Existe Intermedia-Volando
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
            }else if(etapas.indexOf("7") > -1){//Existe en Intermedia-Tramite
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                if(etapas.indexOf("6") > -1 || etapas.indexOf("2") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
                }
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
            }else if(etapas.indexOf("6") > -1){//Existe en Intermedia-Conclusion
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                if(etapas.indexOf("3") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
                }
            }else if(etapas.indexOf("5") > -1){//Existe Volando
                if(etapas.indexOf("1") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                }
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
            }else if(etapas.indexOf("4") > -1){//Existe Termina Causa Penal
                if(etapas.indexOf("1") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                }
                if(etapas.indexOf("2") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
                }
                if(etapas.indexOf("3") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
                }
            }else if(etapas.indexOf("3") > -1){//Existe en Tramite
                if(etapas.indexOf("1") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                }
                if(etapas.indexOf("2") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
                }
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8'>" + pestanas[7] + "</button>");
            }else if(etapas.indexOf("2") > -1){//Existe en Conclusion
                if(etapas.indexOf("1") > -1){
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                }else{
                    out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                }
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7'>" + pestanas[6] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
            }else if(etapas.indexOf("1") > -1){//Existe en Intermedia
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6'>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
            }else{
                //los mostramos vacios si etapa es 0 ya que aun no se tiene nada registrado en etapa inicial
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
                out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
            }
        }else{
            //Si no tenemos procesados registrados en etapa inicial, entonces mostramos el resto del menu vacio
            out.println("<button class='pestanaLinks' onclick=\"openPestana('btn6', 'p6')\" id='btn6' disabled>" + pestanas[5] + "</button>");
            out.println("<button class='pestanaLinks' onclick=\"openPestana('btn7', 'p7')\" id='btn7' disabled>" + pestanas[6] + "</button>");
            out.println("<button class='pestanaLinks' onclick=\"openPestana('btn8', 'p8')\" id='btn8' disabled>" + pestanas[7] + "</button>");
        }
        out.println("<button class='pestanaLinks oculto' onclick=\"openPestana('btn9', 'p9')\" id='btn9'>Volando</button>");
    }else{
%>
    <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Causa Penal</button>
    <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2" disabled>Delitos</button>
    <button class="pestanaLinks" onclick="openPestana('btn3', 'p3')" id="btn3" disabled>Adolescentes</button>
    <button class="pestanaLinks" onclick="openPestana('btn4', 'p4')" id="btn4" disabled>Victimas</button>
    <button class="pestanaLinks" onclick="openPestana('btn5', 'p5')" id="btn5" disabled>Inicial</button>
    <button class="pestanaLinks" onclick="openPestana('btn6', 'p6')" id="btn6" disabled>Intermedia</button>
    <button class="pestanaLinks" onclick="openPestana('btn7', 'p7')" id="btn7" disabled>Conclusion y/o Terminacion</button>
    <button class="pestanaLinks" onclick="openPestana('btn8', 'p8')" id="btn8" disabled>Trámite</button>
    <button class="pestanaLinks oculto" onclick="openPestana('btn9', 'p9')" id="btn9" disabled>Volando</button>
<%
    }
%>