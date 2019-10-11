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
=======
>>>>>>> 09017ef 11/10/2019 Se agregaron funciones a Intermedia Julio

});
    /********************FUNCIONES ETAPA INTERMEDIA***************************/

//Habilita text de Audiencias en Expedientes
function comprobar(obj, idTxt){
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}
=======




=======
//Respuestas simples y fechas con NI
function respuestaSimple(idSelect, idLbl, idDate, idNI) {
    if ($(idSelect).val() !== '1') {
        $(idLbl).fadeOut("slow");
        $(idDate).val("1899-09-09").fadeOut("slow");
        $(idNI).fadeOut("slow");
    } else {
        $(idLbl).fadeIn("slow");
        $(idDate).fadeIn("slow");
        $(idNI).fadeIn("slow");
    }
}
//Respuestas simples a esconder otra variable
function respuestaSelect(idSelect, idLabel, idResp) {
    if ($(idSelect).val() !== '1') {
        $(idLabel).fadeOut("slow");
        $(idResp).val('-2').fadeOut("slow");
    } else {
        $(idLabel).fadeIn("slow");
        $(idResp).val('').fadeIn("slow");
    }
}
>>>>>>> 09017ef 11/10/2019 Se agregaron funciones a Intermedia Julio
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

/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

