var app = angular.module('app.controllers', ['ionic', 'ngCordova', 'ngMaterial', 'ngMessages', ]) //,'ngRoute' 'ja.qr', 'ngMessages', ''material.svgAssetsCache', '$scope', '$stateParams', , 

app.controller('MainCtrl', function($rootScope, $location) {
    $rootScope.activetab = $location.path();
})

app.controller('AppCtrl', function($scope, $timeout, $stateParams, $http, $cordovaNetwork, $cordovaToast, $rootScope, $location) {
    //getNetwork();

    getToast = function(mensagem, tempo) {
        // Materialize.toast(message, displayLength, className, completeCallback);
        var $toastContent = $('<span>' + mensagem + '</span>');
        Materialize.toast($toastContent, tempo);
    }

    logout = function() {
        $('button#sair').on('click', function() {

            $('#form-login').show();
            $('#loading').hide();
            $('#result').hide();

            window.setTimeout("location.href='#/app/login'", 1000, function() {});
        });
    }

    $(function() {
        $("#btn-collapse").sideNav();
    });

    scanPage = function() {
        window.setTimeout("location.href='#/app/login'", 1000, function() {});
    }
})

app.controller('LoadAlunosCtrl', function($scope, $stateParams, $http, $cordovaDialogs, $rootScope, $location) {

    $scope.pg = {
        title: 'Lista de Alunos'
    };

    $scope.loadAlunos = function() {

        $('#loading-fr').show();

        $scope.alunos = [];

        var ajaxRequest = $http.get("http://qrschool.hol.es/_includes/alunos/read.php");

        ajaxRequest.success(function(data, status, headers, config) {
            $scope.alunos = data;

            if (data.length > 0) {

                navigator.notification.alert("Lista atualizada!", function() {}, '', 'Entendi');
                $('#loading-fr').hide();

            } else if (data.length == 0) {
                $('#loading-fr').hide();
                $('#lista-alunos #lista').hide();
                $('#lista-alunos').html('<div class="col s12"><span>Lista vazia!</span></div>');
            }
        });

        ajaxRequest.error(function(data, status, headers, config) {

            navigator.notification.alert("Erro na atualização!", function() {}, '', 'Entendi');
            $('#loading-fr').hide()
        });
    }

    $(function() {
        $('#loading-fr').show();

        $scope.alunos = [];

        var ajaxRequest = $http.get("http://qrschool.hol.es/_includes/alunos/read.php");

        ajaxRequest.success(function(data, status, headers, config) {
            $scope.alunos = data;

            $('#loading-fr').hide();
        });

        ajaxRequest.error(function(data, status, headers, config) {

            $('#loading-fr').hide();
        });
    });
})

app.controller('LoginCtrl', ['$scope', '$http', function($scope, $stateParams, $http, $cordovaDialogs, $urlRouter, $rootScope, $rootScope, $location) {

    $scope.pg = {
        title: 'Tela de Login'
    };

    $('#loading').hide();
    $('#result').hide();

    $('button#btn-logar').on('click', function() {

        var cod_account = $('#ipt-cod_account').val();
        var pw = $('#ipt-pw').val();
        $scope.ok = false;

        if (cod_account !== '' && pw !== '') {
            $.post('http://qrschool.hol.es/_includes/tbl_accounts/get-account.php', {
                cod_account: cod_account,
                pw: pw
            }, function(data) {
                $('#loading').show();
                $('#form-login').hide();
                //console.log(data);
                //$('span#result').show().html(data);

                var dados = data;

                if (data == '1550') {
                    $('#loading').hide();
                    $('#form-login').show();
                    navigator.notification.alert('Usuário ou senha incorretos', '', 'Tentar novamente');
                } else if (data !== '') {
                    //$('span#result').show().text('Logado');
                    //console.info(dados[0].nome);

                    if (dados[0].nivel == '1') {
                        //var acesso = 'dashaluno';
                        console.log(dados);
                        window.setTimeout("location.href='#/app/dashaluno'", 4000, function() {
                            $('#form-login').show();
                            $('#loading').hide();
                            //$('#result').hide();
                        });
                    } else if (dados[0].nivel == '2') {
                        //var acesso = 'dashprof';
                        window.setTimeout("location.href='#/app/dashprof'", 4000, function() {
                            $('#form-login').show();
                            $('#loading').hide();
                            $('#result').hide();
                        });
                    }
                }
            });
        } else if (cod_account == '' || pw == '') {

            getToast('Preencha os campos corretamente!', 3000);

        }
    });

    pegadados = function(dados) {
        $scope.user = [];

        var ajaxRequest = $http.get("http://qrschool.hol.es/_includes/alunos/gatdados.php");

        ajaxRequest.success(function(data, status, headers, config) {
            console.log(data);
            $scope.user = data;

            if (user.nivel == 1) {
                //Usuarario é Aluno
                console.log(user.nivel);

            } else if (user.nivel == 2) {
                //Usuario é Professor
                console.log(user.nivel);

            }
        });

        ajaxRequest.error(function(data, status, headers, config) {
            console.log('Não pegou dados');
        });
    }

    /*$scope.send = function() {

        pegadados = function() {

            var dados = {
                'ra': $('#ipt-ra').val(),
                'pw': $('#ipt-pw').val()
            }
            console.log(dados);
        }
        $.post("http://127.0.0.1/qrschool/_includes/alunos/login.php", function(data) {
            $(".result").html(data);
        });
    }*/
}])

app.controller('DashAlunoCtrl', function($scope, $stateParams, $rootScope, $rootScope, $location, $window) {

    $scope.pag = {
        title: 'Acesso Aluno',
        link: ''
    };
    $scope.btn = {
        btn1: 'menu',
        btn2: 'search',
        btn3: 'more_vert'
    }

    $scope.scanAula = function() {

        cordova.plugins.barcodeScanner.scan(
            function(result) {
                var s = "result: " + result.text + "<br/>" +
                    "format: " + result.format + "<br/>" +
                    "cancelled: " + result.cancelled;
                $('#conteudo').html(s);

                window.setTimeout("location.href='#/app/loadmaterias'", 2000, function() {
                    //$('#loading').hide();
                    //$('#conteudo').show();
                });
                //$.post('http://')
            },
            function(error) {
                //navigator.notification.alert("Scanning failed: " + error);
                if (error) {
                    navigator.notification.alert(error, 'Erro', function() {}, 'Tente novamente');
                }
            }
        );

    }

    /*$('button#scan-aula').on('click', function() {

        if ($scope.scanAula()) {
            $scope.scanAula();
        } else {
            console.log('Device não informado!');

            $scope.scanAula();

            $('#loading').show();
            $('#conteudo').hide();

            window.setTimeout("location.href='#/app/loadmaterias'", 2000, function() {
                //$('#loading').hide();
                //$('#conteudo').show();
            });
        }
    });*/

    //logout();
})

app.controller('DashProfCtrl', function($scope, $stateParams, $rootScope, $location, $window) {

    $scope.pag = {
        title: 'Acesso Professor'
    };

    $scope.btn = {
        btn1: 'menu',
        btn2: 'search',
        btn3: 'more_vert'
    }

    logout();

})

app.controller('IniciarChamadaCtrl', function($scope, $stateParams, $rootScope, $location, $window) {

    $scope.pag = {
        title: 'Iniciar Chamada'
    };

    $scope.btn = {
        btn1: 'arrow_back',
        btn2: 'search',
        btn3: 'more_vert'
    }

    //Função que volta a view
    $scope.$window = $window;

    $scope.goBack = function() {
        $window.history.back();
    };

    $(document).ready(function() {
        $('select').material_select();
    });

    $('input.autocomplete').autocomplete({
        data: {
            "255": null,
            "256": null,
            "257": null,
            "259": null,
            "267": null,
            "344": null
        }
    });

})

app.controller('profileCtrl', function($scope, $http, $stateParams, $cordovaDevice, $rootScope, $location) {})

app.controller('Signup', function($scope, $stateParams, $rootScope, $location) {})

app.controller('SearchCtrl', function($scope, $stateParams, $rootScope, $location) {})

app.controller('ScanCtrl', function($scope, $cordovaBarcodeScanner, $cordovaDialogs, $cordovaVibration, $rootScope, $location) {

    $scope.pg = {
        title: 'Confirmar Presença'
    };

    $scope.btn = {
        btn1: 'arrow_back',
        btn2: 'search',
        btn3: 'more_vert'
    }

    //Função que volta a view
    $scope.$window = $window;

    $scope.goBack = function() {
        $window.history.back();
    };

})

app.controller('LoadMateriasCtrl', function($scope, $http, $rootScope, $location, $window) {

    $scope.pg = {
        title: 'Suas Materias'
    };

    $scope.btn = {
        btn1: 'arrow_back',
        btn2: 'search',
        btn3: 'more_vert'
    }

    //Função que volta a view
    $scope.$window = $window;

    $scope.goBack = function() {
        $window.history.back();
    };

    loadMateriasRelacionadas = function() {

        $('#loading-fr').show();

        $scope.materias = [];

        var ajaxRequest = $http.get("http://qrschool.hol.es/_includes/materias/lista-materias-relacionadas.php");

        ajaxRequest.success(function(data, status, headers, config) {

            $scope.materias = data;

            navigator.notification.alert("Lista atualizada!", // message
                $('#loading-fr').hide(), // callback
                '', // title
                'Entendi' // buttonName
            );

            if (data == '') {
                ("Lista atualizada!");
            }
        });

        ajaxRequest.error(function(data, status, headers, config) {

            navigator.notification.alert("Erro na atualização!",
                $('#loading-fr').hide(), 'Erro', 'Entendi'
            );
        });

        $scope.loadMaterias();
    }
})

app.controller('OpenAulaCtrl', function($scope, $rootScope, $location) {

    $scope.pag = {
        title: 'Abrir Aula'
    };

    $scope.scanBarcode = function() {

        cordova.plugins.barcodeScanner.scan(
            function(result) {
                var s = "result: " + result.text + "<br/>" +
                    "format: " + result.format + "<br/>" +
                    "cancelled: " + result.cancelled;
                //$('#resultado').html(s);

                //$.post('http://')
            },
            function(error) {
                //navigator.notification.alert("Scanning failed: " + error);
                if (error) {
                    alert(error, 'Erro', 'Tente novamente');
                }
            }
        );

    }

})

app.controller('AmigosCtrl', function($scope, $rootScope, $location) {})

app.controller('PresencaManualCtrl', function($scope, $rootScope, $location, $window) {

    $scope.pg = {
        title: 'Presença Manual'
    };

    $scope.btn = {
        btn1: 'arrow_back',
        btn2: 'search',
        btn3: 'more_vert'
    }

    //Função que volta a view
    $scope.$window = $window;

    $scope.goBack = function() {
        $window.history.back();
    };

    $('input.autocomplete').autocomplete({
        data: {
            "31611542": null,
            "31612543": null,
            "31611414": null,
            "31611546": null,
            "31612542": null,
            "31611415": null
        }
    });

})

app.controller('TarefasCtrl', function($scope, $ionicListDelegate, $rootScope, $location) {

    $scope.pag = {
        title: 'Tarefas'
    };

    $scope.data = {
        showDelete: false
    };

    $scope.edit = function(item) {
        alert('Edit Item: ' + item.id);
    };
    $scope.share = function(item) {
        alert('Share Item: ' + item.id);
    };

    $scope.moveItem = function(item, fromIndex, toIndex) {
        $scope.items.splice(fromIndex, 1);
        $scope.items.splice(toIndex, 0, item);
    };

    $scope.onItemDelete = function(item) {
        $scope.items.splice($scope.items.indexOf(item), 1);
    };

    $scope.items = [{
        id: 0
    }, {
        id: 1
    }, {
        id: 2
    }, {
        id: 3
    }, {
        id: 4
    }, {
        id: 5
    }, {
        id: 6
    }, {
        id: 7
    }, {
        id: 8
    }, {
        id: 9
    }, {
        id: 10
    }, {
        id: 11
    }, {
        id: 12
    }, {
        id: 13
    }, {
        id: 14
    }, {
        id: 15
    }, {
        id: 16
    }, {
        id: 17
    }, {
        id: 18
    }, {
        id: 19
    }, {
        id: 20
    }, {
        id: 21
    }, {
        id: 22
    }, {
        id: 23
    }, {
        id: 24
    }, {
        id: 25
    }, {
        id: 26
    }, {
        id: 27
    }, {
        id: 28
    }, {
        id: 29
    }, {
        id: 30
    }, {
        id: 31
    }, {
        id: 32
    }, {
        id: 33
    }, {
        id: 34
    }, {
        id: 35
    }, {
        id: 36
    }, {
        id: 37
    }, {
        id: 38
    }, {
        id: 39
    }, {
        id: 40
    }, {
        id: 41
    }, {
        id: 42
    }, {
        id: 43
    }, {
        id: 44
    }, {
        id: 45
    }, {
        id: 46
    }, {
        id: 47
    }, {
        id: 48
    }, {
        id: 49
    }, {
        id: 50
    }];
})