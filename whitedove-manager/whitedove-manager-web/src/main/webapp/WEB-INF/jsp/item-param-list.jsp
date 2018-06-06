<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemParamList" title="学科类别列表" minimizable="true" maximizable="true" closable="true" style="width:800px;height:420px;"
	data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/param/list',method:'get',pageSize:10,toolbar:itemParamListToolbar">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',width:60">ID</th>
			<th data-options="field:'itemCatId',width:80">学科类别ID</th>
			<th data-options="field:'itemCatName',width:100">学科类别</th>
			<th data-options="field:'paramData',width:200">规格(只显示分组名称)</th>
			<th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
			<th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
		</tr>
	</thead>
</table>
<script>
	function formatItemParamData(value , index){
		var json = JSON.parse(value);
		var array = [];
		$.each(json,function(i,e){
			array.push(e.group);
		});
		return array.join(",");
	}

    function getParamSelectionsIds(){
    	var itemParamList = $("#itemParamList");
    	var sels = itemParamList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var itemParamListToolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	TAOTAO.createWindow({
        		url : "/item-param-add",
        	});
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getParamSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中学科规格!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的学科规格吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/item/param/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除学科规格成功!',undefined,function(){
            					$("#itemParamList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>