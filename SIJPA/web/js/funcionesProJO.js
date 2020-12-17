/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    //Cambiamos del color dependiendo de que informacion se muestre
    if($('#opera').val() === ''){
        $('#proceClaveJC').css('background-color', 'rgba(80,255,120,.6)');
    }else{
        $('#proceClaveJO').css('background-color', 'rgba(80,255,120,.6)');
    }
    
     //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fNacimiento').val() === '1899-09-09'){
        $('#fNacimiento').prop("readonly", true);
        $('#chkFechaNac').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo Curp no identificado
    if($('#curp').val() === '-9'){
        $('#curp').prop("readonly", true);
        $('#chkCurp').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#nPais').val() === '1'){
        $('#dNEntidad').show();
        $('#dNMunicipio').show();
        $('#nEntidad').prop("required", true);
        $('#nMunicipio').prop("required", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#residencia').val() === '1'){
        $('#dREntidad').show();
        $('#dRMunicipio').show();
        $('#dRColonia').show();
        $('#rEntidad').prop("required", true);
        $('#rMunicipio').prop("required", true);
        $('#rColonia').prop("required", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#poblaIndigena').val() === '1'){
        $('#dPuebloIndigena').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#hablaIndigena').val() === '1'){
        $('#dLenguaIndigena').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#ingresosPro').val() === '1'){
        $('#rangoIngePro').show();
        $('#tblFuenteIngrePro').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#ocupacion').val() === '10'){
        $('#dCondicionActi').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#presentAdo').val() === '1'){
        $('#dTipoDetencion').show();
    }else if($('#presentAdo').val() === '2'){
        $('#formCondu').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#grupoDelictivo').val() === '1'){
        $('#gruDeli').show();
        $('#delictivo').prop('required', true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#delictivo').val() === '-9'){
        $('#delictivo').prop("disabled", true);
        $('#chkdelictivo').prop("checked", true);
    }
    
    $('#curp').focusout(function(){
        if($(this).val() !== ''){
            if($(this).val().length !== 18){
                alert('El CURP esta mal capturado, favor de verificarlo');
            }
        }
    });
    
    $('#ingresosPro').change(function (e) {
        if ($(this).val() === '1') {
            $('#rangoIngePro, #tblFuenteIngrePro').fadeIn('slow');
            $('#rangoIngresosPro').val('').prop('required', true);
        } else {
            $('#rangoIngePro, #tblFuenteIngrePro').fadeOut('slow');
            $('#rangoIngresosPro').val('-2').prop('required', false);
            $('#tblFuenteIngrePro input').prop("checked", false);
        }
    });

    $('#chkIngresosPro9').change(function (e) {
        if ($(this).is(":checked")) {
            for (var i = 1; i <= 7; i++) {
                $('#chkIngresosPro' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i <= 7; i++) {
                $('#chkIngresosPro' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    $('#grupoDelictivo').change(function (e) {
        if ($(this).val() === '1') {
            $('#gruDeli').fadeIn('slow');
            $('#delictivo').val('').prop('required', true);
            $('#chkdelictivo').prop("checked", false);
        } else {
            $('#gruDeli').fadeOut('slow');
            $('#delictivo').val('-2').prop('required', true);
            $('#chkdelictivo').prop("checked", false);
        }
    });

    $('#chkdelictivo').change(function (e) {
        if ($(this).is(":checked")) {
            $('#delictivo').val("-9");
            $('#delictivo').prop("disabled", true);
        } else {
            $('#delictivo').val("");
            $('#delictivo').prop("disabled", false);
        }
    });
    
    //Guarda Procesados
    $('#formProcesadosJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if ($('#ingresosPro').val() === '1' && $('input[name="chkIngresosPro"]:checked').length === 0) {
            alert('Selecciona al menos una fuente de ingreso del procesado');
            $('input[name="chkIngresosPro"]').focus();
            return false;
        }else if ($('input[name="arrayDelito"]:checked').length === 0) {
            alert('Selecciona al menos un Delito Atribuido al Adolescente');
            $('input[name="arrayDelito"]').focus();
            return false;
        }
        $.ajax({
            type: 'post',
            url: 'insrtProcesadosJO',
            data: $('#formProcesadosJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Procesados: ", response);
                alert("Guardado correctamente!!!");
                var numProce = parseInt(parent.$('#TadolescentesJO').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 0; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaProcesaJO tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaProcesaJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaProcesaJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    //colocamos el registro completo den etapa oral para ser llenado
                    var posicion = parent.$('#tablaJuicioJO tbody tr').length;//Posicion exacta para no generar errores
                    parent.$('#tablaJuicioJO tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] 
                            + '</td><td></td><td></td><td></td>'
                            + '<td><a class="pop" href="etapaOral.jsp?proceClaveJO=' + response[1] + '&posicion=' + response[0] + '">'
                            + '<img src="img/editar.png" title="Modificar"/></a></td></tr>');
//                    parent.$('#tablaJuicioJO tbody').find('tr').eq(response[0]).children('td').eq(1).html(response[2]);
                    if (response[5] === numProce) {
                        parent.openPestana('btn4', 'p4');
                    } else {
                        //alert('Falta por capturar ' + (numProce - response[6]) + ' procesados');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Procesados: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

});

// curp No identificado
function curpNoIdent(idChk, idTxt) {
    if ($(idChk).is(":checked")) {
        $(idTxt).val("-9");
        $(idTxt).prop("readonly", true);
    } else {
        $(idTxt).val("");
        $(idTxt).prop("readonly", false);
    }
}