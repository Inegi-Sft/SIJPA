/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
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
    var numProcesa = $('#tblVictiProceJO tbody tr').length;
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
    
    $('#tipoVictima').change(function () {
        switch ($(this).val()) {
            case '1':
                $('#victiFisicas').fadeIn('slow');
                $('#sexoV, #fnacimientoV, #edad, #vulnera, #Pnacimiento, #naciona, #Preside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #interprete, #hablaesp, #indigena, #extrangera, #ocupa, #ingresos').val('').prop('required', true);
                $('#tipoMoral').fadeOut('slow');
                $('#tvic_moral').val('-2').prop('required', false);
                break;
            case '2':
                $('#tipoMoral').fadeIn('slow');
                $('#tvic_moral').val('').prop('required', true);

                $('#victiFisicas, #estaNaci, #munNaci, #estaResi, #munResi, #famLingui, #rangoInge, #fuenteIngre').fadeOut('slow');
                $('#sexoV, #edad, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios,#indigena, #familia, #interprete, #hablaesp, #extrangera, #ocupa, #ingresos, #rangoIngresos').val('-2').prop('required', false);
                $('#fnacimientoV').val("1899-09-09").prop({'required': false, 'readonly':false});
                $('#chkFechaNaciV, #fuenteIngre input').prop('checked', false);
                break;
            default:
                $('#tipoMoral, #victiFisicas, #estaNaci, #munNaci, #estaResi, #munResi, #famLingui, #rangoInge, #fuenteIngre').fadeOut('slow');
                $('#tvic_moral, #sexoV, #edad, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #indigena, #familia, #interprete, #hablaesp, #ocupa, #ingresos, #rangoIngresos, #extrangera').val('-2').prop('required', false);
                $('#fnacimientoV').val("1899-09-09").prop({'required': false, 'readonly':false});
                $('#chkFechaNaciV, #fuenteIngre input').prop('checked', false);
                break;
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

    $('#ingresos').change(function () {
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

    $('.RelaProceChk').change(function () {
        var numProcesa = $('#tblVictiProceJO tbody tr').length;
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
    
    //Guarda Victimas JO
    $('#formVictimasJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if ($('#deliCometido:checked').length === 0) {
            alert('Selecciona al menos una opcion de Delitos cometidos a la Victima');
            $('#deliCometido').focus();
            return false;
        }
        
        if ($('.RelaProceChk:checked').length === 0) {
            alert('Selecciona al menos una opcion de Relacion de la Victima con el Procesado');
            $('#chkRelaProce').focus();
            return false;
        }
        
        if($('#ingresos').val() === '1'){
            if ($('input[name="chkIngresos"]:checked').length === 0) {
                alert('Selecciona al menos una opcion de Fuente de Ingresos');
                $('input[name="chkIngresos"]').focus();
                return false;
            }
        }
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
});