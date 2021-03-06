<!DOCTYPE html>
<html>
	<head>
		<%@ page language="java" pageEncoding="UTF-8"%>
		<%@ taglib uri="/tld/base.tld" prefix="app"%>
		<app:base />
		<title></title>
		<%	String nd = request.getParameter("nd");
			String proKey = request.getParameter("proKey");
		%>
		<style>
		.myCellSpan{
			background-color:#FF8888 ;
			width:100%;
			height:100%;
			display:inline-block;
			margin:0;
			padding:0;
		}
		</style>
		<script src="${pageContext.request.contextPath }/js/common/bootstrap.autocomplete.js"></script>
		<script type="text/javascript" charset="utf-8">
			//请求路径，对应后台RequestMapping
			var controllername= "${pageContext.request.contextPath }/bzjk/GcBzjkCommonController.do";
			var controllername1= "${pageContext.request.contextPath }/xdxmk/xdxmkController.do";
			g_bAlertWhenNoResult = false;
			var g_nd = '<%=nd%>';
			var g_proKey = '<%=proKey%>';
			var btnNum = 0;
			var objRow;
			
			//计算本页表格分页数
			function setPageHeight(){
				var getHeight=getDivStyleHeight();
				var height = getHeight-pageTopHeight-pageTitle-pageQuery-getTableTh(2)-pageNumHeight;
				var pageNum = parseInt(height/pageTableOne,10);
				$("#DT1").attr("pageNum",pageNum);
			}
			
			//页面初始化
			$(function() {
				setPageHeight();
				doInit();
				//按钮绑定事件（导出EXCEL）
				$("#btnExp").click(function() {
					  if(exportRequireQuery($("#DT1"))){//该方法需传入表格的jquery对象
					      printTabList("DT1");
					  }
				});
				//按钮绑定事件（查询）
				$("#btnQuery").click(function() {
					 doInit();
				});
				//按钮绑定事件（清空）
			    $("#btnClear").click(function() {
			        $("#queryForm").clearFormResult();
			    });
				//自动完成项目名称模糊查询
				showAutoComplete("QXMMC",controllername1+"?xmmcAutoCompleteToXmxdk","getXmmcQueryCondition"); 
			});
			//页面默认参数
			function doInit(){
				doSearch();
			}
			function doSearch(){
				var condNd = "";
				if(g_nd!=null&&g_nd!=""){
					condNd = "&nd="+g_nd;
				}
				var condProKey = "";
				if(g_proKey!=null&&g_proKey!=""){
					condProKey = "&proKey="+g_proKey;
				}
				var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
				defaultJson.doQueryJsonList(controllername+"?queryList_Kfg"+condNd+condProKey,data,DT1,null,false);
			}
			
			function tr_click(obj,tabId){
				var rowValue = $("#"+tabId).getSelectedRow();//获得选中行的json 字符串
				var tempJson = convertJson.string2json1(rowValue);//字符串转JSON对象
			}
			//项目名称自动模糊查询参数
			function getXmmcQueryCondition(){
				var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
				return data;
			}
			//详细信息
			function rowView(index){
				var obj = $("#DT1").getSelectedRowJsonByIndex(index);
				var id = convertJson.string2json1(obj).XMID;
				$(window).manhuaDialog(xmscUrl(id));
			}
			//标段图标样式
			function doBdmc(obj){
				if(obj.XMBS == "0"){
					return '<div style="text-align:center">—</div>';
				}else{
					return obj.BDMC;
				}
			}
		</script>
	</head>
	<body>
		<app:dialogs />
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="B-small-from-table-autoConcise">
					<h4 class="title">
						<span class="pull-right">
							<button id="btnExp" class="btn" type="button">
								导出
							</button>
						</span>
					</h4>
					<form method="post" id="queryForm">
						<table class="B-table" width="100%">
							<!--可以再此处加入hidden域作为过滤条件 -->
							<tr>
							  <th width="5%" class="right-border bottom-border text-right">项目名称</th>
					          <td class="right-border bottom-border" width="15%">
					          	<input class="span12" type="text" placeholder="" name="QXMMC"
									fieldname="T.XMMC" operation="like" id="QXMMC" autocomplete="off"
									tablePrefix="T"/>
							  </td>
							    <th width="5%" class="right-border bottom-border text-right">标段名称</th>
					          <td class="right-border bottom-border" width="15%">
					          	<input class="span12" type="text" placeholder="" name="BDMC"
									fieldname="T.BDMC" operation="like" id="BDMC" />
							  </td>
							    <th width="5%" class="right-border bottom-border text-right">项目性质</th>
					          <td class="right-border bottom-border" width="10%">
					          	  <select class="span12" id="XJXJ" name = "XJXJ" fieldname="T.XMXZ"  defaultMemo="全部" operation="="  kind="dic" src="XMXZ">
					              </select>
							  </td>
						      <th width="5%" class="right-border bottom-border text-right">项目管理公司</th>
					          <td class="right-border bottom-border" width="10%">
					            <select class="span12" id="XMGLGS" name = "XMGLGS" fieldname="T.XMGLGS"  defaultMemo="全部" operation="="  kind="dic" src="T#VIEW_YW_XMGLGS:ROW_ID:BMJC">
					             </select>
							  </td>
							     <td class="text-left bottom-border text-right">
					           		<button id="btnQuery" class="btn btn-link"  type="button"><i class="icon-search"></i>查询</button>
					           		<button id="btnClear" class="btn btn-link" type="button"><i class="icon-trash"></i>清空</button>
					          	</td>
							</tr>
							<!--可以再此处加入hidden域作为过滤条件 -->
						</table>
					</form>
					<div style="height: 5px;">
					</div>
					<div class="overFlowX">
						<table class="table-hover table-activeTd B-table" id="DT1" width="100%" type="single" printFileName="项目详细列表">
							<thead>
				             <tr>
								<th name="XH" id="_XH" rowspan="2" colindex=1>&nbsp;#&nbsp;</th>
								<th fieldname="XMMC" rowspan="2" colindex=2 maxlength="15" rowMerge="true">&nbsp;项目名称&nbsp;</th>
								<th fieldname="BDMC" rowspan="2" colindex=3 CustomFunction="doBdmc">&nbsp;标段名称&nbsp;</th>
								<th fieldname="XMBDDZ" rowspan="2" colindex=4 maxlength="15">&nbsp;项目地址&nbsp;</th>
								<th fieldname="XMXZ" rowspan="2" colindex=5 tdalign="center">&nbsp;项目性质&nbsp;</th>
								<th fieldname="JSMB" rowspan="2" colindex=6 maxlength="15">&nbsp;年度目标&nbsp;</th>
								<th fieldname="XMGLGS" rowspan="2" colindex=7>&nbsp;项目管理公司&nbsp;</th>
								<th colspan="3">&nbsp;监理&nbsp;</th>
								<th colspan="3">&nbsp;施工&nbsp;</th>
								<th fieldname="LJJLSDZ" rowspan="2" colindex=14 tdalign="right">&nbsp;累计计量值&nbsp;</th>
								<th colspan="2">&nbsp;开（复）工时间&nbsp;</th>
								<th colspan="2">&nbsp;完工时间&nbsp;</th>
							</tr>
							<tr>
								<th fieldname="JLDW" colindex=8 maxlength="15">&nbsp;监理单位&nbsp;</th>
								<th fieldname="JLZHTQDJ" colindex=9 tdalign="right">&nbsp;合同额&nbsp;</th>
								<th fieldname="JLZHTZF" colindex=10 tdalign="right">&nbsp;已支付&nbsp;</th>
								<th fieldname="SGDW" colindex=11 maxlength="15">&nbsp;施工单位&nbsp;</th>
								<th fieldname="SGZHTQDJ" colindex=12 tdalign="right">&nbsp;合同额&nbsp;</th>
								<th fieldname="SGZHTZF" colindex=13 tdalign="right">&nbsp;已支付&nbsp;</th>
								<th fieldname="KGSJ" colindex=15 tdalign="center">&nbsp;计划&nbsp;</th>
								<th fieldname="SJKGSJ" colindex=16 tdalign="center">&nbsp;实际&nbsp;</th>
								<th fieldname="WGSJ" colindex=17 tdalign="center">&nbsp;计划&nbsp;</th>
								<th fieldname="SJWGSJ" colindex=18 tdalign="center">&nbsp;实际&nbsp;</th>
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
			<FORM name="frmPost" method="post" style="display: none"
				target="_blank">
				<!--系统保留定义区域-->
				<input type="hidden" name="queryXML" id="queryXML">
				<input type="hidden" name="txtXML" id="txtXML">
				<input type="hidden" name="ywid" id="ywid">
				<input type="hidden" name="txtFilter" order="asc"
					fieldname="Z.XMID,Z.PXH" id="txtFilter">
				<input type="hidden" name="resultXML" id="resultXML">
				<input type="hidden" name="queryResult" id = "queryResult">
				<!--传递行数据用的隐藏域-->
				<input type="hidden" name="rowData">
			</FORM>
		</div>
	</body>
</html>