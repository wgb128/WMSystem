(function($){  
    $.fn.fixTable = function(options){ 
		var defaults = {  
			fixColumn: 0,  
			width:0,
			height:0  
		};    
	    var opts = $.extend(defaults, options); 
	    
	     //   $("#_fixTableMain").remove();
	       // $("#_fixTableBody").remove();
	        $("#_fixTableHeader").remove();
	        $("#_fixTableColumn").remove();


			var _this = $(this);
			var tabthrows = $("thead tr" ,_this);
			var threadLength = tabthrows.size();
			var _clone = _this.clone();
			_clone = _clone.removeAttr('id');
			var _columnClone = _this.clone();
			_columnClone = _columnClone.removeAttr('id');

			var _columnDataClone = _this.clone();
			_columnDataClone = _columnDataClone.removeAttr('id');
			_this.wrap(function() {
               return $("<div id='_fixTableMain'></div>");
            });
			$("#_fixTableMain").css({
				"width":defaults["width"],
				"height":defaults["height"],
				"overflow":"scroll",
				"position":"relative"
			});
			$("#_fixTableMain").wrap(function() {
               return $("<div id='_fixTableBody'></div>");
            });
			$("#_fixTableBody").css({
				//"background-color":"yellow",
				"width":defaults["width"],
				"height":defaults["height"],
				"overflow":"hidden",
				"position":"relative"
			});
			$("#_fixTableBody").append("<div id='_fixTableHeader'></div>");
			$(_clone).height($(_clone).find("thead").height()*threadLength);
			$("#_fixTableHeader").append(_clone);
			$("#_fixTableHeader").css({
			//	"background-color":"gray",
				"overflow":"hidden",
				"width":defaults["width"]-17,
				"height":_clone.find("thead").find("tr").height()*threadLength+1,
				"position":"absolute",
				"z-index":"88888",
				"top":"0"
			});
			
			$("#_fixTableBody").append("<div id='_fixTableColumn'></div>");
			
			var _fixColumnNum = defaults["fixColumn"];
			var _fixColumnWidth = 0;
			//add by zhangbr@ccthanking.com 只有当数据宽度大于表格宽度时，才使用固定列头
            if($(this).width()>defaults["width"]){
				$($(_this).find("thead").find("tr").find("th")).each(function(index, element) {
	               	if((index+1)<=_fixColumnNum){
						_fixColumnWidth += $(this).width()+5;
					}
	            });
            }
			$("#_fixTableColumn").css({
				"overflow":"hidden",
				"width":_fixColumnWidth,
				"height":defaults["height"]-17,
				"position":"absolute",
				"z-index":"99999",
				"top":"0",
				"left":"0"
			});
			$("#_fixTableColumn").append("<div id='_fixTableColumnHeader'></div>");
			$("#_fixTableColumnHeader").css({
				//"background-color":"#abc123",
				"width":$("#_fixTableColumn").width(),
				"height":_this.find("thead").find("tr").height()*threadLength+1,
				"overflow":"hidden",
				"position":"absolute",
				"z-index":"999999",
			});
			$("#_fixTableColumnHeader").append(_columnClone);
			
			$("#_fixTableColumn").append("<div id='_fixTableColumnBody'></div>");
			$("#_fixTableColumnBody").css({
				//"background-color":"#acd542",
				"width":$("#_fixTableColumn").width(),
				"height":defaults["height"]-17,
				"overflow":"hidden",
				"position":"absolute",
				"z-index":"99999",
				"top":"0"
			});
			$("#_fixTableColumnBody").append(_columnDataClone);
			$("#_fixTableMain").scroll(function(e) {
                $("#_fixTableHeader").scrollLeft($(this).scrollLeft());
				$("#_fixTableColumnBody").scrollTop($(this).scrollTop());
            });
		};
    
})(jQuery); 