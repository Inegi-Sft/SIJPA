<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showConclusiones"%>
<%@page import="clasesAuxiliar.showInicial"%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Resoluciones</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesConc.js"></script>
        <%
            catalogos cat = new catalogos();
            showConclusiones sConclu = new showConclusiones();
            showInicial inicial = new showInicial();
            showProcesados proce = new showProcesados();
            ArrayList<String[]> lista, conclusiones,concluPA = new ArrayList();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadClave = (String) session.getAttribute("juzgadoClave");
            String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
            String jEntidad = jDividido[0];
            String jMunicipio = jDividido[1];
            String jNumero = jDividido[2];
            String jConcatenado = jEntidad + jMunicipio + jNumero;
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String fechaResol = "";
            String tipoResol = "";
            String sobreseimto = "";
            String proceSobre = "";
            String excluAccion = "";
            String susCondicional = "";
            String fechaSuspen = "";
            String mecanisAcuer = "";
            String fechaAcuerdo = "";
            String tipoProceAb = "";
            String medidaPriva = "";
            String medidaNoPriva = "";
            String tiempoInter = "";
            String reparaDanio = "";
            String tipoRepara = "";
            String montoRepara = "";
            String impugna = "";
            String tipoImpugna = "";
            String fechaImpugna = "";
            String persoImpugna = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    conclusiones = sConclu.findConclusion(causaClave, proceClave + jConcatenado);
                    if(conclusiones.size() > 0){
                        operacion = "actualizar";
                        fechaResol = conclusiones.get(0)[0];
                        tipoResol = conclusiones.get(0)[1];
                        sobreseimto = conclusiones.get(0)[2];
                        proceSobre = conclusiones.get(0)[3];
                        excluAccion = conclusiones.get(0)[4];
                        susCondicional = conclusiones.get(0)[5];
                        fechaSuspen = conclusiones.get(0)[6];
                        mecanisAcuer = conclusiones.get(0)[7];
                        fechaAcuerdo = conclusiones.get(0)[8];
                        tipoProceAb = conclusiones.get(0)[9];
                        medidaPriva = conclusiones.get(0)[10];
                        medidaNoPriva = conclusiones.get(0)[11];
                        tiempoInter = conclusiones.get(0)[12];
                        reparaDanio = conclusiones.get(0)[13];
                        tipoRepara = conclusiones.get(0)[14];
                        montoRepara = conclusiones.get(0)[15];
                        impugna = conclusiones.get(0)[16];
                        tipoImpugna = conclusiones.get(0)[17];
                        fechaImpugna = conclusiones.get(0)[18];
                        persoImpugna = conclusiones.get(0)[19];
                        comen = conclusiones.get(0)[20];
                    }
                }
            }
            
            //Control si es cptura verifica cual es tu tipo de resolucion en etapa inicial si es que tiene
            String tipoResIn = "";//variable donde guardaremos si en inicial o intermedia ya tiene conclusion
            if(!proceClave.equals("")){
                tipoResIn = inicial.verificaSobreAperturaJO(causaClave, proceClave + jConcatenado);
                if(!tipoResIn.equals("")){
                    tipoResol = tipoResIn;
                }
                System.out.println("Tipo res: " + tipoResol);
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el juez de control</h1>
            <form method="post" name="formConclusiones" id="formConclusiones">
                <label for="procesado">Id Adolescente</label>
                <% 
                    //Si recibimos el procesado obligado en conclusion lo imprimimos sin poder editar
                    if(!proceClave.equals("")){
                        out.println("<input type='text' name='proceClave' id='proceClave' value='" + proceClave + "' readonly>");
                        out.println("<input type='hidden' name='posicion' id='posicion' value='" + posicion + "'>");
                        out.println("<input type='hidden' name='opera' id='opera' value='" + operacion + "'>");
                    }else{//Si el procesado no esta obligado en conclusion entonces puede escoger de una lista
                        out.println("<select name='proceClave' id='proceClave' onchange='formConclusiones.submit();' required>");
                        out.println("<option value=''>--Seleccione--</option>");
                        lista = inicial.findCausaEtapa(causaClave,5);//Buscamos las etapas a nivel de causa sean 4.volando
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0].replace(jConcatenado, "") + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                        }
                        out.println("</select>");
                    }
                %>
                <fieldset>
                    <legend>Resolución</legend>
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso" value="<%=fechaResol%>" max="<%=fechas%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="resolucion">Tipo de resolución (Conclusión o terminación)</label>
                        <select name="resolucion" id="resolucion" required>
                            <option value="">--Seleccione--</option>
                            <%  
                                lista = cat.findTipoResolucion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoResol)){
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
                            <select name="tipoSobreseimto" id="tipoSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(sobreseimto)){
                                            out.println(" selected ");
                                        }
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
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(proceSobre)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dExcluAccion"  >
                            <label for="excluAccion" class="lblExBig">Causas de exclusión de la acción penal</label>
                            <select name="excluAccion" id="excluAccion">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findExclusionAccionp();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(excluAccion)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsSuspCP">
                        <legend>Suspensión condicional del proceso</legend>
                        <div class="colsA">
                            <label for="tipoCondiSCP">Tipo de condiciones impuestas durante la suspensión condicional del proceso</label>
                            <select name="tipoCondiSCP" id="tipoCondiSCP">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSuspensionCondicional();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(susCondicional)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtAP" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento
                                de las condiciones establecidas en la suspensión condicional del proceso</label>
                            <input type="date" name="fechaExtSCP" id="fechaExtSCP" value="<%=fechaSuspen%>">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtSCP" onclick="fechaNoIdent('#chkFechaExtSCP', '#fechaExtSCP')">
                                <label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsAcuerdoR">
                        <legend>Acuerdo reparatorio</legend>
                        <div class="colsA">
                            <label for="tipoMecanismoAR">Tipo de mecanismo por el que se llegó al acuerdo reparatorio</label>
                            <select name="tipoMecanismoAR" id="tipoMecanismoAR" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findAcuerdoRepara();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(mecanisAcuer)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtinAR" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento
                                de las obligaciones pactadas en el acuerdo reparatorio</label>
                            <input type="date" name="fechaExtinAR" id="fechaExtinAR" value="<%=fechaAcuerdo%>">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtinAR" onclick="fechaNoIdent('#chkFechaExtinAR', '#fechaExtinAR')">
                                <label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsProceAbreviado">
                        <legend>Procedimiento abreviado</legend>
                        <div class="cols" id="dTipoResolucionPA" >
                            <label for="tipoResolucionPA">Tipo de resolución en el procedimiento abreviado</label>
                            <select name="tipoResolucionPA" id="tipoResolucionPA">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findProcAbreviado();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tipoProceAb)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaPL">
                            <label for="tipoMedidaPL">Tipo de medidas privativa de la libertad</label>
                            <select name="tipoMedidaPL" id="tipoMedidaPL">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPrivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(medidaPriva)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaNPL">
                            <label for="tipoMedidaNPL" id="DtipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                            <select name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findNoprivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(medidaNoPriva)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="Dinternamiento">
                            <label for="internamiento">Tiempo en internamiento</label>
                            <select name="internamiento" id="internamiento">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTiempoInternamiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tiempoInter)){
                                            out.println(" selected ");
                                        }
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
                                lista = proce.findProcesadoDelitos(causaClave, proceClave + jConcatenado);
                                for(int i = 0; i < lista.size(); i++){
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(lista.get(i)[1] + "<input type='hidden' name='delitoConclu' value='" + lista.get(i)[0] + "'>");
                                    out.println("</td>");
                                    concluPA = sConclu.findConcluPA(causaClave, proceClave + jConcatenado, lista.get(i)[0]);
                                    if(concluPA.size() != 0){
                                        int resolucionPA = Integer.parseInt(concluPA.get(0)[0]);
                                        String dConclusion = concluPA.get(0)[1];
                                        switch (resolucionPA){
                                            case 1:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                break;
                                            case 2:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                break;
                                            case 3:
                                                if(dConclusion.equals("1")){
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                }else{
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                }
                                                break;
                                            case 9:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia' checked></td>");
                                                break;
                                        }
//                                        if(concluAP.equals("1")){
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
//                                        }else{
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
//                                        }
//                                        if(concluAP.equals("2")){
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
//                                        }else{
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
//                                        }
//                                        if(concluAP.equals("9")){
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia' checked></td>");
//                                        }else{
//                                            out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
//                                        }
                                    }else{
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                    }
                                    out.println("</tr>");
                                }
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(reparaDanio)){
                                        out.println(" selected ");
                                    }
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoRepara)){
                                        out.println(" selected ");
                                    }
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(montoRepara)){
                                        out.println(" selected ");
                                    }
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(impugna)){
                                        out.println(" selected ");
                                    }
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoImpugna)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dFechaImpugna">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" value="<%=fechaImpugna%>">
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
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(persoImpugna)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"><%=comen%></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
        <% if(!tipoResIn.equals("")){ %>
            <script type="text/javascript"> 
                $(document).ready(function(){ 
                    //tipoResolucion(); 
                    $("#resolucion option:not(:selected)").attr("disabled", "disabled");
                });
            </script>
        <%  } %>
    </body>
</html>
