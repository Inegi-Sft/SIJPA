<%-- 
    Document   : capturaJuzgado
    Created on : 20/11/2019, 04:23:41 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="clasesAuxiliar.NumerosRomanos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Juzgados</title>
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
            ArrayList<String[]> lista;
            
            showJuzgados sjuzgado = new showJuzgados();
            int totJuzgado = sjuzgado.findTotJuzgado();
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
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
                                <input type="text" name="nomOrgano" id="nomOrgano"  required/>
                            </td>
                            <td>
                                <label for="numJuzgado">Número Órgano Jurisdiccional</label>
                                <input type="number" class="txtMedia" name="numOrgano" id="numOrgano" required/>
                            </td>
                            <td>
                                <label for="jurisdiccion">Jurisdicción</label>
                                <select name="jurisdiccion" class="txtMedia" id="jurisdiccion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findJurisdiccion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ladaTel">Lada &nbsp; / &nbsp; Teléfono</label>
                                <input type="number" class="txtSmall" name="ladaJuz" id="ladaJuz" value="55"/>
                                <input type="text" class="txtMedia" name="telJuz" id="telJuz" maxlength="8"/>
                            </td>
                            <td>
                                <label for="correo">Correo Órgano Jurisdiccional</label>
                                <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" />
                            </td>
                            <td>
                                <label for="funcionJuz">Funcion del organo Jurisdiccional</label>
                                <select name="funcionJuz" class="txtMedia" id="funcionJuz" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuncionJuzgado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
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
                                <select class="txtMedia" name="entidadJ" id="entidadJ" onchange="llenaMun('#entidadJ', '#municipioJ')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEntidades();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="municipioJ">Municipio o Demarcación Territorial de la CDMX</label>
                                <select class="txtMedia" name="municipioJ" id="municipioJ" required>
                                    <option value="">--Seleccione--</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fDivicion">Forma de División</label>
                                <select class="txtMedia" name="fDivision" id="fDivision" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFormaDivision();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <div id="dRegJudicial" class="oculto">
                                    <label for="regJudicial">Nombre de la Región Judicial</label>
                                    <input type="text" name="regJudicial" id="regJudicial"/>
                                </div>
                                <div id="dDistJudicial" class="oculto">
                                    <label for="distJudicial">Nombre del Distrito Judicial</label>
                                    <input type="text" name="distJudicial" id="distJudicial"/>
                                </div>
                                <div id="dPartJudicial" class="oculto">
                                    <label for="partJudicial">Nombre del Partido Judicial</label>
                                    <input type="text" name="partJudicial" id="partJudicial"/>
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
                                <select class="txtMedia" name="vialidad" id="vialidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findVialidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="asentamiento">Asentamiento Humano</label>
                                <select class="txtMedia" name="asentamiento" id="asentamiento" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAsentamientoHumano();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="cp">Codigo Postal</label>
                                <input type="number" class="txtMedia" name="cp" id="cp" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nomVialidad">Nombre de la Vialidad</label>
                                <input type="text" name="nomVialidad" id="nomVialidad" required/>
                            </td>
                            <td>
                                <label for="nomAsentamiento">Nombre del Asentamiento Humano</label>
                                <input type="text" name="nomAsentamiento" id="nomAsentamiento" required/>

                            </td>
                            <td>
                                <label for="">No. Exterior / No. Interior</label>
                                <input type="text" class="txtSmall" name="noExterior" id="noExterior" />
                                <input type="text" class="txtSmall" name="noInterior" id="noInterior" />
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
                                <input type="text" name="nombreCap" id="nombreCap" required/>
                            </td>
                            <td>
                                <label for="apaternoCap">Apellido Paterno</label>
                                <input type="text" name="apaternoCap" id="apaternoCap" required/>
                            </td>
                            <td>
                                <label for="amaternoCap">Apellido Materno</label>
                                <input type="text" name="amaternoCap" id="amaternoCap"required/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label for="Cargo">Cargo</label>
                                <input type="text" name="cargo" id="cargo" required/>
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
                                <select name="ejercicio" id="ejercicio" class="txtMedia" required>
                                    <option value="">--Seleccionar--</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                </select>
                            </td>
                            <td>
                                <label for="causasIngresa">Causas Penales Ingresadas</label>
                                <input type="number" name="causasIngresa" id="causasIngresa" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="mediProteccion">Medidas de Protección</label>
                                <input type="number" name="mediProteccion" id="mediProteccion" class="txtMedia" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="providenPrecauto">Providencias Precautorias</label>
                                <input type="number" name="providenPrecauto" id="providenPrecauto" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="actosInvestiga">Pruebas Anticipadas</label>
                                <input type="number" name="pruebaAnti" id="pruebaAnti" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="ordenesJudi">Órdenes Judiciales</label>
                                <input type="number" name="ordenesJudi" id="ordenesJudi" class="txtMedia" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="actosInvestiga">Actos investigación con Control Judicial</label>
                                <input type="number" name="actosInvestiga" id="actosInvestiga" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="impugnaMp">Impugnaciones al Ministerio Publico</label>
                                <input type="number" name="impugnaMp" id="impugnaMp" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="otros">Otros Asuntos</label>
                                <input type="number" name="otros" id="otros" class="txtMedia" min="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="causasTram">Causas Penales en Trámite</label>
                                <input type="number" name="causasTram" id="causasTram" class="txtMedia" min="0">
                            </td>
                            <td>
                                <label for="causasBaja">Causas Penales dadas de baja</label>
                                <input type="number" name="causasBaja" id="causasBaja" class="txtMedia" min="0">
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar"/>
            </form>
        </section>
    </body>
</html>
