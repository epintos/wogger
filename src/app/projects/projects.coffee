angular.module("wogger.projects", [
  "ui.router"
]).config(config = ($stateProvider) ->
  $stateProvider.state "projects",
    url: "/projects"
    views:
      main:
        controller: "ProjectsCtrl"
        templateUrl: "projects/projects.tpl.html"

    data:
      pageTitle: "Projects"

  return
).controller "ProjectsCtrl", ProjectsCtrl = ($scope, Restangular) ->
  projects = Restangular.one('projects')
  projects.get().then (projects) ->
    $scope.projects = projects.projects
