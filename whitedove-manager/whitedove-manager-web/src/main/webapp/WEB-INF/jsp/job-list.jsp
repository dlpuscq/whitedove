<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="jobForm">
	<table class="easyui-datagrid" id="jobList" title="职业方向" minimizable="true" maximizable="true" closable="true" style="width:700px;height:420px;"
		data-options="singleSelect:false,collapsible:true,pagination:true,url:'/job/list',method:'get',pageSize:10,toolbar:toolbar">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',width:70">ID</th>
				<th data-options="field:'career',width:150">职业方向</th>
				<th data-options="field:'img',width:80,align:'center',formatter:TAOTAO.formatImage">图片</th>
				<th
					data-options="field:'created',width:150,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
				<th
					data-options="field:'updated',width:150,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
			</tr>
		</thead>
	</table>
</form>
<div id="jobEditWindow" class="easyui-window" title="职业方向修改"
	data-options="modal:true,closed:true,iconCls:'icon-save',href:'job-edit'"
	style="width: 80%; height: 80%; padding: 10px;"></div>
<script>

    function getJobSelectionsIds(){
    	var jobList = $("#jobList");
    	var sels = jobList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [
        {text:'新增',
        iconCls:'icon-add',
        handler:function(){
            TT.createWindow({
                url : "/job-add"
            });
		}
        }, {
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getJobSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个职业才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个职业!');
        		return ;
        	}
        	$("#jobEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#jobList").datagrid("getSelections")[0];
                    $("#jobEditForm").form("load",data);

                    // 实现图片
                    if(data.img){
                        $("#jobEditForm [name=img]").after("<a href='"+data.img+"' target='_blank'>"
                            + "<img src='"+data.img+"' width='80' height='50'/></a>");
                    }
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getJobSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中职业!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的职业吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/job/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除职业成功!',undefined,function(){
            					$("#jobList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>