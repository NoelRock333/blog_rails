// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("ajax:success", "form#comments-form", function(ev, data){
	console.log(data);
	$("#comments-box").append("<li>"+data.cuerpo+"</li>");
	$(this).find("textarea").val("");
});
$(document).on("ajax:error", "form#comments-form", function(ev, data){
	console.log("error");
	console.log(data);
});