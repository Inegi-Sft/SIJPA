<%-- 
    Document   : exportarBD
    Created on : 7/09/2020, 05:15:00 PM
    Author     : JONATHAN.AGUIRRE
--%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.FileSystems"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.nio.file.Paths"%>
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
            <a class="btnCerrar" title="Cerrar" href="importarBD.jsp" >X</a>
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
                    if(url_dividido[url_dividido.length - 1].equalsIgnoreCase("importarBD.jsp")){
                        String ruta = ".\\";
                        System.out.println("Va a leer archivo");
                        File archivo = new File (ruta+"archivo_descifrado.sijpa");
                        FileReader fr = new FileReader (archivo);
                        BufferedReader br = new BufferedReader(fr);
                        String linea;
                         while((linea=br.readLine())!=null){
                            out.println(linea.replace("),", "),<br/>"));
                            out.println("<br/>");
                            out.println("<br/>");
                         }
                         Paths.get(ruta+"archivo_descifrado.sijpa").toFile().delete();
                    }else{
                        out.println("No tienes acceso a este apartado.");
                    }
                }catch (Exception ex){
                    ex.printStackTrace();
                    out.println("Consulta al administrador para ver este apartado.");
                }
            %>
        </section>
    </body>
</html>
