// usuario acessa uma pagina 
// lib olha os cookies e gera um UUID caso esteja em branco, caso tenha dados goto 6
// ajax verifica no backend se o UUID é unico
// Se não for gera um novo UUID e verifica novamente até receber um positivo
// grava o UUID no cookie
// ajax envia o UUID e os dados de acesso ao back end


// script to create a UUID (from w3resource)
function createUUID() {
    var dt = new Date().getTime();
    var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (dt + Math.random() * 16) % 16 | 0;
        dt = Math.floor(dt / 16);
        return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
    return uuid;
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function getCookieUUID() {
    return getCookie('uuid');
}

function setCookieUUID() {
    var uuid;
    var date = new Date();
    date.setTime(date.getTime() + (1000 * 24 * 60 * 60 * 1000));
    var expirationDate = date.toUTCString();

    do {
        uuid = createUUID();
    } while (verifyUUID(uuid) == false);

    document.cookie = "uuid=" + uuid + ";" + "expires=" + expirationDate + ";path=/";
}

function verifyUUID(uuid) {
    // ajax to verify if uuid is valid
    $.ajax({
        type: 'GET',
        url: 'http://localhost:3000/verify_uuid',
        crossDomain: true,
        dataType: "json",
        data: {
            uuid: uuid
        },
        success: function () {
            return true;
        },
        error: function () {
            return false;
        }
    });
}

function sendAccessData(uuid, pathName, dateTime) {
    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/accesses',
        crossDomain: true,
        dataType: "json",
        data: {
            uuid: uuid,
            date_time: dateTime,
            path: pathName
        },
        success: function () {
            return true;
        },
        error: function (jqxhr) {
            console.log('Registro não realizado, favor verificar' + jqxhr.responseText);
        }
    });
}

function sendFormData(form) {
    var formData = $(form).serialize();

    $.ajax({
        type: 'POST',
        url: $(form).attr('action'),
        crossDomain: true,
        dataType: "json",
        data: formData,
        success: function () {
            $('#response_text').text('Usuário criado com sucesso!');
            $('#user_name').val('');
            $('#user_email').val('');
        },
        error: function (jqxhr) {
            debugger;
            $('#response_text').text(jqxhr.responseText);
            $('#user_email').val('');
        }
    });
}

$(document).ready(function () {
    var pathName = window.location.pathname;

    if (getCookieUUID() == '') {
        setCookieUUID();
    }

    var uuid = getCookieUUID();
    var date = new Date().getTime();
    sendAccessData(uuid, pathName, date);
});


$(function () {
    var form = $('#new_user');
    var uuidInput = $('#user_uuid')

    var responseText = $('#response_text')
    $(form).submit(function (event) {
        event.preventDefault();
        uuidInput.attr('value', getCookieUUID());
        sendFormData(form);
    });
});
