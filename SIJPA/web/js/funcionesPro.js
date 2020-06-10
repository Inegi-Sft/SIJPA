/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    /*---------------------------- FUNCIONES PROCESADOS JC----------------------------*/
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fNacimiento').val() === '1899-09-09'){
        $('#fNacimiento').prop("readonly", true);
        $('#chkFechaNac').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#nPais').val() === '1'){
        $('#dNEntidad').show();
        $('#dNMunicipio').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#residencia').val() === '1'){
        $('#dREntidad').show();
        $('#dRMunicipio').show();
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
    
    $('#presentAdo').change(function () {
        switch ($(this).val()) {
            case '1':
                $('#dTipoDetencion').fadeIn('slow');
                $('#tipoDetencion').val('').prop('required', true);
                $('#formCondu').hide();
                $('#formaConduc').val('-2').prop('required', false);
                break;
            case '2':
                $('#formCondu').fadeIn('slow');
                $('#formaConduc').val('').prop('required', true);
                $('#dTipoDetencion').hide();
                $('#tipoDetencion').val('-2').prop('required', false);
                break;
            default:
                $('#dTipoDetencion, #formCondu').fadeOut('slow');
                $('#tipoDetencion, #formaConduc').val('-2').prop('required', false);
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
    
    //Guarda Procesados
    $('#formProcesados').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if ($('#ingresosPro').val() === '1') {
            if ($('input[name="chkIngresosPro"]:checked').length === 0) {
                alert('Selecciona al menos una fuente de ingreso del procesado');
                $('input[name="chkIngresosPro"]').focus();
                return false;
            }
        }
        if ($('input[name="arrayDelito"]:checked').length === 0) {
            alert('Selecciona al menos un delito atribuido al adolescente');
            $('input[name="arrayDelito"]').focus();
            return false;
        }
        $.ajax({
            type: 'post',
            url: 'insrtProcesados',
            data: $('#formProcesados').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Procesados: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
//                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaProcesa tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaProcesa tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaProcesa tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    //coloca el nombre del procesado en la tabla de etapa inicial
                    parent.$('#tablaInicial tbody').find('tr').eq(response[0]).children('td').eq(1).html(response[1]);
                    if (response[5] === numProce) {
                        parent.openPestana('btn4', 'p4');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' procesados');
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
    /*---------------------------- FIN FUNCIONES PROCESADOS JC----------------------------*/
});
