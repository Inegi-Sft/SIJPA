/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload = function () {
    var menuLeft = document.getElementById('cbp-spmenu-s1'),
            menuRight = document.getElementById('cbp-spmenu-s2'),
            menuTop = document.getElementById('cbp-spmenu-s3'),
            menuBottom = document.getElementById('cbp-spmenu-s4'),
            showLeft = document.getElementById('showLeft'),
            showRight = document.getElementById('showRight'),
            showTop = document.getElementById('showTop'),
            showBottom = document.getElementById('showBottom'),
            showLeftPush = document.getElementById('showLeftPush'),
            showRightPush = document.getElementById('showRightPush'),
            body = document.body;

    document.getElementById('showLeft').onclick = function () {
        toggle(this, 'active');
        toggle(menuLeft, 'cbp-spmenu-open');
        disableOther('showLeft');
    };
    showRight.onclick = function () {
        toggle(this, 'active');
        toggle(menuRight, 'cbp-spmenu-open');
        disableOther('showRight');
    };
    showTop.onclick = function () {
        toggle(this, 'active');
        toggle(menuTop, 'cbp-spmenu-open');
        disableOther('showTop');
    };
    showBottom.onclick = function () {
        toggle(this, 'active');
        toggle(menuBottom, 'cbp-spmenu-open');
        disableOther('showBottom');
    };
    showLeftPush.onclick = function () {
        toggle(this, 'active');
        toggle(body, 'cbp-spmenu-push-toright');
        toggle(menuLeft, 'cbp-spmenu-open');
        disableOther('showLeftPush');
    };
    showRightPush.onclick = function () {
        toggle(this, 'active');
        toggle(body, 'cbp-spmenu-push-toleft');
        toggle(menuRight, 'cbp-spmenu-open');
        disableOther('showRightPush');
    };

    function disableOther(button) {
        if (button !== 'showLeft') {
            toggle(showLeft, 'disabled');
        }
        if (button !== 'showRight') {
            toggle(showRight, 'disabled');
        }
        if (button !== 'showTop') {
            toggle(showTop, 'disabled');
        }
        if (button !== 'showBottom') {
            toggle(showBottom, 'disabled');
        }
        if (button !== 'showLeftPush') {
            toggle(showLeftPush, 'disabled');
        }
        if (button !== 'showRightPush') {
            toggle(showRightPush, 'disabled');
        }
    }
};
