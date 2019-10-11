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
            <form action="" method="post">
                <fieldset>
                    <table style="border-spacing: 0; " class="tablaFormu">
                        <tr>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo celebración de la audiencia intermedia?</label>
                                    <select class="txtMedia" name="audiInterme" id="audiInterme">
                                        <option value="0">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <label for="fechaCtrlDeten">Fecha de la audiencia intermedia</label>
                                    <input type="date" name="fechaAudiinter" id="fechaAudiinter"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkAudiinter">
                                        <label>No identificada</label>
                                    </div> 
                                </fieldset>
                            </td>
                            <td>
                                <label for="fechaEscrito">Fecha del escrito de acusación</label>
                                <input type="date" name="fechaEscrito" id="fechaEscrito"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkEscrito">
                                    <label>No identificada</label>
                                </div> 
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo solicitud de corrección del escrito de acusación?</label>
                                    <select class="txtMedia" name="correEscrito" id="correEscrito">
                                        <option value="0">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <label for="fechaCtrlDeten">Fecha de corrección del escrito de acusación</label>
                                    <input type="date" name="fechaCorreccion" id="fechaCorreccion"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkCorreccion">
                                        <label>No identificada</label>
                                    </div> 
                                </fieldset>
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInterme">¿Hubo solicitud de asesor coadyuvante?</label>
                                    <select class="txtMedia" name="asesorCoady" id="asesorCoady">
                                        <option value="0">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                    <label for="fechaCtrlDeten">Fecha de la solicitud del asesor coadyuvante</label>
                                    <input type="date" name="fechaCoady" id="fechaCoady"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkCoady">
                                        <label>No identificada</label>
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
                                                <label for="audiInterme">¿Hubo presentación de medios de prueba?</label>
                                                <select class="txtMedia" name="mediosPrueba" id="mediosPrueba">
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
                                                <label for="audiInterme">Tipos de  medios de prueba (excluidos o aceptados)</label>
                                                <select class="txtMedia" name="tipoPrueba" id="tipoPrueba">
                                                    <option value="0">--Seleccione--</option>
                                                    <%
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                        }
                                                    %> 
                                                </select>
                                            </td>

                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                            <td>
                                <label for="audiInterme">Exclusión de medios de prueba</label>
                                <select class="txtMedia" name="excuMedios" id="excuMedios">
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
                                <label for="audiInterme">¿Contó con acuerdos probatorios?</label>
                                <select class="txtMedia" name="acuerdosProba" id="acuerdosProba">
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
