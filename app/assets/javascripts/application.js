// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require twitter/bootstrap
//= require_tree .
//= require highlight_js/highlight
//= require highlight_js/languages/ruby
//= require highlight_js/languages/xml
//= require highlight_js/languages/php
//= require highlight_js/languages/objectivec
//= require highlight_js/languages/javascript
//= require highlight_js/languages/css

hljs.initHighlightingOnLoad();

// 自定义插件 #1
KindEditor.lang({
	more : '更多'
});

KindEditor.plugin('more', function(K) {
	var self = this, name = 'more';
	self.clickToolbar(name, function() {
		self.insertHtml('<!-- more -->');
	});
});