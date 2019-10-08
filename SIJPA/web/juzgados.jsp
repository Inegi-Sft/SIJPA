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
    </head>
    <body >
        <%
            catalogos cat=new catalogos();
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
                <button class="pestanaLinks active" onclick="openPestana(event, 'p1')" id="btn1">Datos del Juez</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Datos Órgano Jurisdiccional</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Forma de Organizacion del Órgano</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Datos Geográficos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Datos Captura</button>
            </div>

            <form action="#" method="post">
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
                                <input type="date" class="txtMedia" name="fGestion" id="fGestion" />
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaInicioG"><label>No identificada</label>
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
                                <select name="numDistrito" class="txtMedia txtMedia" id="numDistrito" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        NumerosRomanos nRomanosR = new NumerosRomanos(1, 99);
                                        ArrayList<NumerosRomanos> alnRomanosR = nRomanosR.getNumerosRomanos();
                                        for (NumerosRomanos nR : alnRomanosR) {
                                            out.println("<option value='"+nR.nArabigo+"'>"+nR+"</option>");
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
                                <select class="txtMedia" name="fOrganiza" id="fOrganiza">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findForOrganiza();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>"+ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="regJudicial">Nombre de la Región Judicial</label>
                                <input type="text" name="regJudicial" id="regJudicial"/>
                            </td>
                            <td>
                                <label for="distJudicial">Nombre del Distrito Judicial</label>
                                <input type="text" name="distJudicial" id="distJudicial"/>
                            </td>
                            <td>
                                <label for="partJudicial">Nombre del Partido Judicial</label>
                                <input type="text" name="partJudicial" id="partJudicial" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p4" class="pestanaContent">
                    <h2>Datos Geográficos</h2>
                    <table  class="tablaFormu" >
                        <tr>
                            <td>
                                <label for="entidad">Entidad Federativa</label>
                                <select class="txtMedia" name="entidad" id="entidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista=cat.findEntidades();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>"+ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="vialidad">Vialidad</label>
                                <select class="txtMedia" name="vialidad" id="vialidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="asentamiento">Asentamiento Humano</label>
                                <select class="txtMedia" name="asentamiento" id="asentamiento">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="municipio">Municipio o Delegacion</label>
                                <select class="txtMedia" name="municipio" id="municipio">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cp">Codigo Postal</label>
                                <input type="number" class="txtMedia" name="cp" id="cp" />
                            </td>
                            <td>
                                <label for="nomVialidad">Nombre de la Vialidad</label>
                                <input type="text" name="nomVialidad" id="nomVialidad" />
                            </td>
                            <td>
                                <label for="nomAsentamiento">Nombre del Asentamiento Humano</label>
                                <input type="text" name="nomAsentamiento" id="nomAsentamiento"/>
                                
                            </td>
                            <td>
                                <label for="">No. Exterior / No. Interiior</label>
                                <input type="text" class="txtSmall" name="noExterior" id="noExterior" />
                                <input type="text" class="txtSmall" name="noInterior" id="noInterior" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p5" class="pestanaContent">
                    <h2>Datos Captura</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nombreCap">Nombre(s)</label>
                                <input type="text" name="nombreCap" id="nombreCap" />
                            </td>
                            <td>
                                <label for="apaternoCap">Apellido Paterno</label>
                                <input type="text" name="apaternoCap" id="apaternoCap" />
                            </td>
                            <td>
                                <label for="amaternoCap">Apellido Materno</label>
                                <input type="text" name="amaternoCap" id="amaternoCap"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label for="Cargo">Cargo</label>
                                <input type="text" name="cargo" id="cargo" />
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
