angular.module('wogger.api', []).factory 'userApi', ($http, configuration) ->
  url = configuration.apiUrl

  login: (credentials) ->
    $http.post(url + '/login', credentials)

  getUser: (callback) ->
    $http.get(url + '/users/me')

  forgotPassword: (data) ->
    $http.post(url + '/login/forgotpassword', data)

  resetPassword: (token, password) ->
    $http.post(url + '/login/forgotpassword/' + token, {password: password})

  signup: (data) ->
    $http.post(url + '/signup', data)
