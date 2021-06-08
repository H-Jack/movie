<?php
namespace think\route;

use think\facade\Request;
use think\facade\Route;

Route::any("api/v1/login","api/v1.login/login");
Route::any("api/v1/weblogin","api/v1.login/weblogin");
Route::any("api/v1/webregistered","api/v1.login/webregistered");
Route::any("api/v1/indexuserinfo","api/v1.index/userinfo");
Route::any("api/v1/indexmovie","api/v1.index/movie");
Route::any("api/v1/indexallmovie","api/v1.index/allmovie");
Route::any("api/v1/indexallsingin","api/v1.index/allsingin");
Route::any("api/v1/indexorderadd","api/v1.index/orderadd");
Route::any("api/v1/indexorder","api/v1.index/order");
Route::any("api/v1/weborderadd","api/v1.index/weborderadd");
Route::any("api/v1/weborder","api/v1.index/weborder");
Route::any("api/v1/editpassword","api/v1.index/editpassword");
Route::any("api/v1/deleteorder","api/v1.index/deleteorder");
Route::any("api/v1/webdeleteorder","api/v1.index/webdeleteorder");
Route::any("api/v1/indexsearch","api/v1.index/search");
Route::any("api/v1/indexclassification","api/v1.index/classification");
Route::any("api/v1/information","api/v1.index/information");
Route::any("api/v1/addmessage","api/v1.index/addmessage");
Route::any("api/v1/indexmovieactormessage","api/v1.index/movieactormessage");
Route::any("api/v1/indexmovieactor","api/v1.index/movieactor");
Route::any("api/v1/indexmessage","api/v1.index/message");
Route::any("api/v1/indexaddress","api/v1.index/address");

Route::any('wechat/api/notify','api/wechat_unify/notify');