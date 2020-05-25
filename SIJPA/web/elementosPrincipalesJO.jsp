<%-- 
    Document   : elementosPrincipalesJO
    Created on : 29/04/2020, 07:44:49 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showDelitosJO"%>
<%@page import="clasesAuxiliar.showProcesadosJO"%>
<%@page import="clasesAuxiliar.showVictimasJO"%>
<%@page import="clasesAuxiliar.showJuicio"%>
<%@page import="clasesAuxiliar.showConclusionesJO"%>
<%@page import="clasesAuxiliar.showTramiteJO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Elementos JO</title>
        <%@include file="librerias.jsp" %>
        <%  
            showDelitosJO delito = new showDelitosJO();
            ArrayList<String[]> deliJC, deliJO;

            showProcesadosJO procesa = new showProcesadosJO();
            ArrayList<String[]> proceJC, proceJO;

            showVictimasJO victi = new showVictimasJO();
            ArrayList<String[]> vicJC, vicJO;
            
            showJuicio juicio = new showJuicio();
            ArrayList<String[]> juiciJC, juiciJO ;

            showConclusionesJO conclusion = new showConclusionesJO();
            ArrayList<String[]> concJC, concJO;

            showTramiteJO tramite = new showTramiteJO();
            ArrayList<String[]> tramJC, tramJO ;
            
            String jc = (String)session.getAttribute("juzgadoClave");
            int y = 0;
            String ccJC = "";
            String ccJuz = "";
            if(request.getParameter("causaClaveJC") != null){//Si viene la causa penal, recuperamos datos
                ccJC = request.getParameter("causaClaveJC");
                ccJuz = ccJC + jc.replace("-", "");
            }
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="causasPenalesJO.jsp" >X</a>
            <br/>
            <div class="pestana">
                <%@include file="botonesPrinciJO.jsp"%>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <%@include file="capturaCausaPenalJO.jsp"%> 
            </div>
            <div id="p2" class="pestanaContent">
                <h2>Delitos</h2>
                <table class="tablasRegis" id="tablaDeliJO">
                    <thead>
                        <tr>
                            <th>Delito clave</th>
                            <th>Delito (Cod. Penal)</th>
                            <th>Delito (Norma Tec.)</th>
                            <th>Fecha Ocurrencia</th>
                            <th>Grado</th>
                            <th>Comisión</th>
                            <th>Editar</th>
                            <!--<th>Eliminar</th>-->
                        </tr>
                    </thead>  
                    <tbody> 
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                deliJC = delito.findDeliCausasJC(ccJuz);//Obtenemos delitos por causa
                                for(String[] delJC : deliJC){//For para recorrer todos los delitos en la causa penal JC
                                    deliJO = delito.findDeliCausasJO(ccJuz, delJC[0]);
                                    if(deliJO.size() > 0){//Si el delito esta en BD de JO se muestra
                                        out.println("<tr>");
                                        out.println("<td>" + deliJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + deliJO.get(0)[1] + "</td>");
                                        out.println("<td>" + deliJO.get(0)[2] + "</td>");
                                        out.println("<td>" + deliJO.get(0)[3] + "</td>");
                                        out.println("<td>" + deliJO.get(0)[4] + "</td>");
                                        out.println("<td>" + deliJO.get(0)[5] + "</td>");
                                        out.println("<td><a class='pop' href='delitosJO.jsp?delitoClave=" + deliJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Editar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    else{//Si el delito no esta en la BD de JO lo recuperamos de JC y se muestra
                                        out.println("<tr>");
                                        out.println("<td>" + delJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='delitosJO.jsp?delitoClave=" + delJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"'/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h2>Adolescentes</h2>
                <table class="tablasRegis" id="tablaProcesaJO">
                    <thead> 
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Condición Reincidencia</th>
                            <th>Sexo</th>
                            <th>Fecha nacimiento</th>
                            <th>Editar</th>
                            <!--<th>Eliminar</th>-->
                        </tr>
                    </thead> 
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                proceJC = procesa.findProcesasdosCausaJC(ccJuz);
                                for(String[] proJC : proceJC){//For para recorrer los procesados en de la cuasa penal de JC
                                    proceJO = procesa.findProcesasdosCausaJO(ccJuz, proJC[0]);
                                    if(proceJO.size() > 0){//Si el procesado esta lleno en BD de JO lo mostramos
                                        out.println("<tr>");
                                        out.println("<td>" + proceJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + proceJO.get(0)[1] + "</td>");
                                        out.println("<td>" + proceJO.get(0)[2] + "</td>");
                                        out.println("<td>" + proceJO.get(0)[3] + "</td>");
                                        out.println("<td>" + proceJO.get(0)[4] + "</td>");
                                        out.println("<td><a class='pop' href='procesadosJO.jsp?proceClave=" + proceJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + proc[0] + "'," + y + ",'tablaProcesa','#Tadolescentes')\"/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si el procesado no esta en BD de JO se recupera de JC
                                        out.println("<tr>");
                                        out.println("<td>" + proJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='procesadosJO.jsp?proceClave=" + proJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + proc[0] + "'," + y + ",'tablaProcesa','#Tadolescentes')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p4" class="pestanaContent">
                <h2>Victimas</h2>
                <table class="tablasRegis" id="tablaVictimasJO">
                    <thead> 
                        <tr>
                            <th>Victima clave</th>
                            <th>Tipo de Víctima</th>
                            <th>Sexo</th>
                            <th>Fecha nacimiento</th>
                            <th>Lugar nacimiento</th>
                            <th>Editar</th>
                            <!--<th>Eliminar</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                vicJC = victi.findVictimasCausaJC(ccJuz);
                                for(String[] viJC : vicJC){//For para recorrer todas las victimas registradas en BD de JC
                                    vicJO = victi.findVictimasCausaJO(ccJuz, viJC[0]);
                                    if(vicJO.size() > 0){//Si tenemos victimas registradas en la BD de JO las mostramos
                                        out.println("<tr>");
                                        out.println("<td>" + vicJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + vicJO.get(0)[1] + "</td>");
                                        out.println("<td>" + vicJO.get(0)[2] + "</td>");
                                        out.println("<td>" + vicJO.get(0)[3] + "</td>");
                                        out.println("<td>" + vicJO.get(0)[4] + "</td>");
                                        out.println("<td><a class='pop' href='victimasJO.jsp?victiClave=" + vicJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + vi[0] + "'," + y + ",'tablaVictimas','#Tvictimas')\"/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si la victima no esta en BD se agrega vacia
                                        out.println("<tr>");
                                        out.println("<td>" + viJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='victimasJO.jsp?victiClave=" + viJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + vi[0] + "'," + y + ",'tablaVictimas','#Tvictimas')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p5" class="pestanaContent">
                <h2>Juicio Oral</h2>
                <table class="tablasRegis" id="tablaJuicioJO">
                    <thead>
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Medidas diciplinarias</th>
                            <th>Incidentes en audiencia</th>
                            <th>Suspencion de audiencia</th>
                            <th>Emision de Fallo</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                juiciJC = juicio.findProceJuicioJC(ccJuz);
                                for(String[] juiJC : juiciJC){//For para recorrer todos los procesados que pasan a JO en JC
                                    juiciJO = juicio.findProceJuicioJO(ccJuz, juiJC[0]);
                                    if(juiciJO.size() > 0){//Si el procesado esta en inicial de la BD lo agregamos
                                        out.println("<tr>");
                                        out.println("<td>" + juiciJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[1] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[2] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[3] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[4] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[5] + "</td>");
                                        out.println("<td><a class='pop' href='etapaOral.jsp?proceClave=" + juiciJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{
                                        out.println("<tr>");
                                        out.println("<td>" + juiJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + juiJC[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='etapaOral.jsp?proceClave=" + juiJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p6" class="pestanaContent">
                <h2>Resoluciones dictadas</h2>
                <table class="dContenido">
                    <tr>
                        <td>
                            <%--
                                if(!ccJC.equals("")){
                                    etapaProce = inicial.findCausaEtapa(ccJuzJC, 5);//Buscamos cuales procesados sin capturar en etapa 5
                                    if(etapaProce.size() != 0){//Si existen mostraremos el emsaje de cuantos procesados hay en esa etapa
                                        out.println("<p class='indicador2' style='color:#D60320'>");
                                        out.println("<span id='indicaVolando'>" + etapaProce.size() + "</span>");
                                        out.println("adolescente(s) por asignar estatus</p>");
                                        out.println("<a href='conclusiones.jsp' class='agregar pop'><img src='img/add.png'/> Agregar</a>");
                                    }else{
                                        out.println("<p class='indicador2'><span id='indicaVolando'>0</span>");
                                        out.println("adolescente(s) por asignar estatus</p>");
                                        out.println("<a href='conclusiones.jsp' class='agregar pop oculto'><img src='img/add.png'/> Agregar</a>");
                                    }
                                }else{
                                    out.println("<p class='indicador2'><span id='indicaVolando'>0</span>");
                                    out.println("adolescente(s) por asignar estatus</p>");
                                    out.println("<a href='conclusiones.jsp' class='agregar pop oculto'><img src='img/add.png'/> Agregar</a>");
                                }
                            --%>
                        </td>
                    </tr>
                </table>
                <table class="tablasRegis " id="tablaConcluJO">
                    <thead>
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Fecha conclusión</th>
                            <th>Tipo conclusión/terminación</th>
                            <th>Editar</th>
                            <!--<th width="80">Borrar</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                concJC = conclusion.findConcluCausaJC(ccJuz);
                                for(String[] conJC : concJC){//For para recorrer todos los procesados que pasan a JO en JC
                                    concJO = conclusion.findConcluCausaJO(ccJuz, conJC[0]);
                                    if(concJO.size() > 0){//Si el procesado esta en inicial de la BD lo agregamos
                                        out.println("<tr>");
                                        out.println("<td>" + concJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + concJO.get(0)[1] + "</td>");
                                        out.println("<td>" + concJO.get(0)[2] + "</td>");
                                        out.println("<td>" + concJO.get(0)[3] + "</td>");
                                        out.println("<td><a class='pop' href='conclusionesJO.jsp?proceClave=" + concJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{
                                        out.println("<tr>");
                                        out.println("<td>" + conJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + conJC[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='conclusionesJO.jsp?proceClave=" + conJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p7" class="pestanaContent">
                <h2>Pendientes de resolución</h2>
                <table class="dContenido">
                    <tr>
                        <td>
                            <%--
                                if(!ccJC.equals("")){
                                    etapaProce = inicial.findCausaEtapa(ccJuzJC, 5);//Buscamos cuales procesados sin capturar en etapa 5
                                    if(etapaProce.size() != 0){//Si existen mostraremos el emsaje de cuantos procesados hay en esa etapa
                                        out.println("<p class='indicador2' style='color:#D60320'>");
                                        out.println("<span>" + etapaProce.size() + "</span>");
                                        out.println("adolescente(s) por asignar estatus</p>");
                                        out.println("<a href='tramite.jsp' class='agregar pop'><img src='img/add.png'/> Agregar</a>");
                                    }else{
                                        out.println("<p class='indicador2'><span>0</span>");
                                        out.println("adolescente(s) por asignar estatus</p>");
                                        out.println("<a href='tramite.jsp' class='agregar pop oculto'><img src='img/add.png'/> Agregar</a>");
                                    }
                                }else{
                                    out.println("<p class='indicador2'><span>0</span>");
                                    out.println("adolescente(s) por asignar estatus</p>");
                                    out.println("<a href='tramite.jsp' class='agregar pop oculto'><img src='img/add.png'/> Agregar</a>");
                                }
                            --%>
                        </td>
                    </tr>
                </table>
                <table class="tablasRegis" id="tablaTramiteJO">
                    <thead>
                        <tr>
                            <th>Procesado clave</th>
                            <th>Nombre</th>
                            <th>Etapa procesal</th>
                            <th>Fecha del último acto procesal</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                tramJC = tramite.findTramiteCausaJC(ccJuz);
                                for(String[] traJC : tramJC){//For para recorrer todos los procesados que pasan a JO en JC
                                    tramJO = tramite.findTramiteCausaJO(ccJuz, traJC[0]);
                                    if(tramJO.size() > 0){//Si el procesado esta en inicial de la BD lo agregamos
                                        out.println("<tr>");
                                        out.println("<td>" + tramJO.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + tramJO.get(0)[1] + "</td>");
                                        out.println("<td>Juicio Oral</td>");
                                        out.println("<td>" + tramJO.get(0)[2] + "</td>");
                                        out.println("<td><a class='pop' href='tramiteJO.jsp?proceClave=" + tramJO.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{
                                        out.println("<tr>");
                                        out.println("<td>" + traJC[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + traJC[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                        out.println("<td>Juicio Oral</td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='tramiteJO.jsp?proceClave=" + traJC[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p8" class="pestanaContent">
                <h2>Volando</h2>
                <table class="tablasRegis" id="tablaVolando">
                    <thead>
                        <tr>
                            <th>Procesado clave</th>
                            <th>Nombre</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--
                            if(!ccJC.equals("")){
                                etapaProce = inicial.findCausaEtapa(ccJuzJC, 5);//Buscamos cuales procesados sin capturar en etapa 5
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(String [] eta : etapaProce){//For para recorrer todos los procesados registrados en etapa inicial en BD
                                        out.println("<tr>");
                                        out.println("<td>" + eta[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + eta[1] + "</td>");
                                        out.println("<td><a class='pop' href=''><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                }
                            }
                        --%>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
