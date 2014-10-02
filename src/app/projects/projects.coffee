angular.module('wogger.projects', [
  'ui.router'
  'wogger.auth'
]).config(config = ($stateProvider) ->
  $stateProvider.state 'user.projects',
    url: '/projects'
    views:
      main:
        templateUrl: "projects/projects.tpl.html"
    data:
      pageTitle: 'Projects'

  return
).controller 'ProjectsCtrl',
ProjectsController = ($rootScope, $scope, Project) ->
  Project.query().then (projects) ->
    $scope.projects = projects

.factory 'Project', (Parse) ->
  class Project extends Parse.Model
    @configure 'Project',
               'name',
               'status',
               'color'
