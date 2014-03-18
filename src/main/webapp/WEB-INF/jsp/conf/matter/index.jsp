<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>会议议定事项管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>会议议定事项管理</h1>
    </div>
    <div ng-controller="matterController">
        <!-- 会议议定事项管理-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="btn-group">
                <button type="button" class="btn btn-danger" ng-click="delete()">删除</button>
                <button type="button" class="btn btn-primary" ng-click="show()">查看</button>
                <button type="button" class="btn btn-primary" ng-click="showAdd()">添加</button>
                </div>
            </div>
            <!--会议议定事项查询 -->
            <div class="panel-body">
                <table class="table table-hover">
					<thead>
                    <tr>
                        <th>选择</th>
                        <th>完成时间</th>
                        <th>议定事项内容</th>
                    </tr>
					</thead>

					<tbody>
                    <tr ng-repeat="matter in matterList">
                        <td><input type="checkbox" id="{{matter.id}}" ng-model="matter.selected"/> </td>
                        <td>{{matter.finishDate}}</td>
                        <td>{{matter.content}}</td>
                    </tr>
					</tbody>
                </table>

            </div>

            <!--添加议定事项 -->
            <div class="modal fade" id="createDialog">
                <div class="modal-dialog">
                    <form class="form-horizontal" role="form">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">添加会议议定事项</h4>
                        </div>
                        <div class="modal-body">

                                <div class="form-group">
                                    <label for="newMatterFinishDate" class="col-sm-2 control-label">完成s时间</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newMatterFinishDate" ng-model="newMatter.finishDate"/>
                                    </div>
                                </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" ng-click="add()">保存</button>
                        </div>
                    </div><!-- /.modal-content -->
                    </form>
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
		
		app.factory('Matter', function($resource){
			return $resource("./:id", {}, {
				list:{
					method:'GET',
					params:{id:'list'},
					isArray:true
				},
                query:{
                    method:'GET',
                    params:{id:'query'},
                    isArray:true
                },
				update:{
					method:'PUT'
				}
			});
		});
		
		app.controller('matterController', function($scope, Matter){
			//页面初始化时访问后台取得会议议定事项列表信息并加载
			$scope.matterList = Matter.query();

			$scope.showAdd = function(){
				$scope.newMatter  = new Object();
				$('#createDialog').modal('show');
			};
			
			$scope.add = function(){
                Matter.save($scope.newMatter, function(){
					$('#createDialog').modal('hide');
					$scope.matterList = Matter.list();
				});
			}
		
			$scope.delete = function(matter){
				if(!confirm("确认删除会议记录，记录相关的会议议题和议定事项也将被删除。")){
                    return;
                }
                Matter.delete({id:matter.id}, function(){
					$scope.matterList = Matter.list();
				});
			}
		});


    </script>
</div>
</body>


</html>