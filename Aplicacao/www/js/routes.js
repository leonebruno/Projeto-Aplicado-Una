var app = angular.module('app.routes', []);

app.config(function($stateProvider, $urlRouterProvider) {
    $stateProvider
    /*.when('/', {
        templateUrl: 'templates/main.html',
        controller: 'MainCtrl'
    })*/
    .state('app', {
        url: '/app',
        abstract: true,
        templateUrl: 'templates/menu.html',
        controller: 'AppCtrl'
    })
    .state('app.scan', {
        url: '/scan',
        views: {
            'menuContent': {
                templateUrl: 'templates/scan.html',
                controller: 'ScanCtrl'
            }
        }
    })
    .state('app.search', {
        url: '/search',
        views: {
            'menuContent': {
                templateUrl: 'templates/search.html'
            }
        }
    })
    .state('app.login', {
        url: '/login',
        views: {
            'menuContent': {
                templateUrl: 'templates/login.html',
                controller: 'LoginCtrl'
            }
        }
    })
    .state('app.load-alunos', {
        url: '/load-alunos',
        views: {
            'menuContent': {
                templateUrl: 'templates/load-alunos.html',
                controller: 'LoadAlunosCtrl'
            }
        }
    })
    .state('app.loadmaterias', {
        url: '/loadmaterias',
        views: {
            'menuContent': {
                templateUrl: 'templates/loadmaterias.html',
                controller: 'LoadMateriasCtrl'
            }
        }
    })
    .state('app.profile', {
        url: '/profile',
        views: {
            'menuContent': {
                templateUrl: 'templates/profile.html',
                controller: 'profileCtrl'
            }
        }
    })
    .state('app.dashaluno', {
        url: '/dashaluno',
        views: {
            'menuContent': {
                templateUrl: 'templates/dashaluno.html',
                controller: 'DashAlunoCtrl'
            }
        }
    })
    .state('app.dashprof', {
        url: '/dashprof',
        views: {
            'menuContent': {
                templateUrl: 'templates/dashprof.html',
                controller: 'DashProfCtrl'
            }
        }
    })
    .state('app.openaula', {
        url: '/openaula',
        views: {
            'menuContent': {
                templateUrl: 'templates/openaula.html',
                controller: 'OpenAulaCtrl'
            }
        }
    })
    .state('app.tarefas', {
        url: '/tarefas',
        views: {
            'menuContent': {
                templateUrl: 'templates/tarefas.html',
                controller: 'TarefasCtrl'
            }
        }
    })
    .state('app.main', {
        url: '/main',
        views: {
            'menuContent': {
                templateUrl: 'templates/main.html',
                controller: 'MainCtrl'
            }
        }
    })
    .state('app.iniciarchamada', {
        url: '/iniciarchamada',
        views: {
            'menuContent': {
                templateUrl: 'templates/iniciar-chamada.html',
                controller: 'IniciarChamadaCtrl'
            }
        }
    })
    .state('app.presencamanual', {
        url: '/presencamanual',
        views: {
            'menuContent': {
                templateUrl: 'templates/presencamanual.html',
                controller: 'PresencaManualCtrl'
            }
        }
    })
    ;
    // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/app/login');
    //$urlRouterProvider.otherwise('/main');
    });

/*app.config(function($stateProvider, $urlRouterProvider){
    $routeProvider
    .when('/', {
        templateUrl: 'templates/main.html',
        controller: 'MainCtrl'
    })

    .otherwise({redirectTo: '/'});
});*/