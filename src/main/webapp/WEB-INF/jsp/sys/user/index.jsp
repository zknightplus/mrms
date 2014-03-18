<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="App">
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link href="../../../s/third/bootstrap/3.0.2/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<div class="page-header">
    <h1>用户管理</h1>
</div>
<div ng-controller="userController">
    <!-- 用户维护 -->
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#home" data-toggle="tab">会议办用户</a></li>
        <li><a href="#profile" data-toggle="tab">责任单位用户</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="home">
            <!-- 会议办用户 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" ng-click="showUpdateUser()">编辑</button>
                        <button type="button" class="btn btn-danger" ng-click="deleteUsers()">删除</button>
                        <button type="button" class="btn btn-primary">查看</button>
                        <button type="button" class="btn btn-danger">取消管理员</button>
                        <button type="button" class="btn btn-primary" ng-click="showAddUser()">添加用户</button>
                    </div>
                </div>
                <!--用户查询 -->
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>登陆账号</th>
                            <th>姓名</th>
                            <th>联系电话</th>
                            <th>邮箱</th>
                        </tr>
                        </thead>


                        <tbody>
                        <tr ng-repeat="user in userList" ng-dblclick="showUpdateUser(user)">
                            <td>{{user.account}}</td>
                            <td>{{user.name}}</td>
                            <td>{{user.telNo}}</td>
                            <td>{{user.email}}</td>
                        </tr>
                        </tbody>
                    </table>

                </div>


                <div class="modal fade" id="updateUserDialog">
                    <!--修改用户 -->
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">修改用户信息</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="updateUserAccount" class="col-sm-2 control-label">账号</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserAccount"
                                                   ng-model="updateUserInfo.account" value="{{updateUserInfo.account}}"
                                                   readonly="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="updateUserName" class="col-sm-2 control-label">姓名</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserName"
                                                   value="{{updateUserInfo.name}}" ng-model="updateUserInfo.name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateUserTelNo" class="col-sm-2 control-label">联系电话</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserTelNo"
                                                   value="{{updateUserInfo.telNo}}" ng-model="updateUserInfo.telNo"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateUserEmail" class="col-sm-2 control-label">邮箱</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserEmail"
                                                   value="{{updateUserInfo.email}}" ng-model="updateUserInfo.email"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" ng-click="updateUser(updateUserInfo)">保存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--添加用户 -->
                <div class="modal fade" id="createUserDialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">添加用户</h4>
                                {{msg}}
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="newUserAccount" class="col-sm-3 control-label">登陆账号</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserAccount" ng-model="newUser.account"/>
                                        </div>
                                        <div class="col-sm-3 control-label">英文数字组合</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserAdmin" class="col-sm-3 control-label">设为管理员</label>

                                        <div class="col-sm-1">
                                            <input type="checkbox" class="form-control" id="newUserAdmin"
                                                   ng-model="newUser.admin"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserName" class="col-sm-3 control-label">姓名</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserName" ng-model="newUser.name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserDuty" class="col-sm-3 control-label">职务</label>

                                        <div class="col-sm-6">
                                            <select class="form-control" id="newUserDuty" ng-model="newUser.duty.id"
                                                    ng-options="duty.id as duty.name for duty in dutyList"
                                                    >
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserTelNo" class="col-sm-3 control-label">联系电话</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserTelNo" ng-model="newUser.telNo"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserEmail" class="col-sm-3 control-label">邮箱</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserEmail" ng-model="newUser.email"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" ng-click="addUser()">保存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>


        </div>
        <div class="tab-pane" id="profile">
            <!--责任单位用户-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" ng-click="showUpdateUser2()">编辑</button>
                        <button type="button" class="btn btn-danger" ng-click="deleteUsers()">删除</button>
                        <button type="button" class="btn btn-primary">查看</button>
                        <button type="button" class="btn btn-danger">取消管理员</button>
                        <button type="button" class="btn btn-primary" ng-click="showAddUser2()">添加用户</button>
                    </div>
                </div>
                <!--用户查询 -->
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>登陆账号</th>
                            <th>姓名</th>
                            <th>联系电话</th>
                            <th>邮箱</th>
                        </tr>
                        </thead>


                        <tbody>
                        <tr ng-repeat="user in userList" ng-dblclick="showUpdateUser(user)">
                            <td>{{user.account}}</td>
                            <td>{{user.name}}</td>
                            <td>{{user.telNo}}</td>
                            <td>{{user.email}}</td>
                        </tr>
                        </tbody>
                    </table>

                </div>


                <div class="modal fade" id="updateUserDialog2">
                    <!--修改用户 -->
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">修改用户信息</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="updateUserAccount2" class="col-sm-2 control-label">账号</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserAccount2"
                                                   ng-model="updateUserInfo.account" value="{{updateUserInfo.account}}"
                                                   readonly="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="updateUserName2" class="col-sm-2 control-label">姓名</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserName2"
                                                   value="{{updateUserInfo.name}}" ng-model="updateUserInfo.name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateUserOrg2" class="col-sm-3 control-label">责任单位</label>

                                        <div class="col-sm-6">
                                            <select class="form-control" id="updateUserOrg2" ng-model="updateUser.org.id"
                                                    ng-options="org.id as org.name for org in orgList"
                                                    >
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateUserTelNo2" class="col-sm-2 control-label">联系电话</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserTelNo2"
                                                   value="{{updateUserInfo.telNo}}" ng-model="updateUserInfo.telNo"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateUserEmail2" class="col-sm-2 control-label">邮箱</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="updateUserEmail2"
                                                   value="{{updateUserInfo.email}}" ng-model="updateUserInfo.email"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" ng-click="updateUser(updateUserInfo)">保存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--添加用户 -->
                <div class="modal fade" id="createUserDialog2">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">添加用户</h4>
                                {{msg}}
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="newUserAccount2" class="col-sm-3 control-label">登陆账号</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserAccount2" ng-model="newUser.account"/>
                                        </div>
                                        <div class="col-sm-3 control-label">英文数字组合</div>
                                    </div>

                                    <div class="form-group">
                                        <label for="newUserName2" class="col-sm-3 control-label">姓名</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserName2" ng-model="newUser.name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserOrg2" class="col-sm-3 control-label">责任单位</label>

                                        <div class="col-sm-6">
                                            <select class="form-control" id="newUserOrg2" ng-model="newUser.org.id"
                                                    ng-options="org.id as org.name for org in orgList"
                                                    >
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserTelNo2" class="col-sm-3 control-label">联系电话</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserTelNo2" ng-model="newUser.telNo"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newUserEmail2" class="col-sm-3 control-label">邮箱</label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="newUserEmail2" ng-model="newUser.email"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" ng-click="addUser()">保存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
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

    $(function () {
        $('#myTab a:first').tab('show')
    })


    var app = angular.module('App', ['ngResource'], function () {
    });

    app.factory('User', function ($resource) {
        return $resource("./:id", {}, {
            list: {
                method: 'GET',
                params: {id: 'list'},
                isArray: true
            },
            update: {
                method: 'PUT'
            }
        });
    });

    app.factory('Items', function ($resource) {
        return $resource("../../base/param/category/:id/list", {}, {
            list: {
                method: 'GET',
                params: {id: 'list'},
                isArray: true
            }
        })
    });

    app.controller('userController', function ($scope, User, Items) {
        //页面初始化时访问后台取得用户列表信息并加载
        $scope.userList = User.list();

        $scope.dutyList = Items.list({id: '6'});

        $scope.showUpdateUser = function (user) {
            $scope.selectedUser = user;
            $scope.updateUserInfo = angular.copy(user);

            $('#updateUserDialog').modal('show');
        };

        $scope.showUpdateUser2 = function (user) {
            $scope.selectedUser = user;
            $scope.updateUserInfo = angular.copy(user);

            $('#updateUserDialog2').modal('show');
        };

        $scope.updateUser = function (updateUserInfo) {
            User.update({id: updateUserInfo.id}, updateUserInfo, function () {
                angular.copy(updateUserInfo, $scope.selectedUser);

                $('#updateUserDialog').modal('hide');
            });
        }

        $scope.showAddUser = function () {
            $scope.newUser = new Object();
            $scope.newUser.type = '1';
            $('#createUserDialog').modal('show');
        };

        $scope.showAddUser2 = function () {
            $scope.newUser = new Object();
            $scope.newUser.type = '2';
            $('#createUserDialog2').modal('show');
        };


        $scope.showAddUser2 = function () {
            $scope.newUser = new Object();
            $scope.newUser.type = '2';
            $('#createUserDialog').modal('show');
        };

        $scope.addUser = function () {
            User.save($scope.newUser, function (result) {
                if(result.code == '0'){
                    $('#createUserDialog').modal('hide');
                    $scope.userList = User.list();
                    $scope.msg = '';
                }else{
                    $scope.msg = result.msg;
                }

            });
        }

        $scope.deleteUsers = function () {
            var deleteUserIds = "";
            var deleteUserNames = "";

            for (var i = 0; i < $scope.userList.length; i++) {
                if ($scope.userList[i].selected) {
                    deleteUserIds += $scope.userList[i].id + ",";
                    if (deleteUserNames == "") {
                        deleteUserNames = $scope.userList[i].account;
                    } else {
                        deleteUserNames += "," + $scope.userList[i].account;
                    }
                }
            }

            if (deleteUserNames == "") {
                alert("请选择删除的用户！");
                return;
            }

            if (!confirm("确认删除用户：" + deleteUserNames)) {
                return;
            }
            User.delete({id: deleteUserIds}, function () {
                $scope.userList = User.list();
            });
        }
    });


</script>
</div>
</body>


</html>