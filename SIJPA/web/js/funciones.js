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
    //$('#municipioD').selectize();
    //$('#municipioJ').selectize();
    //$('#nMunicipio').selectize();
    //$('#rMunicipio').selectize();
    //$('#Mnacimiento').selectize();
    //$('#Mreside').selectize();

});
/********************FUNCIONES ETAPA INTERMEDIA***************************/

//Habilita text de Audiencias en Expedientes
/***
 * 
 * @param {type} obj
 * @param {type} idTxt
 * @returns {undefined}
 */
function comprobar(obj, idTxt) {
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}

//Respuestas simples y fechas con NI
function respuestaSimple(idSelect, idLbl, idDate, idNI) {
    if ($(idSelect).val() !== '1') {
        $(idLbl).fadeOut("slow");
        $(idDate).val("1899-09-09").fadeOut("slow");
        $(idNI).fadeOut("slow");
    } else {
        $(idLbl).fadeIn("slow");
        $(idDate).val("").fadeIn("slow");
        $(idNI).fadeIn("slow");
    }
}
//Respuestas simples a esconder otra variable
function respuestaSelect(idSelect, idLabel, idResp) {
    if ($(idSelect).val() !== '1') {
        $(idLabel).fadeOut("slow");
        $(idResp).val('-2');
        $(idResp).fadeOut("slow");
    } else {
        $(idLabel).fadeIn("slow");
        $(idResp).val('').fadeIn("slow");
    }
}
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

/**************************FUNCION ETAPA INICIAL *****************************************/
/***
 * 
 * @param {type} idChk
 * @param {type} idTable
 * @returns {undefined}
 */
function despliegaTabla(idChk, idTable) {
    if ($(idChk).val() !== '1') {
        $(idTable).fadeOut("slow");
    } else {
        $(idTable).fadeIn("slow");
    }
}

function medidasCaute(idChk) {
    if (($(idChk).val === 1) || $(idChk).val() === '') {
        return true;
    } else {
        var i = 0;
        if ($("#apliMedidaCau99").is(":checked")) {
            i = 1;
        }
        for (var x = 1; x < 14; x++) {
            if ($("#apliMedidaCau" + x).is(":checked")) {
                i = i + 1;
            }
        }
        if (i === 0) {
            alert("Selecciona por lo menos una Medida Cautelar");
            return false;
        } else {
            return true;
        }
    }
}
/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

/*****************************FUNCIONES LLENAR MUNICIPIOS***************************/
/***
 * 
 * @param {type} idEnt
 * @param {type} idMun
 * @returns {undefined}
 */
function llenaMun(idEnt,idMun) {
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
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************************/
