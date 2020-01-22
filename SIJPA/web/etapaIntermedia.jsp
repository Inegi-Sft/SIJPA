<%-- 
    Document   : etamaIntermedia
    Created on : 7/10/2019, 09:58:11 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Intermedia</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            String proceClave = "", posicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            if (request.getParameter("insertado") != null) {
                out.println("<script type='text/javascript'>alert('Error al insertar: Consulte al administrador del sistema');</script>");
            }

            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Intermedia</h1>
            <form action="" method="post" id="formuMedia" name="formuMedia">
                <label for="idProcesado">Id Adolescente</label>
                <input class="txtMedia" name="idProcesado" id="idProcesado" value="<%=proceClave%>" readonly />
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                <fieldset>
                    <legend>Características de la etapa intermedia</legend>
                    <table style="border-spacing: 0; " class="tablaFormu">
                        <tr>
                            <td>
                                <div  id="divfechaEscrito">
                                    <label for="fechaEscrito">Fecha del escrito de acusación</label>
                                    <input type="date" name="fechaEscrito" id="fechaEscrito" required/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkEscrito" onclick="fechaNoIdent('#chkEscrito', '#fechaEscrito')"><label>No identificada</label>
                                    </div> 
                                </div>
                            </td>
                            <td>
                                <div  id="divcontestaEscrito">
                                    <label for="contestaEscrito">Fecha de contestación a la acusación</label>
                                    <input type="date" name="contestaEscrito" id="contestaEscrito" required/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkcontestaEscrito" onclick="fechaNoIdent('#chkcontestaEscrito', '#contestaEscrito')"><label>No identificada</label>
                                    </div> 
                                </div>
                            </td>
                            <td>
                                <div id="descuProba">
                                    <label for="audiInterme">¿Hubo descubrimiento probatorio?</label>
                                    <select class="txtMedia" name="decubreProba" id="decubreProba" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="audiInterme">¿Hubo celebración de la audiencia intermedia?</label>
                                        <select class="txtMedia" name="audiInterme" id="audiInterme" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="oculto cols" id="divfechaAudiinter">
                                        <label for="fechaCtrlDeten" id="lblfechaAudiinter">Fecha de la audiencia intermedia</label>
                                        <input type="date" name="fechaAudiinter" id="fechaAudiinter"/>
                                        <div class="noIdentificada" id="nifechaAudiinter">
                                            <input type="checkbox" id="chkAudiinter" onclick="fechaNoIdent('#chkAudiinter', '#fechaAudiinter')"><label>No identificada</label>
                                        </div> 
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <div id="dseparaAcusa" class="oculto">
                                    <label for="separaAcusa">¿Hubo separación de la acusación?</label>
                                    <select class="txtMedia" name="separaAcusa" id="separaAcusa"  required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset id="fmediosPrueba" class="oculto">
                                    <legend>Medios Prueba</legend>
                                    <table class="tablaFormu">
                                        <tr>
                                            <td colspan="3">
                                                <div id="dmediosPrueba" class="oculto">
                                                    <label for="mediosPrueba">¿Hubo presentación de medios de prueba?</label>
                                                    <select class="txtMedia" name="mediosPrueba" id="mediosPrueba" required>
                                                        <option value="">--Seleccione--</option>
                                                        <%
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        %> 
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="oculto" id="dpruebaMP">
                                                    <label for="pruebaMP">Medios de prueba presentados por el ministerio público</label>
                                                    <select class="txtMedia" name="pruebaMP" id="pruebaMP">
                                                        <option value="">--Seleccione--</option>
                                                        <%
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        %> 
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="oculto" id="dpruebaAJ">
                                                    <label for="pruebaAJ">Medios de prueba presentados por el asesor jurídico</label>
                                                    <select class="txtMedia" name="pruebaAJ" id="pruebaAJ">
                                                        <option value="">--Seleccione--</option>
                                                        <%
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        %> 
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="oculto" id="dpruebaDefensa">
                                                    <label for="pruebaDefensa">Medios de prueba presentados por la defensa</label>
                                                    <select class="txtMedia" name="pruebaDefensa" id="pruebaDefensa">
                                                        <option value="">--Seleccione--</option>
                                                        <%
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        %> 
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table id="tblpruebaMP" border="1" class="tablasRegis oculto">
                                                    <tr>
                                                        <th width="20">Id</th>
                                                        <th width="450">Tipos</th>
                                                        <th width="70">Resolución</th>
                                                    </tr>
                                                    <%
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            out.println("<input type='checkbox' name='chkpruebaMP' id='chkpruebaMP" + ls[0] + "' value='" + ls[0] + "' />");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    %>
                                                </table>
                                            </td>
                                            <td>
                                                <table id="tblmediospruebaAJ" border="1" class="tablasRegis oculto">
                                                    <tr>
                                                        <th width="20">Id</th>
                                                        <th width="450">Tipos</th>
                                                        <th width="70">Resolución</th>
                                                    </tr>
                                                    <%
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            out.println("<input type='checkbox' name='chkpruebaAJ' id='chkpruebaAJ" + ls[0] + "' value='" + ls[0] + "' />");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    %>
                                                </table>
                                            </td>
                                            <td>
                                                <table id="tblmediospruebaDefen" border="1" class="tablasRegis oculto">
                                                    <tr>
                                                        <th width="20">Id</th>
                                                        <th width="450">Tipos</th>
                                                        <th width="70">Resolución</th>
                                                    </tr>
                                                    <%
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            out.println("<input type='checkbox' name='chkpruebaDefen' id='chkpruebaDefen" + ls[0] + "' value='" + ls[0] + "' />");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    %>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="dacuerdosProba" class="oculto">
                                    <label for="acuerdosProba">¿Contó con acuerdos probatorios?</label>
                                    <select class="txtMedia" name="acuerdosProba" id="acuerdosProba" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div id="daperturaJO" class="oculto">
                                    <label for="aperturaJO">¿Se dictó auto de apertura a juicio oral?</label>
                                    <select class="txtMedia" name="aperturaJO" id="aperturaJO" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardainter" value="Guardar" id="guardaInter" class="btnFlotante"/>
            </form>
        </section>
        <script> $("#aperturaJO > option[value=9]").hide(); </script>
    </body>
</html>
