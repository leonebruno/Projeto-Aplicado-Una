var app = angular.module('app', ['ionic', 'app.controllers', 'app.routes', 'app.directives', 'app.services', 'ngCordova', 'ngMaterial', ])//

app.run(function($ionicPlatform) {
    $ionicPlatform.ready(function() {
        if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
            cordova.plugins.Keyboard.disableScroll(true);
            //console.log(device.cordova);
            //console.log("navigator.geolocation works well");
        }
        if (window.StatusBar) {
            StatusBar.backgroundColorByHexString('#b71c1c');
        }
    });
})