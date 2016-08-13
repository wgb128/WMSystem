<!DOCTYPE html>
<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri= "/tld/base.tld" prefix="app" %>
<%@ page import="com.ccthanking.framework.util.DateTimeUtil" %>
<%
	String qsrq = DateTimeUtil.getDateTime(DateTimeUtil.getMonthFirstDay(DateTimeUtil.getNow()), "yyyy-MM-dd");
	String jsrq = DateTimeUtil.getDateTime(DateTimeUtil.getNow(), "yyyy-MM-dd");
%>
<app:base/>
<title>实例页面-登录日志查询</title>

<script type="text/javascript" charset="UTF-8">
 var id;
  var controllername= "${pageContext.request.contextPath }/logController.do";
	$(function() {
		var btn = $("#example1");
		btn.click(function() {
			var loginTime = $("#loginTime").val();
			var loginTime_ = $("#loginTime_").val();
            if(loginTime!=""&&loginTime_!=""){
            	if(loginTime>loginTime_){
            		xAlert("信息提示","登录起始时间不能大于终止时间！",'3');
            		return;
            	}
            }
	        //生成json串
			var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
			//调用ajax插入
			defaultJson.doQueryJsonList(controllername+"?queryLogin",data,DT1);
		});
	});

  	//计算本页表格分页数
  	function setPageHeight(){
  		var height = g_iHeight-pageTopHeight-pageTitle-pageQuery-getTableTh(1)-pageNumHeight;
  		var pageNum = parseInt(height/pageTableOne,10);
  		$("#DT1").attr("pageNum",pageNum);
  	}
  	
	//页面默认参数
	$(document).ready(function() {
		$("#loginTime").val("<%=qsrq %>");
		$("#loginTime_").val("<%=jsrq %>");
		setPageHeight();
        //生成json串
        g_bAlertWhenNoResult = false;
		var data = combineQuery.getQueryCombineData(queryForm,frmPost, DT1);
		//调用ajax插入
		defaultJson.doQueryJsonList(controllername+"?queryLogin", data, DT1);
        g_bAlertWhenNoResult = true;
	});
	
	// 清除表单
	$(function() {
		$("#query_clear").click(function() {
	       $("#queryForm").clearFormResult();
		});
	    //导出
/* 	    $("#btnExpExcel").click(function() 
	       {
	    	if(exportRequireQuery($("#DT1"))){//该方法需传入表格的jquery对象
				printTabList("DT1");
			}
	   	}); */
	    

	    //按钮绑定事件（导出）
		$("#btnExpExcel").click(function() {
			if(exportRequireQuery($("#DT1"))){//该方法需传入表格的jquery对象
				doCustomExportExcel("DT1","dlrz.xls","USERID,UERNAME,LOGINTIME,USERDEPTID,LOGINIP","2,1","/logController.do","queryExportLogin"); 
			}
		});
	});
	
	function tr_click(obj,tabListid){
		//$("#queryForm").setFormValues(obj);
		
		//obj为行数据的json 对象，可以通过obj.XMMC获得选中行的项目名称
		var rowindex = $("#DT1").getSelectedRowIndex();//获得选中行的索引
		var rowValue = $("#DT1").getSelectedRow();//获得选中行的json对象
		id = obj.LOGINID;
	}


	//双击事件
	function tr_dbclick(){
	//	 $(window).manhuaDialog({"title":"操作日志详细信息","type":"text","content":"${pageContext.request.contextPath}/jsp/framework/system/log/log_operation.jsp?id="+id,"modal":"1"});
	}
</script>      
</head>
<body>
<app:dialogs/>
<div class="container-fluid">

  <p></p>

  <div class="row-fluid">
		<div class="B-small-from-table-autoConcise">
			<h4 class="title">登录日志查询
			<span class="pull-right"> 
				 <button id="btnExpExcel" class="btn"  type="button">导出</button>
			</span>
			</h4>
     <form method="post" id="queryForm"  >
      <table class="B-table" width="100%">
      <!--可以再此处加入hidden域作为过滤条件 -->
      	<TR  style="display:none;">
	        <TD class="right-border bottom-border"></TD>
			<TD class="right-border bottom-border">
			<%-- 	<input type="text" class="span12" kind="text"  fieldname="rownum"  value="10000" operation="<=" > --%>
			</TD>
        </TR>
        <!--可以再此处加入hidden域作为过滤条件 -->
        <tr>
          <th width="5%" class="right-border bottom-border text-right">用户登录名</th>
          <td width="15%" class="right-border bottom-border">
          	<input class="span12" type="text" placeholder="" name = "userId" fieldname = "USERID" operation="like" logic = "and" ></td>
          <th width="5%" class="right-border bottom-border text-right">用户姓名</th>
          <td width="15%" class="bottom-border">
          	<input class="span12" type="text" placeholder="" name = "userName" fieldname = "UERNAME" operation="like" logic = "and" ></td>
          <th width="5%" class="right-border bottom-border text-right">登录时间</th>
          <td width="10%" class="right-border bottom-border">
          	<input class="span12" type="date" placeholder="" id="loginTime" name = "loginTime" fieldname = "LOGINTIME" operation=">=" logic = "and"  fieldtype="date" fieldformat="YYYY-MM-DD"></td>
          <th width="3%" class="right-border bottom-border">至</th>
          <td width="10%" colspan="2" class="bottom-border">
          	<input class="span12" type="date" placeholder="" id="loginTime_" name = "loginTime" fieldname = "LOGINTIME" operation="<="  logic="and"  fieldtype="date" fieldformat="YYYY-MM-DD"></td>
          
			<td width="22%"  class="text-left bottom-border text-right">
				<button	id=example1 class="btn btn-link" type="button"><i class="icon-search"></i>查询</button>
                <button id="query_clear" class="btn btn-link" type="button"><i class="icon-trash"></i>清空</button>
            </td>
        </tr>
        <tr>
          </tr>
      </table>
      </form>
	<div style="height:5px;"> </div>		
	<div class="overFlowX"> 
           <table width="100%" class="table-hover table-activeTd B-table" id="DT1"   printFileName="登录日志" type="single">
                <thead>
                    <tr>
                    <th name="XH" id="_XH" width="3%">#</th>
                    <th fieldname="USERID" id="USERID" colindex=1>&nbsp;用户登录名&nbsp;</th>
					<th fieldname="UERNAME" colindex=2>&nbsp;用户姓名&nbsp;</th>
					<th fieldname="LOGINTIME"  fieldformat="YYYY-MM-DD" colindex=3 tdalign="center" width="10%">&nbsp;登录时间&nbsp;</th>
					<th fieldname="USERDEPTID" colindex=5>&nbsp;用户单位&nbsp;</th>
					<th fieldname="LOGINIP" colindex=6 tdalign="center">&nbsp;用户登录IP&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            
</div>
    </div>
  </div>	
    
</div>

  <div align="center">
 	<FORM name="frmPost" method="post" style="display:none" target="_blank" id ="frmPost">
		 <!--系统保留定义区域-->
         <input type="hidden" name="queryXML" id = "queryXML">
         <input type="hidden" name="txtXML" id = "txtXML">
         <input type="hidden" name="txtFilter"  order="desc" fieldname = "LOGINTIME"	id = "txtFilter">
         <input type="hidden" name="resultXML" id = "resultXML">
         <input type="hidden" name="queryResult" id = "queryResult">
       		 <!--传递行数据用的隐藏域-->
         <input type="hidden" name="rowData">
		
 </FORM>
 </div>
</body>
</html>