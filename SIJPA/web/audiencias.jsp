<%-- 
    Document   : audiencias
    Created on : 3/04/2020, 09:34:31 AM
    Author     : FERMIN.GOMEZ
--%>

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
        <script type="text/javascript" src="js/fnAudiencias.js"></script>
        <%  
            showJuzgados juz = new showJuzgados();
            showAudiencias sa = new showAudiencias();
            ArrayList<String[]> listas;
            ArrayList<String> lista;
            
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
//                    else if(juez.findTotJuez(juzgado) == 0){
//                        //Si el Juzgado seleccionado no tiene jueces entonces lo mandamos a capturar un Juez
//                        response.sendRedirect("capturaJuez.jsp");
//                    }
                }
            }
            
            String funJuz = juz.findFuncionDes(juzgado);
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
            <form action="audiencias.jsp" name="formAudiencias" method="post">
                <div id="juzClave">
                    <div>
                        <label for="juzgado">Juzgado Clave:</label>
                        <select name="juzgado" id="juzgado" onchange="formAudiencias.submit();">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = juz.findJuzgadosJC((Integer)session.getAttribute("tipoUsuario"), (String)session.getAttribute("usuActivo"));
                                for (String ls : lista) {
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
                <a class="add" href="#" onclick="validaAdd('capturaAudiencias');">
                    <img src="img/add3.png" width="20" height="20"/> Agregar 
                </a>
                <table id="causas" class="myTable" >
                    <thead>
                        <tr>
                            <th>Causa Penal</th>
                            <th>Juez</th>
                            <th width="180">Audiencias Investigacion</th>
                            <th width="180">Audiencias Intermedia</th>
                            <th width="40">Editar</th>
                            <th width="40">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        listas = sa.findAllCausaAudiencias(juzgado);
                        String juzLimpio = "";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        for (String[] ls : listas) {
                            String causa = ls[0].replace(juzLimpio, "");
                    %>
                        <tr>
                            <td><%=causa%></td>
                            <td><%=ls[1]%></td>
                            <td><%=ls[2]%></td>
                            <td><%=ls[3]%></td>
                            <td><a href="capturaAudiencias.jsp?causaClave=<%=ls[0]%>"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><a href="#"><img src='img/delete.png' title="Eliminar" onclick="deleteAudiencias('<%=ls[0]%>');"/></a></td>
                        </tr>
                    <% 
                        }
                    %>
                    </tbody>
                </table>
                </div>
            </form>
        </section>
    </body>
</html>
