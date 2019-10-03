<%-- 
    Document   : etapaInicial
    Created on : 2/10/2019, 12:00:12 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Inicial</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp" %>
        <section class="contenedor">
            <h1>Etapa Inicial</h1>
            <form action="" method="post">
                <fieldset>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label for="idProcesado">Id Adolescente</label>
                                <select class="selPro" name="idProcesado" id="idProcesado" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                                <hr style="border: 1px solid #0077CB;margin-top: 10px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <label for="ctrlDetencion">¿Hubo control de detención?</label>
                                    <select class="selPro" name="ctrlDetencion" id="ctrlDetencion">
                                        <option value="0">--Seleccione--</option>
                                        <%
                                            //conexion a base
                                        %>
                                    </select>

                                    <label for="fechaCtrlDeten">Fecha de audiencia de control de detención</label>
                                    <input type="date" name="fechaCtrlDeten" id="fechaCtrlDeten"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaCtrlDeten"><label>No identificada</label>
                                    </div> 
                                </fieldset>
                            </td>
                            <td>
                                <label for="legalDeten">¿Se calificó como legal la detención?</label>
                                <select class="selPro" name="legalDeten" id="legalDeten">
                                    <option value="0">--Seleccione--</option>
                                    <%                                    //conexion a base
                                    %>
                                </select>    
                            </td>
                            <td>
                                <fieldset>
                                    <label for="audiInicial">¿Hubo audiencia inicial?</label>
                                    <select class="selPro" name="audiInicial" id="audiInicial">
                                        <option value="0">--Seleccione--</option>
                                        <%                                    //conexion a base
                                        %>
                                    </select>    

                                    <label for="conducAudi">Forma de conducción en la audiencia inicial</label>
                                    <select class="selPro" name="conducAudi" id="conducAudi">
                                        <option value="0">--Seleccione--</option>
                                        <%                                    //conexion a base
                                        %>
                                    </select>    
                                </fieldset>
                            </td>
                            <td>
                                <label for="fechaFormuImpu">Fecha de formulación de la imputacion</label>
                                <input type="date" name="fechaFormuImpu" id="fechaCtrlDeten"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaFormuImpu"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr><td colspan="4"><br/></td></tr>
                        <tr style="padding-top: 15px;">
                            <td>
                                <fieldset>
                                    <label for="declaro">¿El adolescente declaró?</label>
                                    <select class="selPro" name="declaro" id="declaro">
                                        <option value="0">--Seleccione--</option>
                                        <%                                //conexion a base
                                        %>
                                    </select>
                                    <label for="plazo">Tiempo del plazo constitucional</label>
                                    <select class="selPro" name="plazo" id="plazo">
                                        <option value="0">--Seleccione--</option>
                                        <%                                //conexion a base
                                        %>
                                    </select>
                                </fieldset>
                            </td>
                            <td>
                                <fieldset>
                                    <label for="autoVin">Resolución del auto de vinculación a proceso</label>
                                    <select class="selPro" name="autoVin" id="autoVin">
                                        <option value="0">--Seleccione--</option>
                                        <%                                //conexion a base
                                        %>
                                    </select>
                                    <label for="fechAuto">Fecha en que se dictó el auto de vinculación a proceso</label>
                                    <input type="date" name="fechAuto" id="fechAuto"/>
                                    <div class="noIdentificada">
                                        <input type="checkbox" id="chkFechaAuto"><label>No identificada</label>
                                    </div>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <table style="border-spacing: 0; ">
                                        <tr>
                                            <td>
                                                <label for="soliPlazo" class="lblExBig">¿Se solicitó el plazo para el cierre de investigación complementaria?</label>
                                                <select class="selPro" name="soliPlazo" id="soliPlazo">
                                                    <option value="0">--Seleccione--</option>
                                                    <%                                //conexion a base
                                                    %>
                                                </select>
                                            </td>
                                            <td>
                                                <label for="plazoFijadoC">Plazo fijado para el cierre de la investigación</label>
                                                <select class="selPro" name="plazoFijadoC" id="plazoFijadoC">
                                                    <option value="0">--Seleccione--</option>
                                                    <%   //conexion a base
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="fechSoliPlazo">Fecha de la solicitud del plazo</label>
                                                <input type="date" name="fechSoliPlazo" id="fechSoliPlazo"/>
                                                <div class="noIdentificada">
                                                    <input type="checkbox" id="chkFechSoliPlazo"><label>No identificada</label>
                                                </div>

                                            </td>
                                            <td>
                                                <label for="fechCierreI" >Fecha del cierre de la investigación</label>
                                                <input type="date" name="fechCierreI" id="fechCierreI"/>
                                                <div class="noIdentificada">
                                                    <input type="checkbox" id="chkFechCierreI"><label>No identificada</label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><br/>
                                <fieldset style="background-color: #fff;">
                                    <legend>Medidas Cautelares</legend>
                                    <div class="cols">
                                        <label for="drecretaMC">¿Se decretó medida cautelar?</label>
                                        <select class="selPro" name="drecretaMC" id="drecretaMC">
                                            <option value="0">--Seleccione--</option>
                                            <%   //conexion a base
%>
                                        </select>
                                    </div>
                                    <div  style="float: left;width: 75%;">
                                        <table class="tblDelitos">
                                            <tr>
                                                <th width="20">Id</th>
                                                <th width="450">Medida Cautelar</th>
                                                <th width="70">Decretada</th>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>El resguardo en su domicilio con las modalidades que el órgano Jurisdiccional disponga</td>
                                                <td>
                                                    <select name="aplica" id="aplica">
                                                        <option value="Si">Si</option>
                                                        <option value="No" selected>No</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Garantía económica para asegurar la comparecencia</td>
                                                <td>
                                                    <select name="aplica" id="aplica">
                                                        <option value="Si">Si</option>
                                                        <option value="No" selected>No</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>La prohibición de convivir, acercarse o comunicarse con determinadas personas, con las víctimas, ofendidos o testigos, siempre que no se afecte el derecho de defensa</td>
                                                <td>
                                                    <select name="aplica" id="aplica">
                                                        <option value="Si">Si</option>
                                                        <option value="No" selected>No</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
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
