angular.module( 'ngBoilerplate', [
  'templates-app',
  'templates-common',
  'ngBoilerplate.home',
  'ngBoilerplate.about',
  'ui.router',
  'restangular',
  'wogger.config'
])

.config( function myAppConfig ( $stateProvider, $urlRouterProvider, RestangularProvider, configuration ) {
  $urlRouterProvider.otherwise( '/home' );
  RestangularProvider.setBaseUrl(configuration.apiUrl);
})

.run( function run () {
})

.controller( 'AppCtrl', function AppCtrl ( $scope, $location ) {
  $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){
    if ( angular.isDefined( toState.data.pageTitle ) ) {
      $scope.pageTitle = toState.data.pageTitle + ' | Logger' ;
    }
  });
})

;

