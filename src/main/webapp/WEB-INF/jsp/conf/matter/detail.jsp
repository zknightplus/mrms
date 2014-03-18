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
        <h1>>会议纪要管理</h1>
    </div>


    <div ng-controller="conferenceController">
        <!-- 会议纪要查询 -->
        <div>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>全选</th>
                    <th>会议名称</th>
                    <th>会议开始时间</th>
                    <th>会议结束时间</th>
                    <th>ID</th>
                </tr>
                </thead>

                <tbody>
                    <tr ng-repeat="conference in conferenceList">
                        <td></td>
                        <td>{{conference.name}}</td>
                        <td>{{conference.startDate}}</td>
                        <td>{{conference.endDate}}</td>
                        <td>{{conference.id}}</td>
                    </tr>
                </tbody>
            </table>
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

        app.factory('Conference', function($resource){
           return $resource("./:id", {}, {
               list:{
                   method:'GET',
                   params:{id:'list'},
                   isArray:true
               },
               update:{
                   method:'PUT'
               }
           })
        });

        app.controller('conferenceController', function($scope, Conference){
            $scope.conferenceList = Conference.list();
        });

    </script>
</div>
</body>


</html>