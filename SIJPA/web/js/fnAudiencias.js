$(document).ready(function () {
/*----------------Cabecera------------------------*/
    $('#usu img').click(function(){
        $('#usu #enlace').animate({
            right: "0",
            width: "toggle",
            opacity: "toggle"
        },800);
    });
    /*----------------Fin de Cabecera------------------------*/
 });

// habilita las audiencias de acuaerdo si el checkbox esta checkeado
function habilitaTxt(obj, idTxt1,idTxt2) {
    if (obj.checked) {
        $(idTxt1).prop({"required": true,"readonly": false});
        $(idTxt2).prop({"required": true,"readonly": false});
    } else {
        $(idTxt1).prop({"required": false,"readonly": true}).val("");
        $(idTxt2).prop({"required": false,"readonly": true}).val("");
    }
}
// llena el combo de jueces de acuerdo al juzgado
function llenaJueces(cbxJuzgado, cbxCausas, chkJueces) {
    var juzgado = $(cbxJuzgado).val();
    if (juzgado !== '') {
        $.ajax({
            url: "obtenDatosAudiencias.jsp",
            dataType: 'html',
            type: "post",
            data: {juzgadoClave: juzgado},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
            }
        }).done(function (data) {
            $(cbxCausas).html(data);
            $(chkJueces).html(data);
        });
    } else {
        $(cbxCausas).empty().append("<option value=''>--Seleccione--</option>");
        $(chkJueces).empty().append("No hay Jueces para mostrar");
    }
}


