<%@page contentType="text/html; charset=GBK"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String knowledgeid = request.getParameter("knowledgeid");
	String ktypeidstring = request.getParameter("ktypeid");
	Long ktypeid = Long.parseLong(ktypeidstring); 
	String sourcefilepath = request.getParameter("sourcefilepath");
	String dddd = "this11111111111.doc";
	System.out.println("------------------------====="+knowledgeid);
	System.out.println("------------------------====="+ktypeid);
	System.out.println("------------------------====="+sourcefilepath);
	System.out.println("-----------------------basePathbasePath-====="+basePath);
%>
<html>

<head>
	<link href="<%=basePath %>js/edo/res/css/edo-all.css" rel="stylesheet"
			type="text/css" />
	<link href="<%=basePath %>css/wenku.css" rel="stylesheet"
			type="text/css" />
	<link href="<%=basePath %>css/cims201.css" rel="stylesheet"
			type="text/css" />
	
	<script src="<%=basePath %>js/edo/edo.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/thirdlib/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/commontools/boxText.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/commontools/Window.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/commontools/PopupManager.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/cims201.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/utils.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/navigator/nav.js" type="text/javascript"></script>

	<script src="<%=basePath %>js/systemevent.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/commontools/commonTable.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/commontools/commonTree.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/tree/commontree.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/knowledge-list-table.js"
		type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/knowledge-util.js" type="text/javascript"></script>
	
	<!-- ���� -->	
	<script src="<%=basePath %>js/knowledge/knowledge_search.js"
		type="text/javascript"></script>
	<!-- �����ļ�Լ���� -->
	<script src="<%=basePath %>js/knowledge/knowledge_search_index.js"
		type="text/javascript"></script>
		<!-- avidm�������� -->
	<script src="<%=basePath %>js/knowledge/avidm_search.js"
		type="text/javascript"></script>
		<!-- standard�������� -->
	<script src="<%=basePath %>js/knowledge/standard_search.js"
		type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/standard-list-box.js" type="text/javascript"></script>
			
	<!-- ֪ʶչʾ -->
	<script src="<%=basePath %>js/commontools/starJudge.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/knowledge-view.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/question-view.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/knowledge-list-box.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/knowledge/knowledge-list-fulltext.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/tree/tree-util.js" type="text/javascript"></script>
	<!-- ����-->
	<script src="<%=basePath %>js/knowledge/borrow/borrowapprval.js" type="text/javascript"></script>
	<!-- ���� -->
	<script src="<%=basePath %>js/comment/comment-view.js" type="text/javascript"></script>
	
	
	<!-- ��ҳjs -->
	<script src="<%=basePath %>js/index.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/getComponentByIndex.js" type="text/javascript"></script>
  	<script src="<%=basePath %>js/tree/treeKnowledgePanel.js" type="text/javascript"></script>
  	<script src="<%=basePath %>js/system_index.js" type="text/javascript"></script>
  	
  	
  	<!-- ��Ϣ -->
  	<script type="text/javascript" src="<%=basePath %>js/dwr/chat.js"></script> 
  	<script type='text/javascript' src='<%=basePath %>dwr/interface/ChatManager.js'></script> 
    <script type='text/javascript' src='<%=basePath %>dwr/engine.js'></script> 
    <script type='text/javascript' src='<%=basePath %>dwr/util.js'></script> 
    
    <script src="<%=basePath %>js/message/message-list.js" type="text/javascript"></script>
  	
  	<script type="text/javascript">
  		//����Ӧ�õ�ȫ�ֱ���
  		//ϵͳ�û�
  		cims201User = null;
  		
  	</script>
	<script src="${ctx}/js/message/message.js" type="text/javascript"></script>
	<script src="${ctx}/js/message/message-bar.js" type="text/javascript"></script>
	<script src="${ctx}/js/message/chat-box.js" type="text/javascript"></script>
	
	<!-- ����֪ʶ -->
	<script src="<%=basePath %>js/user/roleuserselector.js" type="text/javascript"></script>	
	<script src="<%=basePath %>js/knowledge/approval/approval_new.js" type="text/javascript"></script>
	
	<!-- ֪ʶ�ʴ� -->
	<script src="<%=basePath %>js/question/answerrank.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/expertinput.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/experttreeinput.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/treeexpertlist.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/myanswerlist.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/questionsearch.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/waitedquestionlist.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/expertinfolist.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/question/questionFilter.js" type="text/javascript"></script>
	
		<!-- ��Ȥģ�� -->	
    <script src="<%=basePath %>js/interestmodel/interestmodellist.js" type="text/javascript"></script> 
    <script src="<%=basePath %>js/interestmodel/interestmodel.js" type="text/javascript"></script> 
    <script src="<%=basePath %>js/interestmodel/changeImCount.js" type="text/javascript"></script> 
    <script src="<%=basePath %>js/interestmodel/imknowledge-list-box.js" type="text/javascript"></script> 
	
	
	<!-- ͳ�Ʒ��� -->
	<script src="<%=basePath %>js/statistics/knowledgerank.js" type="text/javascript"></script>	
	<script src="<%=basePath %>js/statistics/userrank.js" type="text/javascript"></script>
	
	<!-- ϵͳ���� -->
	<script src="<%=basePath %>js/systemmanage/behaviormanage.js" type="text/javascript"></script>	

<title>
	�༭֪ʶ
</title>
<script>
var ntkoobj = null;
//var ntkoobj.filename=null;
function initDoc(docURL,filename){
	//�õ��ؼ��������
	ntkoobj = document.all("TANGER_OCX"); //"TANGER_OCX"����ҳ�е�NTKO OFFICE�ĵ��ؼ���ID
	if(null == ntkoobj)
	{
		alert("NTKO OFFICE�ĵ��ؼ�δ����ȷװ�ء����ڱ�ҳ��װ��ʱ�����Ϸ����ֵ���ʾ���ϵ����װActiveX�ؼ������������ֵİ�װActiveX�ĶԻ�����ѡ��'��'");
		return;
	}
	//���û�д���docURL���򴴽�һ��Word�ĵ�����
	if( (null == docURL) || (0 == docURL.length) )
	{
		
	}
	else //���򣬵���NTKO OFFICE�ĵ��ؼ���BeginOpenFromURL�����򿪷������ϵ��ĵ�
	{
		docURL=docURL+"?filename="+filename;
		ntkoobj.filename=filename;
		ntkoobj.OpenFromURL(docURL);
	}
	forbiddenMenu(ntkoobj);
}

	function forbiddenMenu(ntkoobj){
	
		ntkoobj.FileNew=false;
		ntkoobj.FileClose=false;
		ntkoobj.FileSaveAs=false;
		ntkoobj.FilePrint=false;
		ntkoobj.FilePrintPreview=false;
}




</script>

</head>

<body  onload='initDoc("${pageContext.request.contextPath}/knowledge/viewfile!docEdit.action","<%=sourcefilepath%>")'>


	<script src="${pageContext.request.contextPath}/js/knowledge/modify/jiazaizhengwen.js" ></script>
	<script language="JScript" for="TANGER_OCX" event="OnFileCommand(cmd,canceled)">
	//knowledge��file��ktypeid,knowledgeid
	var vktypeid = "<%=ktypeid%>";
	var vsourcefilepath = "<%=sourcefilepath%>";
	var vknowledgeid = "<%=knowledgeid%>";
	
		if (cmd == 3) //user has clicked on file save menu or button
		{
			var r=confirm("��ȷ�����棿")
			
			if(r==true){
				var t=confirm("����Ϊ�°汾��")
				if(t==true){
					TANGER_OCX.SaveToURL("${ctx}/knowledge/fileupload!uploadForModify.action","filepathTemp","isNewVersion=true");
					transKinfo(true,vktypeid,vsourcefilepath,vknowledgeid);
				}else if(t==false){
					TANGER_OCX.SaveToURL("${ctx}/knowledge/fileupload!uploadForModify.action","filepathTemp","isNewVersion=false&filename="+ntkoobj.filename);
					transKinfo(false,vktypeid,vsourcefilepath,vknowledgeid);
				}
	
				document.all("TANGER_OCX").CancelLastCommand = true;
			}else{
				document.all("TANGER_OCX").CancelLastCommand = true;
			}			
			
		}
		
	function transKinfo(isNewV,ktypeid,sourcefilepath,knowledgeid){
	alert("22==="+ktypeid);
				//��ȡ�����Ե�ƥ��
			var properties = getData('/caltks/knowledge/ktype/ktype!listKtypeProperty.action',{id:ktypeid});

			getData_Async('/caltks/knowledge/fileupload!getfileinfor.action', {
				filename : vsourcefilepath
			}, function(text) {
				alert(11);
				dproperty = Edo.util.Json.decode(text);			
				if (dproperty == '�ļ���ʽ��֧�ֽ���' || dproperty == 'û�н��������') {
					alert('�ļ���ʽ��֧�ֽ���,����֪ʶʧ��');

				} else {					
					getMatchedProperty(properties,dproperty,ktypeid,knowledgeid);				
				}				
				// ����flashת��action
				cims201.utils.getData_Async('fileupload!flashconvert.action', {
							filename : sourcefilepath
						}, function(text) {
							var converresult = Edo.util.Json.decode(text);
							if (converresult == 'ת���ɹ�') {
								alert("falshת���ɹ�");
							} else {
								alert("falshת��ʧ��");
							}						

						});

			});

		}		
	
		
// �ɼ��ļ��е����ݣ������޸�֪ʶ�����͵����Խ���ƥ��
function getMatchedProperty(properties,dproperty,ktypeid,knowledgeid) {
	var notequaltype = true;
	var resultList = new Array();
	if (null != properties && dproperty != null) {

		if (dproperty != '�ļ���ʽ��֧�ֽ���' && dproperty != 'û�н��������'
				&& dproperty != '') {
			// �ж��û�ѡ���֪ʶ���ͺͳ�ȡ����֪ʶ�����Ƿ�һ�£������һ�������û�
		
			// ���ε���������ֵ
			for (var i = 0; i < properties.length; i++) {

				for (j = 0; j < dproperty.length; j++) {
					
					if (dproperty[j].name == properties[i].description
							&& properties[i].isVisible) {
						var result = {};
						result.name = dproperty[j].name;
						result.value = dproperty[j].value;
						resultList[resultList.length] = result;
					}
				}

			}

		}
		var warn = cims201.utils.getData('/caltks/knowledge/knowledge!simpleupdate.action',{formvalue:resultList,id:knowledgeid,ktypeid:ktypeid});
		if(warn!=null){
			alert(warn);
		}

	} else {
		// if(selectedktype!="����֪ʶ")
		// {
		// //�����һ��ͨ����ǩû�г�ȡ��֪ʶ��������ڶ���ͨ������֪ʶ���ͳ�ȡ
		//		
		//		
		// }
	}

}

//ͨ��ajax���̨ȡ����
function getData(url,params){
//alert("util");
// �ӷ������˻�ȡ��������
	var data;
	Edo.util.Ajax.request({
		url : url,
		type : 'post',
		params : params,
		async : false,
		onSuccess : function(text) {
			// text���Ǵ�url��ַ��õ��ı��ַ���
			if(text == null || text == ''){
				data = null;
			}else{
		
				data = Edo.util.Json.decode(text);
			}			
		},
		onFail : function(code,a,b,c,d,e,f) {
			// code�����罻��������,��404,500֮��
			if(code=="500")
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : 'ϵͳ�ڲ������ǿ���������������������������ϵ����Ա',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});
			if(code=="403")
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : '��û��Ȩ�޸ò��������������������ϵ����Ա',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});
			if(code=="404")
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : 'ϵͳ����û���ҵ���ҳ��',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});				
			
			data = 'error'; 
		}
	});
	
	return data;
}

//ͨ��ajax���̨ȡ����,ͨ���첽��ʽ
function getData_Async(url,params,callback){
// �ӷ������˻�ȡ��������
	var data;
	Edo.util.Ajax.request({
		url : url,
		type : 'post',
		params : params,
		async : true,
		onSuccess : callback,
		onFail : function(code,a,b,c,d,e,f) {
			// code�����罻��������,��404,500֮��
			if(code=500)
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : 'ϵͳ�ڲ������ǿ���������������������������ϵ����Ա',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});
			if(code=403)
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : '��û��Ȩ�޸ò��������������������ϵ����Ա',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});
			if(code=404)
			    	Edo.MessageBox.show({
								title : '���棡',
								msg : 'ϵͳ����û���ҵ���ҳ��',
								buttons : Edo.MessageBox.CANCEL,
								callback : null,
								icon : Edo.MessageBox.WARNING
							});				
			
			data = 'error'; 
		}
	});
	
	return data;
}
	</script>
	
		
		

</body>

</html>



