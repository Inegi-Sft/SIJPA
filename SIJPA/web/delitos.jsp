<%-- 
    Document   : delitos
    Created on : 1/10/2019, 09:00:11 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Delitos</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp" %>
        <section class="contenedor">
            <h1>Delitos</h1>
            <form action="" method="post">
                <fieldset>
                    <legend>Identificación del tipo penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="delitoCP">Delito de acuerdo con la ley penal</label>
                                <select class="selPro"  name="delitoCP" id="delitoCP" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td colspan="3">
                                <label for="articuloCP">Artículo y/o fracción de acuerdo con el código penal</label>
                                <input class="txtExBig" type="text"  name="articuloCP" id="articuloCP" required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="delitoNT">Delito de acuerdo con la Norma Técnica</label>
                                <select class="selPro"  name="delitoNT" id="delitoNT" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="fuero">Fuero</label>
                                <select class="selPro"  name="fuero" id="fuero">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="reclasi">¿Hubo reclasificación del delito?</label>
                                <select class="selPro"  name="fuero" id="fuero">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </section>
    </body>
</html>
