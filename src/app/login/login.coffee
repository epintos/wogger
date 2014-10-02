angular.module('wogger.login', [
  'ui.router'
  'wogger.auth'
  'wogger.api'
]).config(config = ($stateProvider) ->
  $stateProvider.state "public.login",
    url: "/login"
    views:
      content:
        controller: "LoginCtrl"
        templateUrl: "login/login.tpl.html"
    data:
      wrapperClass: "login-wrapper"
      pageTitle: "Login"
      public: true
  return
).controller "LoginCtrl", LoginController = ($rootScope, $scope, $location,
authorization, userApi, $state, Parse) ->

  $scope.logout = ->
    authorization.logout()
    $state.go('public.login')

  $scope.login = ->
    delete $scope.error
    credentials =
      username: this.username,
      password: this.password

    successLogin = (data) ->
      authorization.setToken(data.sessionToken, $scope.rememberMe)
      $rootScope.user = data
      $location.path('/')

    error = ->
      # TODO: apply user notification here..
      $scope.error = "Login Error"

    $rootScope.user = userApi.login(credentials).then (data)->
      successLogin(data)
    , (err) ->
      error
