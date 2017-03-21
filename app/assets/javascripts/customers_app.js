// ============= p.72 Rendering Canned Search Results ========
// How to render collections with Angular ?
// let’s change search to assign a list of results to a new object 
// in $scope called customers. 
// We’ll use keys that map the fields of our Active Record object 
// —this will make it a snap to implement the back end later.
var app = angular.module('customers',[]); 
// angular.Module has a function named controller that will register controller function. 
app.controller("CustomerSearchController", [ 
// Angular provides a service called $http used to make Ajax requests
    "$scope","$http",
    function($scope,$http) {
// ------------------------------------    
      // $scope.search = function(searchTerm) {
        // $scope.searchedFor = searchTerm; 
      // } 
// ------------------------------------   
      var page = 0;
      $scope.customers = [];
      $scope.search = function(searchTerm) {
        $http.get("/customers.json",
                  { "params": { "keywords": searchTerm, "page": page } } 
        ).then(function(response) { 
          $scope.customers = response.data; 
          },function(response) { 
            alert("There was a problem: " + response.status); 
          } 
        );  
      }
      $scope.previousPage = function() {
        if (page > 0) { 
          page = page - 1; 
          $scope.search($scope.keywords); 
        } 
      }
      $scope.nextPage = function(){
        page = page + 1; 
        $scope.search($scope.keywords); 
      }
// -----------------------------
    } 
]);

