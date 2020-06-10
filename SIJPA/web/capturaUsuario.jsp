<%-- 
    Document   : registroUsuario
    Created on : 9/01/2020, 02:56:52 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Registro Usuarios</title>
        <%@include file="librerias.jsp"%>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;

            usuario usuario = new usuario();
            int tot = usuario.findTotUsu();
        %>
    </head>
    <body>
        <% if(tot != 0){ %>
            <%@include file="cabecera.jsp"%>
            <%@include file="menu.jsp"%>
        <% } %>
        <section class="contenedor">
            <% 
                if(tot != 0){
                    out.println("<div class='toggle-nav'>");
                    out.println("<div class='toggle-nav-inner'></div>");
                    out.println("</div>");
                }
            %>
            <h1>Registro de Usuario</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Usuario</button>
            </div>
            <form action="insrtUsuario" method="post" name="formUsuario" id="formAdmin">
                <!--Contenido pestañas--> 
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos Generales</h2>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <% 
                                    if(tot == 0){ 
                                        out.println("<input type='hidden' name='tipoUsuario' id='tipoUsuario' value='1'/>");
                                    }else{
                                        out.println("<input type='hidden' name='tipoUsuario' id='tipoUsuario' value='2'/>");
                                    }
                                %>
                                
                                <label for="nom">Nombre(s)</label>
                                <input type="text" name="nom" id="nom" required/>
                            </td>
                            <td>
                                <label for="paterno">Apellido Paterno</label>
                                <input type="text" name="paterno" id="paterno" required/>
                            </td>
                            <td>
                                <label for="materno">Apellido Materno</label>
                                <input type="text" name="materno" id="materno" required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="edad">Edad</label>
                                <input type="number" class="txtSmall" min="18" name="edad" id="edad" required/>
                            </td>
                            <td>
                                <label for="correo">Correo Electronico</label><div class="ayuda"></div>
                                <input type="text" name="correo" id="correo" placeholder="usuario@correo.com" required/>
                            </td>
                            <td>
                                <label for="entidad">Entidad Federativa</label>
                                <%
                                    if(tot == 0){
                                        out.println("<select name='entidad' id='entidad' required>");
                                        out.println("<option value=''>--Seleccione--</option>");
                                        lista = cat.findEntidades();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                        out.println("</select>");
                                    }else{
                                        out.println("<select name='entidad' id='entidad' required>");
                                        lista = usuario.findEntidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                        out.println("</select>");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pass">Contraseña</label>
                                <input type="text" name="pass" id="pass" required/>
                            </td>
                            <td>
                                <label for="confPass">Confirma Contraseña</label>
                                <input type="text" name="confPass" id="confPass" required/>
                            </td>
                            <td>
                                <span id="mesajePass"></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <br/>
                <input type="submit" name="guardar" id="guardar" value="Guardar" hidden/>
            </form>
            <% if(tot == 0){ %>
            <div id="mensajeAdmin">
                <p>
                    Bienvenido a la captura del Usuario Administrador del sistema SIJPA. Siendo que es la primera vez que se utiiza el sistema, se necesita capturar
                    un administrador de manera obligatoria,el cual tendra los permisos para dar de alta a mas usuarios, en caso de que se requieran, ademas de que,
                    podra ver los usuarios ya registrados, editar, borrar, recuperar contraseñas, etc. Siendo que esta viendo este mensaje, significa que este 
                    ordenador sera el que funcione como servidor para los demas ordenadores que usen el sistema SIJPA, asi que favor de usarlo con mucho cuidado y
                    seguir el manual de usuario para siempre salvaguardar la informacion que se captura.
                </p>
                <button id="buttonAdmin">OK, Entendido</button>
            </div>
            <% } %>
        </section>
    </body>
</html>
