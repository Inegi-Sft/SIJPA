<%-- 
    Document   : capturaJuzgado
    Created on : 20/11/2019, 04:23:41 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Juzgados</title>
        <%@include file="librerias.jsp"%>
        <script type="text/javascript" src="js/fnJuzgados.js"></script>
        <% 
            //Unicamente lo utilizamos cuando recibimos la variable de Binevenida
            if(request.getParameter("insert") != null){
                int integer = Integer.parseInt(request.getParameter("insert"));
                out.println("<script>alert('se esta editando');</script>");
                out.println("<script>$(document).ready(function () {");
                if(integer == 103){
                    out.println("alertify.alert('Confirmado','El Acuerdo fue Aceptado Correctamente', function(){"
                            + "alertify.success('Acuerdo Aceptado OK')});");
                }
                out.println("});</script>");
            }
            
            catalogos cat = new catalogos();
            ArrayList<String[]> lista, listaDatJuz, informeJuz;
            
            
            showJuzgados sJuzgado = new showJuzgados();
            int totJuzgado = sJuzgado.findTotJuzgado();
            
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String juzClave = "";
            String juzNom = "";
            String juzNum = "";
            String juzJuris = "";
            String juzFun = "";
            String lada = "";
            String correo = "";
            String entidad = "";
            String municipio = "";
            String forDiv = "";
            String nomReg = "";
            String nomDis = "";
            String nomPart = "";
            String viali = "";
            String nomViali = "";
            String asenta = "";
            String nomAsenta = "";
            String numExt = "";
            String numInt = "";
            String codPost = "";
            String nomCap = "";
            String apeCap = "";
            String apeMCap = "";
            String cargoCap = "";
            ////////////////
            String causaPenaIn = "";
            String medidasPro = "";
            String proviPre = "";
            String pruAnticipa = "";
            String ordenJudici = "";
            String actosInves = "";
            String impugnaMp = "";
            String otros = "";
            String causaTram = "";
            String causaBaja = "";
            String ejercicio = "";
            if(request.getParameter("claveJuzgado") != null){
                juzClave = request.getParameter("claveJuzgado");
                listaDatJuz = sJuzgado.findJuzgadoDato(juzClave);
                informeJuz  = sJuzgado.findInformeJuz(juzClave);
                if(listaDatJuz.size() > 0){
                    operacion = "actualizar";
                    juzNom = listaDatJuz.get(0)[1];
                    juzNum = listaDatJuz.get(0)[2];
                    juzJuris = listaDatJuz.get(0)[3];
                    juzFun = listaDatJuz.get(0)[4];
                    lada = listaDatJuz.get(0)[5];
                    correo = listaDatJuz.get(0)[6];
                    entidad = listaDatJuz.get(0)[7];
                    municipio = listaDatJuz.get(0)[8];
                    forDiv = listaDatJuz.get(0)[9];
                    nomReg = listaDatJuz.get(0)[10];
                    nomDis = listaDatJuz.get(0)[11];
                    nomPart = listaDatJuz.get(0)[12];
                    viali = listaDatJuz.get(0)[13];
                    nomViali = listaDatJuz.get(0)[14];
                    asenta = listaDatJuz.get(0)[15];
                    nomAsenta = listaDatJuz.get(0)[16];
                    numExt = listaDatJuz.get(0)[17];
                    numInt = listaDatJuz.get(0)[18];
                    codPost = listaDatJuz.get(0)[19];
                    nomCap = listaDatJuz.get(0)[20];
                    apeCap = listaDatJuz.get(0)[21];
                    apeMCap = listaDatJuz.get(0)[22];
                    cargoCap = listaDatJuz.get(0)[23];
                    ////////////////
                    causaPenaIn = informeJuz.get(0)[0];
                    medidasPro = informeJuz.get(0)[1];
                    proviPre = informeJuz.get(0)[2];
                    pruAnticipa = informeJuz.get(0)[3];
                    ordenJudici = informeJuz.get(0)[4];
                    actosInves = informeJuz.get(0)[5];
                    impugnaMp = informeJuz.get(0)[6];
                    otros = informeJuz.get(0)[7];
                    causaTram = informeJuz.get(0)[8];
                    causaBaja = informeJuz.get(0)[9];
                    ejercicio = informeJuz.get(0)[10];
                }else{
                    out.println("<script>alert('Juzgado " + juzClave + " no encontrado '); "
                        + "window.location.href = 'juzgados.jsp'</script>");
                }
             }
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="juzgados.jsp" >X</a>
            <% if(totJuzgado > 0){ %>
                <div class="toggle-nav">
                    <div class="toggle-nav-inner"></div>
                </div>
            <% } %>
            <h1>Captura Órgano Jurisdiccional</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Datos Principales</button>
                <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2">Ubicación</button>
                <button class="pestanaLinks" onclick="openPestana('btn3', 'p3')" id="btn3">Domicilio</button>
                <button class="pestanaLinks" onclick="openPestana('btn4', 'p4')" id="btn4">Datos del Capturador</button>
                <button class="pestanaLinks oculto" onclick="openPestana('btn5', 'p5')" id="btn5">Información General JC</button>
                <button class="pestanaLinks oculto" onclick="openPestana('btn6', 'p6')" id="btn6">Información General JO</button>
            </div>
            <form action="insrtJuzgados" method="post" name="formJuzgados">
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos Principales</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nomOrgano">Nombre del órgano jurisdiccional</label>
                                <input type="text" name="nomOrgano" id="nomOrgano" value="<%=juzNom%>" required/>
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                            <td>
                                <label for="numJuzgado">Número del órgano jurisdiccional</label>
                                <input type="text" class="soloNum" name="numOrgano" id="numOrgano" value="<%=juzNum%>" min="0" maxlength="3" required/>
                                <input type="hidden" name="jClaveR" id="jClaveR" value="<%=juzClave%>">
                            </td>
                            <td>
                                <label for="jurisdiccion">Jurisdicción</label>
                                <select name="jurisdiccion" id="jurisdiccion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findJurisdiccion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(juzJuris)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ladaTel">Teléfono con lada</label>
                                <input type="text" class="txtMedia soloNum" name="telJuz" id="telJuz" value="<%=lada%>"  maxlength="10"/>
                            </td>
                            <td>
                                <label for="correo">Correo del órgano jurisdiccional</label>
                                <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" value="<%=correo%>" />
                            </td>
                            <td>
                                <label for="funcionJuz">Funcion del órgano jurisdiccional</label>
                                <select name="funcionJuz" id="funcionJuz" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuncionJuzgado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(juzFun)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p2" class="pestanaContent">
                    <h2>División territorial jurisdiccional - Poder Judicial Estatal</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="entidadJ">Entidad federativa</label>
                                <select name="entidadJ" id="entidadJ" onchange="llenaMun('#entidadJ', '#municipioJ')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEntidades();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(entidad)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="municipioJ">Municipio o Demarcación Territorial de la CDMX</label>
                                <select name="municipioJ" id="municipioJ" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        if(entidad.equals("")){
                                            out.println("<option value = ''>--Seleccione--</option>");
                                        }else{
                                            lista = cat.findMunicipios(Integer.parseInt(entidad));
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(municipio)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[1] + "</option>");
                                            }
                                        }
                                   %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fDivision">Forma de división</label>
                                <select name="fDivision" id="fDivision" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findFormaDivision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(forDiv)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <div id="dRegJudicial" class="oculto">
                                    <label for="regJudicial">Nombre de la región judicial</label>
                                    <input type="text" name="regJudicial" id="regJudicial" value="<%=nomReg%>"/>
                                </div>
                                <div id="dDistJudicial" class="oculto">
                                    <label for="distJudicial">Nombre del distrito judicial</label>
                                    <input type="text" name="distJudicial" id="distJudicial" value="<%=nomDis%>"/>
                                </div>
                                <div id="dPartJudicial" class="oculto">
                                    <label for="partJudicial">Nombre del partido judicial</label>
                                    <input type="text" name="partJudicial" id="partJudicial" value="<%=nomPart%>"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p3" class="pestanaContent">
                    <h2>Domicilio</h2>
                    <table  class="tablaFormu" >
                        <tr>
                            <td>
                                <label for="vialidad">Vialidad</label>
                                <select name="vialidad" id="vialidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findVialidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(viali)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="asentamiento">Asentamiento humano</label>
                                <select name="asentamiento" id="asentamiento" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAsentamientoHumano();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(asenta)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="cp">Codigo postal</label>
                                <input type="text" class="soloNum txtSmall" name="cp" id="cp" value="<%=codPost%>" maxlength="5"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nomVialidad">Nombre de la vialidad</label>
                                <input type="text" name="nomVialidad" id="nomVialidad" value="<%=nomViali%>" required/>
                            </td>
                            <td>
                                <label for="nomAsentamiento">Nombre del asentamiento humano</label>
                                <input type="text" name="nomAsentamiento" id="nomAsentamiento" value="<%=nomAsenta%>" required/>
                            </td>
                            <td>
                                <label for="">No. exterior / No. interior</label>
                                <input type="text" class="txtSmall soloNum" name="noExterior" id="noExterior" value="<%=numExt%>" maxlength="4"/>
                                <input type="text" class="txtSmall soloNum" name="noInterior" id="noInterior" value="<%=numInt%>" maxlength="4"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p4" class="pestanaContent">
                    <h2>Datos del Capturador</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nombreCap">Nombre(s)</label>
                                <input type="text" name="nombreCap" id="nombreCap" value="<%=nomCap%>" required/>
                            </td>
                            <td>
                                <label for="apaternoCap">Apellido paterno</label>
                                <input type="text" name="apaternoCap" id="apaternoCap" value="<%=apeCap%>" required/>
                            </td>
                            <td>
                                <label for="amaternoCap">Apellido materno</label>
                                <input type="text" name="amaternoCap" id="amaternoCap" value="<%=apeMCap%>" required/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label for="Cargo">Cargo</label>
                                <input type="text" name="cargo" id="cargo" value="<%=cargoCap%>" required/>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div id="p5" class="pestanaContent">
                    <h2>Información General JC</h2>
                    <table class="tablaFormu">
                        
                            <td>
                                <label for="ejercicioJC">Ejercicio:</label>
                                <select name="ejercicioJC" id="ejercicioJC">
                                    <option value="">--Seleccionar--</option>
                                    <%
                                        lista = cat.findEjercicios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(ejercicio)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <div class="divInfo" id="divInfoJC">
                                    Causas penales ingresadas en Juzgado de Control(derivadas de carpetas "judicializadas" o de acción penal por particulares independientemente de 
                                    que sean o no competentes, así como de incompetencias de otros órganos jurisdiccionales, 
                                    materias o fueros)
                                </div>
                                <label for="causasIngresaJO" id="causasPinfoJO">Causas penales ingresadas</label>
                                <%
                                    int conteoCausaPenaInJC;
                                    conteoCausaPenaInJC = sJuzgado.countCausasPenIn(juzClave, 1);
                                %>
                                <input type="number" name="causasIngresaJO" id="causasIngresaJO" value="<%=conteoCausaPenaInJC%>" min="0" readonly> 
                            </td>
                            <td>
                                <label for="mediProteccionJC">Medidas de protección (solicitudes)</label>
                                <input type="number" name="mediProteccionJC" id="mediProteccionJC" value="<%=medidasPro%>" min="0">
                            </td>
                        
                        <tr>
                            <td>
                                <label for="providenPrecautoJC">Providencias precautorias (solicitudes)</label>
                                <input type="number" name="providenPrecautoJC" id="providenPrecautoJC" value="<%=proviPre%>" min="0">
                            </td>
                            <td>
                                <label for="pruebaAntiJC">Pruebas anticipadas <br>(solicitudes)</label>
                                <input type="number" name="pruebaAntiJC" id="pruebaAntiJC" value="<%=pruAnticipa%>" min="0">
                            </td>
                            <td>
                                <label for="ordenesJudiJC">Órdenes judiciales <br>(solicitudes)</label>
                                <input type="number" name="ordenesJudiJC" id="ordenesJudiJC" value="<%=ordenJudici%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="actosInvestigaJC">Actos de investigación que requieren control judicial <br>(solicitudes)</label>
                                <input type="number" name="actosInvestigaJC" id="actosInvestigaJC" value="<%=actosInves%>" min="0">
                            </td>
                            <td>
                                <label for="impugnaMpJC">Impugnaciones a las determinaciones del MP <br>(solicitudes)</label>
                                <input type="number" name="impugnaMpJC" id="impugnaMpJC" value="<%=impugnaMp%>" min="0">
                            </td>
                            <td>
                                <label for="otrosJC">Otros asuntos <br>(solicitudes distintas a las anteriores)</label>
                                <input type="number" name="otrosJC" id="otrosJC" value="<%=otros%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="causasTramJC">Causas penales pendientes de conclusión y/o terminación</label>
                                <input type="number" name="causasTramJC" id="causasTramJC" value="<%=causaTram%>" min="0">
                            </td>
                            <td>
                                <label for="causasBajaJC">Causas penales que causaron baja en el sistema</label>
                                <input type="number" name="causasBajaJC" id="causasBajaJC" value="<%=causaBaja%>" min="0">
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div id="p6" class="pestanaContent">
                    <h2>Información General JO</h2>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="ejercicioJO">Ejercicio:</label>
                                <select name="ejercicioJO" id="ejercicioJO">
                                    <option value="">--Seleccionar--</option>
                                    <%
                                        lista = cat.findEjercicios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(ejercicio)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <div class="divInfo" id="divInfoJO">
                                    Causas penales ingresadas en Juicio Oral (derivadas de carpetas "judicializadas" o de acción penal por particulares independientemente de 
                                    que sean o no competentes, así como de incompetencias de otros órganos jurisdiccionales, 
                                    materias o fueros)
                                </div>
                                <label for="causasIngresaJO" id="causasPinfoJO">Causas penales ingresadas</label>
                                <%
                                    int conteoCausaPenaInJO;
                                    if(request.getParameter("insert") != null){
                                        conteoCausaPenaInJO = sJuzgado.countCausasPenIn(juzClave, 2);
                                    }else{
                                        conteoCausaPenaInJO = 0;
                                    }
                                %>
                                <input type="number" name="causasIngresaJO" id="causasIngresaJO" value="<%=conteoCausaPenaInJO%>" min="0" readonly>
                            </td>
                            <td>
                                <label for="mediProteccionJO">Medidas de protección (solicitudes)</label>
                                <input type="number" name="mediProteccionJO" id="mediProteccionJO" value="<%=medidasPro%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="providenPrecautoJO">Providencias precautorias (solicitudes)</label>
                                <input type="number" name="providenPrecautoJO" id="providenPrecautoJO" value="<%=proviPre%>" min="0">
                            </td>
                            <td>
                                <label for="pruebaAntiJO">Pruebas anticipadas <br>(solicitudes)</label>
                                <input type="number" name="pruebaAntiJO" id="pruebaAntiJO" value="<%=pruAnticipa%>" min="0">
                            </td>
                            <td>
                                <label for="ordenesJudiJO">Órdenes judiciales <br>(solicitudes)</label>
                                <input type="number" name="ordenesJudiJO" id="ordenesJudiJO" value="<%=ordenJudici%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="actosInvestigaJO">Actos de investigación que requieren control judicial <br>(solicitudes)</label>
                                <input type="number" name="actosInvestigaJO" id="actosInvestigaJO" value="<%=actosInves%>" min="0">
                            </td>
                            <td>
                                <label for="impugnaMpJO">Impugnaciones a las determinaciones del MP <br>(solicitudes)</label>
                                <input type="number" name="impugnaMpJO" id="impugnaMpJO" value="<%=impugnaMp%>" min="0">
                            </td>
                            <td>
                                <label for="otrosJO">Otros asuntos <br>(solicitudes distintas a las anteriores)</label>
                                <input type="number" name="otrosJO" id="otrosJO" value="<%=otros%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="causasTramJO">Causas penales pendientes de conclusión y/o terminación</label>
                                <input type="number" name="causasTramJO" id="causasTramJO" value="<%=causaTram%>" min="0">
                            </td>
                            <td>
                                <label for="causasBajaJO">Causas penales que causaron baja en el sistema</label>
                                <input type="number" name="causasBajaJO" id="causasBajaJO" value="<%=causaBaja%>" min="0">
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div> 
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar" onclick="valida();"/>
            </form>
        </section>
    </body>
</html>
