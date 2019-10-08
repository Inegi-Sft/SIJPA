<%-- 
    Document   : victimas
    Created on : 27/09/2019, 10:10:38 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Víctimas</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <form action="#" method="post">
                <fieldset>
                    <legend>Caracteristicas Generales</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="victima_clave">Víctima Clave</label>
                                <input type="text" name="victima_clave" id="victima_clave" required />
                            </td>
                            <td>
                                <label for="tipo_victima">Tipo de Víctima</label>
                                <select name="tipo_victima" id="tipo_victima" class="txtSelect txtMedia"  required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">1.- Persona física</option>
                                    <option value="2">2.- Persona moral</option>
                                    <optgroup label="Otro tipo de víctima">
                                        <option value="3">3.- Sociedad</option>
                                        <option value="4">4.- Estado</option>
                                        <option value="5">5.- Otro</option>
                                        <option value="9">9.- No identificado</option>
                                    </optgroup>
                                </select>
                            </td>    
                            <td>
                                <label for="tvic_moral">Tipo de Víctima Moral</label>
                                <select name="tvic_moral" id="tvic_moral" class="txtSelect txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>    
                                </select>
                            </td>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo" class="txtSelect txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>    
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
                                <select name="vulnera" id="vulnera" class="txtSelect txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findVulnera();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>  
                            <td>
                                <label for="naciona">Nacionalidad</label>
                                <select name="naciona" id="naciona" class="txtMedia txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findNacionalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" >
                                <fieldset>
                                    <legend>Defensa</legend>
                                    <div class="cols">
                                        <label for="Con_Asesor">¿Contó con asesor jurídico?</label>
                                        <select name="Con_Asesor" id="Con_Asesor" class="txtSelect txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="Asesor">Asesor Jurídico</label>
                                        <select name="Asesor" id="Asesor" class="txtSelect txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findTipoDefensor();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>        
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend >Delitos cometidos a la víctima</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Procesado Clave</th>
                            <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>Delito cometido</th>
                        </tr>
                        <tr>
                            <td>
                                select para traer procesado_clave
                            </td>
                            <td>
                                select para traer delito_clave
                            </td>
                            <td>
                                select para traer el nombre de delito
                            </td>
                            <td>
                                <input class="chkAplica" type="checkbox" name="deliCometido" id="deliCometido"/>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br/>
                <fieldset>
                    <legend>Relación del Procesado con la Víctima</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Procesado Clave</th>
                            <th>Relación</th>
                        </tr>
                        <tr>
                            <td>
                                select para traer procesado_clave
                            </td>
                            <td>
                                <select name="relacionPro" id="relacionPro" class="txtSelect">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findRelImputado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br/>
                <fieldset>
                    <legend>Características especificas para víctimas personas físicas</legend> 
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="cols">
                                        <label for="Pnacimiento">País</label>
                                        <select name="Pnacimiento" id="Pnacimiento" class="txtMedia txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols">       
                                        <label for="Enacimiento">Entidad</label>
                                        <select name="Enacimiento" id="Enacimiento" class="txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>     
                                        </select>
                                    </div>
                                    <div class="cols"> 
                                        <label for="Mnacimiento">Municipio</label>
                                        <select name="Mnacimiento" id="Mnacimiento" class="txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findMunicipios();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="conyugal">Situación conyugal</label>
                                <select name="conyugal" id="conyugal" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findEdoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar habitual de residencia</legend>
                                    <div class="cols"> 
                                        <label for="Preside">País</label>
                                        <select name="Preside" id="Preside" class="txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>    
                                        </select>
                                    </div>
                                    <div class="cols">   
                                        <label for="Ereside">Entidad</label>
                                        <select name="Ereside" id="Ereside" class="txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>
                                    <div class="cols"> 
                                        <label for="Mreside">Municipio</label>
                                        <select name="Mreside" id="Mreside" class="txtMedia">
                                            <option value="">Seleccione</option>
                                            <%
                                                lista = cat.findMunicipios();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>

                                </fieldset>
                            </td>
                            <td>
                                <label for="discapacidad">¿Cuenta con alguna condición de discapacidad?</label>
                                <select name="discapacidad" id="discapacidad" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="alfabetismo">Condición de alfabetismo</label>
                                <select name="alfabetismo" id="alfabetismo" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>  
                                </select>
                            </td>

                            <td>
                                <label for="estudios">Grado de estudios </label>
                                <select name="estudios" id="estudios" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findGEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió de intérprete?</label>
                                <select name="interprete" id="interprete" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="hablaesp">Dominio del español</label>
                                <select name="hablaesp" id="hablaesp" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findDomEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>

                        </tr>
                        <tr>

                            <td>
                                <label for="indigena">Habla lengua indígena o dialecto </label>
                                <select name="indigena" id="indigena" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="familia"> Familia lingüísticas</label>
                                <select name="familia" id="familia" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findPIndigena();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="ocupa">Ocupación</label>
                                <select name="ocupa" id="ocupa" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findOcupacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="relacionIm">Tipo de relación con el imputado</label>
                                <select name="relacionIm" id="relacionIm" class="txtMedia">
                                    <option value="">Seleccione</option>
                                    <%
                                        lista = cat.findRelImputado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>        
                                </select>
                            </td>
                        </tr>
                    </table> 
                </fieldset><br>
                <fieldset>
                    <legend>Medidas Protección</legend>
                    <label for="mProtect" class="lblExBig">¿Se le dictaron medidas de protección?</label>
                    <select name="mProtect" id="mProtect" class="txtMedia">
                        <option value="">Seleccione</option>
                        <%
                            lista = cat.findResSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MedidasPro" class="tablasRegis">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <tr>
                            <td>
                                1
                            </td>
                            <td>
                                Auxilio inmediato por integrantes de instituciones policiales, al domicilio 
                                en donde se localice o se encuentre la víctima u ofendido en el momento de solicitarlo
                            </td>
                            <td>
                                <!--                                <select name="medidaPro" id="medidaPro" class="txtMedia">
                                                                    <option value="1">Si</option>
                                                                    <option value="2" selected>No</option>
                                                                </select>-->
                                <input type="checkbox" name="aplicaMedida" id="aplicaMedida" />
                            </td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Medidas de Protección Violencia Mujeres</legend>
                    <label for="mujProtect" class="lblExBig">¿Se le dictaron medidas de protección por delitos que impliquen violencia contra las mujeres?</label>
                    <select name="mujProtect" id="mujProtect" class="txtMedia">
                        <option value="">Seleccione</option>
                        <%
                            lista = cat.findResSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MujPro" class="tablasRegis">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección por delitos que impliquen violencia contra las mujeres</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <tr>
                            <td>
                                1
                            </td>
                            <td>
                                Acceso al domicilio en común, de autoridades policíacas o de personas que auxilien a la víctima a tomar sus pertenencias personales y las de sus hijas e hijos
                            </td>
                            <td>
                                <!--                                <select name="medidaProMuj" id="medidaProMuj" class="txtMedia">
                                                                    <option value="1">Si</option>
                                                                    <option value="2" selected>No</option>
                                                                </select>-->
                                <input type="checkbox" name="aplicaMedidaMuj" id="aplicaMedidaMuj" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
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
