<!DOCTYPE html>
<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tld/base.tld" prefix="app"%>
<app:base/>
<title>支付征收办首页</title>
<script src="${pageContext.request.contextPath }/js/common/xWindow.js"></script>
<script type="text/javascript" charset="utf-8">
//请求路径，对应后台RequestMapping
var controllername= "${pageContext.request.contextPath }/zjgl/gcZjglZszjZfzsbController.do";

//页面初始化
$(function() {
	init();
	//按钮绑定事件（查询）
	$("#btnQuery").click(function() {
		var kssj = $("#ZFRQB").val();
		var jssj = $("#ZFRQE").val();
		if(kssj!="" && jssj!="" && kssj > jssj){
			alert("<结束时间>不能早于<开始时间>");
			return false;
		}
		//生成json串
		var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
		//调用ajax插入
		defaultJson.doQueryJsonList(controllername+"?query",data,DT1);
	});
	//按钮绑定事件(新增)
	$("#btnInsert").click(function() {
		$(window).manhuaDialog({"title":"支付征收办>新增","type":"text","content":"${pageContext.request.contextPath }/jsp/business/zjgl/zfzsb-add.jsp?type=insert","modal":"1"});
	});
	//按钮绑定事件(修改)
	$("#btnUpdate").click(function() {
		if($("#DT1").getSelectedRowIndex()==-1)
		 {
			requireSelectedOneRow();
		    return
		 }
		$("#resultXML").val($("#DT1").getSelectedRow());
		$(window).manhuaDialog({"title":"支付征收办>修改","type":"text","content":"${pageContext.request.contextPath }/jsp/business/zjgl/zfzsb-add.jsp?type=update","modal":"1"});
	});
	//按钮绑定事件（导出EXCEL）
	$("#btnExpExcel").click(function() {
		 var t = $("#DT1").getTableRows();
		 if(t<=0)
		 {
			 xAlert("提示信息","请至少查询出一条记录！");
			 return;
		 }
	  	 $(window).manhuaDialog({"title":"导出","type":"text","content":"${pageContext.request.contextPath}/jsp/framework/print/TabListEXP.jsp?tabId=DT1","modal":"3"});
	});
	//按钮绑定事件（清空）
    $("#btnClear").click(function() {
        $("#queryForm").clearFormResult();
        getNd();
    });
	
});

//页面默认参数
function init(){
	getNd();
	//生成json串
	var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
	//调用ajax插入
	defaultJson.doQueryJsonList(controllername+"?query",data,DT1);
}
//默认年度
function getNd(){
	//年度信息，里修改
	var y = new Date().getFullYear();
	$("#ZFRQ option").each(function(){
		if(this.value == y){
		 	$(this).attr("selected", true);
		 	return true;
		}
	});
}

//点击获取行对象
function tr_click(obj,tabListid){
	//alert(JSON.stringify(obj));
}

//回调函数--用于修改新增
getWinData = function(data){
	//var subresultmsgobj = defaultJson.dealResultJson(data);
	var data1 = defaultJson.packSaveJson(data);
	if(JSON.parse(data).ID == "" || JSON.parse(data).ID == null){
		defaultJson.doInsertJson(controllername + "?insert", data1,DT1);
	}else{
		defaultJson.doUpdateJson(controllername + "?update", data1,DT1);
	}
	
};

//详细信息
function rowView(index){
	$("#DT1").setSelect(index);
	if($("#DT1").getSelectedRowIndex()==-1)
	 {
		requireSelectedOneRow();
	    return
	 }
	$("#resultXML").val($("#DT1").getSelectedRow());
	//$(window).manhuaDialog({"title":"支付征收办>详细信息","type":"text","content":"${pageContext.request.contextPath }/jsp/business/zjgl/zfzsb-add.jsp?id="+id,"modal":"1"});
	$(window).manhuaDialog({"title":"支付征收办>详细信息","type":"text","content":"${pageContext.request.contextPath }/jsp/business/zjgl/zfzsb-add.jsp?type=detail","modal":"1"});
}
</script>
</head>
<body>
<app:dialogs/>
<div class="container-fluid">
	<p></p>
	<div class="row-fluid">
		<div class="B-small-from-table-autoConcise">
			<h4 class="title">
				支付征收办
				<span class="pull-right">  
					<button id="btnInsert" class="btn" type="button" style="font-family:SimYou,Microsoft YaHei;font-weight:bold;">新增</button>
      				<button id="btnUpdate" class="btn" type="button" style="font-family:SimYou,Microsoft YaHei;font-weight:bold;">修改</button>
      				<button id="btnExpExcel" class="btn" type="button" style="font-family:SimYou,Microsoft YaHei;font-weight:bold;">导出</button>
				</span>
			</h4>
			<form method="post" id="queryForm">
				<table class="B-table" width="100%">
					<!--可以再此处加入hidden域作为过滤条件 -->
					<TR style="display: none;">
						<TD class="right-border bottom-border"></TD>
						<TD class="right-border bottom-border">
							<INPUT type="text" class="span12" kind="text" id="num" fieldname="rownum" value="1000" operation="<="/>
						</TD>
					</TR>
					<!--可以再此处加入hidden域作为过滤条件 -->
					<tr>
						<td width="8%" class="right-border bottom-border">
							<select class="span12" type="date" fieldtype="date" fieldformat="yyyy" id="ZFRQ" name="ZFRQ" fieldname="ZFRQ" operation="=" kind="dic" src="XMNF"  defaultMemo="-年度-">
<%--							<select class="span12" type="date" fieldtype="date" fieldformat="yyyy" id="ZFRQ" name="ZFRQ" fieldname="ZFRQ" operation="=" kind="dic" src="T#GC_ZJGL_ZSZJ_ZFZSB: distinct TO_CHAR(zfrq, 'yyyy') as zfrq:TO_CHAR(zfrq, 'yyyy') AS x:SFYX='1' order by zfrq"></select>--%>
						</td>
						<th width="8%" class="right-border bottom-border">支付日期（起止）</th>
						<td width="35%" class="right-border bottom-border">
							<input id="ZFRQB" class="span5" type="date" fieldtype="date" autocomplete="off" placeholder="" name="ZFRQB" check-type="maxlength" maxlength="10" fieldname="ZFRQB" fieldformat="yyyy-MM-dd" operation=">="/>
							--
							<input id="ZFRQE" class="span5" type="date" fieldtype="date" autocomplete="off" placeholder="" name="ZFRQE" check-type="maxlength" maxlength="10" fieldname="ZFRQE" fieldformat="yyyy-MM-dd" operation="<="/>
						</td>
			            <td class="text-left bottom-border text-right">
	                        <button id="btnQuery" class="btn btn-link"  type="button" style="font-family:SimYou,Microsoft YaHei;font-weight:bold;"><i class="icon-search"></i>查询</button>
           					<button id="btnClear" class="btn btn-link" type="button" style="font-family:SimYou,Microsoft YaHei;font-weight:bold;"><i class="icon-trash"></i>清空</button>
			            </td>							
					</tr>
				</table>
			</form>
			<div style="height:5px;"> </div>	
			<div class="overFlowX">
	            <table width="100%" class="table-hover table-activeTd B-table" id="DT1" type="single"  pageNum="18">
	                <thead>
	                	<tr>
	                		<th  name="XH" id="_XH" style="width:10px" colindex=1 tdalign="center">&nbsp;#&nbsp;</th>
	                		<th fieldname="ZFRQ" colindex=2 tdalign="center" maxlength="10" hasLink="true" linkFunction="rowView">&nbsp;支付日期&nbsp;</th>
	                		<th fieldname="ZFJE" colindex=3 tdalign="center" maxlength="17">&nbsp;支付金额&nbsp;</th>
	                		<th fieldname="LXR" colindex=4 tdalign="center" maxlength="36">&nbsp;联系人&nbsp;</th>
							<th fieldname="LXFS" colindex=5 tdalign="center" maxlength="40">&nbsp;联系方式&nbsp;</th>
							<th fieldname="BLR" colindex=6 tdalign="center" maxlength="36">&nbsp;办理人&nbsp;</th>
							<th fieldname="BZ" colindex=5 tdalign="center" maxlength="40">&nbsp;备注&nbsp;</th>
	                	</tr>
	                </thead>
	              	<tbody></tbody>
	           </table>
	       </div>
	 	</div>
	</div>     
</div>
<div align="center">
	<FORM name="frmPost" method="post" style="display: none" target="_blank">
		<!--系统保留定义区域-->
		<input type="hidden" name="queryXML"/> 
		<input type="hidden" name="txtXML"/>
<%--		<input type="hidden" name="txtFilter" order="desc" fieldname="ZFRQ"/>--%>
		<input type="hidden" name="txtFilter" order="desc" fieldname="LRSJ"/>
		<input type="hidden" name="resultXML" id="resultXML"/>
		<!--传递行数据用的隐藏域-->
		<input type="hidden" name="rowData"/>
		<input type="hidden" name="queryResult" id="queryResult"/>
	</FORM>
</div>
</body>
</html>