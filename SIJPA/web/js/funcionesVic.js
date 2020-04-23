/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    /*---------------------------- FUNCIONES VICTIMAS JC----------------------------*/
    //Se usa para la recuperacion de BD
    if($('#tipoVictiHi').val() !== ''){
        var tipoVi = $('#tipoVictiHi').val();
        if(tipoVi === '1'){
            $('#victiFisicas, #mediProtec').show();
        }else if(tipoVi === '2'){
            $('#tipoMoral').show();
        }
        $("#tipoVictima option[value='" + tipoVi + "']").prop('selected', true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#con_asesor').val() === '1'){
        $('#asesorJuri').show();
    }
    
    //Se usa para la recuperacion de BD
    var numProcesa = $('#tblVictiProce tbody tr').length;
    for (i = 0; i < numProcesa; i++) {
        if ($('#chkRelaProce' + i + '99').is(":checked")) {
            for (var j = 1; j < 11; j++) {
                $('#chkRelaProce' + i + j).prop("checked", false).prop("disabled", true);
            }
        }else if ($('#chkRelaProce' + i + '10').is(":checked")) {
            for (var j = 1; j < 10; j++) {
                $('#chkRelaProce' + i + j).prop("checked", false).prop("disabled", true);
            }
            $('#chkRelaProce' + i + '99').prop("checked", false).prop("disabled", true);
        } else {
            for (var j = 1; j < 12; j++) {
                $('#chkRelaProce' + i + j).prop("disabled", false);
            }
            $('#chkRelaProce' + i + '99').prop("disabled", false);
        }
    }
    
    //Se usa para la recuperacion de BD
    if($('#sexoV').val() === '2'){
        $('#mediProtecMuj').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#fnacimientoV').val() === '1899-09-09'){
        $('#fnacimientoV').prop('readonly', true);
        $('#chkFechaNaciV').prop('checked', true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#Pnacimiento').val() === '1'){
        $('#estaNaci').show();
        $('#munNaci').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#Preside').val() === '1'){
        $('#estaResi').show();
        $('#munResi').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#indigena').val() === '1'){
        $('#famLingui').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#ingresos').val() === '1'){
        $('#rangoInge').show();
        $('#fuenteIngre').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#mProtect').val() === '1'){
        $('#MedidasPro').show();
    }
    
    $('#tipoVictima').change(function () {
        switch ($(this).val()) {
            case '1':
                $('#victiFisicas, #mediProtec').fadeIn('slow');
                $('#sexoV, #fnacimientoV, #edadVi, #vulnera, #Pnacimiento, #naciona, #Preside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #interprete, #hablaesp, #indigena, #extrangera, #ocupa, #ingresos, #mProtect, #mujProtect').val('').prop('required', true);
                $('#tipoMoral,#MedidasPro,#MujPro').fadeOut('slow');
                $('#tvic_moral').val('-2').prop('required', false);
                break;
            case '2':
                $('#tipoMoral').fadeIn('slow');
                $('#tvic_moral').val('').prop('required', true);

                $('#victiFisicas, #mediProtec,  #mediProtecMuj').fadeOut('slow');
                $('#sexoV, #edadVi, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios,#indigena, #familia, #interprete, #hablaesp, #extrangera, #ocupa, #ingresos, #mProtect, #mujProtect').val('-2').prop('required', false);
                $('#fnacimientoV').val("1899-09-09").prop('required', false);
                break;
            default:
                $('#tipoMoral, #victiFisicas, #mediProtec, #mediProtecMuj').fadeOut('slow');
                $('#tvic_moral, #sexoV, #edadVi, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #indigena, #familia, #interprete, #hablaesp, #ocupa, #ingresos, #extrangera, #mProtect, #mujProtect').val('-2').prop('required', false);
                $('#fnacimientoV').val("1899-09-09").prop('required', false);
                break;
        }
    });

    $('#sexoV').change(function () {
        if ($(this).val() === '2') {
            $('#mujProtect').val('').prop('required', true);
            $('#mediProtecMuj').fadeIn('slow');
            $('#MujPro').fadeOut('slow');
            $('#aplicaMedidaMuj').prop("checked", false);
        } else {
            $('#mujProtect').val('-2').prop('required', false);
            $('#mediProtecMuj').fadeOut('slow');
            $('#aplicaMedidaMuj').prop("checked", false);
        }
    });

    $('#con_asesor').change(function () {
        if ($(this).val() === '1') {
            $('#asesorJuri').fadeIn('slow');
            $('#asesor').val('').prop('required', true);
        } else {
            $('#asesorJuri').fadeOut('slow');
            $('#asesor').val('-2').prop('required', false);
        }
    });

    $('#formVictimas').submit(function (e) {
        if ($('#deliCometido:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Delitos cometidos a la Victima');
            $('#deliCometido').focus();
        }

        if ($('.RelaProceChk:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Relacion de la Victima con el Procesado');
            $('#chkRelaProce').focus();
        }

        if ($('#mProtect').val() === '1') {
            if ($('input[name="aplicaMedida"]:checked').length === 0) {
                e.preventDefault();
                alert('Selecciona al menos una opcion de Medidas de Protección');
                $('#mProtect').focus();
            }
        }

        if ($('#mujProtect').val() === '1') {
            if ($('input[name="aplicaMedidaMuj"]:checked').length === 0) {
                e.preventDefault();
                alert('Selecciona al menos una opcion de Medidas de Protección contra Mujeres');
                $('#mujProtect').focus();
            }
        }
    });

    $('#ingresos').change(function (e) {
        if ($(this).val() === '1') {
            $('#rangoInge, #fuenteIngre').fadeIn('slow');
            $('#rangoIngresos').val('').prop('required', true);
            $('#chkIngresos').prop("checked", false);
        } else {
            $('#rangoInge, #fuenteIngre').fadeOut('slow');
            $('#rangoIngresos').val('-2').prop('required', false);
            $('#chkIngresos').prop("checked", false);
        }
    });

    $('#mProtect').change(function (e) {
        if ($(this).val() === '1') {
            $('#MedidasPro').fadeIn('slow');
            $('input[name="aplicaMedida"]').prop("checked", false).prop("disabled", false);
        } else {
            $('#MedidasPro').fadeOut('slow');
            $('input[name="aplicaMedida"]').prop("checked", false).prop("disabled", false);
        }
    });

    $('#mujProtect').change(function (e) {
        if ($(this).val() === '1') {
            $('#MujPro').fadeIn('slow');
            $('input[name="aplicaMedidaMuj"]').prop("checked", false).prop("disabled", false);
        } else {
            $('#MujPro').fadeOut('slow');
            $('input[name="aplicaMedidaMuj"]').prop("checked", false).prop("disabled", false);
        }
    });

    $('.RelaProceChk').change(function () {
        var numProcesa = $('#tblVictiProce tbody tr').length;
        for (i = 0; i < numProcesa; i++) {
            if ($('#chkRelaProce' + i + '99').is(":checked")) {
                for (var j = 1; j < 11; j++) {
                    $('#chkRelaProce' + i + j).prop("checked", false).prop("disabled", true);
                }
            }else if ($('#chkRelaProce' + i + '10').is(":checked")) {
                for (var j = 1; j < 10; j++) {
                    $('#chkRelaProce' + i + j).prop("checked", false).prop("disabled", true);
                }
                $('#chkRelaProce' + i + '99').prop("checked", false).prop("disabled", true);

            } else {
                for (var j = 1; j < 12; j++) {
                    $('#chkRelaProce' + i + j).prop("disabled", false);
                }
                $('#chkRelaProce' + i + '99').prop("checked", false).prop("disabled", false);
            }
        }
    });

    $('#chkIngresos9').change(function () {
        if ($(this).is(":checked")) {
            for (var i = 1; i < 9; i++) {
                $('#chkIngresos' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i < 9; i++) {
                $('#chkIngresos' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    $('#aplicaMedida99').change(function () {
        if ($(this).is(":checked")) {
            for (var i = 1; i < 12; i++) {
                $('#aplicaMedida' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i < 12; i++) {
                $('#aplicaMedida' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    $('#aplicaMedidaMuj99').change(function () {
        if ($(this).is(":checked")) {
            for (var i = 1; i < 18; i++) {
                $('#aplicaMedidaMuj' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i < 18; i++) {
                $('#aplicaMedidaMuj' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    //Guarda Victimas
    $('#formVictimas').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtVictimas',
            data: $('#formVictimas').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Victimas: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tvictimas').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaVictimas tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaVictimas tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaVictimas tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    console.log('Captu: ' + response[5] + ' Existen: ' + numProce);
                    if (response[5] === numProce) {
                        parent.openPestana('btn5', 'p5');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' victimas');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Victimas: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
    /*---------------------------- FIN VICTIMAS DELITOS JC----------------------------*/
});
