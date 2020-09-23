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
            ArrayList<String[]> deli, deliJO;

            showProcesadosJO procesa = new showProcesadosJO();
            ArrayList<String[]> proce, proceJO;

            showVictimasJO victi = new showVictimasJO();
            ArrayList<String[]> vic, vicJO;
            
            showJuicio juicio = new showJuicio();
            ArrayList<String[]> juiciJO , etapaProce;

            showConclusionesJO conclusion = new showConclusionesJO();
            ArrayList<String[]> concJO;

            showTramiteJO tramite = new showTramiteJO();
            ArrayList<String[]> tramJO;
            
            //Si la variable de sesion esta vacia entonces lo regresamos a Index para generarlas de nuevo
            String juzClaJO = "";
            if(session.getAttribute("juzgadoClave") != null){
                juzClaJO = (String)session.getAttribute("juzgadoClave");
            }else{
                response.sendRedirect("index.jsp?insert=600");
            }
            
            String juzClaJC = "";
            int y = 0;
            String ccJC = "";
            String ccJO = "";
            String ccJuz = "";
            String extraeClave = "";
            if(request.getParameter("causaClaveJC") != null){//Si viene la causa penal, recuperamos datos
                juzClaJC = request.getParameter("juzClaveJC");
                ccJC = request.getParameter("causaClaveJC");
                ccJuz = ccJC + juzClaJC.replace("-", "");
            }
            if(request.getParameter("causaClaveJO") != null){//Si viene la causa penal, recuperamos datos
                ccJO = request.getParameter("causaClaveJO");
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
                                deli = delito.findDeliCausasJCyJO(ccJuz);//Obtenemos delitos por causa
                                for(String[] del : deli){//For para recorrer todos los delitos en la causa penal JC
                                    //deliJO = delito.findDeliCausasJO(ccJuz, delJC[0]);
                                    if(!del[1].equals("--")){//Si el delito esta en BD de JO se muestra
                                        out.println("<tr>");
                                        out.println("<td>" + del[1].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + del[2] + "</td>");
                                        out.println("<td>" + del[3] + "</td>");
                                        out.println("<td>" + del[4] + "</td>");
                                        out.println("<td>" + del[5] + "</td>");
                                        out.println("<td>" + del[6] + "</td>");
                                        String deliClavJC = (del[0] == null)? "--": del[0].replace(juzClaJC.replace("-", ""), "");
                                        out.println("<td><a class='pop' href='delitosJO.jsp?delitoClaveJC=" + deliClavJC
                                                + "&delitoClaveJO=" + del[1].replace(juzClaJO.replace("-", ""), "") 
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Editar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    else{//Si el delito no esta en la BD de JO lo recuperamos de JC y se muestra
                                        out.println("<tr>");
                                        //Columna de control para cuando se agregan de un juzgado Mixto por eso no se muestra
                                        out.println("<td style='display: none'>" + del[0].replace(juzClaJC.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + ccJO + "-D" + (y+1) + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='delitosJO.jsp?delitoClaveJC=" + del[0].replace(juzClaJC.replace("-", ""), "")
                                                + "&delitoClaveJO=" + ccJO + "-D" + (y+1)
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"'/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                                //Agregamos los nuevos delitos que se especificaron en JO (los nuevos)
                                while(y < Integer.parseInt(totDelitos)){
                                    /*la variable totDelitos se toma de la pagina capturaCausaPenal.jsp es posible por que agrega
                                    a esta pagina en unas lineas de codigo mas arriba*/
                                    out.println("<tr>");
                                    out.println("<td>" + ccJO + "-D" + (y+1) + "</td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td><a class='pop' href='delitosJO.jsp?delitoClaveJC=--"
                                            + "&delitoClaveJO=" + ccJO + "-D" + (y+1)
                                            + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                    //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                    //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"'/></a></td>");
                                    out.println("</tr>");
                                    y++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h2>Imputados</h2>
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
                                proce = procesa.findProcesasdosCausaJCyJO(ccJuz);
                                for(String[] pro : proce){//For para recorrer los procesados en de la cuasa penal de JC
                                    //proceJO = procesa.findProcesasdosCausaJO(ccJuz, proJC[0]);
                                    if(!pro[1].equals("--")){//Si el procesado esta lleno en BD de JO lo mostramos
                                        out.println("<tr>");
                                        out.println("<td>" + pro[1].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + pro[2] + "</td>");
                                        out.println("<td>" + pro[3] + "</td>");
                                        out.println("<td>" + pro[4] + "</td>");
                                        out.println("<td>" + pro[5] + "</td>");
                                        String proClavJC = (pro[0] == null)? "--": pro[0].replace(juzClaJC.replace("-", ""), "");
                                        out.println("<td><a class='pop' href='procesadosJO.jsp?proceClaveJC=" + proClavJC
                                                + "&proceClaveJO=" + pro[1].replace(juzClaJO.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + proc[0] + "'," + y + ",'tablaProcesa','#Tadolescentes')\"/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si el procesado no esta en BD de JO se recupera de JC
                                        out.println("<tr>");
                                        //Columna de control para cuando se agregan de un juzgado Mixto por eso no se muestra
                                        out.println("<td style='display: none'>" + pro[0].replace(juzClaJC.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + ccJO + "-P" + (y+1) + "</td>");
                                        out.println("<td>" + pro[2] + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='procesadosJO.jsp?proceClaveJC=" + pro[0].replace(juzClaJC.replace("-", ""), "")
                                                + "&proceClaveJO=" + ccJO + "-P" + (y+1)
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + proc[0] + "'," + y + ",'tablaProcesa','#Tadolescentes')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                                //Agregamos los nuevos procesados que se especificaron en JO (los nuevos)
                                while(y < Integer.parseInt(totProce)){
                                    /*la variable totProce se toma de la pagina capturaCausaPenal.jsp es posible por que agrega
                                    a esta pagina en unas lineas de codigo mas arriba*/
                                    out.println("<tr>");
                                    out.println("<td>" + ccJO + "-P" + (y+1) + "</td>");
                                    out.println("<td>--</td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td><a class='pop' href='procesadosJO.jsp?proceClaveJC=--"
                                            + "&proceClaveJO=" + ccJO + "-P" + (y+1)
                                            + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                    //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                    //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"'/></a></td>");
                                    out.println("</tr>");
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
                                vic = victi.findVictimasCausaJCyJO(ccJuz);
                                for(String[] vi : vic){//For para recorrer todas las victimas registradas en BD de JC
                                    //vicJO = victi.findVictimasCausaJO(ccJuz, viJC[0]);
                                    if(!vi[1].equals("--")){//Si tenemos victimas registradas en la BD de JO las mostramos
                                        out.println("<tr>");
                                        out.println("<td>" + vi[1].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + vi[2] + "</td>");
                                        out.println("<td>" + vi[3] + "</td>");
                                        out.println("<td>" + vi[4] + "</td>");
                                        out.println("<td>" + vi[5] + "</td>");
                                        String vicClavJC = (vi[0] == null)? "--": vi[0].replace(juzClaJC.replace("-", ""), "");
                                        out.println("<td><a class='pop' href='victimasJO.jsp?victiClaveJC=" + vicClavJC
                                                + "&victiClaveJO=" + vi[1].replace(juzClaJO.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + vi[0] + "'," + y + ",'tablaVictimas','#Tvictimas')\"/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si la victima no esta en BD se agrega vacia
                                        out.println("<tr>");
                                        //Columna de control para cuando se agregan de un juzgado Mixto por eso no se muestra
                                        out.println("<td style='display: none'>" + vi[0].replace(juzClaJC.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + ccJO + "-V" + (y+1) + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='victimasJO.jsp?victiClaveJC=" + vi[0].replace(juzClaJC.replace("-", ""), "")
                                                + "&victiClaveJO=" + ccJO + "-V" + (y+1)
                                                + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                        //        + "onclick=\"borraRegistro('" + vi[0] + "'," + y + ",'tablaVictimas','#Tvictimas')\"/></a></td>");
                                        out.println("</tr>");
                                    }
                                    y++;
                                }
                                //Agregamos las nuevas victimas que se especificaron en JO (los nuevos)
                                while(y < Integer.parseInt(totVicti)){
                                    /*la variable totVicti se toma de la pagina capturaCausaPenal.jsp es posible por que agrega
                                    a esta pagina en unas lineas de codigo mas arriba*/
                                    out.println("<tr>");
                                    out.println("<td>" + ccJO + "-V" + (y+1) + "</td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td></td>");
                                    out.println("<td><a class='pop' href='victimasJO.jsp?victiClaveJC=--"
                                            + "&victiClaveJO=" + ccJO + "-V" + (y+1)
                                            + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                    //out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar' "
                                    //        + "onclick=\"borraRegistro('" + del[0] + "'," + y + ",'tablaDeli','#Tdelitos')\"'/></a></td>");
                                    out.println("</tr>");
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
                            <th>Emision de Fallo</th>
                            <th>Etapa D.</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                y = 0;
                                String proClaveJO="";
                                proce = juicio.findProceJuicio(ccJO + juzClaJO.replace("-", ""));
                                for(String[] pro : proce){//For para recorrer todos los procesados que pasan a JO en JC
                                    juiciJO = juicio.findProceJuicioJO(pro[0]);
                                    if(juiciJO.size() > 0){//Si el procesado esta en oral de la BD lo agregamos
                                        out.println("<tr>");
                                        out.println("<td>" + juiciJO.get(0)[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[1] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[2] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[3] + "</td>");
                                        out.println("<td>" + juiciJO.get(0)[4] + "</td>");
                                        out.println("<td><a class='pop' href='etapaOral.jsp?proceClaveJO=" + juiciJO.get(0)[0].replace(juzClaJO.replace("-", ""), "")
                                                + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{
                                        out.println("<tr>");
                                        out.println("<td>" + pro[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + pro[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='etapaOral.jsp?proceClaveJO=" + pro[0].replace(juzClaJO.replace("-", ""), "")
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
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!ccJC.equals("")){
                                etapaProce = juicio.findCausaConcluJO(ccJO + juzClaJO.replace("-", ""));//Buscamos cuales procesados se encuentran en conclusion en etapa oral
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(y = 0; y < etapaProce.size(); y++){//For para recorrer todos los procesados registrados en etapa oral en BD
                                        concJO = conclusion.findConcluTablaJO(etapaProce.get(y)[0]);//Le enviamos el procesado
                                        if(concJO.size() > 0){//Si tel procesado esta en conclusion lo ponemos
                                            out.println("<tr>");
                                            out.println("<td>" + concJO.get(0)[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + concJO.get(0)[1] + "</td>");
                                            out.println("<td>" + concJO.get(0)[2] + "</td>");
                                            out.println("<td>" + concJO.get(0)[3] + "</td>");
                                            out.println("<td><a class='pop' href='conclusionesJO.jsp?proceClaveJO=" + concJO.get(0)[0].replace(juzClaJO.replace("-", ""), "")
                                                    + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }else{
                                            out.println("<tr>");
                                            out.println("<td>" + etapaProce.get(y)[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + etapaProce.get(y)[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                            out.println("<td></td>");
                                            out.println("<td></td>");
                                            out.println("<td><a class='pop' href='conclusionesJO.jsp?proceClaveJO=" + etapaProce.get(y)[0].replace(juzClaJO.replace("-", ""), "")
                                                    + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }
                                    }
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
                                etapaProce = juicio.findCausaTramJO(ccJO + juzClaJO.replace("-", ""));//Buscamos cuales procesados se encuentran en tramite en etapa inicial
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(y = 0; y < etapaProce.size(); y++){//For para recorrer todos los procesados registrados en etapa oral en BD
                                        tramJO = tramite.findTramiteTablaJO(etapaProce.get(y)[0]);//Le enviamos el procesado
                                        if(tramJO.size() != 0){//Si tel procesado esta en tramite lo ponemos
                                            out.println("<tr>");
                                            out.println("<td>" + tramJO.get(y)[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + tramJO.get(y)[1] + "</td>");
                                            out.println("<td>JUICIO ORAL</td>");
                                            out.println("<td>" + tramJO.get(y)[3] + "</td>");
                                            out.println("<td><a class='pop' href='tramiteJO.jsp?proceClaveJO=" + tramJO.get(y)[0].replace(juzClaJO.replace("-", ""), "")
                                                    + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }else{
                                            out.println("<tr>");
                                            out.println("<td>" + etapaProce.get(y)[0].replace(juzClaJO.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + etapaProce.get(y)[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                            out.println("<td>JUICIO ORAL</td>");
                                            out.println("<td></td>");
                                            out.println("<td><a class='pop' href='tramiteJO.jsp?proceClaveJO=" + etapaProce.get(y)[0].replace(juzClaJO.replace("-", ""), "")
                                                    + "&posicion=" + y + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }
                                    }
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
