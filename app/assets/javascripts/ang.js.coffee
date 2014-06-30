# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###

WmslWorldCupApp = angular.module("WmslWorldCupApp", [])

WmslWorldCupApp.controller "PlayerInfoCtrl", ($scope , $http) ->
  
  $scope.player = {name: 'Loading player information ...'}
  loadPlayerInfo = ->
    $http.get('../players/1.json').success( (player) ->
      $scope.player = player
      console.log('Successfully loaded player.')
    ).error( ->
      console.error('Failed to load player.')
    )
  loadPlayerInfo()
  
  return


WmslWorldCupApp.controller "MatchesCtrl", ($scope , $http) ->
  
  $scope.matches = {description: 'Loading matches ...'}
  loadMatches = ->
    $http.get('./matches_close.json').success( (matches) ->
      $scope.matches = matches
      console.log('Successfully loaded matches.')
    ).error( ->
      console.error('Failed to load matches.')
    )
  loadMatches()
  
  return
  
WmslWorldCupApp.controller "BetsContrl", ($scope , $http) ->
  
  $scope.bets = {description: 'Loading bets ...'}
  loadBets = ->
    $http.get('./bets.json').success( (bets) ->
      $scope.bets = bets
      console.log('Successfully loaded bets.')
    ).error( ->
      console.error('Failed to load bets.')
    )
  loadBets()
  
  return###
