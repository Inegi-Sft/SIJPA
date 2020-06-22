<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="com.sun.xml.internal.ws.api.message.saaj.SAAJFactory"%>
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
            estatusJO esJO= new estatusJO();
            usuario us=new usuario();
            showJuicio Juicio=new showJuicio();
            estatusEtapaJO EtapaJO=new estatusEtapaJO();
            int ExisEJO=0;
            ArrayList<String[]> lsCausasJC, lisCausaJO;
            ArrayList<String> lista;
            int Estatus=0,cInicial=0;
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                if(request.getParameter("juzgado") != ""){
                    juzgado=request.getParameter("juzgado");
                    session.setAttribute("juzgadoClave", juzgado);
                }
            }else if(session.getAttribute("juzgadoClave") != null){
                juzgado = (String) session.getAttribute("juzgadoClave");
            }
            
            if(juz.findTotJuzgado() == 0){
                response.sendRedirect("capturaJuzgado.jsp");
            }else if(session.getAttribute("juzgadoClave") != null){
                if(juez.findTotJuez((String)session.getAttribute("juzgadoClave")) == 0){
                    response.sendRedirect("capturaJuez.jsp");
                }
            }
            
            if(session.getAttribute("causaClave") != null){
                session.setAttribute("causaClave", "");
                session.setAttribute("causaClaveJO", "");
            }
            session.setAttribute("Sistema", "JO");
            int tCausasJuz = cp.countCausasPenalesJO(juzgado);
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
                    <label for="juzgado">Juzgado Clave:</label>
                    <select name="juzgado" id="juzgado" class="txtLong" onchange="formCPJO.submit();">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = juz.findJuzgados();
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
                <span class="totExp">Total: <%=tCausasJuz%></span>
<!--                <span class="msjAviso" hidden>Selecciona el Juzgado al cual se le agregarán las Causas Penales</span>
                <a class="add" href="#" onclick="validaAddCausa();">
                    <img src="img/add3.png" width="20" height="20"/> Agregar Expediente
                </a>-->
                <table id="causasJO" class="myTable">
                    <thead>
                        <tr>
                            <th>Posi</th>
                            <th>No. Asunto JC</th>
                            <th>No. Asunto JO</th>
                            <th>Fecha Ingreso</th>
                            <th>Conductas Antisociales</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <th>Organo Diferente</th>
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <!--<th>Eliminar</th>-->
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        lsCausasJC = cp.findCausasJOenJC(juzgado);
                        String juzLimpio = "";
                        String Est1="",Est2="",Est3="",EI,Com="";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        int pos = 0;
                        for (String[] lsJC : lsCausasJC) {
                            String ccJCSimple = lsJC[0].replace(juzLimpio, "");
                            //Validamos si ya esiste en JO o aun sigue en JC
                            lisCausaJO = cp.findCausasPenalesJO(juzgado, lsJC[0]);
                            if(lisCausaJO.size() > 0){//Si se encuentra en JO recuperamos los datos
                                cInicial = Juicio.findEtapaCausaClaveJO(lisCausaJO.get(0)[1]);
                                Estatus = us.findAvanceUsuarioJO(lisCausaJO.get(0)[1]);
                                Est1 = "";
                                Est2 = "";
                                Est3 = "";
                                System.out.println("El Estatus essss "+Estatus+" cinicial "+cInicial);
                                if ((Estatus != 5 || cInicial > 0)) {
                                    Est1 = esJO.findEstatus(Estatus, lisCausaJO.get(0)[1]);
                                }
                                if (Estatus == 5) {
                                    Est2 = EtapaJO.findEstatusOral(lisCausaJO.get(0)[1], juzgado);
                                }
                                Est3 = Est1 + "---" + Est2;
                                if (Est3.equals("---")) {
                                    Com = "Completo";
                                } else {
                                    Com = "Incompleto";
                                }
                                System.out.println(Est1+Com+"fin validacion");
                                
                                out.println("<tr>");
                                out.println("<td>" + pos + "</td>");
                                out.println("<td>" + ccJCSimple + "</td>");
                                String ccJOSimple = lisCausaJO.get(0)[1].replace(juzLimpio, "");
                                out.println("<td>" + ccJOSimple + "</td>");
                                out.println("<td>" + lisCausaJO.get(0)[2] + "</td>");
                                out.println("<td>" + lisCausaJO.get(0)[3] + "</td>");
                                out.println("<td>" + lisCausaJO.get(0)[4] + "</td>");
                                out.println("<td>" + lisCausaJO.get(0)[5] + "</td>");
                                out.println("<td>" + lisCausaJO.get(0)[6] + "</td>");
                                out.println("<td><a data-title='"+ Est3 +"'> "+ Com +"</a></td>");
                                out.println("<td><a href='elementosPrincipalesJO.jsp?causaClaveJC=" + ccJCSimple + "&causaClaveJO=" + ccJOSimple + "'><img src='img/editar.png' title='Editar'/></a></td>");
                                //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' onclick=\"borraRegistro(" + ls[0] + "," + pos + ",'causasJO')\"/></a></td>");
                                out.println("</tr>");
                            }else{//Si no esta en JO los recuperamos de JC
                                out.println("<tr>");
                                out.println("<td>" + pos + "</td>");
                                out.println("<td>" + ccJCSimple + "</td>");
                                out.println("<td>--</td>");
                                out.println("<td>" + lsJC[1] + "</td>");
                                out.println("<td>" + lsJC[2] + "</td>");
                                out.println("<td>" + lsJC[3] + "</td>");
                                out.println("<td>" + lsJC[4] + "</td>");
                                out.println("<td>--</td>");
                                out.println("<td>--</td>");
                                out.println("<td><a href='elementosPrincipalesJO.jsp?causaClaveJC=" + ccJCSimple + "'><img src='img/editar.png' title='Editar'/></a></td>");
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
