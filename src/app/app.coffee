angular.module('wogger', [
  'templates-app'
  'templates-common'
  'wogger.projects'
  'wogger.config'
  'wogger.timer'
  'wogger.login'
  'wogger.auth'
  'ui.router'
  'ui.bootstrap'
  'restangular'
  'ngStorage'
]).config(myAppConfig = ($stateProvider, $urlRouterProvider,
                         $httpProvider, RestangularProvider, configuration) ->
  $httpProvider.responseInterceptors.push('httpInterceptor')
  $urlRouterProvider.otherwise('/timer')
  RestangularProvider.setBaseUrl(configuration.apiUrl)
  return

).run(run = ($rootScope, $state, authorization) ->
  authorization.loadToken()
  authorization.loadUser()  if $rootScope.token
  $rootScope.$on '$stateChangeStart', (event, toState,
                                       toParams, fromState, fromParams) ->
    if authorization.isLoggedIn() is toState.data.public
      # event.preventDefault()
      if authorization.isLoggedIn()
        $state.go 'user.timer'
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
