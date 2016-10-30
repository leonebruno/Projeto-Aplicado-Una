var app = angular.module('app.services', [])

app.service('firebaseIntegracao', function() {

    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyBQukA3LrLjU4CR-fgum2fFlC3LBkyL76c",
        authDomain: "qrschool-55428.firebaseapp.com",
        databaseURL: "https://qrschool-55428.firebaseio.com",
        storageBucket: "qrschool-55428.appspot.com",
        messagingSenderId: "1095308632159"
    };
    firebase.initializeApp(config);

});