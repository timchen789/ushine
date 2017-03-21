// ============= p.72 Rendering Canned Search Results ========
// How to render collections with Angular ?
// let’s change search to assign a list of results to a new object 
// in $scope called customers. 
// We’ll use keys that map the fields of our Active Record object 
// —this will make it a snap to implement the back end later.
var app = angular.module('customers',[]); 
// angular.Module has a function named controller that will register controller function. 
app.controller("CustomerSearchController", [ 
    "$scope", 
    function($scope) {
// ------------------------------------    
      // $scope.search = function(searchTerm) {
        // $scope.searchedFor = searchTerm; 
      // } 
// ------------------------------------    
      $scope.customers = [];
      $scope.search = function(searchTerm) {
        $scope.customers = [ 
        { 
        "first_name":"Schuyler",
        "last_name":"Cremin",
        "email":"giles0@macgyver.net",
        "username":"jillian0",
        "created_at":"2015-03-04", 
        }, 
        { 
        "first_name":"Derick",
        "last_name":"Ebert", 
        "email":"lupe1@rennerfisher.org", 
        "username":"ubaldo_kaulke1", 
        "created_at":"2015-03-04", 
        }, 
        { 
        "first_name":"Derick", 
        "last_name":"Johnsons", 
        "email":"dj@somewhere.org", 
        "username":"djj", 
        "created_at":"2015-03-04", 
        } 
        ]
      }
// -----------------------------
    } 
]);
