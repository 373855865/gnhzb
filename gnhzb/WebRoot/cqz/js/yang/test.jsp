<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<title>环境化设计知识服务平台</title>
		
	</head>
	<body style="margin: 0px;  width: 100%; overflow:hidden;" scroll="no">
	</body>
</html>
  	
  	<script type="text/javascript">
  		//整个应用的全局变量
  		//系统用户
  		cims201User = null;
  		
  	</script>
     	<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/welcome.css">
		<link href="<%=basePath%>js/edo/res/css/edo-all.css" rel="stylesheet"
			type="text/css" />
		<link href="<%=basePath%>css/icon.css" rel="stylesheet"
			type="text/css" />

		<script src="<%=basePath%>js/edo/edo.js" type="text/javascript"></script>
		<script src="<%=basePath %>js/cims201.js" type="text/javascript"></script>
		<script src="<%=basePath%>js/utils.js" type="text/javascript"></script>	
	
	<!-- 统计分析 -->
	
	<!-- 系统管理 -->
		<!-- 本体编辑管理 -->
	<!--标准集成  -->
	
	
	
	<script type="text/javascript"><!--

 	//构建主体框架
 	var moduledata= cims201.utils.getData('http://localhost:8080/gnhzb/lca/lcamodule!getModuletree.action',{componentid:null});
    Edo.build(
    {
        type: 'app',
        render: document.body,
        //width: cims201.utils.getScreenSize().width,
        //height: cims201.utils.getScreenSize().height,
        //height: cims201.utils.getScreenSize().height+50,
        layout: 'horizontal',
        padding: [0,0,0,0],
        border: [0,0,0,0],
        //增加框架的元素
        children:[
	              {                
	            type: 'ct',
	            width: 180,
	            height: '100%',
	            collapseProperty: 'width',
	            enableCollapse: true,
	            splitRegion: 'west',
	            splitPlace: 'after',
	            children: [
	                {
                	    type: 'tree',
	   			        width: '100%',
	   			        height: '100%',
	   			        autoColumns:true,
	   			        headerVisible: false,
	   			        verticalLine:false,
	   			        horizontalLine:false,
	   			        id: 'moduletree',
	   			        enabelCellSelect: false,
				        autoColumns: true,
				        enableDragDrop: true,
				        showHeader: false,
				        onbeforetoggle: function(e){
				            var row = e.record;
				            var dataTree = this.data;                        
				            if(!row.children || row.children.length == 0){
				                //显示树形节点的loading图标,表示正在加载
				                this.addItemCls(row, 'tree-node-loading');
				                Edo.util.Ajax.request({
				                    //url: 'nodes.txt',
				                    url: 'http://localhost:8080/gnhzb/lca/lcamodule!getModuletree.action',
				                    params: {
				                        componentid: row.id   //传递父节点的Name(也可以是ID)
				                    },
				                    defer: 200,
				                    onSuccess: function(text){
				                   // alert(text);
				                        var data = Edo.util.Json.decode(text);
				                        dataTree.beginChange();
				                        if(!(data instanceof Array)) data = [data]; //必定是数组
				                        data.each(function(o){
				                            dataTree.insert(0, o, row);    
				                        });                    
				                        dataTree.endChange();    
				                    }
				                });
				            }
				            return !!row.children;
				        },
				        ondblclick:function(e){
				        	var r = this.getSelected();
				        	Edo.get('moduleview').set('src','http://localhost:8080/gnhzb/cqz/js/yang/lcamodulelook.jsp?moduleid='+r.id+'&componentid='+r.componentid);
				            Edo.get('modulename').set('text', r.name);
				        	Edo.get('createuserid').set('text', r.Createuserid);
				        	Edo.get('date').set('text', r.Createdate);
				        	Edo.get('note').set('text', r.Note);
				        	Edo.get('version').set('text', r.Version);
				        },
				        columns:[
				            {   
				                enableDragDrop: true,
				                dataIndex: "name"
				            
	                        }
				            ],
	                     data:moduledata
				           
	            }
	                ]
	        },
			        {
			    	    type: 'box',
			    	    width: '100%',
			    		height:'100%',
			    	    layout: 'vertical',
			    	    children:[
			    	       
			    	                {
			    	                    type: 'ct',
			    	                    id:'modulecontent',
			    	                    width: '100%',
			    	                    height: 150,
			    	                    enableCollapse: true,   //1)设置为可伸缩               
			    	                    splitRegion: 'north',   //2)设置调节方向
			    	                    splitPlace: 'after' ,
			    	                    children:[
			    	                              {
			    	                  	    	    type: 'box',
			    	                  	    	    width: '100%',
			    	                  	    		height:'33%',
			    	                  	    	    layout: 'horizontal',
			    	                  	    	    children:[
		    	                  	    	            {	type : 'formitem',label : '模型名称:',labelWidth : 100,labelAlign : 'center',
		    							               	    children : [{type : 'text',width : 200,id : 'modulename'}]
		    							               	},
				    					               	{	type : 'formitem',label : '模型创建人:',labelWidth : 100,labelAlign : 'center',
				    						               	    children : [{type : 'text',width : 200,id : 'createuserid'}]
				    						               	    }
			    	                  	    	              ]
			    	                              },
			    	                              {
				    	                  	    	    type: 'box',
				    	                  	    	    width: '100%',
				    	                  	    		height:'33%',
				    	                  	    	    layout: 'horizontal',
				    	                  	    	    children:[
														{	type : 'formitem',label : '创建时间:',labelWidth : 100,labelAlign : 'center',
															    children : [{type : 'text',width : 200,id : 'date'}]
															        } ,
														   {	type : 'formitem',label : '版本号:',labelWidth : 100,labelAlign : 'center',
														   	    children : [{type : 'text',width : 200,id : 'version'}]
														   	    } ,       
				    	                  	    	              ]
				    	                              },
			    	                              {
				    	                  	    	    type: 'box',
				    	                  	    	    width: '100%',
				    	                  	    		height:'33%',
				    	                  	    	    layout: 'horizontal',
				    	                  	    	    children:[
														{	type : 'formitem',label : '模型评分:',labelWidth : 100,labelAlign : 'center',
															    children : [{type : 'text',width : 200,id : 'score'}]
															    } ,
														{	type : 'formitem',label : '备注:',labelWidth : 100,labelAlign : 'center',
															    children : [{type : 'text',width : 200,id : 'note'}]
															    } 
				    	                  	    	              ]
				    	                              }
			    	                               
			    	                               ]
			    	                    	
			    	                    
			    	                }, 
	    	                {
			    	        	type: 'module',
			    	        	id:'moduleview',
			    	    		width: '100%',
			    	    		height:'100%'
			    	    		
	    	        }
	    	        
	    	       
	    	    ]
	    	}
	       
	    ]
	}
	       
        
        
        );
        	
</script>
