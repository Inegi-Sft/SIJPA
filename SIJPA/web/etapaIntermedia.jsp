<%-- 
    Document   : etamaIntermedia
    Created on : 7/10/2019, 09:58:11 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.showIntermedia"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Intermedia</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesInter.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            catalogos cat = new catalogos();
            showIntermedia sInter = new showIntermedia();
            ArrayList<String[]> lista, intermedia, lisResolPru, medioPru = new ArrayList();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadoClave = (String) session.getAttribute("juzgadoClave");
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String fechaAcusa = "";
            String fechaContesta = "";
            String descubreProba = "";
            String audiInter = "";
            String fechaAudiInter = "";
            String separaAcusa = "";
            String presentaMprueba = "";
            String acuerdoProba = "";
            String aperJO = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    intermedia = sInter.findIntermedia(causaClave, proceClave + juzgadoClave.replace("-", ""));
                    if(intermedia.size() > 0){
                        operacion = "actualizar";
                        fechaAcusa = intermedia.get(0)[0];
                        fechaContesta = intermedia.get(0)[1];
                        descubreProba = intermedia.get(0)[2];
                        audiInter = intermedia.get(0)[3];
                        fechaAudiInter = intermedia.get(0)[4];
                        separaAcusa = intermedia.get(0)[5];
                        presentaMprueba = intermedia.get(0)[6];
                        acuerdoProba = intermedia.get(0)[7];
                        aperJO = intermedia.get(0)[8];
                        comen = intermedia.get(0)[9];
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Etapa Intermedia</h1>
            <form action="" method="post" id="formuMedia" name="formuMedia">
                <label for="idProcesado">Id Adolescente</label>
                <input name="proceClave" id="proceClave" value="<%=proceClave%>" readonly />
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                <fieldset>
                    <legend>Características de la etapa intermedia</legend>
                    <table style="border-spacing: 0; " class="tablaFormu">
                        <tr>
                            <td>
                                <div id="divfechaEscrito">
                                    <label for="fechaEscrito">Fecha del escrito de acusación</label>
                                    <input type="date" name="fechaEscrito" id="fechaEscrito" value="<%=fechaAcusa%>" required>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkEscrito" onclick="fechaNoIdent('#chkEscrito', '#fechaEscrito')">
                                        <label>No identificada</label>
                                    </div> 
                                </div>
                            </td>
                            <td>
                                <div id="divcontestaEscrito">
                                    <label for="contestaEscrito">Fecha de contestación a la acusación</label>
                                    <input type="date" name="contestaEscrito" id="contestaEscrito" value="<%=fechaContesta%>" required>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkcontestaEscrito" onclick="fechaNoIdent('#chkcontestaEscrito', '#contestaEscrito')">
                                        <label>No identificada</label>
                                    </div> 
                                </div>
                            </td>
                            <td>
                                <div id="descuProba">
                                    <label for="audiInterme">¿Hubo descubrimiento probatorio?</label>
                                    <select name="decubreProba" id="decubreProba" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(descubreProba)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="audiInterme">¿Hubo celebración de la audiencia intermedia?</label>
                                        <select name="audiInterme" id="audiInterme" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(audiInter)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="oculto cols" id="divfechaAudiinter">
                                        <label for="fechaAudiinter">Fecha de la audiencia intermedia</label>
                                        <input type="date" name="fechaAudiinter" id="fechaAudiinter" value="<%=fechaAudiInter%>">
                                        <div class="noIdentificada" id="nifechaAudiinter">
                                            <input type="checkbox" id="chkAudiinter" onclick="fechaNoIdent('#chkAudiinter', '#fechaAudiinter')">
                                            <label>No identificada</label>
                                        </div> 
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <div id="dseparaAcusa" class="oculto">
                                    <label for="separaAcusa">¿Hubo separación de la acusación?</label>
                                    <select name="separaAcusa" id="separaAcusa">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(separaAcusa)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset id="fmediosPrueba" class="oculto">
                                    <legend>Medios Prueba</legend>      
                                    <div class="cols" id="dmediosPrueba">
                                        <label for="mediosPrueba">¿Hubo presentación de medios de prueba?</label>
                                        <select name="mediosPrueba" id="mediosPrueba">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(presentaMprueba)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="oculto" id="dTblmediosPrueba">
                                        <label for="tblMediosPru">Medios de Prueba Presentados</label>        
                                        <table class="tablasRegis" id="tblMediosPru">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tipos de Medios</th>
                                                    <th>Figura que lo Presentó</th>
                                                    <th>Resolución</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    medioPru = sInter.findMediosPrueba(causaClave, proceClave + juzgadoClave.replace("-", ""));
                                                    if(medioPru.size() != 0){
                                                        int y = 1;
                                                        for(String[] medioP : medioPru){
                                                            out.println("<tr>");
                                                            out.println("<td>" + medioP[0] + "</td>");
                                                            //tipos medios
                                                            out.println("<td><select name='tipoMP' id='tipoMP" + y + "'>");
                                                            out.println("<option value=''>---Seleccione---</option>");
                                                            lista = cat.findMediosPrueba();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(medioP[1])){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                            out.println("</select></td>");
                                                            //figuras presenta
                                                            out.println("<td><select name='figuraMP' id='figuraMP" + y + "'>");
                                                            out.println("<option value=''>---Seleccione---</option>");
                                                            lista = cat.findFiguraMprueba();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(medioP[2])){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                            out.println("</select></td>");
                                                            //resolucion
                                                            out.println("<td><select name='resoluMP' id='resoluMP" + y + "'>");
                                                            out.println("<option value=''>---Seleccione---</option>");
                                                            lista = cat.findResolucionMprueba();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(medioP[3])){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                            out.println("</select></td>");
                                                            out.println("</tr>");
                                                            y++;
                                                        }
                                                    }else{
                                                        out.println("<tr>");
                                                        out.println("<td>1</td>");
                                                        //figuras presenta
                                                        out.println("<td><select name='figuraMP' id='figuraMP1'>");
                                                        out.println("<option value=''>---Seleccione---</option>");
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                        }
                                                        out.println("</select></td>");
                                                        //tipos medios
                                                        out.println("<td><select name='tipoMP' id='tipoMP1'>");
                                                        out.println("<option value=''>---Seleccione---</option>");
                                                        lista = cat.findFiguraMprueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                        }
                                                        out.println("</select></td>");
                                                        //resolucion
                                                        out.println("<td><select name='resoluMP' id='resoluMP1'>");
                                                        out.println("<option value=''>---Seleccione---</option>");
                                                        lista = cat.findResolucionMprueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                        }
                                                        out.println("</select></td>");
                                                        out.println("</tr>");
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                        <a id="addMedioPrueba" style="cursor: pointer; font-weight: bold">
                                            <img src="img/add.png" title="Agregar Medio Prueba" style="vertical-align: bottom">
                                            AGREGAR 1 MEDIO DE PRUEBA
                                        </a>
                                    </div>
                                        <!-- <tr>
                                            <td>
                                                <div class="oculto" id="dpruebaMP">
                                                    <label for="pruebaMP">Medios de prueba presentados por el Ministerio Público</label>
                                                    <select name="pruebaMP" id="pruebaMP">
                                                        <option value="">--Seleccione--</option>
                                                        <%--
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(presenMinisterio)){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        --%> 
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="oculto" id="dpruebaAJ">
                                                    <label for="pruebaAJ">Medios de prueba presentados por el asesor jurídico</label>
                                                    <select name="pruebaAJ" id="pruebaAJ">
                                                        <option value="">--Seleccione--</option>
                                                        <%--
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(presenAsesor)){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        --%> 
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="oculto" id="dpruebaDF">
                                                    <label for="pruebaDF">Medios de prueba presentados por la defensa</label>
                                                    <select name="pruebaDF" id="pruebaDF">
                                                        <option value="">--Seleccione--</option>
                                                        <%--
                                                            lista = cat.findRespuestaSimple();
                                                            for (String[] ls : lista) {
                                                                out.println("<option value='" + ls[0] + "'");
                                                                if(ls[0].equals(presenDefensa)){
                                                                    out.println(" selected ");
                                                                }
                                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                            }
                                                        --%> 
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table id="tblpruebaMP" class="tablasRegis oculto">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tipos de Medios</th>
                                                        <th>Presentado</th>
                                                        <th>Resolución</th>
                                                    </tr>
                                                    <%--
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            medioPru = sInter.findMediosPrueba(causaClave, proceClave + juzgadoClave.replace("-", ""), "1", ls[0]);
                                                            if(medioPru.size() != 0){
                                                                out.println("<input type='checkbox' name='chkpruebaMP' id='chkpruebaMP' value='" + ls[0] + "' checked>");
                                                            }else{
                                                                out.println("<input type='checkbox' name='chkpruebaMP' id='chkpruebaMP' value='" + ls[0] + "'>");
                                                            }
                                                            out.println("</td>");
                                                            out.println("<td>");
                                                            out.println("<select class='txtMedia' name='tipoPruebaMP' id='tipoPruebaMP" + ls[0] + "' disabled>");
                                                            out.println("<option value=''>--Seleccione--</option>");
                                                            lisResolPru = cat.findResolucionMprueba();
                                                            for(String[] lisResol : lisResolPru){
                                                                out.println("<option value='" + lisResol[0] + "'");
                                                                if(medioPru.size() > 0){
                                                                    if(lisResol[0].equals(medioPru.get(0)[1])){
                                                                        out.println(" selected ");
                                                                    }
                                                                }
                                                                out.println(">" + lisResol[0] + ".- " + lisResol[1] + "</option>");
                                                            }
                                                            out.println("</select>");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    --%>
                                                </table>
                                            </td>
                                            <td>
                                                <table id="tblpruebaAJ" class="tablasRegis oculto">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tipos de Medios</th>
                                                        <th>Presentado</th>
                                                        <th>Resolución</th>
                                                    </tr>
                                                    <%--
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            medioPru = sInter.findMediosPrueba(causaClave, proceClave + juzgadoClave.replace("-", ""), "2", ls[0]);
                                                            if(medioPru.size() != 0){
                                                                out.println("<input type='checkbox' name='chkpruebaAJ' id='chkpruebaAJ' value='" + ls[0] + "' checked>");
                                                            }else{
                                                                out.println("<input type='checkbox' name='chkpruebaAJ' id='chkpruebaAJ' value='" + ls[0] + "'>");
                                                            }
                                                            out.println("</td>");
                                                            out.println("<td>");
                                                            out.println("<select class='txtMedia' name='tipoPruebaAJ' id='tipoPruebaAJ" + ls[0] + "' disabled>");
                                                            out.println("<option value=''>--Seleccione--</option>");
                                                            lisResolPru = cat.findResolucionMprueba();
                                                            for(String[] lisResol : lisResolPru){
                                                                out.println("<option value='" + lisResol[0] + "'");
                                                                if(medioPru.size() > 0){
                                                                    if(lisResol[0].equals(medioPru.get(0)[1])){
                                                                        out.println(" selected ");
                                                                    }
                                                                }
                                                                out.println(">" + lisResol[0] + ".- " + lisResol[1] + "</option>");
                                                            }
                                                            out.println("</select>");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    --%>
                                                </table>
                                            </td>
                                            <td>
                                                <table id="tblpruebaDF" class="tablasRegis oculto">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tipos de Medios</th>
                                                        <th>Presentado</th>
                                                        <th>Resolución</th>
                                                    </tr>
                                                    <%--
                                                        lista = cat.findMediosPrueba();
                                                        for (String[] ls : lista) {
                                                            out.println("<tr>");
                                                            out.println("<td>" + ls[0] + "</td>");
                                                            out.println("<td>" + ls[1] + "</td>");
                                                            out.println("<td>");
                                                            medioPru = sInter.findMediosPrueba(causaClave, proceClave + juzgadoClave.replace("-", ""), "3", ls[0]);
                                                            if(medioPru.size() != 0){
                                                                out.println("<input type='checkbox' name='chkpruebaDF' id='chkpruebaDefen' value='" + ls[0] + "' checked>");
                                                            }else{
                                                                out.println("<input type='checkbox' name='chkpruebaDF' id='chkpruebaDefen' value='" + ls[0] + "'>");
                                                            }
                                                            out.println("</td>");
                                                            out.println("<td>");
                                                            out.println("<select class='txtMedia' name='tipoPruebaDF' id='tipoPruebaDF" + ls[0] + "' disabled>");
                                                            out.println("<option value=''>--Seleccione--</option>");
                                                            lisResolPru = cat.findResolucionMprueba();
                                                            for(String[] lisResol : lisResolPru){
                                                                out.println("<option value='" + lisResol[0] + "'");
                                                                if(medioPru.size() > 0){
                                                                    if(lisResol[0].equals(medioPru.get(0)[1])){
                                                                        out.println(" selected ");
                                                                    }
                                                                }
                                                                out.println(">" + lisResol[0] + ".- " + lisResol[1] + "</option>");
                                                            }
                                                            out.println("</select>");
                                                            out.println("</td>");
                                                            out.println("</tr>");
                                                        }
                                                    --%>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>-->
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="dacuerdosProba" class="oculto">
                                    <label for="acuerdosProba">¿Contó con acuerdos probatorios?</label>
                                    <select name="acuerdosProba" id="acuerdosProba">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(acuerdoProba)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div id="daperturaJO" class="oculto">
                                    <label for="aperturaJO">¿Se dictó auto de apertura a juicio oral?</label>
                                    <select name="aperturaJO" id="aperturaJO">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(aperJO)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %> 
                                    </select>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"><%=comen%></textarea>
                </div>
                <br/>
                <input type="submit" name="guardainter" value="Guardar" id="guardaInter" class="btnFlotante">
            </form>
        </section>
    </body>
</html>
