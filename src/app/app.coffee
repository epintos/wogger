angular.module('wogger', [
  'templates-app'
  'templates-common'
  'wogger.projects'
  'wogger.timer'
  'wogger.login'
  'wogger.signup'
  'wogger.auth'
  'ui.router'
  'ui.bootstrap'
  'restangular'
  'ngStorage'
  'Parse'
]).config(myAppConfig = ($stateProvider, $urlRouterProvider,
                         $httpProvider, ParseProvider) ->
  $httpProvider.responseInterceptors.push('httpInterceptor')
  $urlRouterProvider.otherwise('/projects')
  ParseProvider.initialize(
    'dHi2yhcugrWZaWrsRs51GUi5CT6SMZeEALQj8rLM',
    'epxaxjelF2GK7xqHsKXmcukgYBuvWjOV8mwcR5IQ'
  )
  return

).run(run = ($rootScope, $state, authorization) ->
  authorization.loadToken()
  authorization.loadUser() if $rootScope.token
  $rootScope.$on '$stateChangeStart', (event, toState,
                                       toParams, fromState, fromParams) ->
    if authorization.isLoggedIn() is toState.data.public
      # event.preventDefault()
      if authorization.isLoggedIn()
        $state.go 'user.projects'
      else
        # Logout case
        $state.go 'public.login'
).controller 'AppCtrl', AppCtrl = ($scope, $location) ->
  $scope.$on '$stateChangeSuccess', (event, toState,
                                     toParams, fromState, fromParams) ->
    if angular.isDefined(toState.data.pageTitle)
      $scope.wrapperClass = toState.data.wrapperClass
      $scope.pageTitle = toState.data.pageTitle + ' | Wogger'
    return

  $scope.isActive = (route) ->
    route is $location.path()

  return
