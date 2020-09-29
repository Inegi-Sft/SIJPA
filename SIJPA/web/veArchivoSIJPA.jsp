<%-- 
    Document   : exportarBD
    Created on : 7/09/2020, 05:15:00 PM
    Author     : JONATHAN.AGUIRRE
--%>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Importa BD</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funciones.js"></script>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>ARCHIVO SIJPA</h1><br>
            <!--<h2>Caracteristicas Exportación</h2>-->
            <% 
                String url;
                try{
                    String[] url_dividido;
                    url = request.getHeader("Referer").toString();
                    url_dividido = url.split("/");
                    String ruta = "..\\..\\inegi_conf\\Archivos\\";
                    if(url_dividido[url_dividido.length - 1].equalsIgnoreCase("importarBD.jsp")){
                        List<String> archivo_sql = Files.readAllLines(Paths.get(ruta+"archivo_descifrado.sijpa"));
                        for (String linea : archivo_sql){
                            out.println(linea.replace("),", "),<br/>"));
                            out.println("<br/>");
                            out.println("<br/>");
                        }
                        Paths.get(ruta+"archivo_descifrado.sijpa").toFile().delete();
                    }else{
                        out.println("No tienes acceso a este apartado.");
                    }
                }catch (Exception ex){
                    out.println("Consulta al administrador para ver este apartado.");
                }
            %>
        </section>
    </body>
</html>
