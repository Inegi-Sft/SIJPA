/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    if($('#opera').val() !== ''){
        $('#proceClave').css('background-color', 'rgba(80,255,120,.6)');
    }
    
    $('#pruebasD select option[value="9"]').hide();
    $('#pruebasD input').attr("min","1").val("0");
    
    
    //Se usa para la recuperacion de datos de DB
    if($('#medidasDis').val() === '1'){
        $('#dTipoMedida').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#incidentes').val() === '1'){
        $('#dResoIncidente, #dPromueveIncidente').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#suspencionA').val() === '1'){
        $('#dFechaSuspencion, #dFechaReanudacion').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#deliberacion').val() === '1'){
        $('#dFechaDeliberacion, #dSentidoFallo').show();
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#autoApertura').val() === '1899-09-09'){
        $('#autoApertura').prop('readonly', true);
        $('#chkAutoApertura').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#celebracionA').val() === '1899-09-09'){
        $('#celebracionA').prop('readonly', true);
        $('#chkCelebracionA').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#resoIncidente').val() === '1899-09-09'){
        $('#resoIncidente').prop('readonly', true);
        $('#chkResoIncidente').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaSuspencion').val() === '1899-09-09'){
        $('#fechaSuspencion').prop('readonly', true);
        $('#chkFechaSuspencion').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaReanudacion').val() === '1899-09-09'){
        $('#fechaReanudacion').prop('readonly', true);
        $('#chkFechaReanudacion').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaDeliberacion').val() === '1899-09-09'){
        $('#fechaDeliberacion').prop('readonly', true);
        $('#chkFechaDeliberacion').prop('checked', true);
    }
    
    
    $('#medidasDis').change(function(){
        if ($('#medidasDis').val() === '1') {
            $('#dTipoMedida').fadeIn("slow");
            $('#tipoMedida').val('').prop("required", true);
        } else {
            $('#dTipoMedida').fadeOut("slow");
            $('#tipoMedida').val('-2').prop("required", false);
        }
    });
    
    $('#incidentes').change(function(){
        if ($('#incidentes').val() === '1') {
            $('#dResoIncidente, #dPromueveIncidente').fadeIn("slow");
            $('#resoIncidente, #promueveIncidente').val('').prop({"required": true,"readonly":false});
            $('#chkResoIncidente').prop("checked", false);
        } else {
            $('#dResoIncidente, #dPromueveIncidente').fadeOut("slow");
            $('#resoIncidente').val('1799-09-09').prop("required", false);
            $('#promueveIncidente').val('-2').prop("required", false);
        }
    });
    
    $('#suspencionA').change(function(){
        if ($('#suspencionA').val() === '1') {
            $('#dFechaSuspencion, #dFechaReanudacion').fadeIn("slow");
            $('#fechaSuspencion, #fechaReanudacion').val('').prop({"required": true,"readonly":false});
            $('#chkFechaSuspencion, #chkFechaReanudacion').prop("checked", false);
        } else {
            $('#dFechaSuspencion, #dFechaReanudacion').fadeOut("slow");
            $('#fechaSuspencion, #fechaReanudacion').val('1799-09-09').prop("required", false);
        }
    });
    
    $('#deliberacion').change(function(){
        if ($('#deliberacion').val() === '1') {
            $('#dFechaDeliberacion, #dSentidoFallo').fadeIn("slow");
            $('#fechaDeliberacion, #sentidoFallo').val('').prop({"required": true,"readonly":false});
            $('#chkFechaDeliberacion').prop("checked", false);
        } else {
            $('#dFechaDeliberacion, #dSentidoFallo').fadeOut("slow");
            $('#fechaDeliberacion').val('1799-09-09').prop("required", false);
            $('#sentidoFallo').val('-2').prop("required", false);
        }
    });
    
    $('#sentidoFallo').change(function(){
        if ($('#sentidoFallo').val() === '1') {
            alert("Este procesado debe registrarse en Resoluciones bajo la sentencia Asolutoria");
        } else if ($('#sentidoFallo').val() === '2'){
            alert("Este procesado debe registrarse en Resoluciones bajo la sentencia Condenatoria");
        }
    });
    
    //Guarda Etapa Oral
    $('#fromJuicioO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        var actual = true;
        if($('#opera').val() !== ''){
            actual = confirm("Al actualizar datos en Etapa Oral, se perderan los datos que se tengan guardados en posteriores etapas.\nSeguro que desea continuar?");    
        }
        if(actual){
            $.ajax({
                type: 'post',
                url: 'insrtEtapaOral',
                data: $('#fromJuicioO').serialize(),
                success: function (response) { 
                    console.log("Respuesta del servidor Etapa Oral: ", response);
                    alert("Guardado correctamente!!!");
                    var numProce = parseInt(parent.$('#TadolescentesJO').val());
                    if (response !== null && $.isArray(response)) {
                        for (var i = 1; i < 6; i++) {
                            console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                            parent.$('#tablaJuicioJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaJuicioJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaJuicioJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                        //Control de banderas para saber a que etapa se manda el procesado
                        //Funcion para determinar si esta en otra tabla
                        buscaYremplazaJO(response[1], response[6]);//mandamos el nombre de procesado y la bandera nueva
                        console.log('Bandera Etapa Oral: ' + response[6]);
                        if(response[6] === 2){//Condicion para mandar al procesado a etapa conclusiones JO
                            parent.$('#tablaConcluJO tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="conclusionesJO.jsp?proceClaveJO=' + response[1] + '&posicion=' + parent.$('#tablaConcluJO tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn6').addClass(' activar');
                        }else if(response[6] === 3){//Condicion para mandar al procesado a etapa tramite JO
                            console.log('Entramos a insertar tramite');
                            parent.$('#tablaTramiteJO tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="tramiteJO.jsp?proceClaveJO=' + response[1] + '&posicion=' + parent.$('#tablaTramiteJO tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn7').addClass(' activar');
                        }
                        console.log('Captu: ' + response[7] + ' Existen: ' + numProce);
                        if (response[7] === numProce) {
                            for(var x = 6; x <= 7; x++){
                                //Validamos que pestañas activamos en JO
                                if(parent.$('#btn' + x).hasClass('activar')){
                                    parent.openPestana('btn' + x, 'p' + x);
                                    parent.$('#btn' + x).removeClass('activar');
                                }
                            }
                        } else {
                            alert('Falta por capturar ' + (numProce - response[7]) + ' adolescentes');
                        }
                    }
                    parent.$.fancybox.close();
                },
                error: function (response) {
                    console.log("Respuesta del servidor Etapa Oral: ", response);
                    alert('Error al guardar, cunsulte al administrador!');
                }
            });
        }
    });
    
});

function habilita(sel, txt){
    if($(sel).val()==='1'){
        $(txt).prop('readonly',false);
        $(txt).val("1");
    }
    else{
        $(txt).prop('readonly',true);
        $(txt).val("0");
    }
}
