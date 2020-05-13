/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    
    $('#proceSobreseimto').change(function(){
        if ($('#proceSobreseimto').val() === '6') {
            $('#dExcluAccion').fadeIn("slow");
            $('#excluAccion').val('').prop("required", true);
        } else {
            $('#dExcluAccion').fadeOut("slow");
            $('#excluAccion').val('-2').prop("required", false);
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
    
});

//muestra elementos de acuerdo al tipo de resolucion que seleccione
function tipoResolucion() {
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
}

function sentencia(){
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
}
