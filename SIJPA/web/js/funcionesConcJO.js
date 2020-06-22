/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaReso').val() === '1899-09-09'){
        $('#fechaReso').prop("readonly", true);
        $('#chkFechaReso').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    switch ($('#resolucion').val()){
        case '1':
            $('#flsSobreseimto,#flsImpugnacion,#flsReparaDanio').fadeIn("slow");
            $('#fechaExtinAR').val('1799-09-09');
            break;
        case '2':
            $('#flsSentencia,#flsImpugnacion,#flsReparaDanio').fadeIn("slow");
            $('#flsSobreseimto select').val('-2');
            $('#fechaExtinAR').val('1799-09-09');
            break;
        case '3':
            $('#flsImpugnacion').fadeIn("slow");
            $('#flsSobreseimto select, #flsSentencia select, #flsReparaDanio select').val('-2');
            $('#fechaExtinAR').val('1799-09-09');
            break;
    }
    
       //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaSenten').val() === '1899-09-09'){
        $('#fechaSenten').prop("readonly", true);
        $('#chkFechaSenten').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if ($('#proceSobreseimto').val() === '6') {
        $('#dExcluAccion').show();
    }
    
    //Se usa para la recuperacion de BD
    switch ($('#tipoSentencia').val()) {
        case '1':
            $('#dTipoMedidaPL').fadeIn("slow");
            $('#tblDConclusiones tr > *:nth-child(2)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones tr > *:nth-child(2) input').prop("checked", true);
            break;
        case '2':
            $('#dTipoMedidaNPL').fadeIn("slow");
            $('#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones tr > *:nth-child(3) input').prop("checked", true);
            break;
        case '3':
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones input').prop({"checked": false, "required": true});
            break;
        case '9':
            $('#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones tr > *:nth-child(4) input').prop("checked", true);
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').hide();
            break;
        default:
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),\n\
                #tblDConclusiones tr > *:nth-child(4)').hide();
            break;
    }
    
    //Se usa para la recuperacion de BD
    if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
        $('#Dinternamiento').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#reparaDanio').val() === '1') {
        $('#dTipoRepara').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#tipoReparaD').val() === '2') {
        $('#dMontoRepara').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#impugnacion').val() === '1') {
        $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaImpugnacion').val() === '1899-09-09'){
        $('#fechaImpugnacion').prop("readonly", true);
        $('#chkFechaImpugnacion').prop("checked", true);
    }
    
    $('#resolucion').change(function(){
        $('#tblDConclusiones input').prop("required", false);
        $('#tblDConclusiones input.radValCambia').val("-2").prop("checked", true);
        if ($('#resolucion').val() === '1') {
            $('#flsSobreseimto,#flsImpugnacion,#flsReparaDanio').fadeIn("slow");
            $('#flsSobreseimto select,#flsImpugnacion select,#flsReparaDanio select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaImpugnacion').prop("checked", false);

            $('#flsSentencia,#dExcluAccion,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna,#dTipoRepara,#dMontoRepara').hide();
            $('#flsSentencia select').val('-2').prop("required", false);

        } else if ($('#resolucion').val() === '2') {
            $('#flsSentencia,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
            $('#flsSentencia select,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaImpugnacion').prop("checked", false);
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();

            $('#flsSobreseimto,#dTipoMedidaPL,#dTipoMedidaNPL,#dInternamiento,#dTipoRepara,#dMontoRepara,\n\
            #dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto select').val('-2').prop("required", false);

        } else if ($('#resolucion').val() === '3') {
            $('#flsImpugnacion').fadeIn("slow");
            $('#flsImpugnacion select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaImpugnacion').prop("checked", false);

            $('#flsSobreseimto,#flsSentencia,#flsReparaDanio,#dTipoMedidaPL,#dTipoMedidaNPL,#dInternamiento,#dTipoRepara,#dMontoRepara,\n\
            #dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto select,#flsSentencia select, #flsReparaDanio select').val('-2').prop("required", false);

        } else {
            $('#flsSobreseimto,#flsSentencia,#flsReparaDanio,#flsImpugnacion').fadeOut("slow");
            $('#flsSobreseimto select,#flsSentencia select,#flsReparaDanio select,#flsImpugnacion select').val('-2').prop("required", false);
            $('#fechaImpugnacion').val('1799-09-09').prop("required", false);
        }
    });
    
    $('#proceSobreseimto').change(function(){
        if ($('#proceSobreseimto').val() === '6') {
            $('#dExcluAccion').fadeIn("slow");
            $('#excluAccion').val('').prop("required", true);
        } else {
            $('#dExcluAccion').fadeOut("slow");
            $('#excluAccion').val('-2').prop("required", false);
        }
    });
    
    $('#tipoSentencia').change(function(){
        $('#tblDConclusiones input.radValCambia').val("9");
        switch ($('#tipoSentencia').val()) {
            case '1':
                $('#dTipoMedidaPL').fadeIn("slow");
                $('#dTipoMedidaNPL').hide();
                $('#tipoMedidaPL').val('').prop("required", true);
                $('#tipoMedidaNPL').val('-2').prop("required", false);
                $('#tblDConclusiones tr > *:nth-child(2)').fadeIn('slow');
                $('#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
                $('#tblDConclusiones tr > *:nth-child(2) input').prop("checked", true);
                break;
            case '2':
                $('#dTipoMedidaPL').hide();
                $('#dTipoMedidaNPL').fadeIn("slow");
                $('#tipoMedidaNPL').val('').prop("required", true);
                $('#tipoMedidaPL').val('-2').prop("required", false);
                $('#dInternamiento').hide();
                $('#internamiento').val('-2').prop("required", false);
                $('#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
                $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(4)').hide();
                $('#tblDConclusiones tr > *:nth-child(3) input').prop("checked", true);
                break;
            case '3':
                $('#dTipoMedidaPL,#dTipoMedidaNPL,#dInternamiento').fadeOut("slow");
                $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
                $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
                $('#tblDConclusiones tr > *:nth-child(4)').hide();
                $('#tblDConclusiones input').prop({"checked": false, "required": true});
                break;
            default:
                $('#dTipoMedidaPL,#dTipoMedidaNPL,#dInternamiento').fadeOut("slow");
                $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
                $('#tblDConclusiones tr > *:nth-child(4)').fadeIn("slow");
                $('#tblDConclusiones tr > *:nth-child(4) input').prop("checked", true);
                $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').hide();

                break;
        }
    });
    
    $('#tipoMedidaPL').change(function(){
        if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
            $('#dInternamiento').fadeIn("slow");
            $('#internamiento').val('').prop("required", true);
        } else {
            $('#dInternamiento').fadeOut("slow");
            $('#internamiento').val('-2').prop("required", false);
        }
    });
    
    $('#reparaDanio').change(function(){
        if ($('#reparaDanio').val() === '1') {
            $('#dTipoRepara').fadeIn("slow");
            $('#tipoReparaD').val('').prop("required", true);
        } else {
            $('#dMontoRepara,#dTipoRepara').fadeOut("slow");
            $('#montoReparaD,#tipoReparaD').val('-2').prop("required", false);
        }
    });
    
    $('#tipoReparaD').change(function(){
        if ($('#tipoReparaD').val() === '2') {
            $('#dMontoRepara').fadeIn("slow");
            $('#montoReparaD').val('').prop("required", true);
        } else {
            $('#dMontoRepara').fadeOut("slow");
            $('#montoReparaD').val('-2').prop("required", false);
        }
    });
    
    $('#impugnacion').change(function(){
        if ($('#impugnacion').val() === '1') {
            $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').fadeIn("slow");
            $('#tipoImpugnacion,#personaImpugna').val('').prop("required", true);
            $('#fechaImpugnacion').val("").prop("readonly", false).prop("required", true);
            $('#chkFechaImpugnacion').prop("checked", false);
        } else {
            $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').fadeOut("slow");
            $('#tipoImpugnacion,#personaImpugna').val('-2').prop("required", false);
            $('#fechaImpugnacion').val("1899-09-09").prop("required", false);
        }
    });
    
    //Guarda Conclusiones
    $('#formConclusionesJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtConclusionesJO',
            data: $('#formConclusionesJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Conclusiones JO: ", response);
                alert("Guardado Correctamente");
                if (response !== null && $.isArray(response)) {
                    for (var i = 2; i <= 4; i++) {//pone filas correspondientes en la tabla de conclusiones
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaConcluJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaConcluJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaConcluJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Conclusiones: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
});
