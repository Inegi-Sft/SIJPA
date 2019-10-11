/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global selecChk */

$(document).ready(function () {
    //despliega ventana modal
    $('.pop').fancybox({
        'type': 'iframe',
        'overlayShow': true,
        'iframe': {
            'css': {
                'width': '1400px',
                'height': '560px'
            }
        }
    });

    //Auto acompletado
    $('#delitoCP').selectize();
    $('#municipioD').selectize();
    $('#municipioJ').selectize();
    $('#nMunicipio').selectize();
    $('#rMunicipio').selectize();
    $('#Mnacimiento').selectize();
    $('#Mreside').selectize();

    /******************** Funciones para Etapa Intermedia***************************/


    $('#audiInterme').change(function () {
        if ($('#audiInterme').val() !== '1') {
            $('#lblfechaAudiinter').fadeOut("slow");
            $('#fechaAudiinter').fadeOut("slow");
            $('#nifechaAudiinter').fadeOut("slow");
        } else {
            $('#lblfechaAudiinter').fadeIn("slow");
            $('#fechaAudiinter').fadeIn("slow").val("");
            $('#nifechaAudiinter').fadeIn("slow");
        }
    });

    $('#correEscrito').change(function () {
        if ($('#correEscrito').val() !== '1') {
            $('#lblfechaCtrlDeten').fadeOut("slow");
            $('#fechaCorreccion').fadeOut("slow");
            $('#nifechaCtrlDeten').fadeOut("slow");
        } else {
            $('#lblfechaCtrlDeten').fadeIn("slow");
            $('#fechaCorreccion').fadeIn("slow").val("");
            $('#nifechaCtrlDeten').fadeIn("slow");
        }
    });

    $('#asesorCoady').change(function () {
        if ($('#asesorCoady').val() !== '1') {
            $('#lblfechaCoady').fadeOut("slow");
            $('#fechaCoady').fadeOut("slow");
            $('#nifechaCoady').fadeOut("slow");
        } else {
            $('#lblfechaCoady').fadeIn("slow");
            $('#fechaCoady').fadeIn("slow").val("");
            $('#nifechaCoady').fadeIn("slow");
        }
    });

    $('#mediosPrueba').change(function () {
        if ($('#mediosPrueba').val() !== '1') {
            $('#lbltipoPrueba').fadeOut("slow");
            $('#tipoPrueba').fadeOut("slow");
        } else {
            $('#lbltipoPrueba').fadeIn("slow");
            $('#tipoPrueba').fadeIn("slow").val('');
        }
    });


    $('#guardaInter').click(function () {
        var aInter = $('#audiInterme').val();
        var fInter = $('#fechaAudiinter').val()
        if (aInter === '1' && fInter === "") {
            if ($('#chkAudiinter').prop('ckecked')) {
            } else {
                alert("Selecciona la fecha de audiencia intermedia");
            }}
    });

    /*************Fin de Funciones para Etapa Intermedia***************************/
});

<<<<<<< Upstream, based on origin/master
//Habilita text de Audiencias en Expedientes
function comprobar(obj, idTxt){
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}
=======




// Fechas No identificadas
function fechaNoIdent(idChk, idTxtDate) {
    if ($(idChk).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("disabled", false);
    }
}

>>>>>>> 903f32f 10/10/2019 Se agregaron funciones a Intermedia Julio
