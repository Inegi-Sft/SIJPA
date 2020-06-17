<%-- 
    Document   : capturaJuez
    Created on : 27/11/2019, 10:05:45 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Juzgados</title>
        <%@include file="librerias.jsp"%>
        <% 
            if(request.getParameter("error") != null){
                int error = Integer.parseInt(request.getParameter("error"));
                if(error == 100){
                    out.println("<script>alert('Clave duplicada: El juez, distrito, entidad, municipio ya existe  verificar')</script>");
                }
            }
            
            showJueces sJuez = new showJueces();
            int totJuez = sJuez.findTotJuez((String) session.getAttribute("juzgadoClave"));
            
            catalogos cat = new catalogos();
            ArrayList<String[]> lista, juez;
            
            String juzgadoClave = (String)session.getAttribute("juzgadoClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            int juezClave = 0;
            String nombreJuez = "";
            String apePateJuez = "";
            String apeMateJuez = "";
            String fechaGestion = "";
            String sexoJuez = "";
            String edadJuez = "";
            String gradoEstudi = "";
            String funcionDese = "";
            if(request.getParameter("juezClave") != null){//Si viene el juez clave, recuperamos datos
                juezClave = Integer.parseInt(request.getParameter("juezClave"));
                juez = sJuez.findJuezDatos(juezClave, juzgadoClave);
                if(juez.size() > 0){
                    operacion = "actualizar";
                    nombreJuez = juez.get(0)[0];
                    apePateJuez = juez.get(0)[1];
                    apeMateJuez = juez.get(0)[2];
                    fechaGestion = juez.get(0)[3];
                    sexoJuez = juez.get(0)[4];
                    edadJuez = juez.get(0)[5];
                    gradoEstudi = juez.get(0)[6];
                    funcionDese = juez.get(0)[7];
                }else{
                    out.println("<script>alert('El juez clave " + juezClave + " no se encontro dentro del Juzgado "  + juzgadoClave + "'); "
                        + "window.location.href = 'jueces.jsp'</script>");
                }
            }else{
                //Si es captura entonces obtenemos el maximo juez para sumarle uno y sea la nueva clave
                juezClave = sJuez.findMaxJuez((String) session.getAttribute("juzgadoClave")) + 1;
            }
            
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="jueces.jsp" >X</a>
            <% if(totJuez > 0){ %>
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <% } %>
            <h1>Captura Juez del Órgano</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Datos del Juez</button>
            </div>
            <form action="insrtJuez" method="post" name="formJuez">
                <!--Contenido pestañas--> 
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos Generales del Juez</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td></td>
                            <td>
                                <label for="juzClaveJuez">Órgano Jurisdiccional</label>
                                <input type="text" name="juzClaveJuez" id="juzClaveJuez" value="${sessionScope.juzgadoClave}" disabled/>
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                            <td>
                                <label for="juezID">Juez ID</label>
                                <input type="text" name="juezID" id="juezID" value="<%=juezClave%>" readonly/>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" value="<%=nombreJuez%>" required/>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" value="<%=apePateJuez%>" required/>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" value="<%=apeMateJuez%>" required/>
                            </td>
                            <td>
                                <label for="fGestion">Fecha inicio gestion:</label>
                                <input type="date" name="fGestion" id="fGestion" value="<%=fechaGestion%>" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" name="chkFechaInicioG" id="chkFechaInicioG" onclick="fechaNoIdent('#chkFechaInicioG', '#fGestion');">
                                    <label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="sexoJuez">Sexo</label>
                                <select name="sexoJuez" id="sexoJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(sexoJuez)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edadJuez">Edad</label>
                                <input type="number" class="txtSmall" name="edadJuez" id="edadJuez" value="<%=edadJuez%>" min="18" max="70" required/>
                            </td>
                            <td>
                                <label for="estudioJuez">Grado de Estudios</label>
                                <select name="estudioJuez" id="estudioJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEstudioProfesional();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(gradoEstudi)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="funcionJuez">Función dentro del Órgano</label>
                                <select name="funcionJuez" id="funcionJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuncionJuzgado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(funcionDese)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
        <script text="javascript">
            $(document).ready(function () {
                //Se usa para la recuperacion de datos de DB
                if($('#fGestion').val() === '1899-09-09'){
                    $('#fGestion').prop('readonly', true);
                    $('#chkFechaInicioG').prop('checked', true);
                }
            });
        </script>
    </body>
</html>
