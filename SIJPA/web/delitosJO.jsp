<%-- 
    Document   : delitosJO
    Created on : 13/05/2020, 02:49:33 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showDelitosJO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Delitos JO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesDelJO.js"></script>
        <%
            catalogos cat = new catalogos();
            showDelitosJO delitos = new showDelitosJO();
            FechaMax fecha = new FechaMax();
            String fechas = fecha.FechaValida();
            
            ArrayList<String[]> lista, delitoJC, delitoJO;
            ArrayList<String> deliAdi;
            
            String delitoClaveJC = "", delitoClaveJO = "", posicion = "", edicion = "";
            if (request.getParameter("delitoClaveJO") != null || request.getParameter("posicion") != null) {
                delitoClaveJC = request.getParameter("delitoClaveJC");
                delitoClaveJO = request.getParameter("delitoClaveJO");
                posicion = request.getParameter("posicion");//Variable de control para saber la fila de la tabla que pertenece
            }
            
            String juzgadoClaveJC = (String)session.getAttribute("juzgadoClaveJC");
            String juzgadoClaveJO = (String)session.getAttribute("juzgadoClave");
            String causaClaveJC = (String)session.getAttribute("causaClave");//Obtenemos la causa clave de JC
            String causaClaveJO = (String)session.getAttribute("causaClaveJO");//Obtenemos la causa clave de JO
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String datoSis = "";//Variable que se llena dependiendo de que datos se muestran
            String delitoCP = "";
            String fuero = "";
            String articuloCP = "";
            String reclasifica = "";
            String fechaReclasi = "";
            String delitoNT = "";
            String desDelitoNT = "";
            String fechaOcurre = "";
            String sitioOcurre = "";
            String sitioOE ="";
            String gradoConsuma = "";
            String calificacion = "";
            String clasificacion = "";
            String concurso = "";
            String formaComi = "";
            String formaAccion = "";
            String modalidad = "";
            String instruComision = "";
            String ocurreEnti = "";
            String ocurreMuni = "";
            String comen = ""; 
            if(request.getParameter("edita") != null){//Si es diferente de null entonces le mostramos los datos de JO
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    delitoJO = delitos.findDelitosJO(causaClaveJO, delitoClaveJO + juzgadoClaveJO.replace("-", ""));
                    if(delitoJO.size() > 0){
                        operacion = "actualizar";
                        datoSis = "Se muestran datos de Juicio Oral";
                        delitoCP = delitoJO.get(0)[0];
                        fuero = delitoJO.get(0)[1];
                        articuloCP = delitoJO.get(0)[2];
                        reclasifica = delitoJO.get(0)[3];
                        fechaReclasi = delitoJO.get(0)[4];
                        delitoNT = delitoJO.get(0)[5];
                        desDelitoNT = delitoJO.get(0)[6];
                        fechaOcurre = delitoJO.get(0)[7];
                        sitioOcurre = delitoJO.get(0)[8];
                        gradoConsuma = delitoJO.get(0)[9];
                        calificacion = delitoJO.get(0)[10];
                        clasificacion = delitoJO.get(0)[11];
                        concurso = delitoJO.get(0)[12];
                        formaComi = delitoJO.get(0)[13];
                        formaAccion = delitoJO.get(0)[14];
                        modalidad = delitoJO.get(0)[15];
                        instruComision = delitoJO.get(0)[16];
                        ocurreEnti = delitoJO.get(0)[17];
                        ocurreMuni = delitoJO.get(0)[18];
                        comen = delitoJO.get(0)[19]; 
                    }else{
                        out.println("<script>alert('Delito " + delitoClaveJO + " no encontrado dentro de la Causa Penal "  + causaClaveJO + "'); "
                                + "parent.$.fancybox.close();</script>");
                    }
                }
            }else if(!delitoClaveJC.equals("--")){//Si no trae variable edita, entonces le determinamos si trae JC
                delitoJC = delitos.findDelitosJC(causaClaveJC, delitoClaveJC + juzgadoClaveJC.replace("-", ""));
                if(delitoJC.size() > 0){
                    datoSis = "Se muestran datos de Juzgado de Control";
                    delitoCP = delitoJC.get(0)[0];  
                    fuero = delitoJC.get(0)[1];
                    articuloCP = delitoJC.get(0)[2];
                    reclasifica = delitoJC.get(0)[3];
                    fechaReclasi = delitoJC.get(0)[4];
                    delitoNT = delitoJC.get(0)[5];
                    desDelitoNT = delitoJC.get(0)[6];
                    fechaOcurre = delitoJC.get(0)[7];
                    sitioOcurre = delitoJC.get(0)[8];
                    gradoConsuma = delitoJC.get(0)[9];
                    calificacion = delitoJC.get(0)[10];
                    clasificacion = delitoJC.get(0)[11];
                    concurso = delitoJC.get(0)[12];
                    formaComi = delitoJC.get(0)[13];
                    formaAccion = delitoJC.get(0)[14];
                    modalidad = delitoJC.get(0)[15];
                    instruComision = delitoJC.get(0)[16];
                    ocurreEnti = delitoJC.get(0)[17];
                    ocurreMuni = delitoJC.get(0)[18];
                    comen = delitoJC.get(0)[19];
                }else{
                    out.println("<script>alert('Delito " + delitoClaveJC + " no encontrado dentro de la Causa Penal "  + causaClaveJC + "'); "
                            + "parent.$.fancybox.close();</script>");
                }
            }else{//Si viene JC vacio entonces es un registro nuevo
                datoSis = "Registro nuevo en Juicio Oral";
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Delitos</h1>
            <form method="post" name="formDelitosJO" id="formDelitosJO">
                <fieldset>
                    <legend>Identificación del tipo penal</legend>
                    <table class="tablaFormu" >
                        <tr>
                            <td colspan="3">
                                <h5><%=datoSis%></h5>
                                <% if(!delitoClaveJC.equals("--")){ %>
                                    <div class="cols">
                                        <label>Delito Clave Juzgado Control</label>
                                        <input type="text" name="delitoClaveJC" id="delitoClaveJC" value="<%=delitoClaveJC%>" readonly>
                                    </div>
                                    <img src="img/flechaIz.png" id="flechaRela">
                                <% } %>
                                <div class="cols">
                                    <label>Delito Clave Juicio Oral</label>
                                    <input type="text" name="delitoClaveJO" id="delitoClaveJO" value="<%=delitoClaveJO%>" readonly>
                                    <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                                    <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoCP">Delito de acuerdo con la ley penal</label>
                                <select  class="demo-default txtExBig" name="delitoCP" id="delitoCP" placeholder="--Seleccione--" required>
                                    <option value="" ></option>
                                    <%
                                        
                                        lista = cat.findCodigoNorma();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "' data-data='{\"norma\":\"" + ls[2] + "\"}'");
                                            if(ls[0].equals(delitoCP)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fuero">Fuero</label>
                                <select  name="fuero" id="fuero" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuero();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(fuero)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="articuloCP">Señalamiento normativo (Artículo, fracción, párrafo, inciso del código penal)</label>
                                <input class="txtExBig" type="text"  name="articuloCP" id="articuloCP" value="<%=articuloCP%>" required>
                            </td>
                            <td rowspan="2">
                                <fieldset>
                                    <label for="reclasificaDel">¿Hubo reclasificación del delito?</label>
                                    <select  name="reclasificaDel" id="reclasificaDel" onchange="respuestaSimpleFecha('#reclasificaDel', '#dFechaReclaDel', '#fechaReclaDel', '#chkFechaReclaDel');" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findRespuestaSimple();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(reclasifica)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                    <div class="oculto" id="dFechaReclaDel">
                                        <label for="fechaReclaDel">Fecha de reclasificacion del delito</label>
                                        <input type="date" name="fechaReclaDel" id="fechaReclaDel" value="<%=fechaReclasi%>" required>
                                        <div class='noIdentificada'>
                                            <input type="checkbox" id="chkFechaReclaDel" onclick="fechaNoIdent('#chkFechaReclaDel', '#fechaReclaDel')">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoNT">Delito de acuerdo con la Norma Técnica</label>
                                <select class="txtExBig" name="delitoNT" id="delitoNT" required>
                                    <%
                                        if(delitoCP.equals("")){
                                            out.println("<option value=''>--Seleccione--</option>");
                                        }else{
                                            out.println("<option value='" + delitoNT + "'>" + delitoNT + ".- " + desDelitoNT + "</option>");
                                        }
                                    %>
                                </select> 
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Características de ejecución</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="ocurrencia">Fecha de ocurrencia</label>
                                <input type="date" name="ocurrencia" id="ocurrencia" value="<%=fechaOcurre%>" required max="<%=fechas%>" onkeydown="return false" onchange="VFechaOcurrencia('#ocurrencia')">
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkOcurrencia" onclick="fechaNoIdent('#chkOcurrencia', '#ocurrencia')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <fieldset>
                                    <legend>Sitio de ocurrencia</legend>
                                    <div class="colsx lblExBig">
                                        <label for="sitioO">Sitio de ocurrencia</label>
                                        <select name="sitioO" id="sitioO" requiered>
                                            <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findSitioOcurrencia();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(sitioOcurre)){
                                                    out.println(" selected ");
                                                }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="EspecifiqueSO">
                                        <label for="sitioOE">Especifique sitio</label>
                                        <input class="txtMedia" type="text"  name="sitioOE" id="sitioOE" value="<%=sitioOE%>">
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="consumacion">Grado de consumación</label>
                                <select name="consumacion" id="consumacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findConsumacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(gradoConsuma)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="calificacion">Calificación del delito</label>
                                <select name="calificacion" id="calificacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findCalificacionDelito();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(calificacion)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="clasificacion">Clasificación en orden al resultado</label>
                                <select name="clasificacion" id="clasificacion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findClasificacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(clasificacion)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="concurso">Concurso</label>
                                <select name="concurso" id="concurso" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findConcurso();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(concurso)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="comision">Forma de comisión</label>
                                <select name="comision" id="comision" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFormaComision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(formaComi)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="accion">Forma de acción</label>
                                <select name="accion" id="accion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFormaAccion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(formaAccion)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="modalidad">Modalidad</label>
                                <select name="modalidad" id="modalidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findModalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(modalidad)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="instrumentos">Instrumentos para la comisión</label>
                                <select name="instrumentos" id="instrumentos" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findInstrumentoComision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(instruComision)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Lugar de ocurrencia</legend>
                                    <div class="cols lblExBig">
                                        <label>Entidad Federativa</label>
                                        <select name="entidadD" id="entidadD" onchange="llenaMun('#entidadD', '#municipioD')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(ocurreEnti)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig">
                                        <label class="lblExBig">Municipio o Demarcación territorial de la Ciudad de México</label>
                                        <select name="municipioD" id="municipioD" required>
                                            <%
                                                if(ocurreEnti.equals("")){
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findMunicipios(Integer.parseInt(ocurreEnti));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(ocurreMuni)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="fldsAdicionales">
                    <legend>Características adicionales</legend>
                    <div class="oculto" id="dCosaRobada">
                        <table class="tablasRegis" id="tableCosaRobada">
                            <tr>
                                <th width="20">Id</th>
                                <th width="450">Cosa Robada</th>
                                <th width="70">Aplica</th>
                            </tr>
                            <%
                                lista = cat.findCosaRobada();
                                for (String[] ls : lista) {
                                    out.println("<tr>");
                                    out.println("<td>" + ls[0] + "</td>");
                                    out.println("<td>" + ls[1] + "</td>");
                                    out.println("<td>");
                                    if(!edicion.equals("")){//Diferente de vacio traemos JO
                                        deliAdi = delitos.findDRoboJO(causaClaveJO, delitoClaveJO + juzgadoClaveJO.replace("-", ""), ls[0]);
                                        if(deliAdi.size() != 0){
                                            out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "' checked>");
                                        }else{
                                            out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "'>"); 
                                        }
                                    }else{//Traemos JC 
                                        deliAdi = delitos.findDRoboJC(causaClaveJC, delitoClaveJC + juzgadoClaveJC.replace("-", ""), ls[0]);
                                        if(deliAdi.size() != 0){
                                            out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "' checked>");
                                        }else{
                                            out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "'>"); 
                                        }
                                    }
                                    out.println("</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </table>
                    </div>
                    <div class="oculto" id="dContextoSitua">
                        <table class="tablasRegis" id="tableCosaRobada">
                            <tr>
                                <th width="20">Id</th>
                                <th width="450">Contexto situacional</th>
                                <th width="70">Aplica</th>
                            </tr>
                            <%
                                lista = cat.findContextoSituacional();
                                for (String[] ls : lista) {
                                    out.println("<tr>");
                                    out.println("<td>" + ls[0] + "</td>");
                                    out.println("<td>" + ls[1] + "</td>");
                                    out.println("<td>");
                                    if(!edicion.equals("")){
                                        deliAdi = delitos.findDHomicidiosJO(causaClaveJO, delitoClaveJO + juzgadoClaveJO.replace("-", ""), ls[0]);
                                        if(deliAdi.size() != 0){
                                            out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "' checked>");
                                        }else{
                                            out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "'>"); 
                                        }
                                    }else{
                                        deliAdi = delitos.findDHomicidiosJC(causaClaveJC, delitoClaveJC + juzgadoClaveJC.replace("-", ""), ls[0]);
                                        if(deliAdi.size() != 0){
                                            out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "' checked>");
                                        }else{
                                            out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "'>"); 
                                        }
                                    }
                                    out.println("</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </table>
                    </div>
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

