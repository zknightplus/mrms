<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="GVApp">
<head>
    <meta charset="utf-8">
    <title>全局变量维护</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>全局参数维护</h1>
    </div>


    <div id="paramDiv" ng-controller="paramCtrl">
        <!--全局参数列表 -->
        <div id="paramListDiv">
            <button type="button" class="btn btn-primary" ng-click='showCreateParam()'>新增全局参数</button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>参数Key</th>
                    <th>参数描述</th>
                    <th>参数值</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <tr ng-repeat="param in params">
                    <td>{{param.key}}</td>
                    <td>{{param.description}}</td>
                    <td>{{param.value}}</td>
                    <td>
                        <button type="button" class="btn btn-primary" ng-click='showUpdateParam(param)'>修改</button>
                        <button type="button" class="btn btn-danger" ng-click='deleteParam(param)'>删除</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!--全局参数创建 -->
        
        <div class="modal fade" id="addParamDiv" tabindex="-1" role="dialog" aria-labelledby="addParamTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <form class="form-horizontal" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="addParamTitle">添加全局参数</h4>
                    </div>

	                <div class="modal-body"> 
    	                <div class="form-group">
        	                <label class="col-sm-2 control-label" for="addParamId">全局参数ID</label>
            	            <div class="col-sm-10">
                	            <input type="text" class="form-control" id="addParamId" ng-model="newParam.key"  placeholder="全局参数ID">
                    	    </div>
                    	</div>
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label" for="addParamDescription">全局参数描述</label>

                        	<div class="col-sm-10">
                            	<input type="text" class="form-control"  id="addParamDescription" ng-model="newParam.description" placeholder="全局参数描述 ">
	                        </div>
    	                </div>
        	            <div class="form-group">
            	            <label class="col-sm-2 control-label" for="addParamValue">全局参数值</label>

                	        <div class="col-sm-10">
                    	        <input type="text" class="form-control" id="addParamValue" ng-model="newParam.value" placeholder="全局参数值 ">
                        	</div>
	                    </div>
    	            </div>
        	        <div class="modal-footer">
            	        <div class="control-group">
                	        <div class="controls">
                        	    <a href="#" class="btn btn-primary" ng-click='addParam()'>确定</a>
	                        </div>
    	                </div>
        	        </div>
        	    </form>
            	</div>
        	</div>
        </div>

        <!--全局参数更新 -->
        <div class="modal fade" id="updateParamDiv" tabindex="-1" role="dialog" aria-labelledby="updateParamTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <form class="form-horizontal" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="updateParamTitle">添加全局参数</h4>
                    </div>

	                <div class="modal-body"> 
    	                <div class="form-group">
        	                <label class="col-sm-2 control-label" for="updateParamId">全局参数ID</label>
            	            <div class="col-sm-10">
                	            <input type="text" class="form-control" id="updateParamId" 
                	            	ng-model="param.key" value="{{param.key}}" placeholder="全局参数ID">
                    	    </div>
                    	</div>
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label" for="updateParamDescription">全局参数描述</label>

                        	<div class="col-sm-10">
                            	<input type="text" class="form-control"  id="updateParamDescription" 
                            		ng-model="param.description" value="{{param.description}}" placeholder="全局参数描述 ">
	                        </div>
    	                </div>
        	            <div class="form-group">
            	            <label class="col-sm-2 control-label" for="updateParamValue">全局参数值</label>

                	        <div class="col-sm-10">
                    	        <input type="text" class="form-control" id="updateParamValue" 
                    	        	ng-model="param.value" value="{{param.value}}"  placeholder="全局参数值 ">
                        	</div>
	                    </div>
    	            </div>
        	        <div class="modal-footer">
            	        <div class="control-group">
                	        <div class="controls">
                        	    <a href="#" class="btn btn-primary" ng-click='updateParam(param)'>确定</a>
	                        </div>
    	                </div>
        	        </div>
        	    </form>
            	</div>
        	</div>
        </div>
    </div>


    <script src="../../../s/third/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../../../s/third/jquery/jquery.form.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular-resource_1.2.9.js" type="text/javascript"></script>
    <script src="../../../s/third/bootstrap/3.0.2/js/bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript">
        var app = angular.module('GVApp', ['ngResource'], function () {
            console.log('GVApp initial');
        });

        app.factory('ParamItem', function ($resource) {
            return $resource("./:key", {}, {
                list: {
                    method: 'GET',
                    params: {key: 'list'},
                    isArray: true
                },
                update: {
                    method: 'PUT'
                }
            });
        });

        app.controller('paramCtrl', function ($scope, Param) {
            console.log('in paramCtrl');
            $scope.params = Param.list();
            console.log($scope.params);

            $scope.showCreateParam = function () {
                console.log("in showCreateParam");
                $('#addParamDiv').modal('show');
            };
            
            $scope.addParam = function(){
            	console.log("in addParam");
            	Param.save($scope.newParam);
            	$('#addParamDiv').modal('hide');
            	$scope.params = Param.list();
            };
            
            $scope.showUpdateParam = function (param) {
                console.log("in showUpdateParam");
                $scope.param = param;
                $('#updateParamDiv').modal('show');
            };


            $scope.updateParam = function(param){
            	console.log("in updateParam");
            	console.log(param);
            	Param.update({key:param.key},param);
            	$('#updateParamDiv').modal('hide');
            };
            
            $scope.deleteParam = function (aParam) {
                console.log("in deleteParam");
                console.log(aParam);
                Param.delete({key:aParam.key}, function(){
                    $scope.params = Param.list();                	
                });

            };
        });


    </script>
</div>
</body>


</html>