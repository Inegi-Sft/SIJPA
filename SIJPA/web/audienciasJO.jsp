<%-- 
    Document   : audiencias
    Created on : 14/05/2020, 09:34:31 AM
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
        <title>SIJPA::AudienciasJO</title>
        <%@include file="librerias.jsp" %>
        <link type="text/css" href="css/audiencias.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/fnAudienciasJO.js"></script>
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
                    if(juz.findFuncionJuz(juzgado) == 1){
                        out.println("<script>$(document).ready(function () {"
                                + "alertify.alert('Error de Juzgado',"
                                + "'El juzgado seleccionado(activo) es de Control y este es el apartado de Enjuiciamiento."
                                + "Por favor seleccione otro Juzgado Clave o capture un nuevo Juzgado en el apartado de Juzgados'"
                                + ").set('closable', false);"
                                + "$('#juzgado').val('');"
                                + "});</script>");
                        juzgado = "";//Vaciamos la variable para que no realice busqueda
                        session.setAttribute("juzgadoClave", "");//Vaciamos la variable de session para evitar la busqueda
                    }
                }
            }
            
            String funJuz = juz.findFuncionDes(juzgado);
            String juzLimpio = juzgado.replace("-", "");
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
            <h1>Audiencias JO</h1>
            <form action="audienciasJO.jsp" name="formJuzgadoAudi" method="post">
                <div id="juzClave">
                    <div>
                        <label for="juzgado">Juzgado Clave:</label>
                        <select name="juzgado" id="juzgado" onchange="formJuzgadoAudi.submit();">
                            <option value="">--Seleccione--</option>
                            <%
                                lstJuz = juz.findJuzgadosJO((Integer)session.getAttribute("tipoUsuario"), (String)session.getAttribute("usuActivo"));
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
            </form>
            <form name="formAudienciasJO" id="formAudienciasJO" method="post">
                <table id="tblAudiJO" class="tablasRegis" style="zoom: 90%" >
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Audiencias de Juicio Oral</th>
                            <th>Causa Relacionada</th>
                            <th>Jueces Celebran</th>
                            <th width="168">Fecha inicia</th>
                            <th width="168">Fecha finaliza</th>
                            <th>Acción</th>
                        </tr>
                    <thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <select name='audiJO' id='audiJO' class="txtLong" required>
                                    <option value=''>---Seleccione---</option>
                                    <%    
                                        lista = cat.findAudienciasJuicioOral();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        } 
                                    %>
                                </select>
                            </td>
                            <td>
                                <select name='causaJO' id='causaJO' class="txtMedia" required>
                                    <option value="">---Seleccione---</option>
                                    <option value='-2' data-data='{"causajc":"-2&<%=juzgado%>"}'>*Sin Especificar*</option>
                                    <%
                                        lista = sA.findCausasJO(juzgado);
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "' data-data='{\"causajc\":\"" + ls[1] +"&"+juzgado+"\"}'>" + ls[0].replace(juzLimpio, "") + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <div id="dJueces">
                                    <a href="capturaJuez.jsp" class="addJuez">
                                        <img src="img/add.png" title="Agregar Juez"> Agregar Juez
                                    </a>
                                <%
                                    lista = sA.findJueces(juzgado);
                                    for (String[] ls : lista){ 
                                        out.println("<input type='checkbox' name='juezJO' onchange='cuenta(this)' value='"+ ls[0] +"'/>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"<br>");
                                    }
                                    if(lista.isEmpty()){
                                       out.println("No hay Jueces para mostrar"); 
                                    }
                                %>
                                </div>
                            </td>
                            <td>
                                <input type="date" name="fechaIJO" id="fechaIJO" class="audiFecha" onblur="duracion(this,'#fechaFJO')" required/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkFINI" onclick="fechaNI(this, '#fechaIJO')" />N/I
                                </div>
                            </td>
                            <td>
                                <input type="date" name="fechaFJO" id="fechaFJO" class="audiFecha" onblur="duracion('#fechaIJO',this)" required/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkFFNI" onclick="fechaNI(this, '#fechaFJO')" />N/I
                                </div>
                            </td>
                            <td>
                                <input type="submit" name="addAudi" id="addAudi" class="addAudi" value="Agregar" onclick="validaJuzAdd()"/> 
                                <input type="hidden" name="operacion" id="operacion" value="insertar"/> 
                            </td>
                        </tr>
                    <%
                        lista = sA.recuperaAudienciasJO(juzgado);
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>"+ls[0]+"</td>");
                            out.println("<td>"+ls[1]+"</td>");
                            out.println("<td>"+ls[2].replace(juzLimpio, "")+"</td>");
                            out.println("<td>"+ls[3]+", "+ ls[4] + ", "+ ls[5]+"</td>");
                            out.println("<td>"+ls[6]+"</td>");
                            out.println("<td>"+ls[7]+"</td>");
                            out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"deleteAudienciasJO('"+ls[2]+"',"+ls[0]+");\"/></a></td>");
                            out.println("</tr>");
                        }
                    %>
                    </tbody>
                </table> 
            </form>
        </section>
    </body>
</html>
