<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>会议议题管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>会议议题管理</h1>
    </div>
    <div ng-controller="topicController">
        <!-- 会议议题管理-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="btn-group">
                <button type="button" class="btn btn-danger" ng-click="delete()">删除</button>
                <button type="button" class="btn btn-primary" ng-click="show()">查看</button>
                <button type="button" class="btn btn-primary" ng-click="showAdd()">添加</button>
                </div>
            </div>
            <!--会议议题查询 -->
            <div class="panel-body">
                <table class="table table-hover">
					<thead>
                    <tr>
                        <th>选择</th>
                        <th>议题类型</th>
                        <th>议题名称</th>
                    </tr>
					</thead>

					<tbody>
                    <tr ng-repeat="topic in topicList">
                        <td><input type="checkbox" id="{{topic.id}}" ng-model="topic.selected"/> </td>
                        <td>{{topic.confType.name}}</td>
                        <td>{{topic.name}}</td>
                    </tr>
					</tbody>
                </table>

            </div>

            <!--添加会议议题 -->
            <div class="modal fade" id="createDialog">
                <div class="modal-dialog">
                    <form class="form-horizontal" role="form">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">添加会议议题</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="newTopicConfType" class="col-sm-2 control-label">议题类型</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="newTopicConfType" ng-model="newTopic.confType.id"
                                            ng-options="confType.id as confType.name for confType in confTypeList"
                                            >
                                    </select>
                                </div>
                            </div>

								<div class="form-group">
                                    <label for="newTopicName" class="col-sm-2 control-label">议题名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newTopicName" ng-model="newTopic.name"/>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label for="newTopicConfNo" class="col-sm-2 control-label">次数</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="newTopicConfNo" ng-model="newTopic.confNo"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newTopicReportUnit" class="col-sm-2 control-label">汇报单位</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="newTopicReportUnit" ng-model="newTopic.reportUnit.id"
                                            ng-options="reportUnit.id as reportUnit.name for reportUnit in reportUnitList"
                                            >
                                    </select>
                                </div>
                            </div>
                            <!--
                            <div class="form-group">
                                <label for="newTopicReportUser" class="col-sm-2 control-label">汇报人</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="newTopicReportUser" ng-model="newTopic.reportUser.id"
                                            ng-options="reportUser.id as reportUser.name for reportUser in reportUserList"
                                            >
                                    </select>
                                </div>
                            </div>
                            -->
                            <div class="form-group">
                                <label for="newTopicSubject" class="col-sm-2 control-label">议题主题</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="newTopicSubject" ng-model="newTopic.subject.id"
                                            ng-options="reportSubject.id as reportSubject.name for reportSubject in reportSubjectList"
                                            >
                                    </select>
                                </div>
                            </div>

                            <!--
<div class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file" id="exampleInputFile">
    <p class="help-block">Example block-level help text here.</p>
</div>
-->



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
		
		app.factory('Topic', function($resource){
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

        app.factory('Items', function($resource){
            return $resource("../../base/param/category/:id/list", {}, {
                list:{
                    method:'GET',
                    params:{id:'list'},
                    isArray:true
                }
            })
        });
		
		app.controller('topicController', function($scope, Topic, Items){
			//页面初始化时访问后台取得会议议题列表信息并加载
			$scope.topicList = Topic.query();

            $scope.confTypeList = Items.list({id:'1'});
            $scope.reportUnitList = Items.list({id:'3'});
            //TODO: $scope.reportUserList = Items.list({id:'1'});
            $scope.reportSubjectList = Items.list({id:'2'});


			$scope.showAdd = function(){
				$scope.newTopic  = new Object();
				$('#createDialog').modal('show');
			};
			
			$scope.add = function(){
                console.log($scope.newTopic);
				Topic.save($scope.newTopic, function(){
					$('#createDialog').modal('hide');
					$scope.topicList = Topic.query();
				});
			}
		
			$scope.delete = function(topic){
				if(!confirm("确认删除会议议题，相关的议定事项也将被删除。")){
                    return;
                }
                Topic.delete({id:topic.id}, function(){
					$scope.topicList = Topic.list();
				});
			}
		});


    </script>
</div>
</body>


</html>