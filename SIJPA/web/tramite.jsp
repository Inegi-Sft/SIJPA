<%-- 
    Document   : tramite
    Created on : 3/10/2019, 09:32:06 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Pendientes de resolución </title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Pendientes de resolución </h1>
            <form action="" method="post">
                <!--<center>-->
                <fieldset style="width: 600px; margin-left: 26%;">
                    <legend style="text-align: left;">Estatus</legend>

                    <table style="text-align: center;" border="0" width="300">
                        <tr>
                            <td>
                                <label for="pClave">Procesado Clave</label>
                                <select name="pClave" id="pClave" class="txtMedia selPro">
                                    <option value="0">Seleccione</option>
                                    <%
                                        //conección a base
                                    %>    
                                </select><br/>
                                <input type="text" name="nomProc"  id="nomProc" disabled />
                            </td>

                            <td>
                                <label for="eProcesal">Etapa procesal</label>
                                <select name="eProcesal" id="eProcesal" class="txtMedia selPro">
                                    <option value="0">Seleccione</option>
                                    <%
                                        //conección a base
                                    %>    
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="eMotivo">Especifique el motivo</label>
                                <input type="text" name="eMotivo"  id="eMotivo" class="txtLong" required  />
                            </td>
                            <td>
                                <label for="uActua">Fecha de la última actuación</label>

                                <input type="date" name="uActua" id="uActua" class="txtMedia" required>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkOcurrencia"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>

                    </table>

                </fieldset>
                <!--</center>-->
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">

            </form>
        </section>
    </body>
</html>
