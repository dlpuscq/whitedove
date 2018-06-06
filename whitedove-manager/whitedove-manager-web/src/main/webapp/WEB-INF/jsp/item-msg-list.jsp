<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="easyui-panel" title="课程信息统计" icon="icon-save"  style="width:680px;height:420px;"
     collapsible="true" minimizable="true" maximizable="true" closable="true">
    <div class="easyui-layout" fit="true">

        <div region="north" border="false" style="border-bottom:1px solid #ddd;height:32px;padding:2px 5px;background:#fafafa;">

            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true"
                   icon="icon-ok">全部课程</a>
            </div>

            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" id="collectionid"
                   icon="icon-search" onclick="collection(this)" data-iscollection="">按收藏查看</a>
            </div>
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true"id="salesid"
                   icon="icon-search" onclick="sales(this)" data-iscollection=""
                   icon="icon-search">按销量查看</a>
            </div>
            <div style="float: right;">
                <input class="easyui-searchbox" id="courseName" data-options="prompt:'请输入课程名',searcher:''" style="width:130px;vertical-align:middle;"></input>
                <a href="#" class="easyui-linkbutton" plain="true" id="searchCourse">搜索</a>
            </div>
        </div>

        <div region="center" border="false">
            <table id="ss"></table>
        </div>
    </div>
</div>
<script>
    $('#ss').datagrid({
        fit:true,
        border:false,
        url:'itemsg/list',
        queryParams:{params:null},
        idField:'code',
        columns:[[
            {field:'itemId',width:130,align:'center',title:'课程ID'},
            {field:'itemName',width:130,align:'center',title:'课程名称'},
            {field:'image',width:130,align:'center',title:'图片',formatter:TAOTAO.formatImage},
            {field:'itemCollection',width:130,align:'center',title:'收藏人数'},
            {field:'sales',width:130,align:'center',title:'已售数量'},

        ]],
        pagination:true,
        rownumbers:true
    });

    $("#searchCourse").click(function() {
        $('#ss').datagrid('load',{
            params:  $('#courseName').val()
        });
    });

    function collection(obj) {
        var result = String($(obj).attr('data-iscollection'));
        if(result=="true") {

            $('#ss').datagrid({
                fit:true,
                border:false,
                url:'itemsg/collection',
                queryParams:{params:"correct"},
                idField:'code',
                columns:[[
                    {field:'itemId',width:130,align:'center',title:'课程ID'},
                    {field:'itemName',width:130,align:'center',title:'课程名称'},
                    {field:'image',width:130,align:'center',title:'图片',formatter:TAOTAO.formatImage},
                    {field:'itemCollection',width:130,align:'center',title:'收藏人数'},
                    {field:'sales',width:130,align:'center',title:'已售数量'},

                ]],
                pagination:true,
                rownumbers:true
            });
            $('#collectionid').attr('data-iscollection',false);
        }else {
            $('#ss').datagrid({
                fit:true,
                border:false,
                url:'itemsg/collection',
                queryParams:{params:"fall"},
                idField:'code',
                columns:[[
                    {field:'itemId',width:130,align:'center',title:'课程ID'},
                    {field:'itemName',width:130,align:'center',title:'课程名称'},
                    {field:'image',width:130,align:'center',title:'图片',formatter:TAOTAO.formatImage},
                    {field:'itemCollection',width:130,align:'center',title:'收藏人数'},
                    {field:'sales',width:130,align:'center',title:'已售数量'},

                ]],
                pagination:true,
                rownumbers:true
            });
            $('#collectionid').attr('data-iscollection',true);
        }
    }

    function sales(obj) {
        var result = String($(obj).attr('data-iscollection'));
        if(result=="true") {

            $('#ss').datagrid({
                fit:true,
                border:false,
                url:'itemsg/sales',
                queryParams:{params:"correct"},
                idField:'code',
                columns:[[
                    {field:'itemId',width:130,align:'center',title:'课程ID'},
                    {field:'itemName',width:130,align:'center',title:'课程名称'},
                    {field:'image',width:130,align:'center',title:'图片',formatter:TAOTAO.formatImage},
                    {field:'itemCollection',width:130,align:'center',title:'收藏人数'},
                    {field:'sales',width:130,align:'center',title:'已售数量'},

                ]],
                pagination:true,
                rownumbers:true
            });
            $('#salesid').attr('data-iscollection',false);
        }else {
            $('#ss').datagrid({
                fit:true,
                border:false,
                url:'itemsg/sales',
                queryParams:{params:"fall"},
                idField:'code',
                columns:[[
                    {field:'itemId',width:130,align:'center',title:'课程ID'},
                    {field:'itemName',width:130,align:'center',title:'课程名称'},
                    {field:'image',width:130,align:'center',title:'图片',formatter:TAOTAO.formatImage},
                    {field:'itemCollection',width:130,align:'center',title:'收藏人数'},
                    {field:'sales',width:130,align:'center',title:'已售数量'},

                ]],
                pagination:true,
                rownumbers:true
            });
            $('#salesid').attr('data-iscollection',true);
        }
    }
</script>