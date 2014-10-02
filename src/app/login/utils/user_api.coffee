angular.module('wogger.api', [])
.factory 'userApi', ($http, Parse) ->

  login: (credentials) ->
    Parse.auth.login(credentials.username, credentials.password)

  getUser: (callback) ->
    Parse.auth.resumeSession()
    Parse.auth.currentUser

  forgotPassword: (data) ->
    # $http.post(url + '/login/forgotpassword', data)

  resetPassword: (token, password) ->
    # $http.post(url + '/login/forgotpassword/' + token, {password: password})

  signup: (data) ->
    Parse.auth.register(data.username, data.password)
