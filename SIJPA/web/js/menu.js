/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    // Normal Clicks
    $(function () {
        $('.toggle-nav').click(function () {
            if($(this).hasClass('open')){
                $('nav').css('margin','0');
                $(this).css('margin','0 0 0 300px');
            }else{
                $('nav').removeAttr('style');
                $(this).removeAttr('style');
            }
            return false;
        });
    });
    
    $('.contenedor').click(function(){
        if($('.toggle-nav').hasClass('open')){
            $('.toggle-nav').toggleClass('open');
            $('nav').removeAttr('style');
            $('.toggle-nav').removeAttr('style');
        }
    });

    $('.toggle-nav').click(function () {
        $('.toggle-nav').toggleClass('open');
    });
});