<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Resoluciones</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h2>Resoluciones dictadas por el juez de control</h2>
            <form action="" method="post">
                <fieldset>
                    <legend>Resolución</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label for="idProcesado">Id Adolescente</label>
                                <select class="txtMedia" name="idProcesado" id="idProcesado">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fechaReso">Fecha en que se dictó la resolución</label>
                                <input type="date" name="fechaReso" id="fechaReso"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaReso">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="tipoConclusion">Tipo de resolución (Conclusión o terminación)</label>
                                <select class="txtMedia" name="tipoConclusion" id="tipoConclusion">
                                    <option value="0">--Seleccione--</option>
                                    <%                                
                                        lista = cat.findTipoResolucion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                                <select class="txtMedia" name="tipoSobreseimto" id="tipoSobreseimto">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoSobrese();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                                <select class="txtMedia" name="proceSobreseimto" id="proceSobreseimto">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findSobreseimiento();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Procedimiento abreviado</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label for="huboProsedimto">¿Hubo procedimiento abreviado?</label>
                                <select class="txtMedia" name="huboProsedimto" id="huboProsedimto">
                                    <option value="0">--Seleccione--</option>
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
                                <label for="tipoMedidaPA">Tipo de medida en el procedimiento abreviado</label>
                                <select class="txtMedia" name="tipoMedidaPA" id="tipoMedidaPA">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findProcAbreviado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="tipoMedidaPL">Tipo de medidas privativa de la libertad</label>
                                <select class="txtMedia" name="tipoMedidaPL" id="tipoMedidaPL">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findPrivLibertad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="tipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                                <select class="txtMedia" name="tipoMedidaNPL" id="tipoMedidaNPL">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findNoPrivacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="internamiento">Tiempo en internamiento</label>
                                <select class="txtMedia" name="internamiento" id="internamiento">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findTiempoInterna();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Reparación del daño</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="reparaDanio">¿Hubo reparación del daño?</label>
                                <select class="txtMedia" name="reparaDanio" id="reparaDanio">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="tipoReparaD">Tipo de reparación del daño</label>
                                <select class="txtMedia" name="tipoReparaD" id="tipoReparaD">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findRePDano();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="montoReparaD">Monto de la reparación impuesta</label>
                                <select class="txtMedia" name="montoReparaD" id="montoReparaD">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findMulta();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Impugnación</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="impugnacion">¿La resolución fue impugnada?</label>
                                <select class="txtMedia" name="impugnacion" id="impugnacion">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="tipoImpugnacion">Tipo de impugnación</label>
                                <select class="txtMedia" name="tipoImpugnacion" id="tipoImpugnacion">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoImpugna();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fechaImpugnacion">Fecha de la impugnación </label>
                                <input type="date" name="fechaImpugnacion" id="fechaImpugnacion"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaImpugnacion">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                                <select class="txtMedia" name="personaImpugna" id="personaImpugna">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findImpugResolucion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
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
