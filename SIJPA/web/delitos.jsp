<%-- 
    Document   : delitos
    Created on : 1/10/2019, 09:00:11 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showDelitos"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Delitos</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesDel.js"></script>
        <%
            catalogos cat = new catalogos();
            showDelitos delitos = new showDelitos();
            FechaMax fecha = new FechaMax();
            String fechas = fecha.FechaValida();
            
            ArrayList<String[]> lista, delito;
            ArrayList<String> deliAdi = new ArrayList();
            
            String delitoClave = "", posicion = "", edicion = "";
            if (request.getParameter("delitoClave") != null || request.getParameter("posicion") != null) {
                delitoClave = request.getParameter("delitoClave");
                posicion = request.getParameter("posicion");//Variable de control para saber la fila de la tabla que pertenece
            }
            
            String juzgadoClave = (String)session.getAttribute("juzgadoClave");
            String causaClave = (String)session.getAttribute("causaClave");//Obtenemos la causa clave
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String delitoCP = "";
            String fuero = "";
            String articuloCP = "";
            String reclasifica = "";
            String fechaReclasi = "";
            String delitoNT = "";
            String desDelitoNT = "";
            String fechaOcurre = "";
            String sitioOcurre = "";
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
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    delito = delitos.findDelitos(causaClave, delitoClave + juzgadoClave.replace("-", ""));
                    if(delito.size() > 0){
                        operacion = "actualizar";
                        delitoCP = delito.get(0)[0];
                        fuero = delito.get(0)[1];
                        articuloCP = delito.get(0)[2];
                        reclasifica = delito.get(0)[3];
                        fechaReclasi = delito.get(0)[4];
                        delitoNT = delito.get(0)[5];
                        desDelitoNT = delito.get(0)[6];
                        fechaOcurre = delito.get(0)[7];
                        sitioOcurre = delito.get(0)[8];
                        gradoConsuma = delito.get(0)[9];
                        calificacion = delito.get(0)[10];
                        clasificacion = delito.get(0)[11];
                        concurso = delito.get(0)[12];
                        formaComi = delito.get(0)[13];
                        formaAccion = delito.get(0)[14];
                        modalidad = delito.get(0)[15];
                        instruComision = delito.get(0)[16];
                        ocurreEnti = delito.get(0)[17];
                        ocurreMuni = delito.get(0)[18];
                        comen = delito.get(0)[19];
                    }else{
                        out.println("<script>alert('Delito " + delitoClave + " no encontrado dentro de la Causa Penal "  + causaClave + "'); "
                                + "window.location.href = 'elementosPrincipales.jsp'</script>");
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Delitos</h1>
            <form method="post" name="formDelitos" id="formDelitos">
                <fieldset>
                    <legend>Identificación del tipo penal</legend>
                    <table class="tablaFormu" >
                        <tr>
                            <td colspan="3">
                                <label>Delito Clave</label>
                                <input type="text" name="delitoClave" id="delitoClave" value="<%=delitoClave%>" readonly>
                                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
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
                                <label for="sitioO">Sitio de ocurrencia</label>
                                <select name="sitioO" id="sitioO" required>
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
                                    <div class="colsA lblExBig">
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
                                    <div class="colsA lblExBig">
                                        <label class="txtLong">Municipio o Demarcación territorial de la Ciudad de México</label>
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
                                lista=cat.findCosaRobada();
                                for (String[] ls : lista) {
                                    out.println("<tr>");
                                    out.println("<td>" + ls[0] + "</td>");
                                    out.println("<td>" + ls[1] + "</td>");
                                    out.println("<td>");
                                    deliAdi = delitos.findDRobo(causaClave, delitoClave + juzgadoClave.replace("-", ""),ls[0]);
                                    if(deliAdi.size() != 0){
                                        out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "' checked>");
                                    }else{
                                        out.println("<input type='checkbox' name='cosaRobada' id='cosaRobada" + ls[0] + "' value='" + ls[0] + "'>"); 
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
                                lista=cat.findContextoSituacional();
                                for (String[] ls : lista) {
                                    out.println("<tr>");
                                    out.println("<td>" + ls[0] + "</td>");
                                    out.println("<td>" + ls[1] + "</td>");
                                    out.println("<td>");
                                    deliAdi = delitos.findDHomicidios(causaClave, delitoClave + juzgadoClave.replace("-", ""), ls[0]);
                                    if(deliAdi.size() != 0){
                                        out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "' checked>");
                                    }else{
                                        out.println("<input type='checkbox' name='contextoSitua' id='contextoSitua" + ls[0] + "' value='" + ls[0] + "'>"); 
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
