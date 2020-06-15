<%-- 
    Document   : bienvenida
    Created on : 9/01/2020, 02:58:00 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    usuario usuario = new usuario();
    int visita = usuario.findVisitaUsu((String) session.getAttribute("usuActivo"));
    if(visita == 1){
        response.sendRedirect("sistemasCap.jsp");
    }
    
    if(request.getParameter("errorbd") != null){
        out.println("<script>alert('Error con la Base de Datos, favor de checarlo')</script>");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Bienvenida</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>BIENVENIDOS A SIJPA</h1><br>
            <h2>CONFIDENCIALIDAD</h2>
            <p class="parrafo">
                Conforme a lo dispuesto por el Artículo 37, párrafo primero de la Ley del Sistema Nacional de Información Estadística y Geográfica: 
                "Los datos que proporcionen para fines estadísticos los Informantes del Sistema a las Unidades en términos de la presente Ley, 
                serán estrictamente confidenciales y bajo ninguna circunstancia podrán utilizarse para otro fin que no sea el estadístico.
                "Así como lo dispuesto por el Artículo 38: "Los datos e informes que los Informantes del Sistema proporcionen para fines estadísticos
                y que provengan de registros administrativos, serán manejados observando los principios de confidencialidad y reserva, por lo que no 
                podrán divulgarse en ningún caso en forma nominativa o individualizada...
                Cuando se deba divulgar la información a que se refiere el párrafo anterior, ésta deberá estar agregada de tal manera que no se pueda
                identificar del Sistema y, en general, a las personas de la información."
            </p>
            <h2>OBLIGATORIEDAD</h2>
            <p class="parrafo">
                Conforme a lo dispuesto por el Artículos 45, párrafo primero de la Ley del Sistema Nacional de Información Estadística y Geográfica: 
                "Los Informantes del Sistema estarán obligados aproporcionar, con veracidad y oportunidad, los datos e informes que les soliciten las 
                autoridades competentes para fines estadísticos, censales y geográficos, y prestarán apoyo a las mismas.",así como lo dispuesto en el
                Artículo 46 de la misma: "Los servidores públicos de la Federación,de las entidades federativas y de los municipios, tendrán la obligación
                de proporcionar la información básica que hubieren obtenido en el ejercicio de sus funciones y sirva para generar Nacional, que les 
                solicite el Instituto..."
            </p>
            <form action="insrtUsuario" method="post">
                <input type="submit" name="aceptarAcuerdo" id="aceptarAcuerdo" value="Acepto">
            </form>
        </section>
    </body>
</html>
