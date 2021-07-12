<%-- 
    Document   : validaciones
    Created on : 9/09/2020, 10:42:19 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.showValidaciones"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>Validaciones</title>
        <%@include file="librerias.jsp"%>
        <script type="text/javascript" src="js/fnValidaciones.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            showValidaciones sV = new showValidaciones();
            ArrayList<String[]> lista;
            int i = 0;
            String sistema = "";
            if (request.getParameter("validaSistema") != null) {
                sistema = request.getParameter("validaSistema");
            }

        %>
    </head>
    <body>
        <%        
            if (!sistema.equals("")) {
                out.println("<div class='load'></div>");
            }
        %>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Validación de la información</h1>
            <form name="formValidacion" id="formValidacion" method="post" action="validaciones.jsp">
                <label for="validaSistema">Sistema a validar:</label>
                <select name="validaSistema" id="validaSistema" required>
                    <option value="">--Seleccione--</option>
                    <option value="JC">Juzgado de Control</option>
                    <option value="JO">Juicio Oral</option>
                </select>
                <input type="hidden" id="sistema" value="<%=sistema%>">
                <br>
                <input type="submit" name="validar" id="validar" value="Validar"/>
            </form> 
        <%
            if (!sistema.equals("")) {
                if (sistema.equals("JC")) {
                    out.print("<h3>Resultado: Validación Juzgado de Control</h3>");
                } else {
                    out.print("<h3>Resultado: Validación Juicio Oral</h3>");
                }
        %>
                <div id="validacionOK">
                    <h2>Datos Correctos</h2>
                    <img src="img/success.png" style="width: 100px" />
                    <h2>Información Sin Errores!</h2>
                </div>
                <table id="tblValidacion" class="tablasRegis">
                    <tr>
                        <th width="25%">Sección</th>
                        <th>Descripción</th>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnIF" value="Imputados_Faltantes" onclick="openValidacion('#v1')"/></td>
                        <td>Se muestran los expedientes en los cuales el Total de imputados  indicado en el expediente no coincide con el número de imputados desagregados.  Se requiere registrar los imputados faltantes o bien verificar el total de  imputados registrado por expediente.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnDF" value="Delitos_Faltantes" onclick="openValidacion('#v2')"</td>
                        <td>Se muestran los expedientes en los cuales el Total de delitos indicado en el expediente no coincide con el número de delitos desagregados. Se requiere registrar los delitos faltantes o bien verificar el total de  delitos registrado por expediente.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnVF" value="Victimas_Faltantes" onclick="openValidacion('#v3')"/></td>
                        <td>Se muestran los expedientes en los cuales el Total de víctimas  indicado en el expediente no coincide con el número de víctimas desagregadas. Se requiere registrar las víctimas faltantes o bien verificar el total de  víctimas registrado por expediente.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnIFCT" value="Imputados_Faltan_C_o_T" onclick="openValidacion('#v4')"/></td>
                        <td>Se muestran los imputados que no fueron registrados en Conclusiones o Trámite. Se requiere registrar en  Conclusiones o Trámite a cada imputado.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnVD" value="Victima_Delitos" onclick="openValidacion('#v5')"/></td>
                        <td>Se muestran las víctimas que no tienen delitos asignados, es decir;indica que no se les cometió ningun delito. Se requiere verificar y en su caso asignar el delito que le fue cometido a la víctima.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnID" value="Imputado_Delitos" onclick="openValidacion('#v6')"/></td>
                        <td>Se muestran los imputados a los cuales no se les asigno ningun delito,es decir;indica que  el imputado no cometio ningun delito. Se requiere verificar y en su caso asignar el delito que fue cometido por el imputado.</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnFIngre" value="Fecha_Ingreso" onclick="openValidacion('#v7')"/></td>
                        <td>La fecha de ingreso no debe  de ser mayor a la fecha actual</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnFO" value="Fecha_Ocurrencia" onclick="openValidacion('#v8')"/></td>
                        <td>La fecha de Ocurrencia no debe de ser mayor a la fecha_ingreso</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnFC" value="Fecha_Conclusion" onclick="openValidacion('#v9')"/></td>
                        <td>La fecha de conclusión debe de ser mayor  a la fecha de ingreso</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnFT" value="Fecha_Tramite" onclick="openValidacion('#v10')"/></td>
                        <td>La fecha de tramite debe de ser mayor  a la fecha de ingreso</td>
                    </tr>
                    <tr>
                        <td><input type="button" id="btnFImpug" value="Fecha_Impugnacion" onclick="openValidacion('#v11')"/></td>
                        <td>La fecha de Impuganación debe de ser mayor o igual  a la fecha de conclusión</td>
                    </tr>
                </table>
                <br>
                <form name="formExportacion" id="formExportacion" method="post" action="exportaValidaciones">
                    <input type="hidden" name="sistema" id="sistema" value="<%=sistema%>">
                    <input type="submit" name="btnExportExcel" id="btnExportExcel" value="Exportar xlsx"/>
                </form>
        <%
            }
        %>    
            <div id="v1" class="pValidacion oculto">
                <h2><%=sistema%>: Imputados Faltantes</h2>
                <table id="impFaltantes" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Total Imputados</th>
                            <th>Faltan por Capturar</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Imputados_Faltantes(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v2" class="pValidacion oculto">
                <h2><%=sistema%>: Delitos Faltantes</h2>
                <table id="delFaltantes" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Total Delitos</th>
                            <th>Faltan por Capturar</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Delitos_Faltantes(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v3" class="pValidacion oculto">
                <h2><%=sistema%>: Victimas Faltantes</h2>
                <table id="vicFaltantes" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Total Víctimas</th>
                            <th>Faltan por Capturar</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Victimas_Faltantes(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v4" class="pValidacion oculto">
                <h2><%=sistema%>: Imputados que Faltan en Conclusion o Tramite</h2>
                <table id="impFaltaCT" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Imputado Clave</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Imputados_Faltan_C_o_T(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v5" class="pValidacion oculto">
                <h2><%=sistema%>: Vicitma Delito</h2>
                <h5>No hay delitos desagregados para las siguientes víctimas</h5>
                <table id="vicDelito" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Victima Clave</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Victima_Delito(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v6" class="pValidacion oculto">
                <h2><%=sistema%>: Imputado Delito</h2>
                <h5>No hay delitos desagregados para los siguientes imputados</h5>
                <table id="impDelito" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Imputado Clave</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Imputado_Delito(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v7" class="pValidacion oculto">
                <h2><%=sistema%>: Fecha Ingreso</h2>
                <h5>La Fecha de Ingreso no debe  de ser mayor a la fecha actual</h5>
                <table id="fechaIngreso" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Causa Clave</th>
                            <th>Fecha Ingreso</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Fecha_Ingreso(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table> 
            </div>
            <div id="v8" class="pValidacion oculto">
                <h2><%=sistema%>: Fecha Ocurrencia</h2>
                <h5>La fecha de Ocurrencia no debe de ser mayor a la fecha_ingreso</h5>
                <table id="fechaOcurrencia" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Delito Clave</th>
                            <th>Fecha Ocurrencia</th>
                            <th>Fecha Ingreso</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Fecha_Ocurrencia(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table> 
            </div>
            <div id="v9" class="pValidacion oculto">
                <h2><%=sistema%>: Fecha Conclusion</h2>
                <h5>La fecha de conclusión debe de ser mayor a la fecha de ingreso:</h5>
                <table id="fechaConclusion" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Imputado Clave</th>
                            <th>Fecha Conclusión</th>
                            <th>Fecha Ingreso</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Fecha_Conclusion(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
            <div id="v10" class="pValidacion oculto">
                <h2><%=sistema%>: Fecha Tramite</h2>
                <h5>La fecha de tramite debe de ser mayor a la fecha de ingreso:</h5>
                <table id="fechaTramite" class="tablasRegis">
                    <thead>
                        <tr>
                            <th class="no">No.</th>
                            <th>Juzgado Clave</th>
                            <th>Imputado Clave</th>
                            <th>Fecha Tramite</th>
                            <th>Fecha Ingreso</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    if (!sistema.equals("")) {
                        lista = sV.Fecha_Tramite(sistema);
                        i = 1;
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + ls[0] + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            out.println("<td>" + ls[2] + "</td>");
                            out.println("<td>" + ls[3] + "</td>");
                            out.println("</tr>");
                            i++;
                        }
                    }
                %>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="v11" class="pValidacion oculto">
            <h2><%=sistema%>: Fecha Impugnación</h2>
            <h5>La fecha de Impuganación debe de ser mayor o igual  a la fecha de conclusión::</h5>
            <table id="fechaImpugnacion" class="tablasRegis">
                <thead>
                    <tr>
                        <th class="no">No.</th>
                        <th>Juzgado Clave</th>
                        <th>Imputado Clave</th>
                        <th>Fecha Impuganación</th>
                        <th>Fecha Conclusión</th>
                    </tr>
                </thead>
                <tbody>
            <%
                if (!sistema.equals("")) {
                    lista = sV.Fecha_Impugnacion(sistema);
                    i = 1;
                    for (String[] ls : lista) {
                        out.println("<tr>");
                        out.println("<td>" + i + "</td>");
                        out.println("<td>" + ls[0] + "</td>");
                        out.println("<td>" + ls[1] + "</td>");
                        out.println("<td>" + ls[2] + "</td>");
                        out.println("<td>" + ls[3] + "</td>");
                        out.println("</tr>");
                        i++;
                    }
                }
            %>
                </tbody>
            </table>
        </div><br><br>
    </section>
</body>
</html>
