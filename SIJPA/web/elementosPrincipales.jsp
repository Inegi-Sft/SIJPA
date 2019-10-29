<%-- 
    Document   : elementos
    Created on : 4/10/2019, 11:24:50 AM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showConclusiones"%>
<%@page import="clasesAuxiliar.showTramite"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Elementos del Expediente</title>
        <%@include file="librerias.jsp" %>
        <%
            if (request.getParameter("error") != null) {
                out.println("<script>alert('error en el proceso de guardado')</script>");
            } else if (request.getParameter("seinserto") != null) {
                out.println("<script>parent.$.fancybox.close(); window.location='elementosPrincipales.jsp';</script>");
//                out.println("$('#p8').load($('tramite.jsp #tramiteRegis'))</script>");
//                out.println("<script type='text/javascript'>window.location='elementosPrincipales.jsp';</script>");
            }
        %>
    </head>
    <body>
        <%
            showTramite tram = new showTramite();
            ArrayList<String[]> trami = new ArrayList();

            showConclusiones conclusion = new showConclusiones();
            ArrayList<String[]> conc = new ArrayList();
        %>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="causasPenales.jsp" >X</a>
            <br/>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana(event, 'p1')" id="btn1" style="display: block">Expediente</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Delitos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Adolescentes</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Victimas</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Inicial</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p6')">Intermedia</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p7')">Conclusion y/o Terminacion</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p8')">Tramite</button>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <%@include file="capturaExpediente.jsp"%>
            </div>
            <div id="p2" class="pestanaContent">
                <h2>Delitos</h2>
                <table class="tablasRegis">
                    <tr>
                        <th>Delito clave</th>
                        <th>Delito (Cod. Penal)</th>
                        <th>Delito (Norma Tec.)</th>
                        <th>Grado</th>
                        <th>Comisión</th>
                        <th>No. Adolescentes</th>
                        <th>No. Victimas</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-d1</td>
                        <td>Homicidio</td>
                        <td>Homicidio</td>
                        <td>Consumado</td>
                        <td>Doloso</td>
                        <td>1</td>
                        <td>2</td>
                        <td><a class="pop" href="delitos.jsp"><img src='img/editar.png' title="Editar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>

                    </tr>
                    <tr>
                        <td>0002/2019-d2</td>
                        <td>Lesiones</td>
                        <td>Lesiones</td>
                        <td>Consumado</td>
                        <td>Doloso</td>
                        <td>1</td>
                        <td>2</td>
                        <td><a class="pop" href="delitos.jsp"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h2>Adolescentes</h2>
                <table id="tramiteRegis" class="tablasRegis">
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Tipo de Presentación</th>
                        <th>Sexo</th>
                        <th>Fecha nacimiento</th>
                        <th>Lugar nacimiento</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-p1</td>
                        <td>Detenido</td>
                        <td>Hombre</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a class="pop" href="procesados.jsp"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                </table>
            </div>
            <div id="p4" class="pestanaContent">
                <h2>Victimas</h2>
                <table class="tablasRegis">
                    <tr>
                        <th>Victima clave</th>
                        <th>Tipo de Víctima</th>
                        <th>Sexo</th>
                        <th>Fecha nacimiento</th>
                        <th>Lugar nacimiento</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-v1</td>
                        <td>Persona Fisica</td>
                        <td>Hombre</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a class="pop" href="victimas.jsp"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                </table>
            </div>
            <div id="p5" class="pestanaContent">
                <h2>Etapa Inicial</h2>
                <table class="tablasRegis">
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Control detencion</th>
                        <th>Audiencia inicial</th>
                        <th>Auto vinculacion</th>
                        <th>Medida cautelar</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-p1</td>
                        <td>Si</td>
                        <td>Si</td>
                        <td>Vinculación a proceso</td>
                        <td>No</td>
                        <td><a class="pop" href="etapaInicial.jsp"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                </table>
            </div>
            <div id="p6" class="pestanaContent">
                <h2>Etapa Intermedia</h2>
                <table class="tablasRegis">
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Audiencia intermedia</th>
                        <th>Escrito acusación</th>
                        <th>Presentacion medios prueba</th>
                        <th>Acuerdos probatorios</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-c2</td>
                        <td>Si</td>
                        <td>No</td>
                        <td>Si</td>
                        <td>No</td>
                        <td><a class="pop" href="etapaIntermedia.jsp"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                </table>
            </div>
            <div id="p7" class="pestanaContent">
                <h2>Resoluciones dictadas</h2>
                <table class="tablasRegis">
                    <tr>
                        <th>Conclusión clave</th>
                        <th>Fecha conclusión</th>
                        <th>Adolescente clave</th>
                        <th>Tipo conclusión/terminación</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tbody>
                        <%  conc = conclusion.findConcluTabla();
                            for (String[] tm : conc) {
                                out.println("<tr>");
                                out.println("<td>" + tm[0] + "</td>");
                                out.println("<td>" + tm[1] + "</td>");
                                out.println("<td>" + tm[2] + "</td>");
                                out.println("<td>" + tm[3] + "</td>");
                                out.println("<td><a class='pop' href='tramite.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p8" class="pestanaContent">
                <h2>Pendientes de resolución</h2>
                <table class="tablasRegis" id="tramiteRegis">
                    <tr>
                        <th>Procesado clave</th>
                        <th>Etapa procesal</th>
                        <th>Motivo</th>
                        <th>Fecha última actuación</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tbody>
                        <%  trami = tram.findTramite();
                            for (String[] tm : trami) {
                                out.println("<tr>");
                                out.println("<td>" + tm[4] + "</td>");
                                out.println("<td>" + tm[5] + "</td>");
                                out.println("<td>" + tm[6] + "</td>");
                                out.println("<td>" + tm[7] + "</td>");
                                out.println("<td><a class='pop' href='tramite.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
