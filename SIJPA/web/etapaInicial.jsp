<%-- 
    Document   : etapaInicial
    Created on : 2/10/2019, 12:00:12 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showInicial"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Inicial</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesIni.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            catalogos cat = new catalogos();
            showInicial sIni = new showInicial();
            ArrayList<String[]> lista, inicial, catMediCaute, catDuraMedida, decreMC, soliMedidas, mediDura = new ArrayList();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadoClave = (String) session.getAttribute("juzgadoClave");
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String audiInicial = "";
            String ctrlDeten = "";
            String detenLegal = "";
            String fechaLibertad = "";
            String formulaImpu = "";
            String fechaImputa = "";
            String impuDeclaro = "";
            String fechaDeclara = "";
            String plazoConsti = "";
            String tiempoPlazo = "";
            String autoVincula = "";
            String fechaAutoVin = "";
            String impusoMCaute = "";
            //String inveComplemen = "";
            //String fechaPlazoIn = "";
            String prorroPlazo = "";
            String plazoCierre = "";
            String fechaCierre = "";
            String sobreseim = "";
            String suspenProce = "";
            String causaSuspen = "";
            String huboReaper = "";
            String fechaReaper = "";
            String soliReaper = "";
            String acusacion = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    inicial = sIni.findInicial(causaClave, proceClave + juzgadoClave.replace("-", ""));
                    if(inicial.size() > 0){
                        operacion = "actualizar";
                        audiInicial = inicial.get(0)[0];
                        ctrlDeten = inicial.get(0)[1];
                        detenLegal = inicial.get(0)[2];
                        fechaLibertad = inicial.get(0)[3];
                        formulaImpu = inicial.get(0)[4];
                        fechaImputa = inicial.get(0)[5];
                        impuDeclaro = inicial.get(0)[6];
                        fechaDeclara = inicial.get(0)[7];
                        plazoConsti = inicial.get(0)[8];
                        tiempoPlazo = inicial.get(0)[9];
                        autoVincula = inicial.get(0)[10];
                        fechaAutoVin = inicial.get(0)[11];
                        impusoMCaute = inicial.get(0)[12];
                        //inveComplemen = inicial.get(0)[13];
                        //fechaPlazoIn = inicial.get(0)[14];
                        prorroPlazo = inicial.get(0)[13];
                        plazoCierre = inicial.get(0)[14];
                        fechaCierre = inicial.get(0)[15];
                        sobreseim = inicial.get(0)[16];
                        suspenProce = inicial.get(0)[17];
                        causaSuspen = inicial.get(0)[18];
                        huboReaper = inicial.get(0)[19];
                        fechaReaper = inicial.get(0)[20];
                        soliReaper = inicial.get(0)[21];
                        acusacion = inicial.get(0)[22];
                        comen = inicial.get(0)[23];
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Inicial</h1>
            <form action="" method="post" name="formInicial" id="fromInicial">
                <label for="idProcesado">Id Adolescente</label>
                <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly>
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                <fieldset>
                    <legend>Características de la etapa inical</legend>
                    <div class="colsA">
                        <label for="audiInicial">¿Hubo audiencia inicial?</label>
                        <select name="audiInicial" id="audiInicial" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(audiInicial)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dCtrlDetencion">
                        <label for="ctrlDetencion">¿Hubo control de detención?</label>
                        <select name="ctrlDetencion" id="ctrlDetencion">
                            <option value="">--Seleccione--</option>
                            <% lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(ctrlDeten)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dLegalDeten">
                        <label for="legalDeten">¿Se calificó como legal la detención?</label>
                        <select name="legalDeten" id="legalDeten">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(detenLegal)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="colsA oculto" id="dFechaAutoLiber" >
                        <label for="fechaAutoLiber" id="lblFechaAutoLiber">
                            Fecha en que se dictó el auto de libertad por no ratificar como legal la detención</label>
                        <input type="date" name="fechaAutoLiber" id="fechaAutoLiber" value="<%=fechaLibertad%>">
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaAutoLiber" onclick="fechaNoIdent('#chkFechaAutoLiber', '#fechaAutoLiber')">
                            <label>No identificada</label>
                        </div> 
                    </div>
                    <div class="colsA oculto" id="dFormuImputa">
                        <label for="formuImputa">¿Hubo formulación de la imputación?</label>
                        <select name="formuImputa" id="formuImputa" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(formulaImpu)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <table class="tablaFormu oculto" id="tblimputacion">
                        <tr>
                            <td>
                                <div class="colsA">
                                    <label for="fechaFormuImpu">Fecha de formulación de la imputacion</label>
                                    <input type="date" name="fechaFormuImpu" id="fechaFormuImpu" value="<%=fechaImputa%>">
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaFormuImpu" onclick="fechaNoIdent('#chkFechaFormuImpu', '#fechaFormuImpu')">
                                        <label>No identificada</label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <fieldset class="colsA subField">
                                    <div class="colsA">
                                        <label for="declaro">¿El adolescente declaró?</label>
                                        <select name="declaro" id="declaro" 
                                                onchange="respuestaSimpleFecha('#declaro', '#lbfechDeclara1', '#fechDeclara', '#chkFechDeclara')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(impuDeclaro)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="lbfechDeclara1" >
                                        <label for="lbfechDeclara" id="lbfechDeclara">Fecha de declaración</label>
                                        <input type="date" name="fechDeclara" id="fechDeclara" value="<%=fechaDeclara%>">
                                        <div class="noIdentificada" id="chkDeclara">
                                            <input type="checkbox" id="chkFechDeclara" onclick="fechaNoIdent('#chkFechDeclara', '#fechDeclara')">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset> 
                            </td>
                            <td>
                                <fieldset class="colsA subField">
                                    <div class="colsA">
                                        <label for="huboPlazo">¿Hubo plazo constitucional?</label>
                                        <select name="huboPlazo" id="huboPlazo" onchange="respuestaSelect('#huboPlazo', '#lbPlazo1', '#plazo')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(plazoConsti)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="lbPlazo1">
                                        <label for="plazo" id="lbPlazo">Tiempo del plazo constitucional</label>
                                        <select name="plazo" id="plazo">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPlazoConstitucional();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(tiempoPlazo)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
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
                                        <select name="autoVin" id="autoVin"  required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findAutoVinculacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(autoVincula)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" ID="dfechAuto">
                                        <label for="fechAuto" id="lblFechaAuto">Fecha en que se dictó el auto de vinculación a proceso</label>
                                        <input type="date" name="fechAuto" id="fechAuto" class="depenFecha" value="<%=fechaAutoVin%>">
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaAuto" onclick="fechaNoIdent('#chkFechaAuto', '#fechAuto')">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                    <fieldset class="subField oculto" id="fMedidaCaute">
                        <legend>Medidas Cautelares Impuestas</legend>
                        <label for="drecretaMC">¿Se impuso medida cautelar?</label>
                        <select name="drecretaMC" id="drecretaMC">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(impusoMCaute)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                        <table  class="tablasRegis oculto" id="tableMcau">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tipos de Medidas Cautelares</th>
                                    <th>Fue decretada</th>
                                    <th>Quien solicita la Medida Cautelar</th>
                                    <th>Duración de la Medida Cautelar Decretada</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                lista = cat.findMedidasCautelares();
                                for (String[] ls : lista) {
                                    out.println("<tr>");
                                    out.println("<td>" + ls[0]);
                                    out.println("<div class='divMC' id='divMC" + ls[0] + "'>");
                                    out.println(ls[1]);
                                    out.println("</div>");
                                    out.println("</td>");
                                    out.println("<td class='descMedi' data-coord='" + ls[0] + "' style='text-align: left;'>" + ls[1]);
                                    decreMC = sIni.findDecretaMedi(causaClave, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                                    if(ls[0].equals("13")){//Agregamos el campo especifique al indice 13.-Otra
                                        if(decreMC.size() > 0){
                                            out.println("<input type='text' id='especiMC' name='especiMC' value='" + decreMC.get(0)[3] + "'>");
                                        }else{
                                            out.println("<input type='text' id='especiMC' name='especiMC' class='oculto' value=''>");
                                        }
                                    }
                                    out.println("</td>");
                                    if(decreMC.size() > 0){//Se consulta para la recuperacion de datos
                                        out.println("<td><input type='checkbox' name='chkDecretaMC' id='chkDecretaMC' value='" + ls[0] + "' checked></td>");
                                    }else{
                                        out.println("<td><input type='checkbox' name='chkDecretaMC' id='chkDecretaMC' value='" + ls[0] + "'></td>");
                                    }
                                    out.println("<td><select class='txtMedia' id='soliMedida"+ ls[0] +"' name='soliMedida' disabled>");
                                    out.println("<option value=''>--Seleccione--</option>");
                                    lista = cat.findMedidasSolicita();
                                    for (String[] lis : lista) {
                                        out.println("<option value='" + lis[0] + "'");
                                        if(decreMC.size() > 0){//Solo entramos si la consulta trae datos
                                            if(lis[0].equals(decreMC.get(0)[1])){
                                                out.println(" selected ");
                                            }
                                        }
                                        out.println(">" + lis[0] + ".- " + lis[1] + "</option>");
                                    }
                                    out.println("</select></td>");
                                    out.println("<td><select class='duraMedi txtMedia' id='duraMedida"+ ls[0] +"' name='duraMedida' disabled>");
                                    out.println("<option value=''>--Seleccione--</option>");
                                    lista = cat.findMedidasDuracion();
                                    for (String[] lis : lista) {
                                        out.println("<option value='" + lis[0] + "'");
                                        if(decreMC.size() > 0){//Solo entramos si la consulta trae datos
                                            if(lis[0].equals(decreMC.get(0)[2])){
                                                out.println(" selected ");
                                            }
                                        }
                                        out.println(">" + lis[0] + ".- " + lis[1] + "</option>");
                                    }
                                    out.println("</select></td>");
                                    out.println("</tr>");
                                }
                            %>
                            </tbody>
                        </table>
                    </fieldset>
                    <fieldset class="colsA subField oculto" id="fPlazo">
                        <div class="colsA" id="dplazoFijadoC">
                            <label for="plazoFijadoC">Plazo fijado para el cierre de la investigación</label>
                            <select name="plazoFijadoC" id="plazoFijadoC">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPlazoCierre();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(plazoCierre)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA" id="dsoliProrroga">
                            <label for="soliProrroga">¿Se autorizo prórroga del plazo para el cierre de la investigación?</label>
                            <select name="soliProrroga" id="soliProrroga">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(prorroPlazo)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA" id="dCierre">
                            <label for="fechCierreI" >Fecha del cierre de la investigación</label>
                            <input type="date" name="fechCierreI" id="fechCierreI" value="<%=fechaCierre%>"/>
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechCierreI" onclick="fechaEnProceso('#chkFechCierreI', '#chkEnProceso', '#fechCierreI')">
                                <label>No identificada</label><br/>
                                <input type="checkbox"  id="chkEnProceso" onclick="fechaEnProceso('#chkFechCierreI', '#chkEnProceso', '#fechCierreI')">
                                <label>En proceso de investigación</label>
                            </div>
                        </div>
<!--                        <div class="colsA">
                            <label for="soliPlazo">¿Se solicitó el plazo para el cierre de investigación complementaria?</label>
                            <select name="soliPlazo" id="soliPlazo" required>
                                <option value="">--Seleccione--</option>
                                <%--
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(inveComplemen)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                --%> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dfechSoliPlazo1">
                            <label for="fechSoliPlazo" id="lbfechSoliPlazo"> Fecha de la solicitud del plazo para el cierre de la investigación</label>
                            <input type="date" name="fechSoliPlazo" id="fechSoliPlazo" value="<%--=fechaPlazoIn--%>">
                            <div class="noIdentificada" id="chkfechSoliPlazo">
                                <input type="checkbox" id="chkFechSoliPlazo" onclick="fechaNoIdent('#chkFechSoliPlazo', '#fechSoliPlazo')">
                                <label>No identificada</label>
                            </div>
                        </div>-->
                    </fieldset>
                </fieldset>
                <fieldset class="oculto" id="consePlazo">
                    <legend>Consecuencias de la conclusión del plazo de la investigación complementaria</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <div class="colsA">
                                    <label for="dictoSobresei">¿Se dictó el sobreseimiento de la causa penal?</label>
                                    <select name="dictoSobresei" id="dictoSobresei" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(sobreseim)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td>
                                <fieldset class="colsA subField oculto" id="fSuspencion">
                                    <div class="colsA">
                                        <label for="suspenProceso">¿Se dictó suspensión del proceso?</label>
                                        <select name="suspenProceso" id="suspenProceso">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(suspenProce)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="dcausasSuspension">
                                        <label for="causasSuspension">Causas de la suspensión del proceso</label>
                                        <select name="causasSuspension" id="causasSuspension">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findCausaSuspencion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(causaSuspen)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <fieldset class="colsA oculto" id="dReapertura">
                                    <div class="colsA">
                                        <label for="huboReapertura">¿Hubo reapertura del proceso?</label>
                                        <select name="huboReapertura" id="huboReapertura" required>
                                            <option value="">--Seleccione--</option>
                                            <%  lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(huboReaper)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="dfechaReapertura" >
                                        <label for="fechaReapertura" id="lbfechSoliPlazo">Fecha de la reapertura del proceso</label>
                                        <input type="date" name="fechaReapertura" id="fechaReapertura" value="<%=fechaReaper%>">
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaReapertura" onclick="fechaNoIdent('#chkFechaReapertura', '#fechaReapertura')">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                    <div class="colsA oculto" id="dquienSoliApertura">
                                        <label for="quienSoliApertura">¿Quién solicitó la reapertura?</label>
                                        <select name="quienSoliApertura" id="quienSoliApertura" required>
                                            <option value="">--Seleccione--</option>
                                            <%  
                                                lista = cat.findFiguraProceso();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(soliReaper)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <div class="colsA oculto" id="dAcusacion">
                                    <label for="formulaAcusacion">¿Se formuló acusación?</label>
                                    <select name="formulaAcusacion" id="formulaAcusacion">
                                        <option value="">--Seleccione--</option>
                                        <%                                    
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(acusacion)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
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
                    <textarea name="comentarios" id="comentarios"><%=comen%></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante">
            </form>
        </section>
    </body>
</html>