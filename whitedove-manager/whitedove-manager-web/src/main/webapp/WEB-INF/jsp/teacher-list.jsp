<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">

        <div data-options="region:'west',split:false" style="width:250px;padding:5px">
            <ul id="contentCategoryTree" class="easyui-tree" data-options="url:'/teaching/list',animate: true,method : 'GET'">
            </ul>
        </div>

        <div data-options="region:'center'" style="padding:5px" >
            <table class="easyui-datagrid" id="contentList" style="width:770px;height:420px;"
                   data-options="toolbar:contentListToolbar,singleSelect:false,collapsible:true,pagination:true,method:'get',pageSize:10,url:'/teachers/query/list',queryParams:{catId:null}">
                <thead>
                <tr>
                    <th data-options="field:'ck',checkbox:true"></th>
                    <th data-options="field:'teacherId',width:100">教师ID</th>
                    <th data-options="field:'teacherName',width:120">教师名称</th>
                    <th data-options="field:'titleDesc',width:100">教师简介</th>
                    <th data-options="field:'pic',width:60,align:'center',formatter:TAOTAO.formatImage">图片</th>
                    <th data-options="field:'catName',width:100">教学科目</th>
                    <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
                    <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var tree = $("#contentCategoryTree");
        var datagrid = $("#contentList");
        tree.tree({
            onClick : function(node){
                if(tree.tree("isLeaf",node.target)){
                    datagrid.datagrid('reload', {
                        catId :node.id
                    });
                }
            }
        });
    });

    function imgFormatter(value,row,index){
        if('' != value && null != value)
            value = '<img style="width:40px; height:40px" src="' + value + '">';
        return  value;
    }

    function getTeacherSelectionsIds(){
        var itemList = $("#contentList");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].teacherId);
        }
        ids = ids.join(",");
        return ids;
    }

    var contentListToolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            var node = $("#contentCategoryTree").tree("getSelected");
            if(!node || !$("#contentCategoryTree").tree("isLeaf",node.target)){
                $.messager.alert('提示','新增教师必须选择一个学科分类!');
                return ;
            }
            TT.createWindow({
                url : "/teacher-add"
            });
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
            var ids = getTeacherSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个教师才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个教师!');
                return ;
            }
            TT.createWindow({
                url : "/teacher-edit",
                onLoad : function(){
                    var data = $("#contentList").datagrid("getSelections")[0];
                    $("#contentEditForm").form("load",data);

                    // 实现图片
                    if(data.pic){
                        $("#contentEditForm [name=pic]").after("<a href='"+data.pic+"' target='_blank'>"
                            + "<img src='"+data.pic+"' width='80' height='50'/></a>");
                    }
                    contentEditEditor.html(data.content);
                }
            });
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getTeacherSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中教师!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的教师吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.post("/teachers/delete",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','删除教师成功!',undefined,function(){
                                $("#contentList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>