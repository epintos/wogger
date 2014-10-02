angular.module('wogger.auth',
               ['wogger.api']).config ($stateProvider) ->
  $stateProvider.state 'public',
    abstract: true
    template: "<ui-view/>"
    views:
      main:
        templateUrl: 'login/public.header.tpl.html'
    data:
      public: true
  $stateProvider.state 'user',
    abstract: true
    template: "<ui-view/>"
    views:
      main:
        templateUrl: 'common/user.header.tpl.html'
    data:
      public: false

angular.module('wogger.auth').factory 'authorization',
($rootScope, $http, $localStorage,
$sessionStorage, userApi, Parse) ->

  logout: ->
    Parse.auth.logout()
    delete $rootScope.user
    delete $rootScope.token
    delete $localStorage.token
    delete $sessionStorage.token

  isLoggedIn: ->
    !!$rootScope.token

  loadUser: ->
    $rootScope.user = userApi.getUser()

  loadToken: ->
    $rootScope.token = $localStorage.token || $sessionStorage.token

  setToken: (token, local) ->
    if local
      $localStorage.token = token
    else
      $sessionStorage.token = token
    this.loadToken()
