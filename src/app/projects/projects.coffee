angular.module('wogger.projects', [
  'ui.router'
]).config(config = ($stateProvider) ->
  $stateProvider.state 'user.projects',
    url: '/projects'
    views:
      main:
        # controller: 'ProjectsCtrl'
        templateUrl: 'projects/projects.tpl.html'
    data:
      pageTitle: 'Projects'

  return
).controller 'ProjectsCtrl', ProjectsCtrl = ($scope, Restangular, Parse) ->
  # Parse.auth.register('esteban.pintos+2@wolox.com.ar', '123123123')
  Parse.auth.login('esteban.pintos+2@wolox.com.ar', '123123123')
  # projects = Restangular.one('projects')
  # projects.get().then (projects) ->
  #   $scope.projects = projects.projects
.factory 'Project', (Parse) ->
  class Project extends Parse.Model
    @configure 'Project', 'name', 'status', 'color'
