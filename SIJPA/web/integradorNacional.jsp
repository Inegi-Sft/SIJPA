<%-- 
    Document   : integradorNacional
    Created on : 24/11/2020, 10:23:39 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SIJPA::Integracion Nacional</title>
        <%@include file="librerias.jsp"%>
        <script type="text/javascript" src="js/fnIntegracion.js?v=<%=(int)(Math.random()*10+1)%>"></script>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Integracion a la BD Concentradora Nacional</h1>
            <label>El siguiente procedimiento tomará la BD SIJPA que se encuentra en tu equipo de cómputo, para integrarla a la BD Concentradora Nacional.</label>
            <br/>
            <input type="button" name="integrar" value="INTEGRAR A BD NACIONAL" onclick="integrarBDNacional();"/>
        </section>
        <script>
            function integrarBDNacional(){
                alertify.confirm('Atenci\u00F3n:', '¿Realmente deseas integrar esta BD?',
                    function(){
                        $.ajax({
                            type: 'post',
                            url: 'integradorNacional',
            //                data: {
            //                    clave: clave,
            //                },
                            success: function (response) {
                                if (response === 'tablaJuzgados') {
                                    //alert('El jUZGADO ' + clave + ' se cambio su estatus con exito');
                                }
                                alertify.success('BD Integrada correctamente!') ;
                            },
                            error: function (response) {
                                console.log("Respuesta del servidor Integracion Nacional: ", response);
                                alertify.error('Error al integrar, vuelva a intentarlo o cunsulte al administrador');
                            }
                        });
                    }, function(){ 
                        alertify.error('Operacion cancelada');
                    }
                ).set('labels', {ok:'Continuar', cancel:'Cancelar'});;
            }
        </script>
    </body>
</html>
