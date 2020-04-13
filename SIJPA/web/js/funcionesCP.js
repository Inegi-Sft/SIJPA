/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    /*---------------------------- FUNCIONES CAUSA PENAL JC----------------------------*/
    //Se usa para la recuperacion de datos de DB
    if($('#CarpInves').val() !== ''){
        $('#CarpInves,#expClave,#Tdelitos,#Tadolescentes,#Tvictimas,#compe').prop('disabled',true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngreso').val() === '1899-09-09'){
        $('#fIngreso').prop('readonly', true);
        $('#chkFechaIngre').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#ExpAcomu').val() === '1'){
        $('#expReferen').show();
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#compe').val() === '1'){
        $('#totalElementos').show();
    }else if($('#compe').val() === '2'){
        $('#tipoIncopetencia').show(); 
    }
    
    $('#nomJuez').change(function(){
        if($(this).val() === '100'){
            window.location.href = 'capturaJuez.jsp';
        }
    });
    
    $('#ExpAcomu').change(function (){
        if ($('#ExpAcomu').val() === '1') {
            $('#expReferen').fadeIn("slow");
            $('#ExpRefe').val('').prop("required", true);
        } else {
            $('#expReferen').fadeOut("slow");
            $('#ExpRefe').val('-2').prop("required", false);
        }
    });
    
    $('#compe').change(function (){
        switch ($('#compe').val()) {
            case '1':
                $('#totalElementos, #totalAudiencias').fadeIn("slow");
                $('#Tdelitos, #Tadolescentes, #Tvictimas').val('').prop("required", true);
                $('#tipoIncopetencia').fadeOut("slow");
                $('#Tincompe').val('-2').prop('required', false);
                break;
            case '2':
                $('#tipoIncopetencia').fadeIn("slow");
                $('#Tincompe').val('').prop("required", true);
                $('#totalElementos, #totalAudiencias').fadeOut("slow");
                $('#Tdelitos, #Tadolescentes, #Tvictimas').val('-2').prop("required", false);
                break;
            default:
                $('#totalElementos, #totalAudiencias, #tipoIncopetencia').fadeOut("slow");
                $('#Tdelitos, #Tadolescentes, #Tvictimas, #Tincompe').val('-2').prop("required", false);
                break;
        }
    });
    
    $('#Tdelitos, #Tadolescentes, #Tvictimas').focus(function (e) {
        if ($('#expClave').val() === "") {
            e.stopImmediatePropagation();
            alert('Favor de capturar el expediente clave para poder agregar los datos siguientes');
            $('#expClave').focus();
        }
    });
    
    //Guarda Causa Penal
    $('#formCausaPenal').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtCausaPenal',
            data: $('#formCausaPenal').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Causa Penal: ", response);
                alert("Guardado con exito!!!");
                $('#formCausaPenal').find('input, textarea, button, select').attr('disabled', true);
                $("#guardarExp").prop("hidden", true);
                if (response === 1) {
                    parent.openPestana('btn2', 'p2');
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor Causa Penal: ", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
    /*---------------------------- FIN FUNCIONES CAUSA PENAL JC----------------------------*/
});
