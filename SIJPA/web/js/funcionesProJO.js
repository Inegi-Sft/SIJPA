/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
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
    
    $('#formProcesadosJO').submit(function (e) {
        if ($('input[name="chkIngresos"]:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Fuente de Ingresos');
            $('input[name="chkIngresos"]').focus();
        }
    });

});
