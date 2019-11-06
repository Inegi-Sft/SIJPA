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
        <%
            if (request.getParameter("error") != null) {
                out.println("<script>alert('error en el proceso de guardado')</script>");
            } else if (request.getParameter("seinserto") != null) {
                out.println("<script>parent.$.fancybox.close()</script>");
            }
        %>
    </head>
    <body>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor" style="zoom: .9;">
            <h2>Expediente</h2>
            <form  method="post" name="formExpedientes" id="formExpedientes">
                <fieldset>
                    <legend>Características del expediente de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="jClave">Juzgado Clave:</label>
                                <input type="text" name="jClave" id="jClave" value="<%=juzgado%>" readonly required>
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
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaIngre" onclick="fechaNoIdent('#chkFechaIngre', '#fIngreso')"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <fieldset>
                                    <div class="cols">
                                        <label for="compe">Organo Competente</label>
                                        <select name="compe" id="compe" class="txtMedia" onchange="competencia()" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (int x = 0; x < 3; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'>" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="tipoIncopetencia">
                                        <label for="Tincompe">Tipo de incompetencia</label>
                                        <select name="Tincompe" id="Tincompe" class="txtMedia dependiente" >
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findIncompetencia();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="expAcomulado">
                                        <label for="ExpAcomu" >Expediente acumulado</label>
                                        <select name="ExpAcomu" id="ExpAcomu" class="txtMedia dependiente" onchange="expacumula()">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (int x = 0; x < 3; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'>" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="expReferen">
                                        <label for="ExpRefe">Expediente al que hace referencia</label>
                                        <input type="text" name="ExpRefe" id="ExpRefe" class="dependiente" value="-2">
                                    </div>
                                </fieldset>
                            </td>
                        </tr>             
                        <tr>
                            <td colspan="4" class="oculto" id="idparticular">
                                <div class="cols">
                                    <label for="Pparticular" class="lblExBig">¿La causa penal deriva de acción penal por particular?</label>
                                    <select name="Pparticular" id="Pparticular" class="txtMedia dependiente" >
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findResSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>  
                                    </select>
                                </div>
                                <div class="cols" id="divProcedimiento">
                                    <label for="Tprocedi" >Tipo de procedimiento</label>
                                    <select name="Tprocedi" id="Tprocedi" class="txtMedia dependiente" >
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findProcedimiento();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>  
                                    </select>
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset class="oculto" id="totalElementos">
                    <legend>Contenidos del expediente de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="Tdelitos">Total de delitos</label>
                                <input type="number" name="Tdelitos" id="Tdelitos" class="dependiente" onblur="numeroDelitos()">

                            </td>
                            <td>
                                <label for="Tadolescentes">Total de adolescentes</label>
                                <input type="number" name="Tadolescentes" id="Tadolescentes" class="dependiente" onblur="numeroProcesados()">
                            </td>
                            <td>
                                <label for="Tvictimas">Total de víctimas</label>
                                <input type="number" name="Tvictimas" id="Tvictimas" class="dependiente" onblur="numeroVictimas()">
                            </td>
                        </tr>
                        <tr>
                            <td colspan=3>
                                <label for="Tvictimas">Total de adolescentes concluidos</label>
                                <input type="number" name="Tconclusiones" id="Tconclusiones" class="dependiente" onblur="Tconclu()">
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset class="oculto" id="totalAudiencias">
                    <legend>Audiencias</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de audiencias</th>
                            <th>Aplica Si/No</th>
                            <th>Cantidad</th>
                        </tr>
                        <%
                            lista = cat.findTipoAudiencias();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>"); %>
                        <input type="checkbox" class="chkAplica" name="aplAudi" id="aplAudi" value="<%out.print(ls[0]);%>" onChange="comprobar(this, 'cantAudi<%out.print(ls[0]);%>');"/>
                        <%      out.println("</td>");
                            out.println("<td>"); %>
                        <input type="number" disabled name="cantAudi<%out.print(ls[0]);%>" id="cantAudi<%out.print(ls[0]);%>" class="txtSmall" required/>
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
                <!--<input type="button" name="guardarExp" id="guardarExp" value="Guardar" onclick="expeAudiencia()">-->
                <input type="submit" name="guardarExp" id="guardarExp" value="Guardar"> 
            </form>
        </section>
    </body>
</html>
