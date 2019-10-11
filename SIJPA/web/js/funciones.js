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

    $('#delitoCP').selectize();
    //$('#municipioD').selectize();
    //$('#municipioJ').selectize();
    //$('#nMunicipio').selectize();
    //$('#rMunicipio').selectize();
    $('#Mnacimiento').selectize();
    $('#Mreside').selectize();

});

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

/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

function llenaMun(idEnt, idMun) {
    var enti = $(idEnt).val();
    if (enti !== '') {
        $.ajax({
            url: "obtenMunicipios.jsp",
            dataType: 'html',
            type: "post",
            data: {enti: enti},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
            }
        }).done(function (data) {
            $(idMun).html(data);
            //$('#municipioJ').selectize();
        });
    }else{
        $(idMun).empty().append("<option value='0'>--Seleccione--</option>");
    }

};
