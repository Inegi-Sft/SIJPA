/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

});

//Habilita text de Audiencias en Expedientes
function comprobar(obj, idTxt){
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}
