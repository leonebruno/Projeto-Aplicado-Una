var app = angular.module('app.directives', [])

app.directive('map', function() {
    /*return {
        restrict: 'E',
        scope: {
            onCreate: '&'
        },
        link: function($scope, $element, $attr) {
            function initialize() {

                //estou fazendo depois
                /*navigator.geolocation.getCurrentPosition(function(pos) {
                        console.log('Got pos', pos);
                        $scope.map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
                        $scope.loading.hide();
                    }*/

    /**var mapOptions = {
                    center: new google.maps.LatLng(43.07493, -89.381388), //google.maps.LatLng(pos.coords.latitude, pos.coords.longitude)
                    zoom: 16,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map($element[0], mapOptions);

                $scope.onCreate({
                    map: map
                });

                // Stop the side bar from dragging when mousedown/tapdown on the map
                google.maps.event.addDomListener($element[0], 'mousedown', function(e) {
                    e.preventDefault();
                    return false;
                });
            }

            if (document.readyState === "complete") {
                initialize();
            } else {
                google.maps.event.addDomListener(window, 'load', initialize);
            }
        }
    }**/
    // Note: This example requires that you consent to location sharing when
    // prompted by your browser. If you see the error "The Geolocation service
    // failed.", it means you probably did not give permission for the browser to
    // locate you.

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: {
                lat: -19.975748,
                lng: -44.0224787
            },
            zoom: 6
        });
        var infoWindow = new google.maps.InfoWindow({
            map: map
        });

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                infoWindow.setPosition(pos);
                infoWindow.setContent('Location found.');
                map.setCenter(pos);
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    }

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
    }
});

app.directive('auth', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attr, mCtrl) {
            function loginValidation(value) {
                if (value.indexOf("admin") > -1) {
                    mCtrl.$setValidity('charE', true);
                } else {
                    mCtrl.$setValidity('charE', false);
                }
                return value;
            }
            mCtrl.$parsers.push(loginValidation);
        }
    };
});