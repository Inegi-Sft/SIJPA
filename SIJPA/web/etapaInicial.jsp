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
            <h2>Etapa Inicial</h2>
            <form action="" method="post">
                <fieldset>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="2">
                                <label for="idProcesado">Id Adolescente</label>
                                <select class="txtMedia" name="idProcesado" id="idProcesado" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>Control de Detención</legend>
                                    <div class="cols">
                                        <label for="ctrlDetencion">¿Hubo control de detención?</label>
                                        <select class="txtMedia" name="ctrlDetencion" id="ctrlDetencion">
                                            <option value="">--Seleccione--</option>
                                            <%                                            lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="fechaCtrlDeten" class="lblExBig">Fecha de audiencia de control de detención</label>
                                        <input type="date" name="fechaCtrlDeten" id="fechaCtrlDeten"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaCtrlDeten"><label>No identificada</label>
                                        </div>
                                    </div> 
                                </fieldset>
                            </td>
                            <td>
                                <label for="legalDeten">¿Se calificó como legal la detención?</label>
                                <select class="txtMedia" name="legalDeten" id="legalDeten">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>Audiencia Inicial</legend>
                                    <div class="cols">
                                        <label for="audiInicial">¿Hubo audiencia inicial?</label>
                                        <select class="txtMedia" name="audiInicial" id="audiInicial">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="conducAudi">Forma de conducción en la audiencia inicial</label>
                                        <select class="txtMedia" name="conducAudi" id="conducAudi">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findFormConduccion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="fechaFormuImpu">Fecha de formulación de la imputacion</label>
                                <input type="date" name="fechaFormuImpu" id="fechaFormuImpu"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaFormuImpu">
                                    <label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Declaró</legend>
                                    <div class="cols">
                                        <label for="declaro">¿El adolescente declaró?</label>
                                        <select class="txtMedia" name="declaro" id="declaro">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="fechDeclara">Fecha de declaración</label>
                                        <input type="date" name="fechDeclara" id="fechDeclara"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechDeclara">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Plazo Constitucional</legend>
                                    <div class="cols">
                                        <label for="huboPlazo">¿Hubo plazo constitucional?</label>
                                        <select class="txtMedia" name="huboPlazo" id="huboPlazo">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="plazo">Tiempo del plazo constitucional</label>
                                        <select class="txtMedia" name="plazo" id="plazo">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPConstitucional();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Auto de Vinculación</legend>
                                    <div class="cols">
                                        <label for="autoVin">Resolución del auto de vinculación a proceso</label>
                                        <select class="txtMedia" name="autoVin" id="autoVin">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findAutoVinculacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="fechAuto">Fecha en que se dictó el auto de vinculación a proceso</label>
                                        <input type="date" name="fechAuto" id="fechAuto"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaAuto">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Plazo de Cierre</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="soliPlazo" class="lblExBig">¿Se solicitó el plazo para el cierre de investigación complementaria?</label>
                                <select class="txtMedia" name="soliPlazo" id="soliPlazo">
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
                                <label for="plazoFijadoC" class="lblExBig">Plazo fijado para el cierre de la investigación</label>
                                <select class="txtMedia" name="plazoFijadoC" id="plazoFijadoC">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findPlazoCierre();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fechSoliPlazo" class="lblExBig">Fecha de la solicitud del plazo</label>
                                <input type="date" name="fechSoliPlazo" id="fechSoliPlazo"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechSoliPlazo">
                                    <label>No identificada</label>
                                </div>

                            </td>
                            <td>
                                <label for="fechCierreI" class="lblExBig">Fecha del cierre de la investigación</label>
                                <input type="date" name="fechCierreI" id="fechCierreI"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechCierreI">
                                    <label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Medidas Cautelares</legend>
                    <label for="drecretaMC" >¿Se decretó medida cautelar?</label>
                        <select class="txtMedia" name="drecretaMC" id="drecretaMC">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findResSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                        <table class="tablasRegis" >
                            <tr>
                                <th>Id</th>
                                <th>Medida Cautelar</th>
                                <th>Decretada</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>El resguardo en su domicilio con las modalidades que el órgano Jurisdiccional disponga</td>
                                <td>
                                    <input type="checkbox" name="apliMedidacau" id="apliMedidacau" />
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Garantía económica para asegurar la comparecencia</td>
                                <td>
                                    <input type="checkbox" name="aseguCompa" id="aseguCompa" />
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>La prohibición de convivir, acercarse o comunicarse con determinadas personas, con las víctimas, ofendidos o testigos, siempre que no se afecte el derecho de defensa</td>
                                <td>
                                    <input type="checkbox" name="apliMedidacau3" id="apliMedidacau3" />
                                </td>
                            </tr>
                        </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
    </body>
</html>
