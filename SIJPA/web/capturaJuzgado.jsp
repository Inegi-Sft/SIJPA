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
        <script type="text/javascript" src="js/fnJuzgados.js"></script>
        <%@include file="librerias.jsp"%>
        <% 
            if(request.getParameter("errorJuzgado") != null){
                int error = Integer.parseInt(request.getParameter("errorJuzgado"));
                switch(error){
                    case 100:
                        out.println("<script>alert('Lo datos del Informe no se puede insertar verificar la base')</script>");
                        break;
                    case 200:
                        out.println("<script>alert('El Juzgado no se pudo insertar, tal vez este duplicado')</script>");
                        break;
                }
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
            if(request.getParameter("claveJuz") != null){
                juzClave = request.getParameter("claveJuz");
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
                <button class="pestanaLinks" onclick="openPestana('btn5', 'p5')" id="btn5">Información General</button>
            </div>
            <form action="insrtJuzgados" method="post" name="formJuzgados">
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos Principales</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nomOrgano">Nombre Órgano Jurisdiccional</label>
                                <input type="text" name="nomOrgano" id="nomOrgano" value="<%=juzNom%>" required/>
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                            <td>
                                <label for="numJuzgado">Número Órgano Jurisdiccional</label>
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
                                <label for="ladaTel">Lada &nbsp; / &nbsp; Teléfono</label>
                                <input type="number" class="txtSmall" name="ladaJuz" id="ladaJuz" value="55"/>
                                <input type="text" class="txtMedia soloNum" name="telJuz" id="telJuz" value="<%=lada%>"  maxlength="8"/>
                            </td>
                            <td>
                                <label for="correo">Correo Órgano Jurisdiccional</label>
                                <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" value="<%=correo%>" />
                            </td>
                            <td>
                                <label for="funcionJuz">Funcion del organo Jurisdiccional</label>
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
                                <label for="entidadJ">Entidad Federativa</label>
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
                                <label for="fDivision">Forma de División</label>
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
                                    <label for="regJudicial">Nombre de la Región Judicial</label>
                                    <input type="text" name="regJudicial" id="regJudicial" value="<%=nomReg%>"/>
                                </div>
                                <div id="dDistJudicial" class="oculto">
                                    <label for="distJudicial">Nombre del Distrito Judicial</label>
                                    <input type="text" name="distJudicial" id="distJudicial" value="<%=nomDis%>"/>
                                </div>
                                <div id="dPartJudicial" class="oculto">
                                    <label for="partJudicial">Nombre del Partido Judicial</label>
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
                                <label for="asentamiento">Asentamiento Humano</label>
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
                                <label for="cp">Codigo Postal</label>
                                <input type="text" class="soloNum" name="cp" id="cp" value="<%=codPost%>" maxlength="5"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nomVialidad">Nombre de la Vialidad</label>
                                <input type="text" name="nomVialidad" id="nomVialidad" value="<%=nomViali%>" required/>
                            </td>
                            <td>
                                <label for="nomAsentamiento">Nombre del Asentamiento Humano</label>
                                <input type="text" name="nomAsentamiento" id="nomAsentamiento" value="<%=nomAsenta%>" required/>

                            </td>
                            <td>
                                <label for="">No. Exterior / No. Interior</label>
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
                                <label for="apaternoCap">Apellido Paterno</label>
                                <input type="text" name="apaternoCap" id="apaternoCap" value="<%=apeCap%>" required/>
                            </td>
                            <td>
                                <label for="amaternoCap">Apellido Materno</label>
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
                    <h2>Información General</h2>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="ejercicio">Ejercicio:</label>
                                <select name="ejercicio" id="ejercicio" required>
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
                                <label for="causasIngresa">Causas Penales Ingresadas</label>
                                <input type="number" name="causasIngresa" id="causasIngresa" value="<%=causaPenaIn%>" min="0">
                            </td>
                            <td>
                                <label for="mediProteccion">Medidas de Protección</label>
                                <input type="number" name="mediProteccion" id="mediProteccion" value="<%=medidasPro%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="providenPrecauto">Providencias Precautorias</label>
                                <input type="number" name="providenPrecauto" id="providenPrecauto" value="<%=proviPre%>" min="0">
                            </td>
                            <td>
                                <label for="actosInvestiga">Pruebas Anticipadas</label>
                                <input type="number" name="pruebaAnti" id="pruebaAnti" value="<%=pruAnticipa%>" min="0">
                            </td>
                            <td>
                                <label for="ordenesJudi">Órdenes Judiciales</label>
                                <input type="number" name="ordenesJudi" id="ordenesJudi" value="<%=ordenJudici%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="actosInvestiga">Actos investigación con Control Judicial</label>
                                <input type="number" name="actosInvestiga" id="actosInvestiga" value="<%=actosInves%>" min="0">
                            </td>
                            <td>
                                <label for="impugnaMp">Impugnaciones al Ministerio Publico</label>
                                <input type="number" name="impugnaMp" id="impugnaMp" value="<%=impugnaMp%>" min="0">
                            </td>
                            <td>
                                <label for="otros">Otros Asuntos</label>
                                <input type="number" name="otros" id="otros" value="<%=otros%>" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="causasTram">Causas Penales en Trámite</label>
                                <input type="number" name="causasTram" id="causasTram" value="<%=causaTram%>" min="0">
                            </td>
                            <td>
                                <label for="causasBaja">Causas Penales dadas de baja</label>
                                <input type="number" name="causasBaja" id="causasBaja" value="<%=causaBaja%>" min="0">
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
