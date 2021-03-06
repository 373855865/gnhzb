var moduleobj={
		versionid:null,
		modulename:null,
		modulenote:null,
	    moduletype:null,
	    style:null
		}
var basepathh='http://localhost:8080/gnhzb';
var cell=null;
var levelmodule=null;

function gettoolbar(id,func){
    var toolbar = Edo.create(
    {type: 'ct',
    cls: 'e-dialog-toolbar',
    width: '100%',
    layout: 'horizontal',
    height: 30,
    horizontalAlign: 'center',
    verticalAlign: 'middle',
    horizontalGap: 10,
    children: [
               
        {
            type: 'button',
            text: '确定',
            minWidth: 70,
            onclick: function(e){
            if(func==undefined){
            }else{
            func(id);
            }
            this.parent.parent.parent.destroy();
            }
        },{
            type: 'button',
            text: '取消',
            minWidth: 70,
            onclick: function(e){
            this.parent.parent.parent.destroy();

            }
        }
    ]
});
return toolbar;
}
function refreshdata(dataTable,url,param,id){
    var data= cims201.utils.getData(url,param);
	dataTable.set('data',data);
}

function getmoduleprocessdefinebox(cell){
	var box=Edo.create(
			{type: 'box',id:'moduleprocessbox',width: '100%',border: [0,0,0,0],padding: [20,0,0,0],layout: 'vertical',verticalGap:'20',
           	    children: [
					{	type : 'formitem',label : '执行模块:',labelWidth : 100,labelAlign : 'right',layout: 'horizontal',
						    children : [{type : 'text',width : 200,id : 'tasktreenodeid',text:levelmodule.levelmoduleobject.tasktreenodeid,visible:false},{type : 'text',width : 200,id : 'tasktreenodename',text:levelmodule.levelmoduleobject.tasktreenodename},
						                {type : 'button',text:'请选择模块',
										   	onclick: function(e){
										   	var roledataTable = new Edo.data.DataTable()
												.set({
												    fields: [
												        {name: 'id', mapping: 'id', type: 'string'
												           
												        },
												        {name: 'name', mapping: 'name',  type: 'string'
												        }
												    ]
												});
										   	var tasktreeTable = new Edo.data.DataTree()
										   	.set({
										   	    fields: [
										   	        {name: 'id', mapping: 'id', type: 'string'
										   	           
										   	        },
										   	        {name: 'name', mapping: 'name',  type: 'string'
										   	        }
										   	    ]
										   	});
											var url=basepathh+'/department/department!getOperationRoles.action';
											var param={};
											var id='role';
											refreshdata(roledataTable,url,param,id);
												var box=Edo.create(
												{type: 'box',width: '100%',height:'100%',layout: 'horizontal',
												children:[
													{
												type:'box',
												height: '100%',
												layout:'vertical',
												children:[	
											        {		
													id: 'role', type: 'table', width: '100%', height: '100%',autoColumns: true,
													padding:[0,0,0,0],
													rowSelectMode : 'single',
													columns:[{
														 headerText: '',
														 align: 'center',
														 width: 10,                        
														 enableSort: false,
														 enableDragDrop: true,
														 enableColumnDragDrop: false,
														 style:  'cursor:move;',
														 renderer: function(v, r, c, i, data, t){
														 return i+1;}},
														 {header:'权限名称',dataIndex: 'name', width: '100',headerAlign: 'center',align: 'center'}
														 ],
										             data:roledataTable,
										             onselectionchange: function(e){	
										            	 var r=role.getSelected();
										            	   if(r!=null){
										            	   var data= cims201.utils.getData(basepathh+'/tasktree/tasktree!getTaskTreebyRole.action',{role:r.id});
										            	   tasktreeTable.set('data',data);
													}}}]},
											      
											   		{
										   			id: 'tasktree',
										   			type: 'tree',
													width: '260',
											        height: '100%',
											        headerVisible: false,
											        autoColumns: true,
											        horizontalLine: false,
													padding:[0,0,0,0],
												    rowSelectMode : 'single',
												    columns:[
										                 {header:'名称',dataIndex: 'name', width: '100',headerAlign: 'center',align: 'center'}
										                 ],
										             data:tasktreeTable
											   		}
													]})
										   	    var func=function(){
										   	
										    	var row=Edo.get('tasktree').getSelected();
										        Edo.get('tasktreenodename').set('text',row.name);
										        Edo.get('tasktreenodeid').set('text',row.id);
										       }
										    var toolbar=new gettoolbar(null,func);
										    var winfm=getmywin(400,400,'选择功能模块',[box,toolbar]);
										    winfm.show('center', 'middle', true);
											}}]
						    },
           	    {	type : 'formitem',label : '模块名称:',labelWidth : 100,labelAlign : 'right',
           	    children : [{type : 'text',width : 200,id : 'processname',text:levelmodule.levelmoduleobject.processname}]
           	    },
           	    {	type : 'formitem',label : '执行顺序（设置数值）:',labelWidth : 100,labelAlign : 'right',
               	    children : [{type : 'text',width : 200,id : 'orderid',text:levelmodule.levelmoduleobject.orderid}]
               	    },
           
           	 {	type : 'formitem',label : '知识领域:',labelWidth : 100,labelAlign : 'right',layout: 'horizontal',
               	    children : [{type : 'text',width : 200,id : 'categorynames',text:levelmodule.levelmoduleobject.categorynames},
							{type : 'button',text:'请选择知识域',
							   	onclick: function(e){
									var box=Edo.create(
									{type: 'box',width: '100%',height:'100%',layout: 'horizontal',
									children:[
								        {		
										id: 'categorytable', type: 'table', width: '100%', height: '100%',
										padding:[0,0,0,0],
										rowSelectMode : 'multi',
										columns:[{
											 headerText: '',
											 align: 'center',
											 width: 10,                        
											 enableSort: false,
											 enableDragDrop: true,
											 enableColumnDragDrop: false,
											 style:  'cursor:move;',
											 renderer: function(v, r, c, i, data, t){
											 return i+1;}},
											 Edo.lists.Table.createMultiColumn(),
											 {header:'知识域名称',dataIndex: 'name', width:200,headerAlign: 'center',align: 'center'}
											 ],
							             data:[
										        {
										        	id:121,name:'市场分析'
										        },
										        {
										        	id:122,name:'零件分类'
										        },
										        {
										        	id:123,name:'方案设计'
										        },
										        {
										        	id:124,name:'结构设计'
										        },
										        {
										        	id:125,name:'系列化设计'
										        },
										        {
										        	id:126,name:'编码规则'
										        },
										        {
										        	id:127,name:'事物特性表'
										        },
										        {
										        	id:128,name:'模块优化'
										        },
										        {
										        	id:129,name:'配置设计'
										        },
										        {
										        	id:130,name:'变型设计'
										        }
										        
										        
										        ]/*,
							             onselectionchange: function(e){	
							            	 var r=role.getSelected();
							            	  
										}*/}]
										})
							   	    var func=function(){
							    	var rows=Edo.get('categorytable').getSelecteds();
							    	var categorynames='';
							    	var catgorylist=new Array();
							    	for(var i=0;i<rows.length;i++)
						    		{
							    		catgorylist.push(rows[i].id);
							    		categorynames=categorynames+rows[i].name+";"
						    		}
							    	categorynames=categorynames.substr(0,categorynames.length-1)
							        Edo.get('categorynames').set('text',categorynames);
							    	alert(catgorylist)
							    	levelmodule.levelmoduleobject.knowledgecategorylist=catgorylist;
							    	levelmodule.levelmoduleobject.categorynames=categorynames;
							       }
							    var toolbar=new gettoolbar(null,func);
							    var winfm=getmywin(300,200,'选择功能模块',[box,toolbar]);
							    winfm.show('center', 'middle', true);
								}}/*,
               	                
               	                
               	                {
						type : 'combo',
						width : 200,
						id:'category',
						selectedIndex:(index==null)? null:index,
						displayField : 'name',
						valueField : 'id',
						data : [
						        {
						        	id:121,name:'市场分析'
						        },
						        {
						        	id:122,name:'零件分类'
						        },
						        {
						        	id:123,name:'方案设计'
						        },
						        {
						        	id:124,name:'结构设计'
						        },
						        {
						        	id:125,name:'系列化设计'
						        },
						        {
						        	id:126,name:'编码规则'
						        },
						        {
						        	id:127,name:'事物特性表'
						        },
						        {
						        	id:128,name:'模块优化'
						        },
						        {
						        	id:129,name:'配置设计'
						        },
						        {
						        	id:130,name:'变型设计'
						        },
						        
						        
						        ],
				        onselectionchange:function(e){  
				        	for(var s in e){
				        		alert(s)
				        		alert(e[s])
				        	}
				        	 
				        	 var r=this.data.getAt(this.data.indexOf(e.selectedItem)+1)
				        	 this.data.select(r)
				        	alert(this.data.indexOf(this.selectedItem))
                    
                        }
               	    
					}*/]
               	    },
           	 {	type : 'formitem',label : '输入:',labelWidth : 100,labelAlign : 'right',
               	    children : [{type : 'text',width : 200,id : 'input',text:levelmodule.levelmoduleobject.input}]
               	    },
           	 {	type : 'formitem',label : '输出:',labelWidth : 100,labelAlign : 'right',
               	    children : [{type : 'text',width : 200,id : 'output',text:levelmodule.levelmoduleobject.output}]
               	    },
           	 {	type : 'formitem',label : '文件上传:',labelWidth : 100,labelAlign : 'right',
               	    children : [{
					    id: 'pdmfileuploader',
					    type: 'fileupload',
					    textVisible : false,
					    width: 200,
					    swfUploadConfig : { // swfUploadConfig配置对象请参考swfupload组件说明
					
							upload_url : basepathh+'/lca/lcamodule!fileupload.action', // 上传地址
							flash_url : 'js/swfupload/swfupload.swf',
							flash9_url : " js/swfupload/swfupload_fp9.swf",
							button_image_url : 'js/swfupload/XPButtonUploadText_61x22.png', // 按钮图片地址
							file_types : '*.doc;*.docx', // 上传文件后缀名限制
							file_post_name : 'file', // 上传的文件引用名
							file_size_limit : '5000000',
							post_params : {
								'uploadDir' : 'uploadDir'
							}
						},
					    onfilequeueerror: function(e){
					        alert("文件选择错误:"+e.message);
					    },
					    onfilequeued: function(e){
					    	for(i in e.file ){
					    		/*  alert(i);           //获得属性 
					    		  alert(e.file[i]);  //获得属性值
*/								    		}
					    	var a=false;
					    	var newrow={name:e.filename};
					    	choosenfiletable.data.each(function(o, i){
		                        if(o.name == e.filename) {
		                        	alert('重复上传');
		                        	a=true;
		                        }
		                        	
		                    });
		                    if(a){
		                    	return null;
		                    }
					    	choosenfiletable.data.insert(0, newrow);
					    	choosenfiletable.data.insert(knowledgetable.data.source.length, newrow);
					    	//alert(e.filename); 
					    	var ppp = lcauploader.upload;
							ppp.startUpload();
					
					    },
					    
					    onfilestart: function(e){   
					        alert("开始上传");
					    	//lcaupload.mask();
					    },
					    onfileerror: function(e){
					        alert("上传失败:"+e.message);
					        
					        //lcaupload.unmask();
					    },
					    onfilesuccess: function(e){    
					        alert("上传成功");
					        //lcaupload.unmask();
					    }
				    }]
               	    },
           	 {	type : 'formitem',label : '说明:',labelWidth : 100,labelAlign : 'right',
               	    children : [{type : 'textarea',width : 200,height:50,id : 'description',text:levelmodule.levelmoduleobject.processnote}]
               	    },
               	 {type: 'ct',
               	     cls: 'e-dialog-toolbar',
               	     width: '100%',
               	     layout: 'horizontal',
               	     height: 30,
               	     horizontalAlign: 'center',
               	     verticalAlign: 'middle',
               	     horizontalGap: 10,
               	     children: [
               	                
               	         {
               	             type: 'button',
               	             text: '确定',
               	             minWidth: 70,
               	             onclick: function(e){
               	   
               					levelmodule.levelmoduleobject.processname=Edo.get('processname').text;
               					levelmodule.levelmoduleobject.processnote=Edo.get('description').text;
               					aa.changecelllabel(Edo.get('processname').text,cell);
	               	         	//levelmodule.levelmoduleobject.knowledgecategoryindex=Edo.get('category').data.indexOf(Edo.get('category').selectedItem);
	               	            //levelmodule.levelmoduleobject.knowledgecategoryid=Edo.get('category').getValue();
		               	        /*levelmodule.levelmoduleobject.description=Edo.get('description').text;*/
			               	    levelmodule.levelmoduleobject.tasktreenodeid=Edo.get('tasktreenodeid').text;
			               	    levelmodule.levelmoduleobject.tasktreenodename=Edo.get('tasktreenodename').text;
			               	    levelmodule.levelmoduleobject.input=Edo.get('input').text;
			               	    levelmodule.levelmoduleobject.output=Edo.get('output').text;
			               	    levelmodule.levelmoduleobject.orderid=Edo.get('orderid').text;
           
	               	             resetmoduleproces();
	               	             this.parent.parent.destroy();
               	             }
               	         },{
               	             type: 'button',
               	             text: '取消',
               	             minWidth: 70,
               	             onclick: function(e){
	               	             resetmoduleproces();	
	               	             this.parent.parent.destroy();

               	             }
               	         }
               	     ]
               	 }
	    			]
				});
	if(levelmodule.levelmoduleobject.categorynames!=null)
	{
		Edo.get('categorynames').set('text',levelmodule.levelmoduleobject.categorynames);
		/*alert(levelmodule.levelmoduleobject.knowledgecategoryindex)*/
		/*index=levelmodule.levelmoduleobject.knowledgecategoryindex;*/
		/*var r=Edo.get('category').data.getAt(levelmodule.levelmoduleobject.knowledgecategoryindex);
		alert(r.name)
		Edo.get('category').data.beginChange()
	    Edo.get('category').data.select(r)
	    Edo.get('category').data.endChange()*/
	}
   return box;	 
}


function moduleprocessdefine(choosecell,chooselevelmodule){
	if(!Edo.get('mdct')){
		new moduledivdefine();
	}
	 if(Edo.get('moduleprocessbox')){
		 resetmoduleproces(); 
		 Edo.get('moduleprocessbox').destroy();
	 }
	 cell=choosecell;
     levelmodule=chooselevelmodule;
	 var box=new getmoduleprocessdefinebox(choosecell);
     Edo.get('mdct').addChild(box);
     movemodulediv();
    
}
function getprojectdef(){
	
	var content = Edo.create(
	    {type: 'box',width: '100%',height:'70%',border: [0,0,0,0],padding: [0,0,0,0],layout: 'vertical',
       	    children: [
       	    //				           
       	    {	type : 'formitem',label : '模板名称:',labelWidth : 150,labelAlign : 'right',
       	    children : [{type : 'text',width : 200,id : 'mdname'}]
       	    },
       	    {	type : 'formitem',label : '模板备注:',labelWidth : 150,labelAlign : 'right',
       	    children : [{type : 'text',width : 200,id : 'mdnote'}]
       	    }
       	   
       	    ]
       	});
       	return content;
       	
       	}
function getmywin(width,height,title,children){
	var win=new Edo.containers.Window();
	var win = new Edo.containers.Window();
	win.set('title',title);
	win.set('titlebar',
	    [      //头部按钮栏
	        {
	            cls: 'e-titlebar-close',
	            onclick: function(e){
	                //this是按钮
	                //this.parent是按钮的父级容器, 就是titlebar对象
	                //this.parent.owner就是窗体
	                this.parent.owner.destroy();
	                //deleteMask();
	            }
	        }
	    ]
	);
	
	win.addChild({
	    type: 'box',
	    width: width,
	    height: height, 
	    style:'border:0;',
	    padding:0,
	    children: children
	});	
	return win;
}