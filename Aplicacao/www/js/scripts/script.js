logout = function() {

    $('button#sair').on('click', function() {

        $('#form-login').show();
        $('#loading').hide();
        $('#result').hide();

        window.setTimeout("location.href='#/app/login'", 1000, function() {});
    });

}