<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<div class="easyui-panel" title="用户管理" icon="icon-save"  style="width:750px;height:420px;"
	 collapsible="true" minimizable="true" maximizable="true" closable="true">
	<div class="easyui-layout" fit="true">
		<div region="north" border="false" style="border-bottom:1px solid #ddd;height:32px;padding:2px 5px;background:#fafafa;">
			<div style="float: right;">
				<input class="easyui-searchbox" id="user-content" data-options="prompt:'请输入用户名',searcher:''"
                       style="width:130px;vertical-align:middle;"></input>
				<a href="#" class="easyui-linkbutton" plain="true" id="searchUser">搜索</a>
			</div>

			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
				   icon="icon-man">用户列表</a>
			</div>

			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" id="user-del"
				   icon="icon-remove">删除</a>
			</div>
		</div>

		<div region="center" border="false">
			<table id="qq"></table>
		</div>
	</div>
</div>
<script>

    $('#qq').datagrid({
        fit:true,
        border:false,
        url:'user/list',
        queryParams:{params:null},
        idField:'code',
        columns:[[
            {field:'ck',checkbox:true},
            {field:'id',width:70,align:'left',title:'用户ID'},
            {field:'username',width:70,align:'left',title:'用户名'},
            {field:'phone',width:100,align:'left',title:'电话'},
            {field:'email',width:100,align:'left',title:'邮箱'},
            {field:'headpic',width:100,align:'center',title:'头像',formatter:TAOTAO.formatImage},
            {field:'created',width:100,align:'center',title:'创建日期',formatter:TAOTAO.formatDateTime},
            {field:'updated',width:150,align:'center',title:'更新日期',formatter:TAOTAO.formatDateTime}
        ]],
        pagination:true,
        rownumbers:true
    });
    $("#searchUser").click(function() {
        $('#qq').datagrid('load',{
            params:  $('#user-content').val()
        });
    });

    function getUserSelectionsIds(){
        var itemList = $("#qq");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    };

    $("#user-del").click(function() {
        var ids = getUserSelectionsIds();
        if(ids.length == 0){
            $.messager.alert('提示','未选中用户!');
            return ;
        }
        $.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r) {
            var params = {"ids":ids};
            $.post("/user/delete",params, function(data){
                if(data.status == 200){
                    $.messager.alert('提示','删除用户成功!',undefined,function(){
                        $("#qq").datagrid("reload");
                    });
                }
            });
        });
    });

</script>