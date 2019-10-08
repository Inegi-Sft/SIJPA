<%-- 
    Document   : juzgados
    Created on : 20/09/2019, 10:55:04 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.NumerosRomanos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Juzgados</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/pestanas.js"></script>
    </head>
    <body >
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Juzgados</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana(event, 'p1')" id="btn1">Datos del Juez</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Datos Órgano Jurisdiccional</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Forma de Organizacion del Órgano</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Datos Geográficos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Datos de quien captura</button>
            </div>

            <form action="#" method="post">
                <!-- Contenido pestañas -->
                <div id="p1" class="pestanaContent" style="display: block">
                    <h3>Datos del Juez</h3>
                    <div class="cols">
                        <label for="nombre">Nombre(s)</label>
                        <input type="text" name="nombre" id="nombre" required/>
                    </div>
                    <div class="cols">
                        <label for="apaterno">Apellido Paterno</label>
                        <input type="text" name="apaterno" id="apaterno" required/>
                    </div>
                    <div class="cols">
                        <label for="amaterno">Apellido Materno</label>
                        <input type="text" name="amaterno" id="amaterno" required/>
                    </div>
                    <div class="cols">
                        <label for="fGestion">Fecha inicio gestion:</label>
                        <input type="date" class="txtMedia" name="fGestion" id="fGestion" />
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaInicioG"><label>No identificada</label>
                        </div>
                    </div>
                </div>

                <div id="p2" class="pestanaContent">
                    <h3>Datos Órgano Jurisdiccional</h3>
                    <div class="cols">
                        <label for="nomOrgano">Nombre Organo Jurisdiccional</label>
                        <input type="text" name="nomOrgano" id="nomOrgano"  required/>
                    </div>
                    <div class="cols">
                        <label for="numJuzgado">Número de Juzgado</label>
                        <input type="number" class="txtMedia" name="numJuzgado" id="numJuzgado" required/>
                    </div>
                    <div class="cols">
                        <label for="numDistrito">Número del Distrito Judicial en donde habita el susodicho presuntamente culpable</label>
                        <select name="numDistrito" class="txtMedia selPro" id="numDistrito" required>
                            <option value="0">--Seleccione--</option>
                            <%
                                NumerosRomanos nRomanosR = new NumerosRomanos(1, 99);
                                ArrayList<NumerosRomanos> alnRomanosR = nRomanosR.getNumerosRomanos();
                                for (NumerosRomanos nR : alnRomanosR) {
                                    out.println("<option value='" + nR.nArabigo + "'>" + nR + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tel">Teléfono del Juzgado</label>
                        <input type="number" class="txtMedia" name="tel" id="tel" placeholder="Telefono"/>
                    </div>
                    <div class="cols">
                        <label for="correo">Correo del Juzgado:</label>
                        <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" />
                    </div>
                </div>

                <div id="p3" class="pestanaContent">
                    <h3>Forma de Organizacion del Órgano</h3>
                    <table  class="tablaFormu">
                        <tr>
                            <td></td>
                            <td>
                                <label for="fOrganiza">Forma de Organizacion</label>
                                <select class="selPro" name="fOrganiza" id="fOrganiza">
                                    <option value="0">--Seleccione--</option>
                                    <option value="1">Región judicial</option>
                                    <option value="2">Distrito judicial</option>
                                    <option value="3">Partido judicial</option>
                                    <option value="4">Cobertura estatal</option>
                                    <option value="5">Otro</option>
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
                    <h3>Datos Geográficos</h3>
                    <table  class="tablaFormu" >
                        <tr>
                            <td>
                                <label for="entidad">Entidad Federativa</label>
                                <select class="selPro" name="entidad" id="entidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="vialidad">Vialidad</label>
                                <select class="selPro" name="vialidad" id="vialidad">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="asentamiento">Asentamiento Humano</label>
                                <select class="selPro" name="asentamiento" id="asentamiento">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="municipio">Municipio o Delegacion</label>
                                <select class="selPro" name="municipio" id="municipio">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
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
                    <h3>Datos de quien captura</h3>
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
