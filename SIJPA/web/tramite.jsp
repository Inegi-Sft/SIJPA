<%-- 
    Document   : tramite
    Created on : 3/10/2019, 09:32:06 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.showInicial"%>
<%@page import="clasesAuxiliar.showIntermedia"%>
<%@page import="clasesAuxiliar.showTramite"%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Pendientes de resolución </title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesTram.js"></script>
        <%  
            catalogos cat = new catalogos();
            showTramite sTramite = new showTramite();
            showInicial inicial = new showInicial();
            showIntermedia inter = new showIntermedia();
            ArrayList<String[]> lista, tramite = new ArrayList();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadClave = (String) session.getAttribute("juzgadoClave");
            String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
            String jEntidad = jDividido[0];
            String jMunicipio = jDividido[1];
            String jNumero = jDividido[2];
            String jConcatenado = jEntidad + jMunicipio + jNumero;
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String etapaProcesal = "";
            String estatusInves = "";
            String estatusInter = "";
            String especifi = "";
            String fechaActo = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    tramite = sTramite.findTramite(causaClave, proceClave + jConcatenado);
                    if(tramite.size() > 0){
                        operacion = "actualizar";
                        etapaProcesal = tramite.get(0)[0];
                        estatusInves = tramite.get(0)[1];
                        estatusInter = tramite.get(0)[2];
                        especifi = tramite.get(0)[3];
                        fechaActo = tramite.get(0)[4];
                    }
                }
            }
            
            //Control si es captura verifica cual es tu tipo de resolucion en etapa intermedia si es que tiene
            String etapaInter = "";//;//variable donde guardaremos si en intermedia ya tiene tramite
            if(!proceClave.equals("")){
                etapaInter = inter.findProcesadoClave(causaClave, proceClave + jConcatenado);//Buscamos etapa a nivel de procesado
                if(!etapaInter.equals("")){
                    etapaProcesal = etapaInter;
                }
                System.out.println("Etapa resul: " + etapaProcesal);
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Pendientes de resolución </h1>
            <form action="tramite.jsp" method="post" id="formTramite" name="formTramite">
                <fieldset>
                    <legend>Estatus</legend>
                    <label for="idProcesado">Id Adolescente</label>
                    <% 
                        //Si recibimos el procesado obligado en tramite lo imprimimos sin poder editar
                        if(!proceClave.equals("")){
                            out.println("<input type='text' name='proceClave' id='proceClave' value='" + proceClave + "' readonly>");
                            out.println("<input type='hidden' name='posicion' id='posicion' value='" + posicion + "'>");
                            out.println("<input type='hidden' name='opera' id='opera' value='" + operacion + "'>");
                        }else{//Si el procesado no esta obligado en tramite entonces puede escoger de una lista
                            out.println("<select name='proceClave' id='proceClave' onchange='formTramite.submit();' required>");
                            out.println("<option value=''>--Seleccione--</option>");
                            lista = inicial.findCausaEtapa(causaClave,5);//Buscamos las etapas a nivel de causa sean 4.volando
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0].replace(jConcatenado, "") + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                            }
                            out.println("</select>");
                        }
                    %>
                    <br>
                    <fieldset class="colsA subField">
                        <div class="cols">
                            <label for="eProcesal">Etapa procesal</label>
                            <select name="eProcesal" id="eProcesal" required>
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaProcesal();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(etapaProcesal)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEstInvesti">
                            <label for="estInvesti" class="lblExBig">Estatus para la etapa de investigación</label>
                            <select name="estInvesti" id="estInvesti">
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaInicial();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(estatusInves)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEstIntermedia">
                            <label for="estIntermedia" class="lblExBig">Estatus para la etapa intermedia</label>
                            <select name="estIntermedia" id="estIntermedia" onchange="ocultaEspecifique();">
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaIntermedia();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(estatusInter)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEspecifique">
                            <label for="especifique">Especifique</label>
                            <input type="text" name="especifique"  id="especifique" value="<%=especifi%>">
                        </div>
                    </fieldset>
                    <div class="cols">
                        <label for="uActo">Fecha del último acto procesal</label>
                        <input type="date" name="uActo" id="uActo" value="<%=fechaActo%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkUActo" onclick="fechaNoIdent('#chkUActo', '#uActo');">
                            <label>No identificada</label>
                        </div>
                    </div>
                </fieldset>
                <br>
                <input type="submit" name="guardar" id="guardarTram" value="Guardar">
            </form>
        </section>
        <% if(!etapaInter.equals("")){ %>
            <script type="text/javascript"> 
                $(document).ready(function(){ 
                    //etapaProcesal(); 
                    $("#eProcesal option:not(:selected)").attr("disabled", "disabled");
                });
            </script>
        <%  } %>
    </body>
</html>
