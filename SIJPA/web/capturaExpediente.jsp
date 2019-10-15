<%-- 
    Document   : captura_expediente
    Created on : 24/09/2019, 09:42:00 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Expediente</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor" style="zoom: .9;">
            <h2>Expediente</h2>
            <form action="" method="post">
                <fieldset>
                    <legend>Características del expediente de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="jClave">Juzgado Clave:</label>
                                <input type="text" name="jClave" id="jClave" required>
                            </td>
                            <td>
                                <label for="CarpInves">No. Carpeta Investigación</label>
                                <input type="text" name="CarpInves" id="CarpInves" required>
                            </td>
                            <td>
                                <label for="expClave">Expediente Clave</label>
                                <input type="text" name="expClave" id="expClave" required>
                            </td>
                            <td>
                                <label for="fIngreso">Fecha de ingreso</label>
                                <input type="date" name="fIngreso" id="fIngreso" class="txtMedia" required>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="compe">Organo Competente</label>
                                        <select name="compe" id="compe" class="txtMedia">
                                            <option value="0">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (int x = 0; x < 2; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'>" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="Tincompe">Tipo de incompetencia</label>
                                        <select name="Tincompe" id="Tincompe" class="txtMedia">
                                            <option value="0">--Seleccione--</option>
                                            <%
                                                lista = cat.findIncompetencia();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="ExpAcomu" >Expediente acumulado</label>
                                        <select name="ExpAcomu" id="ExpAcomu" class="txtMedia">
                                            <option value="0">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (int x = 0; x < 2; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'>" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="ExpRefe">Expediente al que hace referencia</label>
                                        <input type="text" name="ExpRefe" id="ExpRefe" required>
                                    </div>
                                </fieldset>
                            </td>0
                        </tr>             
                        <tr>
                            <td>
                                <label for="Pparticular" class="lblExBig">¿La causa penal deriva de acción penal por particular?</label>
                                <select name="Pparticular" id="Pparticular" class="txtMedia">
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
                                <label for="Tprocedi" >Tipo de procedimiento</label>
                                <select name="Tprocedi" id="Tprocedi" class="txtMedia" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista = cat.findProcedimiento();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>  
                                </select>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Contenidos del expediente de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="Tdelitos">Total de delitos</label>
                                <input type="number" name="Tdelitos" id="Tdelitos" required>
                            </td>
                            <td>
                                <label for="Tadolescentes">Total de adolescentes</label>
                                <input type="number" name="Tadolescentes" id="Tadolescentes" required>
                            </td>
                            <td>
                                <label for="Tvictimas">Total de víctimas</label>
                                <input type="number" name="Tvictimas" id="Tvictimas" required>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Audiencias</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de audiencias</th>
                            <th>Aplica Si/No</th>
                            <th>Cantidad</th>
                        </tr>
                        <%
                            lista = cat.findMedCautelares();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>"); %>
                        <input type="checkbox" class="chkAplica" name="aplAudi" id="aplAudi<%out.print(ls[0]);%>" onChange="comprobar(this, 'cantAudi<%out.print(ls[0]);%>');"/>
                        <%      out.println("</td>");
                            out.println("<td>"); %>
                        <input type="number" disabled="true" name="cantAudi" id="cantAudi<%out.print(ls[0]);%>" class="txtSmall"/>
                        <%      out.println("</td>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="ComentaExpe" id="ComentaExpe"></textarea>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
