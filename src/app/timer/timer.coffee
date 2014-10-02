angular.module('wogger.timer', [
  'ui.router'
]).config(config = ($stateProvider) ->
  $stateProvider.state 'user.timer',
    url: '/timer'
    views:
      main:
        templateUrl: 'timer/timer.tpl.html'
    data:
      pageTitle: 'Timer'

  return
).controller 'TimerCtrl',
TimerController = ($rootScope, $scope, $modal, Log) ->
  Log.query().then (logs) ->
    $scope.logs = logs

.factory 'Log', (Parse) ->
  class Log extends Parse.Model
    @configure 'Log',
               'description',
               'project_id',
               'billable',
               'time_seconds',
               'time_from',
               'time_to',
               'tags'
