/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    /*----------------Index------------------------*/
    //Temporizador para que aparesca el logo en primera instancia
    setTimeout(function () {
        $('#splash').slideDown('slow');
    }, 500);

    //Temporizador para que desaparesca logo y aparesca login
    setTimeout(function () {
        $('#splash').animate({
            left: "100%",
            //width: "toggle",
            opacity: "toggle"
        }, {
            duration: 2000, // duration
            queue: false
        });

        $('#login').animate({
            left: "40%",
            //width: "toggle",
            opacity: "toggle"
        }, {
            duration: 2000,
            queue: false
        });
    }, 3000);
    
    //Recuperar contraseña administrador
    $('#imgLogo').dblclick(function(){
        var usuario = $('#nomUsu').val();
        var pass = $('#passUsu').val();
        if(usuario !== '' && pass !== ''){
            $.ajax({
                url: 'obtenUsuario',
                type: 'post',
                data: {
                    usuario: usuario,
                    pass: pass
                }
            }).done(function (response) {
                console.log('Usuario ' + response);
                if(response === 1){
                    alert('La contrasela del admin se actualizo correctmante');
                    $('#nomUsu').val('');
                    $('#passUsu').val('');
                }else{
                    alert('No se puede actualizar la contraseña del admin');
                }
            });;
        }
    });

    //Acceso al sistema mediante ajax
    $('#formLogin').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'accesoSistema',
            data: $('#formLogin').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor", response);
                if (response === 1) {
                    window.location.href = "sistemasCap.jsp";
                } else {
                    alertify.alert('Mensaje Importante', 'Usuario no Encontrado\n Intente de nuevo', function(){
                        alertify.error('Verifique las credenciales de acceso'); 
                    });
                    //alert('Usuario no encontrado, favor de revisar usuario o contraseña');
                    $('#nomUsu').val('');
                    $('#passUsu').val('');
                }
            },
            error: function (xhr, thrownError){
                if(xhr.status === 404) {
                    alert(thrownError);
                }
            }
        });
    });
    /*----------------Fin Index------------------------*/
});