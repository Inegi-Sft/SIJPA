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
        <script type="text/javascript" src="js/fnUsuarios.js"></script>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista, sUsuario;

            usuario usuario = new usuario();
            int tot = usuario.findTotUsu();
            
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            int usuarioClave = 0;
            String nombreUsu = "";
            String aPaterno = "";
            String aMaterno = "";
            String edad = "";
            String correo = "";
            String entidad = "";
            if(request.getParameter("usuarioClave") != null){//Si viene el usaurio clave, recuperamos datos
                usuarioClave = Integer.parseInt(request.getParameter("usuarioClave"));
                sUsuario = usuario.findUsuarioDat(usuarioClave);
                if(sUsuario.size() > 0){
                    operacion = "actualizar";
                    nombreUsu = sUsuario.get(0)[0];
                    aPaterno = sUsuario.get(0)[1];
                    aMaterno = sUsuario.get(0)[2];
                    edad = sUsuario.get(0)[3];
                    correo = sUsuario.get(0)[4];
                    entidad = sUsuario.get(0)[5];
                }else{
                    out.println("<script>alert('El usuario_id " + usuarioClave + " no se encontro dentro de los Usuarios'); "
                            + "window.location.href = 'usuario.jsp'</script>");
                }
            }else{
                usuarioClave = usuario.findMaxUsu() + 1;
            }
        %>
    </head>
    <body>
        <% if(tot != 0){ %>
            <%@include file="cabecera.jsp"%>
            <%@include file="menu.jsp"%>
        <% } %>
        <section class="contenedor">
            <a class="btnCerrar" title="Cerrar" href="usuario.jsp" >X</a>
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
            <form action="insrtUsuario" method="post" name="formUsuario" id="formUsuario">
                <!--Contenido pestañas--> 
                <div id="p1" class="pestanaContent" style="display: block">
                    <!--<h2>Datos Generales</h2>-->
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="3">
                                <label for="usuarioId">Usuario ID</label>
                                <input type="text" name="usuarioId" id="usuarioId" value="<%=usuarioClave%>" readonly/>
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nom">Nombre(s)</label>
                                <input type="text" name="nom" id="nom" value="<%=nombreUsu%>" required>
                                <% //Si no tenemos usuarios insertados en BD entonces el primero es el admin, posterior seran captura
                                    if(tot == 0){
                                        out.println("<input type='hidden' name='tipoUsuario' id='tipoUsuario' value='1'/>");
                                    }else{
                                        out.println("<input type='hidden' name='tipoUsuario' id='tipoUsuario' value='2'/>");
                                    }
                                %>
                            </td>
                            <td>
                                <label for="paterno">Apellido Paterno</label>
                                <input type="text" name="paterno" id="paterno" value="<%=aPaterno%>" required>
                            </td>
                            <td>
                                <label for="materno">Apellido Materno</label>
                                <input type="text" name="materno" id="materno" value="<%=aMaterno%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="edad">Edad</label>
                                <input type="number" class="txtSmall" min="17" name="edad" id="edad" value="<%=edad%>" required>
                            </td>
                            <td>
                                <label for="correo">E-Mail</label>
                                <input type="text" name="correo" id="correo" placeholder="usuario@correo.com" value="<%=correo%>" required>
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
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(entidad)){
                                                out.println(" select ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                        out.println("</select>");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pass">Password</label>
                                <input type="text" name="pass" id="pass" required>
                            </td>
                            <td>
                                <label for="confPass">Confirma Password</label>
                                <input type="text" name="confPass" id="confPass" required>
                            </td>
                            <td>
                                <span id="mesajePass"></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <br/>
                <input type="submit" name="guardar" id="guardar" value="Guardar" hidden>
            </form>
            <% if(tot == 0){ %>
            <div id="mensajeAdmin">
                <p>
                    Bienvenido a la captura del Usuario Administrador del sistema SIJPA. Siendo que es la primera vez que se utiliza el sistema, se necesita capturar
                    un administrador de manera obligatoria, el cual tendrá los permisos para dar de alta a más usuarios, en caso de que se requieran, además de que,
                    podrá ver los usuarios ya registrados, editar, borrar, recuperar contraseñas, etc. Siendo que está viendo este mensaje, significa que este 
                    ordenador será el que funcione como servidor para los demás ordenadores que usen el sistema SIJPA, así que favor de usarlo con mucho cuidado y
                    seguir el manual de usuario para siempre salvaguardar la información que se captura.
                </p>
                <button id="buttonAdmin">OK, Entendido</button>
            </div>
            <% } %>
        </section>
    </body>
</html>
