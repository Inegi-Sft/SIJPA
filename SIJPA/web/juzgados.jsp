<%-- 
    Document   : juzgados
    Created on : 20/09/2019, 10:55:04 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.NumerosRomanos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Juzgados</title>
        <%@include file="librerias.jsp" %>
        <% 
            if(request.getParameter("errorJuzgado") != null){
                out.println("<script>alert('Clave duplicada: El juzgado, distrito, entidad, municipio ya existe  verificar')</script>");
            }else if(request.getParameter("errorInforme") != null){
                out.println("<script>alert('Lo datos de datos generales no se puede insertar verificar')</script>");
            }
        %>
    </head>

    <body >
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Juzgados</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Datos del Juez</button>
                <button class="pestanaLinks" onclick="openPestana('btn2', 'p2')" id="btn2">Datos Órgano Jurisdiccional</button>
                <button class="pestanaLinks" onclick="openPestana('btn3', 'p3')" id="btn3">Forma de Organizacion del Órgano</button>
                <button class="pestanaLinks" onclick="openPestana('btn4', 'p4')" id="btn4">Datos Geográficos</button>
                <button class="pestanaLinks" onclick="openPestana('btn5', 'p5')" id="btn5">Datos del Capturador</button>
                <button class="pestanaLinks" onclick="openPestana('btn6', 'p6')" id="btn6">Datos Generales</button>
            </div>

            <form action="insrtJuzgados" method="post" name="formJuzgados">
                <!-- Contenido pestañas -->
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos del Juez</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" required/>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" required/>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" required/>
                            </td>
                            <td>
                                <label for="fGestion">Fecha inicio gestion:</label>
                                <input type="date" class="txtMedia" name="fGestion" id="fGestion" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" name="chkFechaInicioG" id="chkFechaInicioG" onclick="fechaNoIdent('#chkFechaInicioG', '#fGestion');"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="p2" class="pestanaContent">
                    <h2>Datos Órgano Jurisdiccional</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nomOrgano">Nombre Organo Jurisdiccional</label>
                                <input type="text" name="nomOrgano" id="nomOrgano"  required/>
                            </td>
                            <td>
                                <label for="numJuzgado">Número de Juzgado</label>
                                <input type="number" class="txtMedia" name="numJuzgado" id="numJuzgado" required/>
                            </td>
                            <td>
                                <label for="numDistrito">Número del Distrito Judicial</label>
                                <select name="numDistrito" class="txtMedia" id="numDistrito" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        NumerosRomanos nRomanosR = new NumerosRomanos(1, 99);
                                        ArrayList<NumerosRomanos> alnRomanosR = nRomanosR.getNumerosRomanos();
                                        for (NumerosRomanos nR : alnRomanosR) {
                                            out.println("<option value='" + nR.nArabigo + "'>" + nR + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="tel">Teléfono del Juzgado</label>
                                <input type="number" class="txtMedia" name="tel" id="tel" placeholder="Telefono"/>
                            </td>
                            <td>
                                <label for="correo">Correo del Juzgado:</label>
                                <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div id="p3" class="pestanaContent">
                    <h2>Forma de Organizacion del Órgano</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td></td>
                            <td>
                                <label for="fOrganiza">Forma de Organizacion</label>
                                <select class="txtMedia" name="fOrganiza" id="fOrganiza" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findForOrganiza();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
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
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div id="p4" class="pestanaContent">
                    <h2>Datos Geográficos</h2>
                    <table  class="tablaFormu" >
                        <tr>
                            <td>
                                <label for="entidad">Entidad Federativa</label>
                                <select class="txtMedia" name="entidadJ" id="entidadJ" onchange="llenaMun('#entidadJ', '#municipioJ')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEntidades();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                                <input type="hidden" name="bandera" value="1"/>
                            </td>
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
                                        lista = cat.findAsentHumano();
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
                                <label for="municipio">Municipio o Delegacion</label>
                                <select class="txtMedia" name="municipioJ" id="municipioJ" required>
                                    <option value="">--Seleccione--</option>
                                </select>
                            </td>
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
                <div id="p5" class="pestanaContent">
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
                <div id="p6" class="pestanaContent">
                    <h2>Datos Generales</h2>
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
                                <label for="causasPena">Causas Penales:</label>
                                <input type="text" name="causasPena" id="causasPena" class="txtMedia">
                            </td>
                            <td>
                                <label for="mediProteccion">Medidas de Protección:</label>
                                <input type="text" name="mediProteccion" id="mediProteccion" class="txtMedia">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="providenPrecauto">Providencias Precautorias:</label>
                                <input type="text" name="providenPrecauto" id="providenPrecauto" class="txtMedia">
                            </td>
                            <td>
                                <label for="actosInvestiga">Prueba Anticipada:</label>
                                <input type="text" name="pruebaAnti" id="pruebaAnti" class="txtMedia">
                            </td>
                            <td>
                                <label for="actosInvestiga">Actos investigación con Autorizacion Previa:</label>
                                <input type="text" name="actosInvestiga" id="actosInvestiga" class="txtMedia">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="excusa">Excusas:</label>
                                <input type="text" name="excusa" id="excusa" class="txtMedia">
                            </td>
                            <td>
                                <label for="recusa">Recusación:</label>
                                <input type="text" name="recusa" id="recusa" class="txtMedia">
                            </td>
                            <td>
                                <label for="otras">Otras Cargas:</label>
                                <input type="text" name="otras" id="otras" class="txtMedia">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="causasPenaPend">Causas Penales Pendientes de Conclusión:</label>
                                <input type="text" name="causasPenaPend" id="causasPenaPend" class="txtMedia">
                            </td>
                            <td>
                                <label for="causasPenaBaja">Causas Penales Bajas de Sistema:</label>
                                <input type="text" name="causasPenaBaja" id="causasPenaBaja" class="txtMedia">
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>                       
    </body>
</html>
