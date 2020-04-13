<%-- 
    Document   : elementos
    Created on : 4/10/2019, 11:24:50 AM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showIntermedia"%>
<%@page import="clasesAuxiliar.showInicial"%>
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
        <title>SIJPA::Elementos de la CausaPenal</title>
        <%@include file="librerias.jsp" %>
        <%  
            showDelitos delito = new showDelitos();
            ArrayList<String[]> deli = new ArrayList();

            showProcesados procesa = new showProcesados();
            ArrayList<String[]> proce = new ArrayList();

            showVictimas victi = new showVictimas();
            ArrayList<String[]> vic = new ArrayList();
            
            showInicial inicial = new showInicial();
            ArrayList<String[]> ini = new ArrayList();
            ArrayList<String[]> etapaProce = new ArrayList();
            
            showIntermedia intermedia = new showIntermedia();
            ArrayList<String[]> inter = new ArrayList();

            showConclusiones conclusion = new showConclusiones();
            ArrayList<String[]> conc = new ArrayList();

            showTramite tram = new showTramite();
            ArrayList<String[]> trami = new ArrayList();
            
            String jc = (String)session.getAttribute("juzgadoClave");
            int totD = 0, totP = 0, totV = 0;
            int y = 0;
            String cc = "";
            String ccJuz = "";
            if(request.getParameter("causaClave") != null){//Si viene la causa penal, recuperamos datos
                cc = request.getParameter("causaClave");
                ccJuz = cc + jc.replace("-", "");
                showCausasPenales causaPen = new showCausasPenales();
                totD = causaPen.countTotalDelitos(ccJuz);
                totP = causaPen.countTotalProcesados(ccJuz);
                totV = causaPen.countTotalVictimas(ccJuz);
            }
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="causasPenales.jsp" >X</a>
            <br/>
            <div class="pestana">
                <%@include file="botonesPrinci.jsp"%>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <%@include file="capturaCausaPenal.jsp"%> 
            </div>
            <div id="p2" class="pestanaContent">
                <h2>Delitos</h2>
                <table class="tablasRegis" id="tablaDeli">
                    <thead>
                        <tr>
                            <th>Delito clave</th>
                            <th>Delito (Cod. Penal)</th>
                            <th>Delito (Norma Tec.)</th>
                            <th>Fecha Ocurrencia</th>
                            <th>Grado</th>
                            <th>Comisión</th>
                            <th>Editar</th>
                        </tr>
                    </thead>  
                    <tbody>
                        <%
                            if(!cc.equals("")){
                                for(y = 1; y <= totD; y++){//For para recorrer todos los delitos en la causa penal
                                    deli = delito.findDeliTabla(cc + "-D" + y + jc.replace("-", ""));//Le enviamos el delito a la BD
                                    if(deli.size() != 0){//Si el delito esta en BD lo ponemos
                                        out.println("<tr>");
                                        out.println("<td>" + deli.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + deli.get(0)[1] + "</td>");
                                        out.println("<td>" + deli.get(0)[2] + "</td>");
                                        out.println("<td>" + deli.get(0)[3] + "</td>");
                                        out.println("<td>" + deli.get(0)[4] + "</td>");
                                        out.println("<td>" + deli.get(0)[5] + "</td>");
                                        out.println("<td><a class='pop' href='delitos.jsp?delitoClave=" + deli.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + (y - 1) + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si el delito no esta en la BD lo agregamos vacio
                                        out.println("<tr>");
                                        out.println("<td>" + cc + "-D" + y + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='delitos.jsp?delitoClave=" + cc + "-D" + y
                                                + "&posicion=" + (y - 1) + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h2>Adolescentes</h2>
                <table class="tablasRegis" id="tablaProcesa">
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
                        <%
                            if(!cc.equals("")){
                                for(y = 1; y <= totP; y++){//For para recorrer los procesados en de la cuasa penal
                                    proce = procesa.findProcesasdosTabla(cc + "-P" + y + jc.replace("-", ""));
                                    if(proce.size() != 0){//Si el procesado esta en BD se pone
                                        out.println("<tr>");
                                        out.println("<td>" + proce.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + proce.get(0)[1] + "</td>");
                                        out.println("<td>" + proce.get(0)[2] + "</td>");
                                        out.println("<td>" + proce.get(0)[3] + "</td>");
                                        out.println("<td>" + proce.get(0)[4] + "</td>");
                                        out.println("<td><a class='pop' href='procesados.jsp?proceClave=" + proce.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + (y - 1) + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si el procesado no esta en BD se agrega vacio
                                        out.println("<tr>");
                                        out.println("<td>" + cc + "-P" + y + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='procesados.jsp?proceClave=" + cc + "-P" + y
                                                + "&posicion=" + (y - 1) + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>
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
                        <%
                            if(!cc.equals("")){
                                for(y = 1; y <= totV; y++){//For para recorrer todas las victimas registradas en BD
                                    vic = victi.findVictimasTabla(cc + "-V" + y + jc.replace("-", ""));
                                    if(vic.size() != 0){//Si tenemos victimas registradas en la BD las ponemos
                                        out.println("<tr>");
                                        out.println("<td>" + vic.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + vic.get(0)[1] + "</td>");
                                        out.println("<td>" + vic.get(0)[2] + "</td>");
                                        out.println("<td>" + vic.get(0)[3] + "</td>");
                                        out.println("<td>" + vic.get(0)[4] + "</td>");
                                        out.println("<td><a class='pop' href='victimas.jsp?victiClave=" + vic.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + (y - 1) + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{//Si la victima no esta en BD se agrega vacia
                                        out.println("<tr>");
                                        out.println("<td>" + cc + "-V" + y + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='victimas.jsp?victiClave=" + cc + "-V" + y
                                                + "&posicion=" + (y - 1) + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>
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
                            <th>¿Hubo Audiencia Inicial?</th>
                            <th>Resolución auto de vinculación </th>
                            <th>¿Se dictó sobreseimiento?</th>
                            <th>Etapa D.</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!cc.equals("")){
                                for(y = 1; y <= totP; y++){//For para recorrer todos los procesados registrados
                                    ini = inicial.findInicialTabla(cc + "-P" + y + jc.replace("-", ""));//Veirifcamos si ya existe en inicial
                                    proce = procesa.findProcesasdosTabla(cc + "-P" + y + jc.replace("-", ""));//Verificamos si existe en procesados
                                    if(ini.size() != 0){//Si el procesado esta en inicial de la BD lo agregamos
                                        out.println("<tr>");
                                        out.println("<td>" + ini.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + ini.get(0)[1] + "</td>");
                                        out.println("<td>" + ini.get(0)[2] + "</td>");
                                        out.println("<td>" + ini.get(0)[3] + "</td>");
                                        out.println("<td>" + ini.get(0)[4] + "</td>");
                                        out.println("<td>" + ini.get(0)[5] + "</td>");
                                        out.println("<td><a class='pop' href='etapaInicial.jsp?proceClave=" + ini.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + (y - 1) + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else if(proce.size() != 0){
                                        //Si no existe en la BD de inicial lo buscamos en procesados
                                        out.println("<tr>");
                                        out.println("<td>" + proce.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                        out.println("<td>" + proce.get(0)[1] + "</td>");//Traemos el nombre de procesados en la reccuperación de BD
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='etapaInicial.jsp?proceClave=" + proce.get(0)[0].replace(jc.replace("-", ""), "")
                                                + "&posicion=" + (y - 1) + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }else{
                                        //Si no existe en la BD en ninguna tabla entonces lo agregamos vacio
                                        out.println("<tr>");
                                        out.println("<td>" + cc + "-P" + y + "</td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td></td>");
                                        out.println("<td><a class='pop' href='etapaInicial.jsp?proceClave=" + cc + "-P" + y
                                                + "&posicion=" + (y - 1) + "'><img src='img/editar.png' title='Modificar'/></a></td>");
                                        out.println("</tr>");
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div id="p6" class="pestanaContent">
                <h2>Etapa Intermedia</h2>
                <table class="tablasRegis" id="tablaIntermedia">
                    <thead>
                        <tr>
                            <th>Adolescente clave</th>
                            <th>Nombre</th>
                            <th>Audiencia intermedia</th>
                            <th>Escrito acusación</th>
                            <th>Presentacion medios prueba</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!cc.equals("")){
                                etapaProce = inicial.findCausaInter(ccJuz);//Buscamos cuales procesados se encuentran en intermedia en etapa inicial
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(y = 0; y < etapaProce.size(); y++){//For para recorrer todos los procesados registrados en etapa inicial en BD
                                        inter = intermedia.findIntermediaTabla(etapaProce.get(y)[0]);//Le enviamos el procesado
                                        if(inter.size() != 0){//Si tel procesado esta en intermedia lo ponemos
                                            out.println("<tr>");
                                            out.println("<td>" + inter.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + inter.get(0)[1] + "</td>");
                                            out.println("<td>" + inter.get(0)[2] + "</td>");
                                            out.println("<td>" + inter.get(0)[3] + "</td>");
                                            out.println("<td>" + inter.get(0)[4] + "</td>");
                                            out.println("<td><a class='pop' href='etapaIntermedia.jsp?proceClave=" + inter.get(0)[0].replace(jc.replace("-", ""), "")
                                                    + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }else{//Si no esta en intermedia lo agregamos vacio
                                            out.println("<tr>");
                                            out.println("<td>" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + etapaProce.get(y)[1] + "</td>");//Traemos el nombre de procesados
                                            out.println("<td></td>");
                                            out.println("<td></td>");
                                            out.println("<td></td>");
                                            out.println("<td><a class='pop' href='etapaIntermedia.jsp?proceClave=" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "")
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
                <h2>Resoluciones dictadas</h2>
                <table class="dContenido">
                    <tr>
                        <td>
                            <%
                                if(!cc.equals("")){
                                    etapaProce = inicial.findCausaEtapa(ccJuz, 5);//Buscamos cuales procesados sin capturar en etapa 5
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
                            %>
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
                            <th>Editar</th>
                            <!--<th width="80">Borrar</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!cc.equals("")){
                                etapaProce = inicial.findCausaInterConclu(ccJuz);//Buscamos cuales procesados se encuentran en conclusion en etapa inicial
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(y = 0; y < etapaProce.size(); y++){//For para recorrer todos los procesados registrados en etapa inicial en BD
                                        conc = conclusion.findConcluTabla(etapaProce.get(y)[0]);//Le enviamos el procesado
                                        if(conc.size() != 0){//Si tel procesado esta en conclusion lo ponemos
                                            out.println("<tr>");
                                            out.println("<td>" + conc.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + conc.get(0)[1] + "</td>");
                                            out.println("<td>" + conc.get(0)[2] + "</td>");
                                            out.println("<td>" + conc.get(0)[3] + "</td>");
                                            out.println("<td><a class='pop' href='conclusiones.jsp?proceClave=" + conc.get(0)[0].replace(jc.replace("-", ""), "")
                                                    + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }else{//Si no esta en conclusion lo agregamos vacio
                                            out.println("<tr>");
                                            out.println("<td>" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + etapaProce.get(y)[1] + "</td>");//Traemos el nombre de procesados
                                            out.println("<td></td>");
                                            out.println("<td></td>");
                                            out.println("<td><a class='pop' href='conclusiones.jsp?proceClave=" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "")
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
                <h2>Pendientes de resolución</h2>
                <table class="dContenido">
                    <tr>
                        <td>
                            <%
                                if(!cc.equals("")){
                                    etapaProce = inicial.findCausaEtapa(ccJuz, 5);//Buscamos cuales procesados sin capturar en etapa 5
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
                            %>
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
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(!cc.equals("")){
                                etapaProce = inicial.findCausaInterTram(ccJuz);//Buscamos cuales procesados se encuentran en tramite en etapa inicial
                                if(etapaProce.size() != 0){//Si existen entramos a mostrarlos en la tabla
                                    for(y = 0; y < etapaProce.size(); y++){//For para recorrer todos los procesados registrados en etapa inicial en BD
                                        trami = tram.findTramiteTabla(etapaProce.get(y)[0]);//Le enviamos el procesado
                                        if(trami.size() != 0){//Si tel procesado esta en tramite lo ponemos
                                            out.println("<tr>");
                                            out.println("<td>" + trami.get(0)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + trami.get(0)[1] + "</td>");
                                            out.println("<td>" + trami.get(0)[2] + "</td>");
                                            out.println("<td>" + trami.get(0)[3] + "</td>");
                                            out.println("<td><a class='pop' href='tramite.jsp?proceClave=" + trami.get(0)[0].replace(jc.replace("-", ""), "")
                                                    + "&posicion=" + y + "&edita=Si'><img src='img/editar.png' title='Modificar'/></a></td>");
                                            out.println("</tr>");
                                        }else{//Si no esta en tramite lo agregamos vacio
                                            out.println("<tr>");
                                            out.println("<td>" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "") + "</td>");
                                            out.println("<td>" + etapaProce.get(y)[1] + "</td>");//Traemos el nombre de procesados
                                            out.println("<td></td>");
                                            out.println("<td></td>");
                                            out.println("<td><a class='pop' href='tramite.jsp?proceClave=" + etapaProce.get(y)[0].replace(jc.replace("-", ""), "")
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
            <div id="p9" class="pestanaContent">
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
                        <%
                            if(!cc.equals("")){
                                etapaProce = inicial.findCausaEtapa(ccJuz, 5);//Buscamos cuales procesados sin capturar en etapa 5
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
                        %>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
