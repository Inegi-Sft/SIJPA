<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showInicial"%>
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
            showInicial proCon=new showInicial();
            ArrayList<String[]> lista = new ArrayList();
            
            String entidad =(String) sesion.getAttribute("entidad");
            String municipio =(String) sesion.getAttribute("municipio");
            String numero =(String) sesion.getAttribute("numero");
            String jConcatenado =entidad+municipio+numero;
            String causaClave =(String) sesion.getAttribute("causaClave");
            
            String procesado = request.getParameter("idProcesado");
            String tResolucion = proCon.verificaSobreseimientoAperturaJO(causaClave+jConcatenado, procesado);
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el juez de control</h1>
            <form action="conclusiones.jsp" method="post" name="formConclusiones" id="formConclusiones">
                <label for="procesado">Id Adolescente</label>
                <select class="lblExBig" name="idProcesado" id="idProcesado" onchange="formConclusiones.submit();" required>
                    <option value="">--Seleccione--</option>
                    <%  lista = proce.listProcesadoInsertConclusion(causaClave+jConcatenado);
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'");
                            if(ls[0].equals(procesado)){
                                out.println(" selected ");
                            }
                            out.println( ">" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                        }
                    %> 
                </select>
                <fieldset>
                    <legend>Resolución</legend>
                    
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso" required />
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="resolucion">Tipo de resolución (Conclusión o terminación)</label>
                        <select class="txtLong" name="resolucion" id="resolucion" onchange="tipoResolucion();" required>
                            <option value="">--Seleccione--</option>
                            <%  
                                lista = cat.findTipoResolucion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tResolucion)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <fieldset class="oculto subField" id="flsSobreseimto">
                        <legend>Sobreseimiento</legend>
                        <div class="cols" id="idSobre" >
                            <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                            <select class="txtMedia" name="tipoSobreseimto" id="tipoSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="proceSobre"  >
                            <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                            <select class="txtLong" name="proceSobreseimto" id="proceSobreseimto" onchange="causasExclusion();">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="dExcluAccion"  >
                            <label for="excluAccion" class="lblExBig">Causas de exclusión de la acción penal</label>
                            <select class="txtLong" name="excluAccion" id="excluAccion">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findExclusionAccionp();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsSuspCP">
                        <legend>Suspensión condicional del proceso</legend>
                        <div class="colsA">
                            <label for="tipoCondiSCP">Tipo de condiciones impuestas durante la suspensión condicional del proceso</label>
                            <select class="txtMedia" name="tipoCondiSCP" id="tipoCondiSCP" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSuspensionCondicional();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtAP" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento de las condiciones establecidas en la suspensión condicional del proceso</label>
                            <input type="date" name="fechaExtSCP" id="fechaExtSCP" required/>
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtSCP" onclick="fechaNoIdent('#chkFechaExtSCP', '#fechaExtSCP')"><label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsAcuerdoR">
                        <legend>Acuerdo reparatorio</legend>
                        <div class="colsA">
                            <label for="tipoMecanismoAR">Tipo de mecanismo por el que se llegó al acuerdo reparatorio</label>
                            <select class="txtMedia" name="tipoMecanismoAR" id="tipoMecanismoAR" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findAcuerdoRepara();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtinAR" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento de las obligaciones pactadas en el acuerdo reparatorio</label>
                            <input type="date" name="fechaExtinAR" id="fechaExtinAR" required/>
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtinAR" onclick="fechaNoIdent('#chkFechaExtinAR', '#fechaExtinAR')"><label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsProceAbreviado">
                        <legend>Procedimiento abreviado</legend>
                        <div class="cols" id="dTipoResolucionPA" >
                            <label for="tipoResolucionPA">Tipo de resolución en el procedimiento abreviado</label>
                            <select class="txtLong" name="tipoResolucionPA" id="tipoResolucionPA" onchange="tipoProcedimientoAbrev()">
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
                            <select class="txtMedia" name="tipoMedidaPL" id="tipoMedidaPL"  onchange="rInternamiento()" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPrivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaNPL">
                            <label for="tipoMedidaNPL" id="DtipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                            <select class="txtMedia" name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findNoprivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="Dinternamiento">
                            <label for="internamiento">Tiempo en internamiento</label>
                            <select class="txtMedia" name="internamiento" id="internamiento">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTiempoInternamiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <br/><br/>
                        <table class="tablasRegis" id="tblDConclusiones" style="width:auto;">
                            <tr>
                                <th>Delitos atribuidos al adolescente</th>
                                <th width="100">Privativo</th>
                                <th width="130">No privativo</th>
                                <th width="130">No identificado</th>
                            </tr>
                            <%
                                lista = proce.findProcesadoDelitos(causaClave+jConcatenado, procesado);
                                for(int i=0;i<lista.size();i++){
                            %>
                                <tr>
                                    <td><%=lista.get(i)[1]%>
                                        <input type="hidden" name="delitoConclu" value="<%=lista.get(i)[0]%>">
                                    </td>
                                    <td><input type="radio" name="resolDelito<%=i%>" value="1"></td>
                                    <td><input type="radio" name="resolDelito<%=i%>" value="2"></td>
                                    <td><input type="radio" class="radValCambia" name="resolDelito<%=i%>" value="9"></td>
                                </tr>
                            <%
                                }
                            %> 
                        </table>
                    </fieldset>
                </fieldset>
                <fieldset id="flsReparaDanio">
                    <legend>Reparación del daño</legend>
                    <div class="cols">
                        <label for="reparaDanio">¿Hubo reparación del daño?</label>
                        <select class="txtMedia" name="reparaDanio" id="reparaDanio" onchange="respuestaRepara()" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoRepara" >
                        <label for="tipoReparaD">Tipo de reparación del daño</label>
                        <select class="txtMedia dependiente" name="tipoReparaD" id="tipoReparaD" onchange="pagoCosa()" >
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findReparacionDano();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dMontoRepara" >
                        <label for="montoReparaD">Monto de la reparación del daño impuesta</label>
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
                </fieldset>
                <fieldset id="flsImpugnacion">
                    <legend>Impugnación</legend>
                    <div class="cols">
                        <label for="impugnacion">¿La resolución fue impugnada?</label>
                        <select class="txtMedia" name="impugnacion" id="impugnacion" onchange="impugna()" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoImpugna">
                        <label for="tipoImpugnacion">Tipo de impugnación</label>
                        <select class="txtMedia dependiente" name="tipoImpugnacion" id="tipoImpugnacion">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoImpugnacion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dFechaImpugna">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" class="depenFecha"/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaImpugnacion" onclick="fechaNoIdent('#chkFechaImpugnacion', '#fechaImpugnacion')"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols oculto" id="dQuienImpugna">
                        <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                        <select class="txtMedia dependiente" name="personaImpugna" id="personaImpugna">
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
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
        <% if(procesado!=null && tResolucion!=""){ %>
            <script type="text/javascript"> 
                $(document).ready(function(){ 
                    tipoResolucion(); 
                    $("#resolucion option:not(:selected)").attr("disabled", "disabled");
                });
            </script>
        <%  } %>
    </body>
</html>
