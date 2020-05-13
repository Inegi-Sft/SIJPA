<%-- 
    Document   : conclusionesJO
    Created on : 4/05/2020, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::ResolucionesJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnConclusionesJO.js"></script>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
          
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el tribunal de enjuiciamiento</h1>
            <form action="conclusionesJO.jsp" method="post" name="formConclusionesJO" id="formConclusionesJO">
                <label for="procesado">Id Adolescente</label>
                <select name="proceClave" id="proceClave" required>
                    <option value="">--Seleccione--</option>
                </select>
                <fieldset>
                    <legend>Resolución</legend>
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso" value="" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="resolucion">Tipo de resolución (Conclusión o terminación)</label>
                        <select name="resolucion" id="resolucion" onchange="tipoResolucion()" required>
                            <option value="">--Seleccione--</option>
                            <%  
                                lista = cat.findTipoResolucionJO();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(tipoResol)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols">
                        <label for="fechaSenten">Fecha de lectura y explicación de la sentencia</label>
                        <input type="date" name="fechaSenten" id="fechaSenten" value="" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaSenten" onclick="fechaNoIdent('#chkFechaSenten', '#fechaSenten')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <fieldset class="oculto subField" id="flsSobreseimto">
                        <legend>Sobreseimiento</legend>
                        <div class="cols" id="idSobre" >
                            <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                            <select name="tipoSobreseimto" id="tipoSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(sobreseimto)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="proceSobre"  >
                            <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                            <select name="proceSobreseimto" id="proceSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(proceSobre)){
//                                            out.println(" selected ");
//                                        }
                                        out.print( ">" + ls[0]+ ".- ");
                                        if(ls[0].equals("6"))
                                            out.print("Se hubiere extinguido la acción penal ");
                                        else
                                            out.println(ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dExcluAccion"  >
                            <label for="excluAccion" class="lblExBig">Causas de extinción de la acción penal</label>
                            <select name="excluAccion" id="excluAccion">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findExclusionAccionp();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(excluAccion)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    
                    <fieldset class="oculto subField" id="flsSentencia">
                        <legend>Sentencia</legend>
                        <div class="cols" id="dTipoSentencia" >
                            <label for="tipoSentencia">Tipo de resolucion</label>
                            <select name="tipoSentencia" id="tipoSentencia" onchange="sentencia();">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findProcAbreviado();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(tipoProceAb)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaPL">
                            <label for="tipoMedidaPL">Tipo de medida privativa de la libertad</label>
                            <select name="tipoMedidaPL" id="tipoMedidaPL">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPrivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(medidaPriva)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaNPL">
                            <label for="tipoMedidaNPL" id="lblTipoMedidaNPL">Tipo de medida no privativa de la libertad</label>
                            <select name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findNoprivativas();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(medidaNoPriva)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dInternamiento">
                            <label for="internamiento">Tiempo en internamiento</label>
                            <select name="internamiento" id="internamiento">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTiempoInternamiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(tiempoInter)){
//                                            out.println(" selected ");
//                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <br/>
                        <table class="tablasRegis" id="tblDConclusiones">
                            <tr>
                                <th>Delitos atribuidos al adolescente</th>
                                <th>Privativo</th>
                                <th>No privativo</th>
                                <th>No identificado</th>
                            </tr>
                            <%
                                /*lista = proce.findProcesadoDelitos(causaClave, proceClave + jConcatenado);
                                for(int i = 0; i < lista.size(); i++){
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(lista.get(i)[1] + "<input type='hidden' name='delitoConclu' value='" + lista.get(i)[0] + "'>");
                                    out.println("</td>");
                                    concluPA = sConclu.findConcluPA(causaClave, proceClave + jConcatenado, lista.get(i)[0]);
                                    if(concluPA.size() != 0){
                                        String concluAP = concluPA.get(0);
                                        if(concluAP.equals("1")){
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
                                        }else{
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                        }
                                        if(concluAP.equals("2")){
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
                                        }else{
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                        }
                                        if(concluAP.equals("9")){
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia' checked></td>");
                                        }else{
                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                        }
                                    }else{
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                    }
                                    out.println("</tr>");
                                }*/
                            %>
                        </table>
                    </fieldset>
                </fieldset>
                <fieldset id="flsReparaDanio">
                    <legend>Reparación del daño</legend>
                    <div class="cols">
                        <label for="reparaDanio">¿Hubo reparación del daño?</label>
                        <select name="reparaDanio" id="reparaDanio" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(reparaDanio)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoRepara" >
                        <label for="tipoReparaD">Tipo de reparación del daño</label>
                        <select name="tipoReparaD" id="tipoReparaD">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findReparacionDano();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(tipoRepara)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dMontoRepara" >
                        <label for="montoReparaD">Monto de la reparación del daño impuesta</label>
                        <select name="montoReparaD" id="montoReparaD">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findMulta();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(montoRepara)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <fieldset id="flsImpugnacion">
                    <legend>Impugnación</legend>
                    <div class="cols">
                        <label for="impugnacion">¿La resolución fue impugnada?</label>
                        <select name="impugnacion" id="impugnacion" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(impugna)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoImpugna">
                        <label for="tipoImpugnacion">Tipo de impugnación</label>
                        <select name="tipoImpugnacion" id="tipoImpugnacion">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoImpugnacion();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(tipoImpugna)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dFechaImpugna">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" value="">
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaImpugnacion" onclick="fechaNoIdent('#chkFechaImpugnacion', '#fechaImpugnacion')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols oculto" id="dQuienImpugna">
                        <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                        <select name="personaImpugna" id="personaImpugna">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findFiguraProceso();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(persoImpugna)){
//                                        out.println(" selected ");
//                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
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
        <% /*if(!tipoResol.equals("")){ %>
            <script type="text/javascript"> 
//                $(document).ready(function(){ 
//                    //tipoResolucion(); 
//                    $("#resolucion option:not(:selected)").attr("disabled", "disabled");
//                });
            </script>
        <%  } */%>
    </body>
</html>
