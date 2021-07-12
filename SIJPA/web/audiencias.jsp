<%-- 
    Document   : audiencias
    Created on : 3/04/2020, 09:34:31 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="clasesAuxiliar.showAudiencias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Audiencias</title>
        <%@include file="librerias.jsp" %>
        <link type="text/css" href="css/audiencias.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/fnAudiencias.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%  
            showJuzgados juz = new showJuzgados();
            catalogos cat = new catalogos();
            showAudiencias sA = new showAudiencias();
            ArrayList<String[]> lista;
            ArrayList<String> lstJuz;
            
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                juzgado=request.getParameter("juzgado");
                session.setAttribute("juzgadoClave", juzgado);
            }else if(session.getAttribute("juzgadoClave") != null){
                if(session.getAttribute("juzgadoClave") != ""){
                    juzgado = (String) session.getAttribute("juzgadoClave");
                    //Verificamos la funcion del juzgado para que sea de control
                    if(juz.findFuncionJuz(juzgado) == 2){
                        out.println("<script>$(document).ready(function () {"
                                + "alertify.alert('Error de Juzgado',"
                                + "'El juzgado seleccionado(activo) es de Enjuiciamiento y este es el apartado de Control."
                                + "Por favor seleccione otro Juzgado Clave o capture un nuevo Juzgado en el apartado de Juzgados'"
                                + ").set('closable', false);"
                                + "$('#juzgado').val('');"
                                + "});</script>");
                        juzgado = "";//Vaciamos la variable para que no halla busqueda
                        session.setAttribute("juzgadoClave", "");//Vaciamos la variable de session para evitar la busqueda
                    }
                }
            }
            
            String funJuz = juz.findFuncionDes(juzgado);
            String juzLimpio = juzgado.replace("-", "");
            String banderaInter = request.getParameter("banderaInter");//variable para abrir la pestaña 2, cuando se guarda de intermedia
        %>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Audiencias JC</h1>
            <form action="audiencias.jsp" name="formJuzgadoAudi" method="post">
                <div id="juzClave">
                    <div>
                        <label for="juzgado">Juzgado Clave:</label>
                        <select name="juzgado" id="juzgado" onchange="formJuzgadoAudi.submit();">
                            <option value="">--Seleccione--</option>
                            <%
                                lstJuz = juz.findJuzgadosJC((Integer)session.getAttribute("tipoUsuario"), (String)session.getAttribute("usuActivo"));
                                for (String ls : lstJuz) {
                                    out.println("<option value='" + ls + "'");
                                    if(ls.equals(juzgado)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div>
                        <label id="funcionJu">Función: <%=funJuz%></label>
                    </div>
                </div>
            </form><br><br><br><br>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Audiencias de Investigacion</button>
                <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2">Audiencias  de Intermedia</button>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <form name="formAudienciasInves" id="formAudienciasInves" method="post">
                    <table id="tblAudiInves" class="tablasRegis" style="zoom: 85%" >
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Audiencias de Investigación</th>
                                <th>Juez Celebra</th>
                                <th>Causa Relacionada</th>
                                <th width="168">Fecha Celebración</th>
                                <th width="160">Duración Hrs. / Min.</th>
                                <th>Acción</th>
                            </tr>
                        <thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td>
                                    <select name='audiInves' id='audiInves' class="largo" required>
                                        <option value=''>---Seleccione---</option>
                                        <%    
                                            lista = cat.findAudienciasInvestigacion();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            } 
                                        %>
                                    </select>
                                    <img src="img/eye.png" id="ver" class="vew oculto" onclick="openModalIniciales();"/>
                                    <div class="emergente oculto" id="data">
                                        <h2>Audiencias Iniciales</h2>
                                        <table id="tblActosPro" class="tablasRegis">
                                            <tr>
                                                <th>Acto Procesal</th>
                                                <th>Duracion Hrs. / Min.</th>
                                            </tr>
                                            <%
                                                lista = cat.findActosProcesales();
                                                for (String[] ls : lista) {
                                                    out.println("<tr>");
                                                    out.println("<td><input type='checkbox' name='actosP' onclick='habilita(this, \"#hrsAP"+ls[0]+"\",\"#minAP"+ls[0]+"\", \"#chkDNI"+ls[0]+"\")' value='"+ls[0]+"' />"+ls[0]+".- "+ls[1]+"</td>");
                                                    out.println("<td>");
                                                    out.println("<select name='hrsAP' id='hrsAP"+ls[0]+"' class='lblExBig inactivo' onchange='duracionCero(this, \"#minAP"+ls[0]+"\");'>");
                                                    out.println("<option value=''>hrs</option>");
                                                    for(int i=0;i<=19;i++){
                                                        out.println("<option value='"+i+"'>"+i+"</option>");
                                                    }
                                                    out.println("<option value='99' hidden>99</option>");
                                                    out.println("</select>");
                                                    out.println("<select name='minAP' id='minAP"+ls[0]+"' class='lblExBig inactivo' onchange='duracionCero(\"#hrsAP"+ls[0]+"\", this);'>");
                                                    out.println("<option value=''>min</option>");
                                                    for(int i=0;i<=59;i++){
                                                        if(i<10){
                                                            out.println("<option value='0"+i+"'>0"+i+"</option>");
                                                        }else{
                                                            out.println("<option value='"+i+"'>"+i+"</option>");
                                                        }
                                                    }
                                                    out.println("<option value='99' hidden>99</option>");
                                                    out.println("</select>");
                                                    out.println("<div class='noIden'>");
                                                    out.println("<input type='checkbox' name='chkDNIAP' id='chkDNI"+ls[0]+"' onclick='duracionNI(this, \"#hrsAP"+ls[0]+"\",\"#minAP"+ls[0]+"\")' disabled/>N/I");
                                                    out.println("</div>");
                                                    out.println("</tr>");
                                                }
                                            %>
                                        </table>
                                        <input type="button" name="aceptar" id="aceptar" value="Aceptar" onclick="validallenadoAP();"> 
                                    </div>
                                </td>
                                <td>
                                    <select name='juez' id='juez' class='captuJuez' required>
                                        <option value=''>---Seleccione---</option>
                                        <%
                                            lista = sA.findJueces(juzgado);
                                            for (String[] ls : lista){ 
                                                out.println("<option value='"+ ls[0] +"'>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"</option>");
                                            }
                                        %>
                                        <option value='100'>-- Agregar Nuevo Juez --</option>
                                    </select>
                                </td>
                                <td>
                                    <select name='causa' id='causa' class="txtMedia autoComp" required>
                                        <option value=''>---Seleccione---</option>
                                        <option value='-2'>*Sin Especificar*</option>
                                        <%
                                            lista = sA.findCausasJC(juzgado);
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0].replace(juzLimpio, "") + "</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input type="date" name="fCelebracion" id="fCelebracion" class="audiFecha" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFC" onclick="fechaNIJC(this, '#fCelebracion')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <select name="hrs" id="hrs" class="lblExBig" onchange="duracionCero('#hrs','#min');" required>
                                        <option value="">hrs</option>
                                    <%
                                        for(int i=0;i<=98;i++){
                                            out.println("<option value='"+i+"'>"+i+"</option>");
                                        }
                                    %>
                                        <option value="99" hidden>99</option>
                                    </select>
                                    <select name="min" id="min" class="lblExBig" onchange="duracionCero('#hrs','#min');" required>
                                        <option value="">min</option>
                                    <%
                                        for(int i=0;i<=59;i++){
                                            if(i<10){
                                                out.println("<option value='0"+i+"'>0"+i+"</option>");
                                            }else{
                                                out.println("<option value='"+i+"'>"+i+"</option>");
                                            }
                                        }
                                    %>
                                    <option value="99" hidden>99</option>
                                    </select>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNI" onclick="duracionNI(this, '#hrs','#min')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="submit" name="addInves" id="addInves" class="addAudi" value="Agregar" onclick="return validaJuzAdd()"/> 
                                    <input type="hidden" name="tipoAudiencia" id="tipoAudiencia" value="Investigacion"/> 
                                    <input type="hidden" name="operacion" id="operacion" value="insertar"/>
                                </td>
                            </tr>
                        <%
                            lista = sA.recuperaAudienciasInvestigacion(juzgado);
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>"+ls[0]+"</td>");
                                out.println("<td>"+ls[1]+".- "+ls[2]+"&nbsp;&nbsp;");
                                if(ls[1].equals("11")){
                                   out.println("<img src='img/eye.png' id='verAP' class='vew' onclick='openRecuperaActosP(\""+ls[8]+"\","+ls[0]+");'/>"); 
                                }
                                out.println("</td>");
                                out.println("<td>"+ls[3]+"</td>");
                                out.println("<td>"+ls[4].replace(juzLimpio, "")+"</td>");
                                out.println("<td>"+ls[5]+"</td>");
                                out.println("<td>"+ls[6]+":"+ls[7]+"</td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"deleteAudiencias('"+ls[4]+"',"+ls[8]+","+ls[0]+",'inves');\"/></a></td>");
                                out.println("</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="emergente oculto" id="recuperaAP">
                        <h2>Audiencias Iniciales</h2>
                        <table id="tblRecuperaActosPro" class="tablasRegis">
                            <thead>
                                <tr>
                                    <th>Acto Procesal</th>
                                    <th>Duracion Hrs:Min</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div id="p2" class="pestanaContent">
                <form name="formAudienciasInter" id="formAudienciasInter" method="post">
                    <table id="tblAudiInter" class="tablasRegis" style="zoom: 85%" >
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Audiencias Intermedia</th>
                                <th>Juez Celebra</th>
                                <th>Causa Relacionada</th>
                                <th width="168">Fecha Celebración</th>
                                <th width="160">Duración Hrs. / Min.</th>
                                <th>Acción</th>
                            </tr>
                        <thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td>
                                    <select name='audiInter' id='audiInter' class="largo" required>
                                        <option value=''>---Seleccione---</option>
                                        <%    
                                            lista = cat.findAudienciasIntermedia();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            } 
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <select name='juez' id='juez2' class='captuJuez' required>
                                        <option value=''>---Seleccione---</option>
                                        <%
                                            lista = sA.findJueces(juzgado);
                                            for (String[] ls : lista){ 
                                                out.println("<option value='"+ ls[0] +"'>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"</option>");
                                            }
                                        %>
                                        <option value='100'>-- Agregar Nuevo Juez --</option>
                                    </select>
                                </td>
                                <td>
                                    <select name='causa' id='causa2' class="txtMedia autoComp" required>
                                        <option value=''>---Seleccione---</option>
                                        <option value='-2'>*Sin Especificar*</option>
                                        <%
                                            lista = sA.findCausasJC(juzgado);
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0].replace(juzLimpio, "") + "</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <input type="date" name="fCelebracion" id="fCelebracion2" class="audiFecha" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFINI" onclick="fechaNIJC(this, '#fCelebracion2')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <select name="hrs" id="hrs2" class="lblExBig" onchange="duracionCero('#hrs2','#min2');" required>
                                        <option value="">hrs</option>
                                    <%
                                        for(int i=0;i<=98;i++){
                                            out.println("<option value='"+i+"'>"+i+"</option>");
                                        }
                                    %>
                                        <option value="99" hidden>99</option>
                                    </select>
                                    <select name="min" id="min2" class="lblExBig" onchange="duracionCero('#hrs2','#min2');" required>
                                        <option value="">min</option>
                                    <%
                                        for(int i=0;i<=59;i++){
                                            if(i<10){
                                                out.println("<option value='0"+i+"'>0"+i+"</option>");
                                            }else{
                                                out.println("<option value='"+i+"'>"+i+"</option>");
                                            }
                                        }
                                    %>
                                    <option value="99" hidden>99</option>
                                    </select>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNII" onclick="duracionNI(this, '#hrs2','#min2')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="submit" name="addInter" id="addInter" class="addAudi" value="Agregar" onclick="validaJuzAdd()"/> 
                                    <input type="hidden" name="tipoAudiencia" id="tipoAudiencia2" value="Intermedia"/> 
                                    <input type="hidden" name="operacion" id="operacion2" value="insertar"/> 
                                    <input type="hidden" id="banderaInter" value="<%=banderaInter%>"/> 
                                </td>
                            </tr>
                        <%
                            lista = sA.recuperaAudienciasIntermedia(juzgado);
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>"+ls[0]+"</td>");
                                out.println("<td>"+ls[1]+"</td>");
                                out.println("<td>"+ls[2]+"</td>");
                                out.println("<td>"+ls[3].replace(juzLimpio, "")+"</td>");
                                out.println("<td>"+ls[4]+"</td>");
                                out.println("<td>"+ls[5]+":"+ls[6]+"</td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"deleteAudiencias('"+ls[3]+"',"+ls[7]+","+ls[0]+",'inter');\"/></a></td>");
                                out.println("</tr>");
                            }
                        %>
                        </tbody>
                    </table> 
                </form>
            </div><br/>   
        </section>
    </body>
</html>
