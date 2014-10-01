angular.module('wogger.signup', [
  'ui.router',
  'wogger.auth',
  'wogger.api',
]).config(config = ($stateProvider) ->
  $stateProvider.state "public.signup",
    url: "/signup"
    views:
      content:
        controller: "SignupCtrl"
        templateUrl: "login/signup/signup.tpl.html"

    data:
      wrapperClass: "signup-wrapper"
      pageTitle: "Sign Up"
      public: true
  return
).controller "SignupCtrl", LoginController = ($rootScope, $scope, $location,
authorization, userApi, $state) ->


  $scope.signup = ->
    data =
      username: this.username
      password: this.password

    $scope.error = false
    $scope.message = false

    successSignUp = ->
      $scope.error = false
      $scope.message = "Success"
      $scope.submitted = true
      authorization.setToken(data.sessionToken, $scope.rememberMe)
      $rootScope.user = data
      $location.path('/')

    error = ->
      $scope.error = 'Sign up Error'
      $scope.message = false

    userApi.signup(data).then (data)->
      successSignUp(data)
    , (err) ->
      error
