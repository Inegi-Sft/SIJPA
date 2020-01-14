<%-- 
    Document   : elementos
    Created on : 4/10/2019, 11:24:50 AM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showVictimas"%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.showDelitos"%>
<%@page import="clasesAuxiliar.showConclusiones"%>
<%@page import="clasesAuxiliar.showTramite"%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Elementos del Expediente</title>
        <%@include file="librerias.jsp" %>
        <%
            showDelitos delito = new showDelitos();
            ArrayList<String[]> deli = new ArrayList();

            showProcesados procesa = new showProcesados();
            ArrayList<String[]> proce = new ArrayList();

            showVictimas victi = new showVictimas();
            ArrayList<String[]> vic = new ArrayList();

            showConclusiones conclusion = new showConclusiones();
            ArrayList<String[]> conc = new ArrayList();

            showTramite tram = new showTramite();
            ArrayList<String[]> trami = new ArrayList();
            
            HttpSession sesion= request.getSession();
            String expediente =(String) sesion.getAttribute("expediente");
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="causasPenales.jsp" >X</a>
            <br/>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1" style="display: block">Expediente</button>
                <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2" disabled>Delitos</button>
                <button class="pestanaLinks" onclick="openPestana('btn3', 'p3')" id="btn3" disabled>Adolescentes</button>
                <button class="pestanaLinks" onclick="openPestana('btn4', 'p4')" id="btn4" disabled>Victimas</button>
                <button class="pestanaLinks" onclick="openPestana('btn5', 'p5')" id="btn5" disabled>Inicial</button>
                <button class="pestanaLinks" onclick="openPestana('btn6', 'p6')" id="btn6" disabled>Intermedia</button>
                <button class="pestanaLinks" onclick="openPestana('btn7', 'p7')" id="btn7" disabled>Conclusion y/o Terminacion</button>
                <button class="pestanaLinks" onclick="openPestana('btn8', 'p8')" id="btn8" disabled>Tramite</button>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <%@include file="capturaExpediente.jsp"%>
                
            </div>
            <div id="p2" class="pestanaContent">
                <h2>Delitos</h2>
                <!--<a href="delitos.jsp" class="agregar pop"><img src="img/add.png"/> Agregar</a>-->
                <table class="tablasRegis" id="tablaDeli">
                    <thead>
                        <tr>
                            <th>Delito clave</th>
                            <th>Delito (Cod. Penal)</th>
                            <th>Delito (Norma Tec.)</th>
                            <th>Grado</th>
                            <th>Comisión</th>
                            <th>Editar</th>
                        </tr>
                    </thead>  
                    <tbody>
                        <%-- 
                            deli = delito.findDeliTabla();
                            for (String[] tm : deli) {
                                out.println("<tr>");
                                out.println("<td>" + tm[0] + "</td>");
                                out.println("<td>" + tm[1] + "</td>");
                                out.println("<td>" + tm[2] + "</td>");
                                out.println("<td>" + tm[3] + "</td>");
                                out.println("<td>" + tm[4] + "</td>");
                                out.println("<td><a class='pop' href='delitos.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("</tr>");
                            }
                        --%>

                    </tbody>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h2>Adolescentes</h2>
                <!--<a href="procesados.jsp" class="agregar pop"><img src="img/add.png"/> Agregar</a>-->
                <table id="tablaProcesa" class="tablasRegis">
                    <thead> 
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Tipo de Presentación</th>
                            <th>Sexo</th>
                            <th>Fecha nacimiento</th>
                            <th>Editar</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <%--  proce = procesa.findProcesasdosTabla();
                            for (String[] tm : proce) {
                                out.println("<tr>");
                                out.println("<td>" + tm[0] + "</td>");
                                out.println("<td>" + tm[1] + "</td>");
                                out.println("<td>" + tm[2] + "</td>");
                                out.println("<td>" + tm[3] + "</td>");
                                out.println("<td>" + tm[4] + "</td>");
                                out.println("<td><a class='pop' href='tramite.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("</tr>");
                            }
                        --%>
                    </tbody>
                </table>
            </div>
            <div id="p4" class="pestanaContent">
                <h2>Victimas</h2>
                <table class="tablasRegis" id="tablaVictimas">
                    <thead> 
                        <tr>
                            <th>Victima clave</th>
                            <th>Tipo de Víctima</th>
                            <th>Sexo</th>
                            <th>Fecha nacimiento</th>
                            <th>Lugar nacimiento</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--  vic = victi.findVictimasTabla();
                            for (String[] tm : vic) {
                                out.println("<tr>");
                                out.println("<td>" + tm[0] + "</td>");
                                out.println("<td>" + tm[1] + "</td>");
                                out.println("<td>" + tm[2] + "</td>");
                                out.println("<td>" + tm[3] + "</td>");
                                out.println("<td>" + tm[4] + "</td>");
                                out.println("<td><a class='pop' href='tramite.jsp'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("</tr>");
                            }
                        --%>
                    </tbody>
                </table>
            </div>
            <div id="p5" class="pestanaContent">
                <h2>Etapa Inicial</h2>
                <table class="tablasRegis" id="tablaInicial">
                    <thead>
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th width="150">¿Hubo control de detención?</th>
                            <th>Resolución auto de vinculación </th>
                            <th width="150">¿Se dictó sobreseimiento?</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
            <div id="p6" class="pestanaContent">
                <h2>Etapa Intermedia</h2>
                <table class="tablasRegis" id="tablaIntermedia">
                    <thead>
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Audiencia intermedia</th>
                        <th>Escrito acusación</th>
                        <th>Presentacion medios prueba</th>
                        <th>Acuerdos probatorios</th>
                        <th>Editar</th>
                    </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
            <div id="p7" class="pestanaContent">
                <h2>Resoluciones dictadas</h2>
                <table class="dContenido">
                    <tr>
                        <td>
                            <span class="indicador" id="lblNumConclu"></span>
                            <span class="indicador2 proPendientes"></span>
                            <a href="conclusiones.jsp" class="agregar pop" id="addConclu"><img src="img/add.png"/> Agregar</a>
                        </td>
                    </tr>
                </table>
                <table class="tablasRegis " id="tablaConclu">
                    <thead>
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Fecha conclusión</th>
                            <th>Tipo conclusión/terminación</th>
                            <th width="80">Editar</th>
                            <th width="80">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--  conc = conclusion.findConcluTabla();
                            for (String[] tm : conc) {
                                out.println("<tr>");
                                out.println("<td>" + tm[0] + "</td>");
                                out.println("<td>" + tm[1] + "</td>");
                                out.println("<td>" + tm[2] + "</td>");
                                out.println("<td>" + tm[3] + "</td>");
                                out.println("<td><a class='pop' href='conclusiones.jsp?pc=" + tm[2] + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                out.println("</tr>");
                            }
                        --%>
                    </tbody>
                </table>
            </div>
            <div id="p8" class="pestanaContent">
                <h2>Pendientes de resolución</h2>
                <!--<div class="listaTable">-->
                    <table class="dContenido">
                        <tr>
                            <td>
                                <span class="indicador" id="lblNumTram"></span>
                                <span class="indicador2 proPendientes"></span>
                                <a href="tramite.jsp" class="agregar pop" id="addTram"><img src="img/add.png"/> Agregar</a>
                            </td>
                        </tr>
                    </table>
                    <table class="tablasRegis" id="tablaTramite">
                        <thead>
                            <tr>
                                <th>Procesado clave</th>
                                <th>Nombre</th>
                                <th>Etapa procesal</th>
                                <th>Fecha del último acto procesal</th>
                                <th width="80">Editar</th>
                                <th width="80">Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%--  trami = tram.findTramite();
                                for (String[] tm : trami) {
                                    out.println("<tr>");
                                    out.println("<td>" + tm[4] + "</td>");
                                    out.println("<td>" + tm[5] + "</td>");
                                    out.println("<td>" + tm[6] + "</td>");
                                    out.println("<td>" + tm[7] + "</td>");
                                    out.println("<td><a class='pop' href='tramite.jsp?pc=" + tm[4] + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                }
                            --%>
                        </tbody>
                    </table>
                </div>
<!--                <div class="lista" id="listPTramite">
                    <label>Respecto a la Etapa Inicial, estos adolescentes deben registrarse en pendientes de resolución:</label>
                    <ul>
                        <li>00148/2019-P3</li>
                        <li>00148/2019-P4</li>
                    </ul>
                </div>-->
            </div>
        </section>
    </body>
</html>
