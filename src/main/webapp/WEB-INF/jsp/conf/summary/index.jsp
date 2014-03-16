<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>会议纪要管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>会议纪要管理</h1>
    </div>
    <div ng-controller="summaryController">
        <!-- 会议纪要管理-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="btn-group">
                <button type="button" class="btn btn-danger" ng-click="deleteSummary()">删除</button>
                <button type="button" class="btn btn-primary" ng-click="showSummary()">查看</button>
                <button type="button" class="btn btn-primary" ng-click="showAddSummary()">添加</button>
                </div>
            </div>
            <!--会议纪要查询 -->
            <div class="panel-body">
                <table class="table table-hover">
					<thead>
                    <tr>
                        <th>选择</th>
                        <th>会议时间</th>
                        <th>会次</th>
                        <th>纪要名称</th>
                    </tr>
					</thead>

					<tbody>
                    <tr ng-repeat="summary in summaryList">
                        <td><input type="checkbox" id="{{summary.id}}" ng-model="summary.selected"/> </td>
                        <td>{{summary.startDate}}</td>
                        <td>{{summary.no}}</td>
                        <td>{{user.attachFileName}}</td>
                    </tr>
					</tbody>
                </table>

            </div>

            <!--添加会议纪要 -->
            <div class="modal fade" id="createSummaryDialog">
                <div class="modal-dialog">
                    <form class="form-horizontal" role="form">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">添加会议纪要</h4>
                        </div>
                        <div class="modal-body">

                                <div class="form-group">
                                    <label for="newSummaryStartDate" class="col-sm-2 control-label">会议时间</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newSummaryStartDate" />
                                    </div>
                                </div>
								<div class="form-group">
                                    <label for="newSummaryNo" class="col-sm-2 control-label">会次</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newSummaryNo" ng-model="newSummary.no"/>
                                    </div>
                                </div>
								<div class="form-group">
                                    <label for="newSummaryAttach" class="col-sm-2 control-label">会议纪要附件</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newSummaryAttach"/>
                                    </div>
                                </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" ng-click="addSummary()">保存</button>
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
		
		app.factory('Summary', function($resource){
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
		
		app.controller('summaryController', function($scope, Summary){
			//页面初始化时访问后台取得会议纪要列表信息并加载
			$scope.summaryList = Summary.query();

			$scope.showAddSummary = function(){
				$scope.newSummary  = new Object();
				$('#createSummaryDialog').modal('show');
			};
			
			$scope.addSummary = function(){
				Summary.save($scope.newSummary, function(){
					$('#createSummaryDialog').modal('hide');
					$scope.summaryList = Summary.list();
				});
			}
		
			$scope.deleteSummary = function(summary){
				if(!confirm("确认删除会议记录，记录相关的会议议题和议定事项也将被删除。")){
                    return;
                }
                Summary.delete({id:summary.id}, function(){
					$scope.summaryList = Summary.list();
				});
			}
		});


    </script>
</div>
</body>


</html>