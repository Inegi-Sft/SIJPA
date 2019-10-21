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
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Intermedia</h1>
            <form action="" method="post" id="formuMedia">
                <fieldset>
                    <table style="border-spacing: 0; " class="tablaFormu">
                        <tr>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo celebración de la audiencia intermedia?</label>
                                    <select class="txtMedia" name="audiInterme" id="audiInterme" onchange="resSimpleFech('#audiInterme', '#divfechaAudiinter', '#fechaAudiinter', '#chkAudiinter')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div class="oculto" id="divfechaAudiinter">
                                        <label for="fechaCtrlDeten" id="lblfechaAudiinter">Fecha de la audiencia intermedia</label>
                                        <input type="date" name="fechaAudiinter" id="fechaAudiinter" class="depenFecha"/>
                                        <div class="noIdentificada" id="nifechaAudiinter">
                                            <input type="checkbox" id="chkAudiinter" onclick="fechaNoIdent('#chkAudiinter', '#fechaAudiinter')"><label>No identificada</label>
                                        </div> 
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="fechaEscrito">Fecha del escrito de acusación</label>
                                <input type="date" name="fechaEscrito" id="fechaEscrito" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkEscrito" onclick="fechaNoIdent('#chkEscrito', '#fechaEscrito')"><label>No identificada</label>
                                </div> 
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo solicitud de corrección del escrito de acusación?</label>
                                    <select class="txtMedia" name="correEscrito" id="correEscrito" onchange="resSimpleFech('#correEscrito', '#divfechaCtrlDeten', '#fechaCorreccion', '#chkCorreccion')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="divfechaCtrlDeten" class="oculto">
                                        <label for="fechaCtrlDeten" id="lblfechaCtrlDeten">Fecha de corrección del escrito de acusación</label>
                                        <input type="date" name="fechaCorreccion" id="fechaCorreccion" class="depenFecha"/>
                                        <div class="noIdentificada" id="nifechaCtrlDeten">
                                            <input type="checkbox" id="chkCorreccion" onclick="fechaNoIdent('#chkCorreccion', '#fechaCorreccion')"><label>No identificada</label>
                                        </div> 
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo solicitud de asesor coadyuvante?</label>
                                    <select class="txtMedia" name="asesorCoady" id="asesorCoady" onchange="resSimpleFech('#asesorCoady', '#divfechaCoady', '#fechaCoady', '#chkCoady')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <div id="divfechaCoady" class="oculto">
                                        <label for="fechaCtrlDeten" id="lblfechaCoady">Fecha de la solicitud del asesor coadyuvante</label>
                                        <input type="date" name="fechaCoady" id="fechaCoady" class="depenFecha"/>
                                        <div class="noIdentificada" id="nifechaCoady">
                                            <input type="checkbox" id="chkCoady" onclick="fechaNoIdent('#chkCoady', '#fechaCoady')"><label>No identificada</label>
                                        </div> 
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <table style="border-spacing: 0; " class="tablaFormu">
                                        <tr>
                                            <td>
                                                <label for="mediosPrueba">¿Hubo presentación de medios de prueba?</label>
                                                <select class="txtMedia" name="mediosPrueba" id="mediosPrueba" onchange="respuestaSelect('#mediosPrueba', '#divMediopru', '#tipoPrueba')" required>
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
                                                <div id="divMediopru" class="oculto">
                                                    <label for="tipoPrueba" id="lbltipoPrueba">Tipos de  medios de prueba (excluidos o aceptados)</label>
                                                    <select class="txtMedia dependiente" name="tipoPrueba" id="tipoPrueba" >
                                                        <option value="">--Seleccione--</option>
                                                        <%
                                                            lista = cat.findMediosPrueba();
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
                            </td>
                            <td>
                                <label for="audiInterme">Exclusión de medios de prueba</label>
                                <select class="txtMedia" name="excuMedios" id="excuMedios" required>
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
                                <label for="audiInterme">¿Contó con acuerdos probatorios?</label>
                                <select class="txtMedia" name="acuerdosProba" id="acuerdosProba" required="">
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
    </body>
</html>
