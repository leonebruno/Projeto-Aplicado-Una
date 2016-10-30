var app = angular.module('app.controllers', ['ionic', 'ngCordova', 'ngMaterial', 'ngMessages', ]) //, 'ja.qr', 'ngMessages', ''material.svgAssetsCache', '$scope', '$stateParams', , 

/*==========================================
=            Controller for App            =
==========================================*/
app.controller('AppCtrl', function($scope, $timeout, $stateParams) {})

/*===========================================
=            Controller for Home            =
===========================================*/
app.controller('HomeCtrl', function($scope, $stateParams) {
    $scope.title = 'QR School';
})

app.controller('LoadAlunosCtrl', function($scope, $stateParams, $http, $cordovaDialogs) {

    $scope.title = "Lista de Alunos";

    $(function() {

        $scope.loadAlunos = function() {

            $('#loading').show();

            $scope.alunos = [];

            var ajaxRequest = $http.get("http://qrschool.hol.es/_includes/aluno-list.php");

            ajaxRequest.success(function(data, status, headers, config) {
                $scope.alunos = data;
                navigator.notification.alert("Lista atualizada!", // message
                    $('#loading').hide(), // callback
                    '', // title
                    'Entendi' // buttonName
                );
            });

            ajaxRequest.error(function(data, status, headers, config) {
                navigator.notification.alert("Erro na atualização!", // message
                    $('#loading').hide(), // callback
                    'Erro', // title
                    'Entendi' //buttonName
                );
            });
        }
        $scope.loadAlunos();
    });
})

/*=============================================================
=            Controller for Device Especifications            =
=============================================================*/
app.controller('deviceCtrl', function($scope, $stateParams, $cordovaDevice) {

        $scope.title = 'Informações do Dispositivo';

        /*$scope.device = $cordovaDevice.getDevice();

        $scope.cordova = $cordovaDevice.getCordova();

        $scope.model = $cordovaDevice.getModel();

        $scope.platform = $cordovaDevice.getPlatform();

        $scope.uuid = $cordovaDevice.getUUID();

        $scope.version = $cordovaDevice.getVersion();

        $scope.fabricante = 'Bruno Leone';*/

        $scope.device = device.cordova;
        $scope.model = device.model;
        $scope.platform = device.platform;
        $scope.uuid = device.uuid;
        $scope.version = device.version;
        $scope.manufacturer = device.manufacturer;
        $scope.isVirtual = device.isVirtual;
        $scope.serial = device.serial;
    })
    /*=============================================
    =            Controller for signup            =
    =============================================*/
app.controller('Signup', function($scope, $stateParams) {})

/*=============================================
=            Controller for search            =
=============================================*/
app.controller('SearchCtrl', function($scope, $stateParams) {})
    /*====================================================================
    =            Controller for Scan of the qr code vs alunos            =
    ====================================================================*/
app.controller('ScanCtrl', function($scope, $cordovaBarcodeScanner, $cordovaDialogs, $cordovaVibration) {
    $scope.title = 'Confirmar Presença';
    $scope.scanBarcode = function() {
        /*$cordovaBarcodeScanner.scan().then(function(imageData) {
            navigator.notification.alert(imageData.text);
            console.log("Barcode Format -> " + imageData.format);
            console.log("Cancelled -> " + imageData.cancelled);
            $cordovaVibration.vibrate(200);
            navigator.notification.alert(console.log("An error happened -> " + imageData.format));
        }, function(error) {
            navigator.notification.alert(console.log("An error happened -> " + error));
        });*/
        cordova.plugins.barcodeScanner.scan(
            function(result) {
                navigator.notification.alert("We got a barcode\n" +
                    "Result: " + result.text + "\n" +
                    "Format: " + result.format + "\n" +
                    "Cancelled: " + result.cancelled, navigator.notificator.alert(), '', 'Ok');
                $cordovaVibration.vibrate(200);
            },
            function(error) {
                navigator.notification.alert("Scanning failed: " + error, navigator.notificator.alert(), 'Error', 'Ok');
            }, {
                "preferFrontCamera": false, // iOS and Android
                "showFlipCameraButton": true, // iOS and Android
                "prompt": "Place a barcode inside the scan area", // supported on Android only
                "formats": "QR_CODE,PDF_417", // default: all but PDF_417 and RSS_EXPANDED
                "orientation": "landscape" // Android only (portrait|landscape), default unset so it rotates with the device
            }
        );
    };

    /*document.addEventListener("deviceready", function() {
    $scope.scanBarcode = function() {
    $cordovaBarcodeScanner.scan().then(function(imageData) {
    //alert(imageData.text);
    console.log("Barcode Format -> " + imageData.format);
    console.log("Cancelled -> " + imageData.cancelled);
    $cordovaVibration.vibrate(200);
    }, function(error) {
    navigator.notification.alert(console.log("An error happened -> " + error));
    });
};*/
    // NOTE: encoding not functioning yet
    /*$cordovaBarcodeScanner
    .encode(BarcodeScanner.Encode.TEXT_TYPE, "http://www.nytimes.com")
    .then(function(success) {
    // Success!
    }, function(error) {
    // An error occurred
    });
}, false);*/
})

/*===============================================
=            Controller for scanning            =
===============================================*/
app.controller('dashStudentCtrl', function($scope, $stateParams) {
        cordova.plugins.barcodeScanner.scan(
            function(result) {
                navigator.notification.alert("We got a barcode\n" +
                    "Result: " + result.text + "\n" +
                    "Format: " + result.format + "\n" +
                    "Cancelled: " + result.cancelled);
            },
            function(error) {
                navigator.notification.alert("Scanning failed: " + error);
            }, {
                "preferFrontCamera": true, // iOS and Android
                "showFlipCameraButton": true, // iOS and Android
                "prompt": "Place a barcode inside the scan area", // supported on Android only
                "formats": "QR_CODE,PDF_417", // default: all but PDF_417 and RSS_EXPANDED
                "orientation": "landscape" // Android only (portrait|landscape), default unset so it rotates with the device
            }
        );
    })
    /*=====  End of Controller for scanning  ======*/


/*============================================
=            Controller for Login            =
============================================*/
app.controller('LoginCtrl', function($scope, $stateParams, $cordovaDialogs) { //, $timeout, $ionicMaterialMotion, $ionicLoading, $cordovaDialoge

        /*$(function() {

            $.ajax({
                    url: 'http://http://qrschool.hol.es/_includes/aluno-login.php',
                    type: 'POST',
                    //dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
                    data: {
                        ra: '31611542',
                        password: '31611542'
                    },
                })
                .done(function(data) {

                });

        });*/

        $scope.logar = function($scope) {
            var ra = $('#ipt-ra');
            var pw = $('#password');

            var done = false;
            var acesso = 0;

            $(function() {
                $('#btn-logar').click(function() {
                    if (ra.val() == "" || ra.val() == "RA" || pw.val() == "" || pw.val() == "Senha") {
                        navigator.notification.alert("Os campos devem ser preenchidos!",
                            navigator.notificator.alert(),
                            '',
                            ''
                        );
                    } else {
                        $state.go("/app/cadastro");
                    }
                });
            });

            /*if (b[0]) {}

            if (a[0].value == '1234' && a[1].value == '1234') {
                //$scope.go("/app/home");
                //alert('Entrou', '', 'Sucesso', 'Ok');
                acesso = 1;
                $scope.go("/app/home");
                done = 1;

            } else if (a[0].value == '' || a[1].value == '') {
                function alertDismissed() {
                    // do something
                }
                navigator.notification.alert(
                    'Os campos devem ser preenchidos!', // message
                    navigator.notification.alert, // callback
                    'Erro', // title
                    'Tentar novamente' // buttonName
                );
            }*/
        };
        //$state.go("/app/cadastro");
        //$scope.window.location.href = 'app/cadastro.html';
    })
    /*========================================
    =            DASH FOR STUDENT            =
    ========================================*/
app.controller('dashStudentCtrl', function($scope, $stateParams) {})
    /*=====  End of DASH FOR STUDENT  ======*/

app.controller('generateQRCtrl', function($scope, $stateParams) {
        var qr = new QRCode(typeNumber, correction, inputMode);
        qr.addData(text);
        qr.make();
    })
    /*==========================================
    =            Controller for map            =
    ==========================================*/
app.controller('MapCtrl', function($scope, $ionicLoading, $cordovaGeolocation) {
        $scope.title = 'Localização';

        $scope.mapCreated = function(map) {
            $scope.map = map;
            //$scope.centerOnMe();
        };

        $scope.centerOnMe = function() {
            console.log("Centralizando o mapa");
            if (!$scope.map) {
                return;
            }

            navigator.geolocation.getCurrentPosition(function(pos) {
                console.log('Got pos', pos);
                $scope.map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
            }, function(error) {
                navigator.notificator.alert('Unable to get location: ' + error.message);
            });
        };
    })
    /*=====  End of Controller for map  ======*/



/*----------  Controller for connectionCtrl  ----------*/
app.controller('connectionCtrl', function($scope, $log, $stateParams, $cordovaNetwork, $rootScope) {

        /*var type = $cordovaNetwork.getNetwork()

        var isOnline = $cordovaNetwork.isOnline()

        var isOffline = $cordovaNetwork.isOffline()


        // listen for Online event
        $rootScope.$on('$cordovaNetwork:online', function(event, networkState) {
            var onlineState = networkState;
        })

        // listen for Offline event
        $rootScope.$on('$cordovaNetwork:offline', function(event, networkState) {
            var offlineState = networkState;
        })*/

        $scope.checkConnection = function($scope) {
            var netWorkState = navigator.connection.type;

            var states = {};

            states[Connection.UNKNOWN] = 'Online';
            states[Connection.ETHERNET] = 'Ethernet';
            states[Connection.WIFI] = 'WiFi';
            states[Connection.CELL_2G] = '2G';
            states[Connection.CELL_3G] = '3G';
            states[Connection.CELL_4G] = '4G';
            states[Connection.CELL] = 'Genérica';
            states[Connection.NONE] = 'Offline';

            navigator.notificator.alert('Conexão: ' + states[netWorkState], onOnline(), '', 'OK');
        }

        //caso offline
        document.addEventListener("offline", onOffline, false);

        function onOffline() {
            // Handle the offline event 
            console.log("lost connection");
        }

        //caso online
        document.addEventListener("online", onOnline, false);

        function onOnline() {
            // Handle the online event 
            var networkState = navigator.connection.type;

            if (networkState !== Connection.NONE) {
                if (dataFileEntry) {
                    tryToUploadFile();
                }
            }
            display('Connection type: ' + networkState);
        }
    })
    /*---------- End for Controller for  ----------*/