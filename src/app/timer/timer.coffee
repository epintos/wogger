angular.module('wogger.timer', [
  'ui.router'
]).config(config = ($stateProvider) ->
  $stateProvider.state 'user.timer',
    url: '/timer'
    views:
      main:
        controller: 'TimerCtrl'
        templateUrl: 'timer/timer.tpl.html'
    data:
      pageTitle: 'Timer'

  return
).controller 'TimerCtrl',
TimerController = ($rootScope, $scope, Restangular, $modal) ->
  # logs = Restangular.one('logs')
  # logs.get().then (logs) ->
  #   $scope.logs = logs.logs
  # $scope.newLog = {}

  $scope.createLog = ->
    logs.post($scope.newLog).then (data)->
      console.log(data)
.factory 'Timer', (Parse) ->
  class Timer extends Parse.Model
    @configure 'Timer', 'title', 'body', 'author', 'tags', 'commentCount'
