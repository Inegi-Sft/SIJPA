<%-- 
    Document   : capturaAudiencias
    Created on : 3/04/2020, 12:31:03 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showAudiencias"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Audiencias</title>
        <link type="image/png" href="img/logo_sijpa64.png" rel="icon"/>
        <link type="text/css" href="css/principal.css" rel="stylesheet"/>
        <link type="text/css" href="css/cabecera.css" rel="stylesheet"/>
        <link type="text/css" href="css/audiencias.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/fnAudiencias.js"></script>
        <%
            catalogos cat = new catalogos();
            showAudiencias sa = new showAudiencias();
            ArrayList<String[]> lista;
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
        <h1>Captura Audiencias</h1>
        <form  method="post" name="formCAudiencias" id="formCAudiencias">
            <fieldset>
                <legend>Datos generales de las Audiencias</legend>
                <div class="cols">
                    <label for="juzgadoClave">Juzgado Clave:  </label> <br>
                    <select name="juzgadoClave" id="juzgadoClave" class="txtLong" onchange="llenaJueces('#juzgadoClave','#dJueces')" required>
                        <option value="">--Seleccione--</option>
                        <%
                            lista = sa.findJuzgados();
                            for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                            }
                        %>  
                    </select>
                </div>
                <div class="cols">
                    <label for="causaClave">Causa Penal:  </label> <br>
                    <select name="causaClave" id="causaClave" class="txtLong" onchange="" required>
                        <option value="">--Seleccione--</option>
                    </select>
                </div>
                <fieldset id="fstJueces"><legend>Jueces que celebraron la audiencia</legend>
                    <div id="dJueces"></div>
                </fieldset>
                    <!--<center>-->
                <label class="lblExBig">Audiencias por etapas del proceso:</label>
                <br/>
                <table id="tblAudiInves" border="1" class="tablasRegis colsA">
                    <tr>
                        <th width="30">Id</th>
                        <th width="500">Investigación</th>
                        <th width="70">Aplica</th>
                        <th width="170">Fecha celebración</th>
                        <th width="130">Duracion</th>
                    </tr>
                    <%
                        lista = cat.findAudienciasInvestigacion();
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>");
                            %>
                            <input type="checkbox" name="chkAudiInves" id="chkAudiInves<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaAInves<%=ls[0]%>','#duracionInves<%=ls[0]%>')" style=" background: url('img/checkbox-check.png')" />
                            <% 
                            out.println("</td>");
                            out.println("<td><input type='date' name='fechaAInves' id='fechaAInves"+ls[0]+"' class='audiFecha' readonly/></td>");
                            out.println("<td><input type='time' name='duracionInves' id='duracionInves"+ls[0]+"' class='tiempo' readonly/>hrs.</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
                <br/><br/>
                <table id="tblAudiInter" border="1" class="tablasRegis colsA">
                    <tr>
                        <th width="30">Id</th>
                        <th width="600">Intermedia</th>
                        <th width="70">Aplica</th>
                        <th width="170">Fecha celebración</th>
                        <th width="130">Duracion</th>
                    </tr>
                    <%
                        lista = cat.findAudienciasIntermedia();
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>");
                            %>
                            <input type="checkbox" name="chkAudiInter" id="chkAudiInter<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaAInter<%=ls[0]%>','#duracionInter<%=ls[0]%>')" />
                            <% 
                            out.println("</td>");
                            out.println("<td><input type='date' name='fechaAInter' id='fechaAInter"+ls[0]+"' class='audiFecha' readonly /></td>");
                            out.println("<td><input type='time' name='duracionInter' id='duracionInter"+ls[0]+"' class='tiempo' readonly />hrs.</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
                <br/><br/>
                <table id="tblAudiJO" border="1" class="tablasRegis colsA">
                    <tr>
                        <th width="30">Id</th>
                        <th width="600">Juicio Oral</th>
                        <th width="70">Aplica</th>
                        <th width="170">Fecha celebración</th>
                        <th width="130">Duracion</th>
                    </tr>
                    <%
                        lista = cat.findAudienciasJuicioOral();
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>");
                            %>
                            <input type="checkbox" name="chkAudiJO" id="chkAudiJO<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaAJO<%=ls[0]%>','#duracionJO<%=ls[0]%>')" />
                            <% 
                            out.println("</td>");
                            out.println("<td><input type='date' name='fechaAJO' id='fechaAJO"+ls[0]+"' class='audiFecha' readonly /></td>");
                            out.println("<td><input type='time' name='duracionJO' id='duracionJO"+ls[0]+"' class='tiempo' readonly />hrs.</td>");
                            out.println("</tr>");
                        }
                    %>
                </table>
                    <!--</center>-->
            </fieldset>
        </form>
        </section>
    </body>
</html>
