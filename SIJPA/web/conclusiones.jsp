<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showProcesados"%>
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
            HttpSession sesion= request.getSession();
            
            catalogos cat = new catalogos();
            showProcesados proce=new showProcesados();
            ArrayList<String[]> lista = new ArrayList();
            
            String entidad =(String) sesion.getAttribute("entidad");
            String municipio =(String) sesion.getAttribute("municipio");
            String distrito =(String) sesion.getAttribute("distrito");
            String numero =(String) sesion.getAttribute("numero");
            String jConcatenado =entidad+municipio+distrito+numero;
            String expediente =(String) sesion.getAttribute("expediente");
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el juez de control</h1>
            <form action="" method="post" name="formConclusiones" id="formConclusiones">
                <fieldset>
                    <legend>Resolución</legend>
                    <label for="idProcesado">Id Adolescente</label>
                    <select class="lblExBig" name="idProcesado" id="idProcesado">
                        <option value="">--Seleccione--</option>
                        <%  lista = proce.findProcesadoExp(expediente+jConcatenado);
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                            }
                        %> 
                    </select>
                    <table class="tablaFormu" >
                        <tr>
                            <td>
                                <div class="cols">
                                    <label for="fechaReso">Fecha en que se dictó la resolución</label>
                                    <input type="date" name="fechaReso" id="fechaReso" required/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')"><label>No identificada</label>
                                    </div>
                                </div>
                                <div class="cols">
                                    <label for="tipoConclusion">Tipo de resolución (Conclusión o terminación)</label>
                                    <select class="txtMedia" name="tipoConclusion" id="tipoConclusion" onchange="resSobreseimiento()" required>
                                        <option value="">--Seleccione--</option>
                                        <%  lista = cat.findTipoResolucion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="idSobre" >
                                    <label for="tipoSobreseimto" >Tipo de sobreseimiento</label>
                                    <select class="txtMedia dependiente" name="tipoSobreseimto" id="tipoSobreseimto">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findTipoSobrese();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="proceSobre"  >
                                    <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                                    <select class="txtMedia dependiente" name="proceSobreseimto" id="proceSobreseimto">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findSobreseimiento();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Procedimiento abreviado</legend>
                    <label for="huboProsedimto">¿Hubo procedimiento abreviado?</label>
                    <select class="txtMedia" name="huboProsedimto" id="huboProsedimto" onchange="proceAbreviado()" required>
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findResSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %> 
                    </select>
                    <table class="tablaFormu" border="0">
                        <tr>
                            <td>
                                <div class="cols oculto" id="dTipoMedidaPA" >
                                    <label for="tipoMedidaPA">Tipo de medida en el procedimiento abreviado</label>
                                    <select class="txtMedia dependiente" name="tipoMedidaPA" id="tipoMedidaPA" onchange="respuestaSelectbis()">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findProcAbreviado();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="dTipoMedidaPL">
                                    <label for="tipoMedidaPL">Tipo de medidas privativa de la libertad</label>
                                    <select class="txtMedia dependiente" name="tipoMedidaPL" id="tipoMedidaPL"  onchange="rInternamiento()" >
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findPrivLibertad();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="dTipoMedidaNPL">
                                    <label for="tipoMedidaNPL" id="DtipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                                    <select class="txtMedia dependiente" name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findNoPrivacion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="Dinternamiento">
                                    <label for="internamiento">Tiempo en internamiento</label>
                                    <select class="txtMedia dependiente" name="internamiento" id="internamiento">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findTiempoInterna();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Reparación del daño</legend>
                    <table class="tablaFormu" >
                        <tr>
                            <td>
                                <div class="cols">
                                    <label for="reparaDanio">¿Hubo reparación del daño?</label>
                                    <select class="txtMedia" name="reparaDanio" id="reparaDanio" onchange="respuestaRepara()" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="tipoRepara" >
                                    <label for="tipoReparaD">Tipo de reparación del daño</label>
                                    <select class="txtMedia dependiente" name="tipoReparaD" id="tipoReparaD" onchange="pagoCosa()" >
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRePDano();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                                <div class="cols oculto" id="montoRepara" >
                                    <label for="montoReparaD">Monto de la reparación impuesta</label>
                                    <select class="txtMedia dependiente" name="montoReparaD" id="montoReparaD">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findMulta();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Impugnación</legend>
                    <table class="tablaFormu" >
                        <tr>
                            <td>
                                <div class="cols">
                                    <label for="impugnacion">¿La resolución fue impugnada?</label>
                                    <select class="txtMedia" name="impugnacion" id="impugnacion" onchange="impugna()" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="cols oculto" id="tipoImpugna">
                                    <label for="tipoImpugnacion">Tipo de impugnación</label>
                                    <select class="txtMedia dependiente" name="tipoImpugnacion" id="tipoImpugnacion">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findTipoImpugna();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="cols oculto" id="fechaImpugna">
                                    <label for="fechaImpugnacion">Fecha de la impugnación </label>
                                    <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" class="depenFecha"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaImpugnacion" onclick="fechaNoIdent('#chkFechaImpugnacion', '#fechaImpugnacion')"><label>No identificada</label>
                                    </div>
                                </div>
                                <div class="cols oculto" id="quienImpugna">
                                    <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                                    <select class="txtMedia dependiente" name="personaImpugna" id="personaImpugna">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findImpugResolucion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
    </body>
</html>
