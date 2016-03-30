<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="bower_component/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="bower_component/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bower_component/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="bower_component/assets/js/ie-emulation-modes-warning.js"></script>
    
    
    
  </head>

  <body ng-app="mainApp">
  
  	<c:import url="page_component/header.jsp"/>
	    <!-- Begin page content -->
	    <div class="container" id="watchlist_section" ng-controller="watchlistCtrl">
	      <div class="row-fluid">
	        <div class="col-md-12">
	          <div class="page-header">
	            <h2>Watch List</h2>
	          </div>
	          <div class="row-fluid">
	            <!-- search field -->
	            <div class="col-md-4">
	              <!-- Search text and button -->
	              <div class="row-fluid">
	                <div class="col-md-12">
	                  <div class="input-group">
	                    <input type="text" class="form-control" placeholder="Stock Symbol">
	                    <span class="input-group-btn">
	                      <button class="btn btn-default" type="button">Search</button>
	                    </span>
	                  </div>
	                </div>
	              </div>
	              <hr>
	              <!-- Search List -->
	              <div class="row-fluid">
	                <div class="col-md-12">
	                  <div class="list-group">
	                    <a href="#" class="list-group-item">
	                      <h4 class="list-group-item-heading">[Company Symbol]</h4>
	                      <p class="list-group-item-text">[Company Description]</p>
	                    </a>
	                  </div>
	                </div>
	              </div>
	            </div>
	
	            <!-- watched stock list -->
	            <div class="col-md-8">
	              <table class="table table-bordered table-striped">
	                <tr>
	                  <th class="col-md-3">Stock Symbol</th>
	                  <th class="col-md-3">Company Name</th>
	                  <th class="col-md-2">Change</th>
	                  <th class="col-md-2">Price</th>
	                  <th class="col-md-2">Operation</th>
	                </tr>
	                <tr ng-repeat="stock in stocks | orderBy: 'stockSymbol'">
	                  <td>{{ stock.stockSymbol }}</td>
	                  <td>{{ stock.companyName }}</td>
	                  <td>{{ stock.change }}</td>
	                  <td>{{ stock.price }}</td>
	                  <td>
	                  	<button type="button" class="btn btn-primary-outline btn-sm">Buy</button>
	                  	<button type="button" class="btn btn-primary-outline btn-sm">Sell</button>
	                  </td>
	                </tr>
	              </table>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    <c:import url="page_component/footer.jsp"/>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="bower_component/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bower_component/dist/js/bootstrap.min.js"></script>
    <script src="bower_component/angular/angular.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bower_component/assets/js/ie10-viewport-bug-workaround.js"></script>
    
    <!-- Customize Javascript -->
    <script>
    	var app = angular.module("mainApp", []);
    	app.controller("watchlistCtrl", function($scope, $interval, $http){
    		$scope.stocks = [];
    		$interval(function(){
    			$http({
    				method: 'GET',
    				url: 'getWatchList'
    			}).then(function(response){
    				$scope.stocks = response.data;
    				console.log("response:", response);
    				console.log($scope.stocks);
    			});
    		}, 3000);
    	});
    </script>
    
  </body>
</html>
