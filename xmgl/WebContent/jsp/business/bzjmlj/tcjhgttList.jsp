<!DOCTYPE html>
<html>
	<head>
		<%@ page language="java" pageEncoding="UTF-8"%>
		<%@ taglib uri="/tld/base.tld" prefix="app"%>
		<app:base />
		<title></title>
		<%	String nd = request.getParameter("nd");
			String xmlx = request.getParameter("xmlx");
			String flag = request.getParameter("flag");
			String tiaojian = request.getParameter("tiaojian");
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
			var g_xmlx = '<%=xmlx%>';
			var g_flag='<%=flag%>';
			var g_tiaojian = '<%=tiaojian%>';
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
			        $("#SGJLDW").val('');
			    });
				//自动完成项目名称模糊查询
				showAutoComplete("QXMMC",controllername1+"?xmmcAutoCompleteToXmxdk","getXmmcQueryCondition"); 
			});
			//项目名称自动模糊查询参数
			function getXmmcQueryCondition(){
				var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
				return data;
			}
			//页面默认参数
			function doInit(){
					doSearch();
			}
			function doSearch(){
				var condNd = "";
				if(g_nd!=null&&g_nd!=""){
					condNd = "&nd="+g_nd;
				}
				var condTiaojian = "";
				if(g_tiaojian!=null&&g_tiaojian!=""){
					condTiaojian = "&tiaojian="+g_tiaojian;
				}
				var condXMLX = "";
				if(g_xmlx!=null&&g_xmlx!=""){
					condXMLX = "&xmlx="+g_xmlx;
				}
				var condFLAG = "";
				if(g_flag!=null&&g_flag!=""){
					condFLAG = "&flag="+g_flag;
				}
				var data = combineQuery.getQueryCombineData(queryForm,frmPost,DT1);
				defaultJson.doQueryJsonList(controllername+"?querytcjhgtt"+condTiaojian+condNd+condXMLX+condFLAG,data,DT1,null,false);
			}
			function tr_click(obj,tabId){
				var rowValue = $("#"+tabId).getSelectedRow();//获得选中行的json 字符串
				var tempJson = convertJson.string2json1(rowValue);//字符串转JSON对象
			}
			//详细信息
			function rowView(index){
				var obj = $("#DT1").getSelectedRowJsonByIndex(index);
				var id = convertJson.string2json1(obj).XMID;
				$(window).manhuaDialog(xmscUrl(id));
			}
			//判断是否是项目
			function doBdmc(obj){
				  var bd_name=obj.BDMC;
				  if(bd_name==null||bd_name==""){
					  return '<div style="text-align:center">—</div>';
				  }else{
					  return bd_name;			  
				  }
			}
			//判断是否是项目
			function doBdbh(obj){
				  var bd_name=obj.BDBH;
				  if(bd_name==null||bd_name==""){
					  return '<div style="text-align:center">—</div>';
				  }else{
					  return bd_name;			  
				  }
			}

			//修改计划执行名称
			function rename(obj)
			{
				var isxd = obj.CJXMSX;
				if(isxd=='1')
				{
					return "年初计划";
				}
				else
				{
					return "追加计划";
				}	
			}
			 //标段名称
			 function doBdmc(obj){
				  var bd_name=obj.BDMC;
				  if(bd_name==null||bd_name==""){
					  return '<div style="text-align:center">—</div>';
				  }else{
					  return bd_name;			  
				  }
			  }
			//设置甘特图字段样式
			 function doGtt(obj){
			 	var id = obj.GC_JH_SJ_ID;
			 	var jhbzid = obj.GC_XMGLGS_XXJD_JHBZ_ID;
			 	var bz_xmlx=obj.BZ_XMLX;
			 	return "<div style=\"text-align:center\"><a href=\"javascript:void(0);\"><i title=\"查看甘特图\" class=\"icon-tasks\" onclick=\"showGtt('"+id+"','"+jhbzid+"','"+bz_xmlx+"')\"></i></a></div>";
			 }
			//甘特图
			 function showGtt(id, jhbzid,bz_xmlx){
			 	if(jhbzid == "") {
			 		requireFormMsg("此项目还未编制形象进度!");
			 	} else {
			 		if(bz_xmlx=="")
			 		{
			 			return;
			 		}
			 		else
			 		{
			 			$(window).manhuaDialog({"title":"项目甘特图","type":"text","content":"${pageContext.request.contextPath}/jsp/business/xmglgs/xxjd/xxjd_gtt.jsp?id="+id,"modal":"1"});
			 		}	
			 	}
			 }
		</script>
	</head>
	<body>
		<app:dialogs />
		<div class="container-fluid">
			<p></p>
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
							<tr>
							  <th width="5%" class="right-border bottom-border text-right">项目名称</th>
					          <td class="right-border bottom-border" width="15%">
					          	<input class="span12" type="text" placeholder="" name="QXMMC"
									fieldname="A.XMMC" operation="like" id="QXMMC" autocomplete="off"
									tablePrefix="A"/>
							  </td>
							      <th width="5%" class="right-border bottom-border text-right">项目性质</th>
					          <td class="right-border bottom-border" width="10%">
					          	  <select class="span12" id="XJXJ" name = "XJXJ" fieldname="A.XJXJ"  defaultMemo="全部" operation="="  kind="dic" src="XMXZ">
					              </select>
							  </td>
							       <th width="5%" class="right-border bottom-border text-right">项目类型</th>
					          <td class="right-border bottom-border" width="10%">
					          	  <select class="span12" id="XMLX" name = "XMLX" fieldname="A.XMLX"  defaultMemo="全部" operation="="  kind="dic" src="XMLX">
					              </select>
							  </td>
						      <th width="5%" class="right-border bottom-border text-right">项目管理公司</th>
					          <td class="right-border bottom-border" width="10%">
					            <select class="span12" id="XMGLGS" name = "XMGLGS" fieldname="A.XMGLGS"  defaultMemo="全部" operation="="  kind="dic" src="T#VIEW_YW_XMGLGS:ROW_ID:BMJC">
					             </select>
							  </td>
								<th class="right-border bottom-border text-right">施工、监理单位  </th>
					            <td class="right-border bottom-border">
					          		<input class="span12" type="text"   name="QXMMC"  operation="like" id="SGJLDW"  />
							 	 </td>
							     <td class="text-left bottom-border text-right">
					           		<button id="btnQuery" class="btn btn-link"  type="button"><i class="icon-search"></i>查询</button>
					           		<button id="btnClear" class="btn btn-link" type="button"><i class="icon-trash"></i>清空</button>
					          	</td>
							</tr>
						</table>
					</form>
					<div style="height: 5px;">
					</div>
					<div class="overFlowX">
						<table class="table-hover table-activeTd B-table" id="DT1" width="100%" type="single" printFileName="项目详细列表">
							<thead>
				          	<tr>
								<th name="XH" id="_XH" rowspan="2" colindex=1>&nbsp;#&nbsp;</th>
								<th fieldname="XMMC" rowspan="2" colindex=2 CustomFunction="doGtt" noprint="true">甘特图</th> 
								<th fieldname="XMMC" rowspan="2" colindex=3  rowMerge="true" maxlength="15">&nbsp;项目名称&nbsp;</th>
								<th fieldname="BDMC" rowspan="2" colindex=4  Customfunction="doBdmc" >&nbsp;标段名称&nbsp;</th>	
								<th fieldname="XMDZ" rowspan="2" colindex=5 maxlength="10">&nbsp;建设位置&nbsp;</th>	
								<th fieldname="XJXJ" rowspan="2" colindex=6 tdalign="center">&nbsp;项目性质&nbsp;</th>
								<th fieldname="JSMB" rowspan="2" colindex=7 maxlength="15">&nbsp;年度目标&nbsp;</th>
								<th fieldname="XMLX" rowspan="2" colindex=8 maxlength="15">&nbsp;项目类型&nbsp;</th>
								<th fieldname="XMGLGS"  rowspan="2" colindex=9 maxlength="10"  >&nbsp;项目管理公司&nbsp;</th>
								<th fieldname="ISBT"  rowspan="2" colindex=10 tdalign="center">&nbsp;BT&nbsp;</th>
								<th fieldname="JSNR"  rowspan="2" colindex=11 maxlength="10" >&nbsp;建设内容及规模&nbsp;</th>
								<th fieldname="SGDW"  rowspan="2" colindex=12 tdalign="center"  >&nbsp;施工单位&nbsp;</th>
								<th fieldname="JLDW"  rowspan="2" colindex=13 tdalign="center"  >&nbsp;监理单位&nbsp;</th>
								<th fieldname="KGSJ_SJ"  rowspan="2" colindex=14 tdalign="center"  >&nbsp;开工日期&nbsp;</th>
								<th fieldname="WGSJ_SJ"  rowspan="2" colindex=15 maxlength="10" tdalign="center">&nbsp;完工日期&nbsp;</th>
								<th colspan="4">年度总投资额（元）</th>
							 </tr>
							<tr>
									<th fieldname="GC" colindex=16 tdalign="right">工程</th>
									<th fieldname="ZC" colindex=17 tdalign="right">征拆</th>
									<th fieldname="QT" colindex=18 tdalign="right">其他</th>
									<th fieldname="JHZTZE" colindex=19 tdalign="right">合计</th>
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