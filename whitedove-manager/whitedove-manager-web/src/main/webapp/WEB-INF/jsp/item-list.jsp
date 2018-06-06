<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="itemEditForm">
	<table class="easyui-datagrid" id="itemList" title="学科列表" minimizable="true" maximizable="true" closable="true" style="width:930px;height:420px;"
		data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/list',method:'get',pageSize:10,toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',width:100">学科ID</th>
				<th data-options="field:'title',width:100">学科标题</th>
				<th data-options="field:'cid',width:80">二级学科ID</th>
				<th data-options="field:'sellPoint',width:150">特点</th>
				<th data-options="field:'price',width:70,align:'center',formatter:TAOTAO.formatPrice">价格</th>
				<th data-options="field:'image',width:80,align:'center',formatter:TAOTAO.formatImage">图片</th>
				<th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">开课情况</th>
				<th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
				<th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
			</tr>
		</thead>
	</table>
</form>
<div id="itemEditWindow" class="easyui-window" title="编辑学科"
	data-options="modal:true,closed:true,iconCls:'icon-save',href:'item-edit'"
	style="width: 80%; height: 80%; padding: 10px;"></div>
<script>

    function getitemSelectionsIds(){
    	var itemList = $("#itemList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	$(".tree-title:contains('新增学科')").parent().click();
        }
   		},
		{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getitemSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个学科才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个学科!');
        		return ;
        	}
        	
        	$("#itemEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#itemList").datagrid("getSelections")[0];
        			data.priceView = TAOTAO.formatPrice(data.price);
        			$("#itemeEditForm").form("load",data);
        			
        			// 加载学科描述
        			$.getJSON('/item/desc/query/'+data.id,function(_data){
        				if(_data.status == 200){
        					//UM.getEditor('itemEditEditor').setContent(_data.data.itemDesc, false);
        					itemEditEditor.html(_data.data.itemDesc);
        				}
        			});
        			
        			//加载学科规格
        			$.getJSON('/item/param/item/query/'+data.id,function(_data){
        				if(_data && _data.status == 200 && _data.data && _data.data.paramData){
        					$("#itemeEditForm .params").show();
        					$("#itemeEditForm [name=itemParams]").val(_data.data.paramData);
        					$("#itemeEditForm [name=itemParamId]").val(_data.data.id);
        					
        					//回显学科规格
        					 var paramData = JSON.parse(_data.data.paramData);
        					
        					 var html = "<ul>";
        					 for(var i in paramData){
        						 var pd = paramData[i];
        						 html+="<li><table>";
        						 html+="<tr><td colspan=\"2\" class=\"group\">"+pd.group+"</td></tr>";
        						 
        						 for(var j in pd.params){
        							 var ps = pd.params[j];
        							 html+="<tr><td class=\"param\"><span>"+ps.k+"</span>: </td><td><input autocomplete=\"off\" type=\"text\" value='"+ps.v+"'/></td></tr>";
        						 }
        						 
        						 html+="</li></table>";
        					 }
        					 html+= "</ul>";
        					 $("#itemeEditForm .params td").eq(1).html(html);
        				}
        			});
        			
        			TAOTAO.init({
        				"pics" : data.image,
        				"cid" : data.cid,
        				fun:function(node){
        					TAOTAO.changeItemParam(node, "itemeEditForm");
        				}
        			});
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getitemSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中学科!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的学科吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/item/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除学科成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },'-',{
        text:'下架',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getitemSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中学科!');
        		return ;
        	}
        	$.messager.confirm('确认','确定下架ID为 '+ids+' 的学科吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/item/instock",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','下架学科成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },{
        text:'上架',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getitemSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中学科!');
        		return ;
        	}
        	$.messager.confirm('确认','确定上架ID为 '+ids+' 的学科吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/item/reshelf",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','上架学科成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>