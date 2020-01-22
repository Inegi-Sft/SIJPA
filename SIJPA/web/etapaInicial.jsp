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
            String proceClave = "", posicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            if (request.getParameter("insertado") != null) {
                out.println("<script type='text/javascript'>alert('Error al insertar: Consulte al administrador del sistema');</script>");
            }

            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Inicial</h1>
            <form action="" method="post" name="formInicial" id="fromInicial">
                <label for="idProcesado">Id Adolescente</label>
                <input class="txtMedia" name="idProcesado" id="idProcesado" value="<%=proceClave%>" readonly />
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                <fieldset>
                    <legend>Características de la etapa inical</legend>
                    <div class="colsA">
                        <label for="audiInicial">¿Hubo audiencia inicial?</label>
                        <select class="txtMedia" name="audiInicial" id="audiInicial" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dCtrlDetencion">
                        <label for="ctrlDetencion">¿Hubo control de detención?</label>
                        <select class="txtMedia" name="ctrlDetencion" id="ctrlDetencion" required>
                            <option value="">--Seleccione--</option>
                            <% lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dLegalDeten">
                        <label for="legalDeten">¿Se calificó como legal la detención?</label>
                        <select class="txtMedia" name="legalDeten" id="legalDeten" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dFechaAutoLiber" >
                        <label for="fechaAutoLiber" id="lblFechaAutoLiber">Fecha en que se dictó el auto de libertad por no ratificar como legal la detención</label>
                        <input type="date" name="fechaAutoLiber" id="fechaAutoLiber"/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaAutoLiber" onclick="fechaNoIdent('#chkFechaAutoLiber', '#fechaAutoLiber')"><label>No identificada</label>
                        </div> 
                    </div>
                    <div class="colsA oculto" id="dFormuImputa">
                        <label for="formuImputa">¿Hubo formulación de la imputación?</label>
                        <select class="txtMedia" name="formuImputa" id="formuImputa" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <table class="tablaFormu oculto" id="tblimputacion">
                        <tr>
                            <td>
                                <div class="colsA">
                                    <label for="fechaFormuImpu">Fecha de formulación de la imputacion</label>
                                    <input type="date" name="fechaFormuImpu" id="fechaFormuImpu" required/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaFormuImpu" onclick="fechaNoIdent('#chkFechaFormuImpu', '#fechaFormuImpu')"><label>No identificada</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <fieldset class="colsA subField">
                                    <div class="colsA">
                                        <label for="declaro">¿El adolescente declaró?</label>
                                        <select class="txtMedia" name="declaro" id="declaro" onchange="respuestaSimpleFecha('#declaro', '#lbfechDeclara1', '#fechDeclara', '#chkFechDeclara')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="lbfechDeclara1" >
                                        <label for="lbfechDeclara" id="lbfechDeclara">Fecha de declaración</label>
                                        <input type="date" name="fechDeclara" id="fechDeclara" class="depenFecha"/>
                                        <div class="noIdentificada" id="chkDeclara">
                                            <input type="checkbox" id="chkFechDeclara" onclick="fechaNoIdent('#chkFechDeclara', '#fechDeclara')"><label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset> 
                            </td>
                            <td>
                                <fieldset class="colsA subField">
                                    <div class="colsA">
                                        <label for="huboPlazo">¿Hubo plazo constitucional?</label>
                                        <select class="txtMedia" name="huboPlazo" id="huboPlazo" onchange="respuestaSelect('#huboPlazo', '#lbPlazo1', '#plazo')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="lbPlazo1">
                                        <label for="plazo" id="lbPlazo">Tiempo del plazo constitucional</label>
                                        <select class="txtMedia dependiente" name="plazo" id="plazo">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPlazoConstitucional();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <fieldset class="colsA subField">
                                    <div  class="colsA">
                                        <label for="autoVin">Resolución del auto de vinculación a proceso</label>
                                        <select class="txtMedia" name="autoVin" id="autoVin"  required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findAutoVinculacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" ID="dfechAuto">
                                        <label for="fechAuto" id="lblFechaAuto">Fecha en que se dictó el auto de vinculación a proceso</label>
                                        <input type="date" name="fechAuto" id="fechAuto" class="depenFecha"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaAuto" onclick="fechaNoIdent('#chkFechaAuto', '#fechAuto')"/><label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                    <fieldset class="subField oculto" id="fMedidaCaute">
                        <legend>Medidas Cautelares Impuestas</legend>
                        <label for="drecretaMC" >¿Se impuso medida cautelar?</label>
                        <select class="txtMedia" name="drecretaMC" id="drecretaMC"  required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                        <div id="tabMedidaCautelar" >
                            <table class="tablasRegis" id="tableMcau">
                                <tr>
                                    <th width="20">Id</th>
                                    <th width="450">Medida Cautelar</th>
                                    <th width="70">Decretada</th>
                                </tr>
                                <%
                                    lista = cat.findMedidasCautelares();
                                    for (String[] ls : lista) {
                                        out.println("<tr>");
                                        out.println("<td>" + ls[0] + "</td>");
                                        out.println("<td>" + ls[1] + "</td>");
                                        out.println("<td>");
                                        out.println("<input type='checkbox' name='apliMedidaCau' id='apliMedidaCau" + ls[0] + "' value='" + ls[0] + "' />");
                                        out.println("</td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </table>
                        </div>
                        <div id="especifiqueMC" class="oculto">
                            <table class="tablaFormu">
                                <tr>
                                    <td>
                                        <label for="MCespecifi" >Especifique otra medida cautelar:</label>
                                    </td>
                                    <td>
                                        <textarea cols="125" rows="4" id="MCespecificar" name="MCespecificar"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                    <fieldset class="colsA subField oculto" id="fPlazo">
                        <div class="colsA">
                            <label for="soliPlazo">¿Se solicitó el plazo para el cierre de investigación complementaria?</label>
                            <select class="txtMedia" name="soliPlazo" id="soliPlazo" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dfechSoliPlazo1">
                            <label for="fechSoliPlazo" id="lbfechSoliPlazo"> Fecha de la solicitud del plazo para el cierre de la investigación</label>
                            <input type="date" name="fechSoliPlazo" id="fechSoliPlazo" class="depenFecha"/>
                            <div class="noIdentificada" id="chkfechSoliPlazo">
                                <input type="checkbox" id="chkFechSoliPlazo" onclick="fechaNoIdent('#chkFechSoliPlazo', '#fechSoliPlazo')"><label>No identificada</label>
                            </div>
                        </div>
                        <div class="colsA oculto" id="dsoliProrroga">
                            <label for="soliProrroga">¿Se autorizo prórroga del plazo para el cierre de la investigación?</label>
                            <select class="txtMedia" name="soliProrroga" id="soliProrroga"  required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dplazoFijadoC">
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
                        </div>
                    </fieldset>
                    <div class="colsA oculto" id="dCierre">
                        <label for="fechCierreI" >Fecha del cierre de la investigación</label>
                        <input type="date" name="fechCierreI" id="fechCierreI" required/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechCierreI" onclick="fechaEnProceso('#chkFechCierreI', '#chkEnProceso', '#fechCierreI')"><label>No identificada</label><br/>
                            <input type="checkbox"  id="chkEnProceso" onclick="fechaEnProceso('#chkFechCierreI', '#chkEnProceso', '#fechCierreI')" ><label>En proceso de investigación</label>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="oculto" id="consePlazo">
                    <legend>Consecuencias de la conclusión del plazo de la investigación complementaria</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <div class="colsA">
                                    <label for="dictoSobresei">¿Se dictó el sobreseimiento de la causa penal?</label>
                                    <select class="txtMedia" name="dictoSobresei" id="dictoSobresei" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td>
                                <fieldset class="colsA subField oculto" id="fSuspencion">
                                    <div class="colsA">
                                        <label for="suspenProceso">¿Se dictó suspensión del proceso?</label>
                                        <select class="txtMedia" name="suspenProceso" id="suspenProceso" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="dcausasSuspension">
                                        <label for="causasSuspension">Causas de la suspensión del proceso</label>
                                        <select class="txtMedia" name="causasSuspension" id="causasSuspension" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findCausaSuspencion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <fieldset class="colsA subField oculto" ID="dReapertura">
                                    <div class="colsA">
                                        <label for="huboReapertura">¿Hubo reapertura del proceso?</label>
                                        <select class="txtMedia" name="huboReapertura" id="huboReapertura" required>
                                            <option value="">--Seleccione--</option>
                                            <%  lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="dfechaReapertura" >
                                        <label for="fechaReapertura" id="lbfechSoliPlazo">Fecha de la reapertura del proceso</label>
                                        <input type="date" name="fechaReapertura" id="fechaReapertura"/>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaReapertura" onclick="fechaNoIdent('#chkFechaReapertura', '#fechaReapertura')"><label>No identificada</label>
                                        </div>
                                    </div>
                                    <div class="colsA oculto" id="dquienSoliApertura">
                                        <label for="quienSoliApertura">¿Quién solicitó la reapertura?</label>
                                        <select class="txtMedia" name="quienSoliApertura" id="quienSoliApertura" required>
                                            <option value="">--Seleccione--</option>
                                            <%  
                                                lista = cat.findFiguraProceso();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }

                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <div class="colsA oculto" id="dAcusacion">
                                    <label for="formulaAcusacion">¿Se formuló acusación?</label>
                                    <select class="txtMedia" name="formulaAcusacion" id="formulaAcusacion" required>
                                        <option value="">--Seleccione--</option>
                                        <%                                    lista = cat.findRespuestaSimple();
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
                <!--</fieldset>-->
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante" onclick="return medidasCaute('#drecretaMC')"/>
            </form>
        </section>
        <script> $("#formulaAcusacion > option[value=9]").hide(); </script>
    </body>
</html>