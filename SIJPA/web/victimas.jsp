<%-- 
    Document   : victimas
    Created on : 27/09/2019, 10:10:38 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Víctimas</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <form action="" method="post">
                <div>
                    <fieldset>
                        <legend style="text-align: left">Caracteristicas Generales</legend>
                        <table class="tablaFormu" border="0">
                            <tr>
                                <td>
                                    <label for="victima_clave">Víctima Clave</label>
                                    <input type="text" name="victima_clave" id="victima_clave" required />
                                </td>
                                <td>
                                    <label for="tipo_victima">Tipo de Víctima</label>
                                    <select name="tipo_victima" id="tipo_victima" class="txtSelect" required="">
                                        <option value="0">Seleccione</option>
                                        <option value="1">Persona física</option>
                                        <option value="2">Persona moral</option>
                                        <optgroup label="Otro tipo de víctima">
                                            <option value="3">Sociedad</option>
                                            <option value="4">Estado</option>
                                            <option value="5">Otro</option>
                                            <option value="6">No identificado</option>
                                        </optgroup>


                                    </select>
                                </td>    
                                <td>
                                    <label for="tvic_moral">Tipo de Víctima Moral</label>
                                    <select name="tvic_moral" id="tvic_moral" class="txtSelect">
                                        <option value="0">Seleccione</option>
                                        <%
                                            //conección a base
                                        %>    
                                    </select>
                                </td>
                                <td>
                                    <label for="sexo">Sexo</label>
                                    <select name="sexo" id="sexo" class="txtSelect">
                                        <option value="0">Seleccione</option>
                                        <option value="0">Hombre</option>
                                        <option value="0">Mujer</option>
                                        <option value="0">No identificado</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>



                                <td>
                                    <label for="fnacimiento">Fecha de Nacimiento</label>
                                    <input type="date" name="fnacimiento" id="fnacimiento" class="txtMedia" required>
                                </td>
                                <td>
                                    <label for="edad">Edad</label>
                                    <input type="number" name="edad" id="edad" class="txtSelect">
                                </td>
                                <td>
                                    <label for="tvic_moral">Condición de vulnerabilidad</label>
                                    <select name="vulnera" id="vulnera" class="txtSelect">
                                        <option value="0">Seleccione</option>
                                        <%
                                            //conección a base
                                        %>    
                                    </select>
                                </td>  
                                <td>
                                    <label for="naciona">Nacionalidad</label>
                                    <select name="naciona" id="naciona" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                            </tr>
                        </table>   
                    </fieldset>

                    <fieldset>
                        <legend style="text-align: left">Lugar de nacimiento</legend>
                        <table class="tablaFormu" border="0">   
                            <tr>
                                <td>
                                    <label for="Pnacimiento">País</label>
                                    <select name="Pnacimiento" id="Pnacimiento" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="Enacimiento">Entidad</label>
                                    <select name="Enacimiento" id="Enacimiento" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="Mnacimiento">Municipio</label>
                                    <select name="Mnacimiento" id="Mnacimiento" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>

                            </tr>
                        </table>  
                    </fieldset>

                    <fieldset>
                        <legend style="text-align: left">Lugar habitual de residencia</legend>
                        <table class="tablaFormu" border="0"> 
                            <tr>
                                <td>
                                    <label for="Preside">País</label>
                                    <select name="Preside" id="Preside" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="Ereside">Entidad</label>
                                    <select name="Ereside" id="Ereside" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="Mreside">Municipio</label>
                                    <select name="Mreside" id="Mreside" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend style="text-align: left">Características especificas para víctimas personas físicas</legend> 
                        <table class="tablaFormu" border="0">
                            <tr>
                                <td>
                                    <label for="conyugal">Situación conyugal</label>
                                    <select name="conyugal" id="conyugal" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="discapacidad">¿Cuenta con alguna condición de discapacidad?</label>
                                    <select name="discapacidad" id="discapacidad" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="alfabetismo">Condición de alfabetismo</label>
                                    <select name="alfabetismo" id="alfabetismo" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>

                                <td>
                                    <label for="estudios">Grado de estudios </label>
                                    <select name="estudios" id="estudios" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="interprete">¿Requirió de intérprete?</label>
                                    <select name="interprete" id="interprete" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="hablaesp">Dominio del español</label>
                                    <select name="hablaesp" id="hablaesp" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>

                                <td>
                                    <label for="indigena">Habla lengua indígena o dialecto </label>
                                    <select name="indigena" id="indigena" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="familia"> Familia lingüísticas</label>
                                    <select name="familia" id="familia" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ocupa">Ocupación</label>
                                    <select name="ocupa" id="ocupa" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="relacion">Tipo de relación con el imputado</label>
                                    <select name="relacion" id="relacion" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="dictamedida">¿Se le dictaron medidas de protección?</label>
                                    <select name="dictamedida" id="dictamedida" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="mprotec">Tipo de medidas de protección</label>
                                    <select name="mprotec" id="mprotec" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                            </tr>
                        </table>        
                        <table class="tablaFormu" border="0">
                            <tr>
                                <td>
                                    <label for="delimujer">¿Se le dictaron medidas de protección por delitos que impliquen violencia contra las mujeres?</label>
                                    <select name="delimujer" id="delimujer" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
                                        %>   
                                </td>
                                <td>
                                    <label for="mpmujer">Tipo de medidas de protección por delitos que impliquen violencia contra las mujeres</label>
                                    <select name="mpmujer" id="mpmujer" class="txtMedia">
                                        <option value="0">Seleccione</option>
                                        <%                                        //conección a base
%>   
                                </td>
                            </tr>
                        </table>
                        </fieldset>
                            </div>   
                            <div class="comentarios">
                                <h2>Comentarios</h2>
                                <textarea name="Comentavic" id="Comentavic"></textarea>
                            </div>
                                 <br>
                <input type="submit" name="guardarvic" id="guardarvic" value="Guardar Víctima">
                            </form>
                            </section>    

                            </body>
                            </html>
