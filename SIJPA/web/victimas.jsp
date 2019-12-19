<%-- 
    Document   : victimas
    Created on : 27/09/2019, 10:10:38 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="clasesAuxiliar.showVictimas"%>
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
            String victiClave = "", posicion = "";
            if (request.getParameter("victiClave") != null || request.getParameter("posicion") != null) {
                victiClave = request.getParameter("victiClave");
                posicion = request.getParameter("posicion");
            }
            if (request.getParameter("insertado") != null) {
                out.println("<script type='text/javascript'>alert('Error al insertar: Consulte al administrador del sistema');</script>");
            }
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
            showVictimas victi = new showVictimas();
            ArrayList<String[]> vic = new ArrayList();
            String entidad = (String) session.getAttribute("entidad");
            String municipio = (String) session.getAttribute("municipio");
            String numero = (String) session.getAttribute("numero");
            String jConcatenado = entidad + municipio + numero;
            String causaClave = (String) session.getAttribute("causaClave");

        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <form action="insrtVictimas" method="post" name="formVictimas" id="formVictimas">
                <fieldset>
                    <legend>Caracteristicas Generales</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <div class="cols">
                                    <label for="victima_clave">Víctima Clave</label>
                                    <input type="text" name="victiClave" id="victiClave" value="<%=victiClave%>" readonly/>
                                    <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                                </div>
                                <div class="cols">
                                    <label for="tipo_victima">Tipo de Víctima</label>
                                    <select name="tipo_victima" id="tipo_victima" class="txtMedia" required>
                                        <option value="">--Seleccione--</option>
                                        <option value="1">1.- Persona física</option>
                                        <option value="2">2.- Persona moral</option>
                                        <optgroup label="Otro tipo de víctima">
                                            <option value="3">3.- Sociedad</option>
                                            <option value="4">4.- Estado</option>
                                            <option value="5">5.- Otro</option>
                                            <option value="9">9.- No identificado</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="cols oculto" id="tipoMoral">
                                    <label for="tvic_moral">Tipo de Víctima Moral</label>
                                    <select name="tvic_moral" id="tvic_moral" class="txtMedia dependiente">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findVicMoral();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>    
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend >Delitos cometidos a la víctima</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>Delito cometido</th>
                        </tr>
                        <%
                            vic = victi.findDelitos(causaClave + jConcatenado);
                            for (String[] ls : vic) {
                                out.println("<tr>");
                                out.println("<td>");
                                out.println(ls[0] + "<input type='hidden' name='inpDeli' value='" + ls[0] + "'/>");
                                out.println("</td>");
                                out.println("<td>");
                                out.println(ls[1] + "<input type='hidden' name='inpNom' value='" + ls[1] + "'/>");
                                out.println("</td>");
                                out.println("<td>");
                        %>
                        <input class="chkAplica" type="checkbox" name="deliCometido" id="deliCometido"/>
                        <%
                                out.println("</td>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Defensa</legend>
                    <div class="cols">
                        <label for="con_asesor">¿Contó con Asesor Jurídico?</label>
                        <select name="con_asesor" id="con_asesor" class="txtMedia" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findResSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>      
                        </select>
                    </div>
                    <div class="cols oculto" id="asesorJuri">
                        <label for="asesor">Asesor Jurídico</label>
                        <select name="asesor" id="asesor" class="txtMedia dependiente">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoDefensor();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>        
                        </select>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Relación de la Victima con el Procesado</legend>
                    <table class="tablasRegis" onblur="relacion(j,i)">
                        <tr>
                            <th>Procesado Clave</th>
                            <th width="750">Relación</th>
                        </tr>
                        <%
                            vic = victi.findVprocesados(causaClave + jConcatenado);
                            int i = 0;
                            for (String[] ls : vic) {
                                out.println("<tr>");
                                out.println("<td>");
                                out.println( "<input type='hidden' name='numeroProcesados' id='numeroProcesados' value='" + vic.size() + "'/>");
                                out.println(ls[0] + "<input type='hidden' name='proRela' value='" + ls[0] + "'/>");
                                out.println("</td>");
                                out.println("<td>");
                                lista = cat.findRelImputado();
                                for (String[] los : lista) {
                                    out.println("<div class='chkCat'>");
                                    out.println("<input type='checkbox' class='RelaProceChk' name='chkRelaProce" + i + "' id='chkRelaProce" + i + los[0] + "' value=" + los[0] + ">");
                                    out.println("<label>" + los[1] + "</label>");
                                    out.println("</div>");
                                }
                                out.println("</td>");
                                out.println("</tr>");
                                i++;
                            }
                        %>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="victiFisicas">
                    <legend>Características especificas para víctimas personas físicas</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo" class="txtMedia">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fnacimiento">Fecha de Nacimiento</label>
                                <input type="date" name="fnacimiento" id="fnacimiento" class="txtMedia depenFecha">
                                <div class="noIdentificada" id="chkFechaCtrlDeten">
                                    <input type="checkbox" id="chkVictFisica" onchange="fechaNoIdent('#chkVictFisica', '#fnacimiento')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="edad">Edad</label>
                                <input type="number" name="edad" id="edad" class="txtMedia">
                            </td>
                            <td>
                                <label for="tvic_moral">Condición de vulnerabilidad</label>
                                <select name="vulnera" id="vulnera" class="txtMedia">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findVulnerabilidad();
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
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="cols" id="paisNaci">
                                        <label for="Pnacimiento">País</label>
                                        <select name="Pnacimiento" id="Pnacimiento" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="estaNaci">       
                                        <label for="Enacimiento">Entidad</label>
                                        <select name="Enacimiento" id="Enacimiento" name="Enacimiento" class="txtMedia dependiente" onchange="llenaMun('#Enacimiento', '#Mnacimiento')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>     
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="munNaci"> 
                                        <label for="Mnacimiento">Municipio</label>
                                        <select name="Mnacimiento" id="Mnacimiento" name="Mnacimiento" class="txtMedia dependiente">
                                            <option value="">--Seleccione--</option>      
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="naciona">Nacionalidad</label>
                                <select name="naciona" id="naciona" class="txtMedia">
                                    <option value="">--Seleccione--</option>
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
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar habitual de residencia</legend>
                                    <div class="cols" id="paisResi"> 
                                        <label for="Preside">País</label>
                                        <select name="Preside" id="Preside" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>    
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="estaResi">   
                                        <label for="Ereside">Entidad</label>
                                        <select name="Ereside" id="Ereside" name="Ereside" class="txtMedia dependiente" onchange="llenaMun('#Ereside', '#Mreside')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="munResi"> 
                                        <label for="Mreside">Municipio</label>
                                        <select name="Mreside" id="Mreside" name="Mreside" class="txtMedia dependiente">
                                            <option value="">--Seleccione--</option>      
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="conyugal">Situación conyugal</label>
                                <select name="conyugal" id="conyugal" class="txtMedia">
                                    <option value="">--Seleccione--</option>
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
                            <td>
                                <label for="alfabetismo">Condición de alfabetismo</label>
                                <select name="alfabetismo" id="alfabetismo" class="txtMedia">
                                    <option value="">--Seleccione--</option>
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
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="ocupa">Ocupación</label>
                                <select name="ocupa" id="ocupa" class="txtMedia">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findOcupacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="hablaesp">Dominio del español</label>
                                <select name="hablaesp" id="hablaesp" class="txtMedia">
                                    <option value="">--Seleccione--</option>
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
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="indigena">Habla lengua indígena o dialecto </label>
                                        <select name="indigena" id="indigena" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="famLingui">
                                        <label for="familia"> Familia lingüísticas</label>
                                        <select name="familia" id="familia" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPIndigena();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>   
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="interprete">¿Habla alguna lengua extranjera?</label>
                                <select name="extrangera" id="extrangera" class="txtMedia dependiente">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió de intérprete?</label>
                                <select name="interprete" id="interprete" class="txtMedia dependiente">
                                    <option value="">--Seleccione--</option>
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
                            <td colspan=4>
                                <fieldset>
                                    <div class="cols">
                                        <label for="indigena">¿Percibe algún tipo de ingresos? </label>
                                        <select name="ingresos" id="ingresos" class="txtMedia dependiente">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>

                                    <div class="cols oculto" id="rangoInge">
                                        <label for="indigena">Rango de ingresos </label>
                                        <select name="rangoIngresos" id="rangoIngresos" class="txtMedia dependiente">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRangoIngre();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <table class="tablasRegis oculto" border="0" id="fuenteIngre">
                                        <tr>
                                            <th>ID</th>
                                            <th>Fuente de ingresos</th>
                                            <th>Aplica</th>
                                        </tr>
                                        <%
                                            lista = cat.findFuenteIngre();
                                            for (String[] ls : lista) {
                                                out.println("<tr>");
                                                out.println("<td>" + ls[0] + "</td>");
                                                out.println("<td>" + ls[1] + "</td>");
                                                out.println("<td>");
                                                out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + "  >");
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="mediProtec">
                    <legend>Medidas Protección</legend>
                    <label for="mProtect" class="lblExBig">¿Se le dictaron medidas de protección?</label>
                    <select name="mProtect" id="mProtect" class="txtMedia">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findResSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MedidasPro" class="tablasRegis" hidden>
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <%
                            lista = cat.findMedProteccion();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>");%>
                        <input type="checkbox" name="aplicaMedida" id="aplicaMedida<%=ls[0]%>" value="<%=ls[0]%>"/>
                        <%      out.println("</td>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="mediProtecMuj">
                    <legend>Medidas de Protección Violencia Mujeres</legend>
                    <label for="mujProtect" class="lblExBig">¿Se le dictaron medidas de protección por delitos que impliquen violencia contra las mujeres?</label>
                    <select name="mujProtect" id="mujProtect" class="txtMedia">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findResSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MujPro" class="tablasRegis" hidden>
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección por delitos que impliquen violencia contra las mujeres</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <%
                            lista = cat.findMedMujer();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>");%>
                        <input type="checkbox" name="aplicaMedidaMuj" id="aplicaMedidaMuj<%=ls[0]%>" value="<%=ls[0]%>" />
                        <%      out.println("</td>");
                                out.println("</tr>");
                            }
                        %> 
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
