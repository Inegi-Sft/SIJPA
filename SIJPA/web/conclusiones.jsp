<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Resoluciones</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el juez de control</h1>
            <form action="" method="post">
                <fieldset>
                    <legend>Resolución</legend>

                    <label for="idProcesado">Id Adolescente</label>
                    <select class="selPro" name="idProcesado" id="idProcesado">
                        <option value="0">--Seleccione--</option>
                        <%
                            //conexion a base
                        %>
                    </select><br/>
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso"/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="tipoConclusion">Tipo de resolución (Conclusión o terminación)</label>
                        <select class="selPro" name="tipoConclusion" id="tipoConclusion">
                            <option value="0">--Seleccione--</option>
                            <%
                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                        <select class="selPro" name="tipoSobreseimto" id="tipoSobreseimto">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                        <select class="selPro" name="proceSobreseimto" id="proceSobreseimto">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                </fieldset><br/>
                <fieldset>
                    <legend>Procedimiento abreviado</legend>
                    <label for="huboProsedimto">¿Hubo procedimiento abreviado?</label>
                    <select class="selPro" name="huboProsedimto" id="huboProsedimto">
                        <option value="0">--Seleccione--</option>
                        <%                                //conexion a base
                        %>
                    </select><br/>
                    <div class="cols">
                        <label for="tipoMedidaPA">Tipo de medida en el procedimiento abreviado</label>
                        <select class="selPro" name="tipoMedidaPA" id="tipoMedidaPA">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tipoMedidaPL">Tipo de medidas privativa de la libertad</label>
                        <select class="selPro" name="tipoMedidaPL" id="tipoMedidaPL">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                        <select class="selPro" name="tipoMedidaNPL" id="tipoMedidaNPL">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="internamiento">Tiempo en internamiento</label>
                        <select class="selPro" name="internamiento" id="internamiento">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                </fieldset><br/>
                <fieldset>
                    <legend>Reparación del daño</legend>
                    <div class="cols">
                        <label for="reparaDanio">¿Hubo reparación del daño?</label>
                        <select class="selPro" name="reparaDanio" id="reparaDanio">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tipoReparaD">Tipo de reparación del daño</label>
                        <select class="selPro" name="tipoReparaD" id="tipoReparaD">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="montoReparaD">Monto de la reparación impuesta</label>
                        <select class="selPro" name="montoReparaD" id="montoReparaD">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                </fieldset><br/>
                <fieldset>
                    <legend>Impugnación</legend>
                    <div class="cols">
                        <label for="impugnacion">¿La resolución fue impugnada?</label>
                        <select class="selPro" name="impugnacion" id="impugnacion">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="tipoImpugnacion">Tipo de impugnación</label>
                        <select class="selPro" name="tipoImpugnacion" id="tipoImpugnacion">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                    <div class="cols">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion"/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaImpugnacion"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                        <select class="selPro" name="personaImpugna" id="personaImpugna">
                            <option value="0">--Seleccione--</option>
                            <%                                //conexion a base
                            %>
                        </select>
                    </div>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
    </body>
</html>
