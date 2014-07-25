angular.module("wogger.timer", [
  "ui.router"
]).config(config = ($stateProvider) ->
  $stateProvider.state "timer",
    url: "/timer"
    views:
      main:
        controller: "TimerCtrl"
        templateUrl: "timer/timer.tpl.html"

    data:
      pageTitle: "Timer"

  return
).controller "TimerCtrl", TimerCtrl = ($rootScope, $scope, Restangular, $modal) ->
  logs = Restangular.one('logs')
  logs.get().then (logs) ->
    $scope.logs = logs.logs
