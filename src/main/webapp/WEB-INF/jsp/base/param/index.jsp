<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>参数管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">

    <div ng-controller="paramController">
        <!-- 参数维护 -->
        <div class="panel panel-default">
            <div class="panel-heading">参数管理</div>
            <!--参数查询 -->
            <div class="panel-body" ng-repeat="paramCategory in paramCategoryList">
                <div>
                    <h3>{{paramCategory.name}}</h3>
                </div>
                <div>
                    <h4>
                    <span ng-repeat="paramItem in paramCategory.items">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="label label-primary" ng-click="showUpdateParamItem(paramItem)">{{paramItem.name}}&nbsp;&nbsp;</span><a href="#" ng-click="deleteParamItem(paramItem, paramCategory)"><span class="glyphicon glyphicon-remove"></span></a>
                    </span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href="#" ng-click="showCreateParamItem(paramCategory)">增加</a></span>
                    </h4>
                </div>
            </div>

            <!--参数值更新 -->
            <div class="modal fade" id="updateParamItemDialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">修改参数值</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="oldParamValue" class="col-sm-2 control-label">现在值</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="oldParamValue" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newParamValue2" class="col-sm-2 control-label">新值</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newParamValue2">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">保存</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!--参数值新增 -->
            <div class="modal fade" id="createParamItemDialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">新建参数值</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="newParamValue" class="col-sm-2 control-label">参数值</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newParamValue" ng-model="newParam.name">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" ng-click="createParamItem()">保存</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </div>


    </div>


    <script src="../../../s/third/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../../../s/third/jquery/jquery.form.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular-resource_1.2.9.js" type="text/javascript"></script>
    <script src="../../../s/third/bootstrap/3.0.2/js/bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript">

        var app = angular.module('App', ['ngResource'], function(){
        });

        app.factory('ParamCategory', function($resource){
            return $resource("./category/:id", {}, {
                list:{
                    method:'GET',
                    params:{id:'list'},
                    isArray:true
                }
            })
        });

        app.factory('Items', function($resource){
            return $resource("./category/:id/list", {}, {
				list:{
                    method:'GET',
                    params:{id:'list'},
                    isArray:true
                }
            })
        });

        app.factory('ParamItem', function($resource){
            return $resource("./item/:id", {}, {
                update:{
                    method:'PUT'
                }
            })
        });

        app.controller('paramController', function($scope, ParamCategory, ParamItem, Items){
            //页面加载时查询所有基础参数
			$scope.paramCategoryList = ParamCategory.list();

			//显示新建基础参数窗口
            $scope.showCreateParamItem = function(paramCategory){
				$scope.newParamParentCategory = paramCategory;
				$scope.newParam = null;
                $('#createParamItemDialog').modal('show');
            };
			
			//创建基础参数
			$scope.createParamItem = function(){
				$scope.newParam.categoryId = $scope.newParamParentCategory.id;
				//发送创建请求
				ParamItem.save($scope.newParam,function(){
                    //查询并更新当前类别的基础参数
					$scope.newParamParentCategory.items = Items.list({id:$scope.newParamParentCategory.id});
				});
            	$('#createParamItemDialog').modal('hide');

			}
			
			//显示更新基础参数窗口
            $scope.showUpdateParamItem = function(paramItem){
				//创建要更新的参数对象
				$scope.updateParam = paramItem;
				$scope.updateParam2 = new Object();
				$scope.updateParam2.id = paramItem.id;
				$scope.updateParam2.name = paramItem.name;
				$scope.updateParam2.categoryId = paramItem.categoryId;
				
                $('#updateParamItemDialog').modal('show');
            };
			
			//创建更新基础参数
			$scope.updateParamItem = function(){
				//发送更新请求
				ParamItem.update($scope.updateParam2,function(){
                    //更新当前基础参数
					$scope.updateParam.name = $scope.updateParam2.name;
				});
            	$('#createParamItemDialog').modal('hide');

			}
			
			//删除基础参数
            $scope.deleteParamItem = function(paramItem, paramCategory){
                if(!confirm("确认删除：" + paramItem.name)){
                    return;
                }

                ParamItem.delete({id:paramItem.id},function(){
					//查询并更新当前类别的基础参数
					$scope.paramCategory.items = Items.list({id:paramCategory.id});
                });
            }
        });

    </script>
</div>
</body>


</html>