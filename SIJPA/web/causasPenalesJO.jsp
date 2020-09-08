<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.estatusEtapaJO"%>
<%@page import="clasesAuxiliar.showJuicio"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page import="clasesAuxiliar.estatusJO"%>
<%@page import="clasesAuxiliar.showCausasPenalesJO"%>
<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Causas Penales JO</title>
        <%@include file="librerias.jsp" %>
        <%
            showJuzgados juz = new showJuzgados();
            showJueces juez = new showJueces();
            showCausasPenalesJO cp = new showCausasPenalesJO();
            estatusJO esJO = new estatusJO();
            usuario us = new usuario();
            showJuicio Juicio = new showJuicio();
            estatusEtapaJO EtapaJO = new estatusEtapaJO();
            ArrayList<String[]> lsCausasJC;
            ArrayList<String> lista;
            int Estatus = 0, cInicial = 0;
            
            //Controlamos el juzgado para que tenga siempre uno seleccionado
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                juzgado = request.getParameter("juzgado");
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
//                    else if(juez.findTotJuez(juzgado) == 0){
//                        //Si el Juzgado seleccionado no tiene jueces entonces lo mandamos a capturar un Juez
//                        response.sendRedirect("capturaJuez.jsp");
//                    }
                }
            }
            
            //Vaciamos la variable para que pueda entrar una nueva causa penal
            if(session.getAttribute("causaClave") != null){
                session.setAttribute("causaClave", "");
                session.setAttribute("causaClaveJO", "");
            }
            
            session.setAttribute("Sistema", "JO");//Lanzamos variable de session dependiendo del sistema
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
            <h1>Causas Penales JO</h1>
            <form action="causasPenalesJO.jsp" name="formCPJO" method="post">
                <div id="juzClave">
                    <div>
                        <label for="juzgado">Juzgado Clave:</label>
                        <select name="juzgado" id="juzgado" onchange="formCPJO.submit();">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = juz.findJuzgadosJO();
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
                <span class="totExp" id="totCPJO"></span><!--Se llena dinamico con jquery -->
                <a class="add" href="#" onclick="validaAdd('elementosPrincipalesJO');">
                    <img src="img/add3.png" width="20" height="20"/> Agregar
                </a>
                <table id="causasJO" class="myTable">
                    <thead>
                        <tr>
                            <th>Juzgado JC</th>
                            <th>No. Asunto JC</th>
                            <th>No. Asunto JO</th>
                            <th>Fecha Ingreso JC</th>
                            <th>Conductas Antisociales</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <!--<th>Organo Diferente</th>-->
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <!--<th>Eliminar</th>-->
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        String juzLimpio = "";
                        String Est1="",Est2="",Est3="",EI,Com="";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        int pos = 0;
                        lsCausasJC = cp.findCausasJOyJC(juzgado);
                        for (String[] lsJC : lsCausasJC) {
                            //String ccJCSimple = lsJC[0].replace(juzLimpio, "");
                            //Validamos si ya esiste en JO o aun sigue en JC
                            //lisCausaJO = cp.findCausasPenalesJO(juzgado, lsJC[0]);
                            if(!lsJC[2].equals("--")){//Si se encuentra en JO recuperamos los datos
                                cInicial = Juicio.findEtapaCausaClaveJO(lsJC[2]);
                                Estatus = us.findAvanceUsuarioJO(lsJC[2]);
                                Est1 = "";
                                Est2 = "";
                                Est3 = "";
                                if ((Estatus == 5) || (cInicial == 0)) { 
                                    Est1 = esJO.findEstatus(Estatus, lsJC[2]);
                                }
                                if (cInicial > 0) {
                                    Est2 = EtapaJO.findEstatusOral(lsJC[2], juzgado);
                                }
                                Est3 = Est1 + "---" + Est2;
                                if (Est3.equals("---")) {
                                    Com = "Completo";
                                } else {
                                    Com = "Incompleto";
                                }
                                
                                out.println("<tr>");
                                out.println("<td>" + lsJC[0] + "</td>");
                                out.println("<td>" + lsJC[1].replace(lsJC[0].replace("-", ""), "") + "</td>");
                                out.println("<td>" + lsJC[2].replace(juzLimpio, "") + "</td>");
                                out.println("<td>" + lsJC[3] + "</td>");
                                out.println("<td>" + lsJC[4] + "</td>");
                                out.println("<td>" + lsJC[5] + "</td>");
                                out.println("<td>" + lsJC[6] + "</td>");
                                out.println("<td><a data-title='" + Est3 + "'> " + Com + "</a></td>");
                                out.println("<td><a href='elementosPrincipalesJO.jsp?juzClaveJC=" + lsJC[0] + "&causaClaveJC=" + lsJC[1].replace(lsJC[0].replace("-", ""), "") 
                                        + "&causaClaveJO=" + lsJC[2].replace(juzLimpio, "") + "'><img src='img/editar.png' title='Editar'/></a></td>");
                                //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"borraRegistro(" + ls[0] + "," + pos + ",'causasJO')\"/></a></td>");
                                out.println("</tr>");
                            }else{//Si no esta en JO los recuperamos de JC
                                out.println("<tr>");
                                out.println("<td>" + lsJC[0] + "</td>");
                                out.println("<td>" + lsJC[1].replace(lsJC[0].replace("-", ""), "") + "</td>");
                                out.println("<td>--</td>");
                                out.println("<td>" + lsJC[3] + "</td>");
                                out.println("<td>" + lsJC[4] + "</td>");
                                out.println("<td>" + lsJC[5] + "</td>");
                                out.println("<td>" + lsJC[6] + "</td>");
                                out.println("<td>Incompleto</td>");
                                out.println("<td><a href='elementosPrincipalesJO.jsp?juzClaveJC=" + lsJC[0] + "&causaClaveJC=" + lsJC[1].replace(lsJC[0].replace("-", ""), "")
                                        + "'><img src='img/editar.png' title='Editar'/></a></td>");
                                //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"borraRegistro(" + ls[0] + "," + pos + ",'causasJO')\"/></a></td>");
                                out.println("</tr>");
                            }
                            pos++;
                        }
                    %>
                    </tbody>
                </table>
            </form>
        </section>
    </body>
</html>
