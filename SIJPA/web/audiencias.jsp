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
        <script type="text/javascript" src="js/fnAudiencias.js"></script>
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
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Audiecias de Investigacion</button>
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
                                <th width="168">Fecha inicia</th>
                                <th width="168">Fecha finaliza</th>
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
                                    <input type="date" name="fInvesI" id="fInvesI" class="audiFecha" onblur="duracion(this,'#fInvesF')" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFINI" onclick="fechaNIJC(this, '#fInvesI')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="date" name="fInvesF" id="fInvesF" class="audiFecha" onblur="duracion('#fInvesI',this)" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFFNI" onclick="fechaNIJC(this, '#fInvesF')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="submit" name="addInves" id="addInves" class="addAudi" value="Agregar" onclick="validaJuzAdd()"/> 
                                    <input type="hidden" name="tipoAudiencia" id="tipoAudiencia" value="Investigacion"/> 
                                    <input type="hidden" name="operacion" id="operacion" value="insertar"/>
                                </td>
                            </tr>
                        <%
                            lista = sA.recuperaAudienciasInvestigacion(juzgado);
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>"+ls[0]+"</td>");
                                out.println("<td>"+ls[1]+"</td>");
                                out.println("<td>"+ls[2]+"</td>");
                                out.println("<td>"+ls[3].replace(juzLimpio, "")+"</td>");
                                out.println("<td>"+ls[4]+"</td>");
                                out.println("<td>"+ls[5]+"</td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"deleteAudiencias('"+ls[3]+"',"+ls[0]+",'inves');\"/></a></td>");
                                out.println("</tr>");
                            }
                        %>
                        </tbody>
                    </table> 
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
                                <th width="168">Fecha inicia</th>
                                <th width="168">Fecha finaliza</th>
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
                                    <input type="date" name="fInterI" id="fInterI" class="audiFecha" onblur="duracion(this,'#fInterF')" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFINI" onclick="fechaNIJC(this, '#fInterI')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="date" name="fInterF" id="fInterF" class="audiFecha" onblur="duracion('#fInterI',this)" required/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFFNI" onclick="fechaNIJC(this, '#fInterF')" />N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="submit" name="addInter" id="addInter" class="addAudi" value="Agregar" onclick="validaJuzAdd()"/> 
                                    <input type="hidden" name="tipoAudiencia" id="tipoAudiencia" value="Intermedia"/> 
                                    <input type="hidden" name="operacion" id="operacion" value="insertar"/> 
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
                                out.println("<td>"+ls[5]+"</td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"deleteAudiencias('"+ls[3]+"',"+ls[0]+",'inter');\"/></a></td>");
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
