<%-- 
    Document   : delitos
    Created on : 1/10/2019, 09:00:11 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Delitos</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Delitos</h1>
            <form action="" method="post" name="formDelitos">
                <fieldset>
                    <legend>Identificación del tipo penal</legend>
                    <table class="tablaFormu" >
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoCP">Delito de acuerdo con la ley penal</label>
                                <select  class="demo-default txtExBig" name="delitoCP" id="delitoCP" placeholder="Selecciona el delito . . ."  required>
                                    <option value="" ></option>
                                    <%
                                        lista = cat.findCodNorma();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "' data-data='{\"norma\":\"" + ls[2] +"\"}'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fuero">Fuero</label>
                                <select class="txtMedia"  name="fuero" id="fuero" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuero();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="articuloCP">Artículo y/o fracción de acuerdo con el código penal</label>
                                <input class="txtExBig" type="text"  name="articuloCP" id="articuloCP" required/>
                            </td>
                            <td rowspan="2">
                                <fieldset>
                                    <label for="reclasificaDel">¿Hubo reclasificación del delito?</label>
                                    <select class="txtMedia"  name="reclasificaDel" id="reclasificaDel" onchange="respuestaSimpleFecha('#reclasificaDel', '#dFechaReclaDel', '#fechaReclaDel','#chkFechaReclaDel');" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                    <div class="oculto" id="dFechaReclaDel">
                                        <label for="fechaReclaDel">Fecha de reclasificacion del delito</label>
                                        <input type="date" name="fechaReclaDel" id="fechaReclaDel"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaReclaDel" onclick="fechaNoIdent('#chkFechaReclaDel', '#fechaReclaDel');"><label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoNT">Delito de acuerdo con la Norma Técnica</label>
                                <select class="lblExBig"  name="delitoNT" id="delitoNT" required>
                                    <option value="">--Seleccione--</option>
                                </select> 
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Características de ejecución</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="consumacion">Grado de consumación</label>
                                <select class="txtMedia"  name="consumacion" id="consumacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findConsumacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="calificacion">Calificación del delito</label>
                                <select class="txtMedia"  name="calificacion" id="calificacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findCalifDelito();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="concurso">Concurso</label>
                                <select class="txtMedia"  name="concurso" id="concurso" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findConcurso();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="clasificacion">Clasificación en orden al resultado</label>
                                <select class="txtMedia"  name="clasificacion" id="clasificacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findClasificacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="comision">Forma de comisión</label>
                                <select class="txtMedia"  name="comision" id="comision" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFormComision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="accion">Forma de acción</label>
                                <select class="txtMedia"  name="accion" id="accion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFormAccion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="modalidad">Modalidad</label>
                                <select class="txtMedia"  name="modalidad" id="modalidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findModalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="instrumentos">Instrumentos para la comisión</label>
                                <select class="txtMedia"  name="instrumentos" id="instrumentos" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findInstrComision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ocurrencia">Fecha de ocurrencia</label>
                                <input type="date" name="ocurrencia" id="ocurrencia" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkOcurrencia" onclick="fechaNoIdent('#chkOcurrencia', '#ocurrencia');"><label>No identificada</label>
                                </div>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Lugar de ocurrencia</legend>
                                    <div class="cols lblExBig">
                                        <label>Entidad Federativa</label>
                                        <select class="txtMedia" name="entidadD" id="entidadD" onchange="llenaMun('#entidadD','#municipioD')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig">
                                        <label class="lblExBig">Municipio/Demarcación territorial</label>
                                        <select class="txtMedia" name="municipioD" id="municipioD" required>
                                            <option value="">--Seleccione--</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="numAdo">Número de adolescentes por este delito </label>
                                <select class="txtMedia" name="numAdo" id="numAdo">
                                    <option value="">--Seleccione--</option>
                                    <%    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="numVic">Número de víctimas por este delito </label>
                                <select class="txtMedia" name="numVic" id="numVic">
                                    <option value="">--Seleccione--</option>
                                    <%    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td></td>
                            <td></td>
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
