/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    
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


 /*   $('.RelaProceChk').change(function () {
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

    
    */

    $('#formVictimasJO').submit(function (e) {
        if ($('input[name="chkIngresos"]:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Fuente de Ingresos');
            $('input[name="chkIngresos"]').focus();
        }
        
    
        /*if ($('#deliCometido:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Delitos cometidos a la Victima');
            $('#deliCometido').focus();
        }

        if ($('.RelaProceChk:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Relacion de la Victima con el Procesado');
            $('#chkRelaProce').focus();
        }*/

    });
});
