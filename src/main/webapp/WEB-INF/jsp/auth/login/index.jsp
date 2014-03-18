<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>参数管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">

    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>

</head>
<body>
<div class="container" ng-controller="loginController">
    <form:form cssClass="form-signin" method="post" action="login" commandName="user">
        <h2 class="form-signin-heading">请登录</h2>
        <form:errors path="*"/>
        <form:input cssClass="input-block-level" placeholder="用户账号" path="account"/>
        <form:password cssClass="input-block-level" placeholder="密码" path="pwd"/>
        <button class="btn btn-large btn-primary" type="submit">登陆</button>
    </form:form>

</div>

    <script src="../../../s/third/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../../../s/third/jquery/jquery.form.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular.js" type="text/javascript"></script>
    <script src="../../../s/third/angular/1.2.6/angular-resource_1.2.9.js" type="text/javascript"></script>
    <script src="../../../s/third/bootstrap/3.0.2/js/bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript">

        var app = angular.module('App', ['ngResource'], function(){
        });


        app.controller('loginController', function($scope){


        });

    </script>
</div>
</body>


</html>