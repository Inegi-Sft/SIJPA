<%-- 
    Document   : etapaInicial
    Created on : 2/10/2019, 12:00:12 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Inicial</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Inicial</h1>
            <form action="" method="post">
                <fieldset>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label for="idProcesado">Id Adolescente</label>
                                <select class="txtMedia" name="idProcesado" id="idProcesado">  
                                    <option value="">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                                <hr style="border: 1px solid #0077CB;margin-top: 10px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <label for="ctrlDetencion">¿Hubo control de detención?</label>
                                    <select class="txtMedia" name="ctrlDetencion" id="ctrlDetencion" onchange="respuestaSimple('#ctrlDetencion', '#lbCtrlDeten1', '#fechaCtrlDeten', '#chkFechaCtrlDeten', '#chkCtrlDeten')" required>
                                        <option value="">--Seleccione--</option>
                                        <% lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="lbCtrlDeten1" hidden>
                                        <label for="fechaCtrlDeten" id="lbCtrlDeten"  >Fecha de audiencia de control de detención</label>
                                    </div>
                                    <input type="date" name="fechaCtrlDeten" id="fechaCtrlDeten" hidden required/>
                                    <div class="noIdentificada" id="chkFechaCtrlDeten" hidden="">
                                        <input type="checkbox" id="chkCtrlDeten" onclick="fechaNoIdent('#chkCtrlDeten', '#fechaCtrlDeten')"><label>No identificada</label>

                                    </div> 
                                </fieldset>
                            </td>
                            <td>
                                <label for="legalDeten">¿Se calificó como legal la detención?</label>
                                <select class="txtMedia" name="legalDeten" id="legalDeten" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>    
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInicial">¿Hubo audiencia inicial?</label>
                                    <select class="txtMedia" name="audiInicial" id="audiInicial" onchange="respuestaSelect('#audiInicial', '#lbAudiIni1', '#conducAudi')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>    
                                    <div id="lbAudiIni1" hidden>
                                        <label for="conducAudi" id="lbAudiIni">Forma de conducción en la audiencia inicial</label>
                                    </div>
                                    <select class="txtMedia" name="conducAudi" id="conducAudi" hidden required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findFormConduccion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>    
                                </fieldset>
                            </td>
                            <td>
                                <label for="fechaFormuImpu">Fecha de formulación de la imputacion</label>
                                <input type="date" name="fechaFormuImpu" id="fechaFormuImpu" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaFormuImpu" onclick="fechaNoIdent('#chkFechaFormuImpu', '#fechaFormuImpu')"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr><td colspan="4"><br/></td></tr>
                        <tr style="padding-top: 15px;">
                            <td>
                                <fieldset>
                                    <label for="declaro">¿El adolescente declaró?</label>
                                    <select class="txtMedia" name="declaro" id="declaro" onchange="respuestaSimple('#declaro', '#lbfechDeclara1', '#fechDeclara', '#chkDeclara', '#chkFechDeclara')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="lbfechDeclara1" hidden>
                                         <label for="lbfechDeclara" id="lbfechDeclara">Fecha de declaración</label>
                                    </div>
                                    <input type="date" name="fechDeclara" id="fechDeclara" hidden required/>
                                    <div class="noIdentificada" id="chkDeclara" hidden>
                                        <input type="checkbox" id="chkFechDeclara" onclick="fechaNoIdent('#chkFechDeclara', '#fechDeclara')"><label>No identificada</label>
                                    </div>

                                </fieldset>
                            </td>
                            <td>
                                <fieldset>
                                    <label for="huboPlazo">¿Hubo plazo constitucional?</label>
                                    <select class="txtMedia" name="huboPlazo" id="huboPlazo" onchange="respuestaSelect('#huboPlazo', '#lbPlazo1', '#plazo')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                               
                                    <div id="lbPlazo1" hidden>
                                    <label for="plazo" id="lbPlazo">Tiempo del plazo constitucional</label>
                                    </div>
                                   
                                    <select class="txtMedia" name="plazo" id="plazo" hidden required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findPConstitucional();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <label for="autoVin" style="width:400px;">Resolución del auto de vinculación a proceso</label>
                                    <select class="txtMedia" name="autoVin" id="autoVin" onchange="respuestaSimple('#autoVin', '#lbfechAuto1', '#fechAuto', '#chkAuto', '#chkFechaAuto')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findAutoVinculacion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="lbfechAuto1" hidden>
                                    <label for="fechAuto" id="lbfechAuto" style="width:500px;">Fecha en que se dictó el auto de vinculación a proceso</label>
                                    </div>
                                    <input type="date" name="fechAuto" id="fechAuto" hidden required/>
                                    <div class="noIdentificada" id="chkAuto" hidden>
                                        <input type="checkbox" id="chkFechaAuto" onclick="fechaNoIdent('#chkFechaAuto', '#fechAuto')"><label>No identificada</label>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr><td colspan="4"><br/></td></tr>
                        <tr style="padding-top: 15px;">
                            <td colspan="2">
                                <fieldset>
                                    <label for="soliPlazo" class="lblExBig">¿Se solicitó el plazo para el cierre de investigación complementaria?</label>
                                    <select class="txtMedia" name="soliPlazo" id="soliPlazo" onchange="respuestaSimple('#soliPlazo', '#lbfechSoliPlazo1', '#fechSoliPlazo', '#chkfechSoliPlazo','#chkFechSoliPlazo')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="lbfechSoliPlazo1" hidden>
                                    <label for="fechSoliPlazo" id="lbfechSoliPlazo">Fecha de la solicitud del plazo</label>
                                    </div>
                                    <input type="date" name="fechSoliPlazo" id="fechSoliPlazo" hidden required/>
                                    <div class="noIdentificada" id="chkfechSoliPlazo" hidden>
                                        <input type="checkbox" id="chkFechSoliPlazo" onclick="fechaNoIdent('#chkFechSoliPlazo', '#fechSoliPlazo')"><label>No identificada</label>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="plazoFijadoC" id="idplazoFijadoC">Plazo fijado para el cierre de la investigación</label>
                                <select class="txtMedia" name="plazoFijadoC" id="plazoFijadoC" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findPlazoCierre();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>

                            <td>
                                <label for="fechCierreI" >Fecha del cierre de la investigación</label>
                                <input type="date" name="fechCierreI" id="fechCierreI" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechCierreI" onclick="fechaNoIdent('#chkFechCierreI', '#fechCierreI')" ><label>No identificada</label>
                                </div>
                            </td>

                        </tr>

                        <tr>

                            <td colspan="4"><br/>
                                <fieldset>
                                    <legend>Medidas Cautelares</legend>
                                    <div class="cols">
                                        <label for="drecretaMC" >¿Se decretó medida cautelar?</label>
                                        <select class="txtMedia" name="drecretaMC" id="drecretaMC" onchange="despliegaTabla('#drecretaMC', '#tabMedidaCautelar')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    </br>

                                    <div id="tabMedidaCautelar" hidden >

                                        <table class="tablasRegis" id="tableMcau">
                                            <tr>
                                                <th width="20">Id</th>
                                                <th width="450">Medida Cautelar</th>
                                                <th width="70">Decretada</th>
                                            </tr>
                                            <%
                                                lista = cat.findMedCautelares();
                                                for (String[] ls : lista) {
                                                    out.println("<tr>");
                                                    out.println("<td>" + ls[0] + "</td>");
                                                    out.println("<td>" + ls[1] + "</td>");
                                                    out.println("<td>"); %>
                                            <input type="checkbox" name="apliMedidaCau" id="apliMedidaCau<%out.print(ls[0]);%>" />
                                            <%      out.println("</td>");
                                                    out.println("</tr>");
                                                }
                                            %>


                                            </tr>
                                        </table>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante" onclick="return medidasCaute('#drecretaMC')"/>
            </form>
        </section>
    </body>
</html>
