<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.estatusEtapaIn"%>
<%@page import="clasesAuxiliar.estatus"%>
<%@page import="clasesAuxiliar.showInicial"%>
<%@page import="clasesAuxiliar.showIntermedia"%>
<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Causas Penales JC</title>
        <%@include file="librerias.jsp" %>
        <%
            //Unicamente lo utilizamos cuando recibimos el primer juez por juzgado
            if(request.getParameter("insert") != null){
                int integer = Integer.parseInt(request.getParameter("insert"));
                out.println("<script>$(document).ready(function () {");
                if(integer == 100){
                    out.println("alertify.alert('Confirmado','El Juez fue guardado correctamente', function(){"
                            + "alertify.success('Juez Guardado OK')});");
                }
                out.println("});</script>");
            }
            
            showJuzgados juz = new showJuzgados();
            showJueces juez = new showJueces();
            showCausasPenales cp = new showCausasPenales();
            estatus es = new estatus();
            usuario us = new usuario();
            showInicial Ini=new showInicial();
            estatusEtapaIn EtapaIn=new estatusEtapaIn();
            ArrayList<String[]> lsCausas;
            int Estatus = 0, cInicial = 0;
            ArrayList<String> lista;
            
            //Controlamos el juzgado para que tenga siempre uno seleccionado
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                juzgado = request.getParameter("juzgado");
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
            
            //Vaciamos la variable para que pueda entrar una nueva causa penal
            if(session.getAttribute("causaClave") != null){
                session.setAttribute("causaClave", "");
            }
            
            session.setAttribute("Sistema", "JC");//Lanzamos variable de session dependiendo del sistema
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
            <h1>Causas Penales JC</h1>
            <form action="causasPenales.jsp" name="formCP" method="post">
                <div id="juzClave">
                    <div>
                        <label for="juzgado">Juzgado Clave:</label>
                        <select name="juzgado" id="juzgado" onchange="formCP.submit();">
                            <option value="">--Seleccione--</option>
                            <%
                                //le mandamos el tipo de usuario y el nombre para mostrale los juzgados
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
                <span class="totExp" id="totCPJC"></span><!--Se llena dinamico con jquery -->
                <a class="add" href="#" onclick="validaAdd('elementosPrincipales');">
                    <img src="img/add3.png" width="20" height="20"/> Agregar
                </a>
                <table id="causas" class="myTable">
                    <thead>
                        <tr>
                            <!--<th>Posi</th>-->
                            <th>No. Asunto</th>
                            <th>Fecha Ingreso</th>
                            <th>Delitos</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <th>Órgano Competente</th>
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        lsCausas = cp.findCausasPenales(juzgado);
                        String juzLimpio = "";
                        String Est1="",Est2="",Est3="",Incom="",Com="";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        int pos = 0;
                        for (String[] ls : lsCausas) {
                            String ccSimple = ls[0].replace(juzLimpio, "");
                            cInicial = Ini.findEtapaCausaClave(ls[0]);
                            Estatus = us.findAvanceUsuario(ls[0]);
                            Incom=ls[2]+ls[3]+ls[4];
                            Est1 = "";
                            Est2 = "";
                            Est3 = "";
                            if ((Estatus != 6 || cInicial >= 1)) {
                                Est1 = es.finEstatus(Estatus, ls[0]);
                            }
                            if (Estatus == 6) {
                                Est2 = EtapaIn.findEstatusEtapaIn(ls[0], juzgado);
                            }
                            Est3 = Est1 + "---" + Est2;
                            if (Est3.equals("---")|| (Incom.equals("-2-2-2"))) {
                                Est3="---";
                                Com = "Completo";  
                            } else {
                                Com = "Incompleto";
                            }
                    %>
                        <tr>
                            <!--<td><--%=pos%></td>-->
                            <td><%=ccSimple%></td>
                            <td><%=ls[1]%></td>
                            <td><%=ls[2]%></td>
                            <td><%=ls[3]%></td>
                            <td><%=ls[4]%></td>
                            <td><%=ls[5]%></td>
                            <td><a  data-title="<%=Est3%>"> <%=Com%></a></td> 
                            <td><a href="elementosPrincipales.jsp?causaClave=<%=ccSimple%>"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><img src='img/delete.png' class="borrar" title="Eliminar" onclick="borraR(this)"/></td>
                        </tr>
                    <% 
                            pos++;
                        }
                    %>  
                    </tbody>
                </table>
            </form>
        </section>
    </body>
</html>
