"use strict";$(function(){var n=new Cookie;$.ajax({type:"POST",url:"/api/admin/auth",contentType:"application/json; charset=UTF-8",headers:{Authorization:n.get("TEAN_ADMIN")},error:function(){window.location.href="/admin/login"}})});