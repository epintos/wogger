angular.module( 'wogger', [
  'templates-app',
  'templates-common',
  'wogger.projects',
  'wogger.config',
  'wogger.timer',
  'ui.router',
  'ui.bootstrap',
  'restangular'
])

.config( function myAppConfig ( $stateProvider, $urlRouterProvider, RestangularProvider, configuration ) {
  $urlRouterProvider.otherwise( '/timer' );
  RestangularProvider.setBaseUrl(configuration.apiUrl);
})

.run( function run () {
})

.controller( 'AppCtrl', function AppCtrl ( $scope, $location ) {
  $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){
    if ( angular.isDefined( toState.data.pageTitle ) ) {
      $scope.pageTitle = toState.data.pageTitle + ' | Wogger' ;
    }
  });
})

;

