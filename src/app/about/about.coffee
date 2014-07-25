angular.module("wogger.about", [
  "ui.router"
  "placeholders"
  "ui.bootstrap"
]).config(config = ($stateProvider) ->
  $stateProvider.state "about",
    url: "/about"
    views:
      main:
        controller: "AboutCtrl"
        templateUrl: "about/about.tpl.html"

    data:
      pageTitle: "What is It?"

  return
).controller "AboutCtrl", AboutCtrl = ($scope) ->

  # This is simple a demo for UI Boostrap.
  $scope.dropdownDemoItems = [
    "The first choice!"
    "And another choice for you."
    "but wait! A third!"
  ]
  return
