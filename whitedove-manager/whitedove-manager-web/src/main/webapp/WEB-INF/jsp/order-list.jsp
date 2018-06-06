<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="easyui-panel" title="订单管理" icon="icon-save"  style="width:820px;height:420px;"
     collapsible="true" minimizable="true" maximizable="true" closable="true">
    <div class="easyui-layout" fit="true">
        <div region="north" border="false" id="checkboxId" style="border-bottom:1px solid #ddd;height:32px;padding:2px 5px;background:#fafafa;">
            <div style="float: right;">
                <input class="easyui-searchbox" id="orderid" data-options="prompt:'请输入用户名',searcher:''"
                       style="width:130px;vertical-align:middle;"/>
                <a href="#" class="easyui-linkbutton" plain="true" id="searchOrder">搜索</a>
            </div>

            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true"
                   icon="icon-ok">全部订单</a>
            </div>

            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" id="order-res"
                   icon="icon-redo">恢复</a>
            </div>
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" id="order-can"
                   icon="icon-undo">取消</a>
            </div>
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" id="order-del"
                   icon="icon-cancel">删除</a>
            </div>
        </div>

        <div region="center" border="false">
            <table id="tt"></table>
        </div>
    </div>
</div>
<script>

    $('#tt').datagrid({
        fit:true,
        border:false,
        url:'order/list',
        queryParams:{params:null},
        idField:'code',
        columns:[[
            {field:'ck',checkbox:true},
            {field:'orderId',width:100,align:'left',title:'订单ID'},
            {field:'userId',width:70,align:'left',title:'用户ID'},
            {field:'username',width:70,align:'left',title:'用户姓名'},
            {field:'num',width:70,align:'left',title:'购买数量'},
            {field:'totalFee',width:70,align:'left',title:'总金额'},
            {field:'status',width:100,align:'center',title:'订单状态',formatter:TAOTAO.formatOrderStatus},
            {field:'created',width:150,align:'center',title:'创建时间',formatter:TAOTAO.formatDateTime},
            {field:'updated',width:150,align:'center',title:'修改时间',formatter:TAOTAO.formatDateTime},
        ]],
        pagination:true,
        rownumbers:true
    });
    $("#searchOrder").click(function() {
        $('#tt').datagrid('load',{
            params:  $('#orderid').val()
        });
    });

    function getOrderSelectionsIds(){
        var itemList = $("#tt");
        var sels = itemList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].orderId);
        }
        ids = ids.join(",");
        return ids;
    };

    $("#order-del").click(function() {
        var ids = getOrderSelectionsIds();
        if(ids.length == 0){
            $.messager.alert('提示','未选中订单!');
            return ;
        }
        if(ids.indexOf(',') > 0){
            $.messager.alert('提示','只能选择一条订单!');
            return ;
        }
        $.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r) {
            if (r) {
                var params = {"ids": ids};
                $.post("/order/delete", params, function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', '删除订单成功!', undefined, function () {
                            $('#tt').datagrid('load', {
                                params: $('#orderid').val()
                            });
                        });
                    }
                });
            }
        });
    });
    $("#order-res").click(function() {
        var ids = getOrderSelectionsIds();
        if(ids.length == 0){
            $.messager.alert('提示','未选中学科!');
            return ;
        }
        if(ids.indexOf(',') > 0){
            $.messager.alert('提示','只能选择一条订单!');
            return ;
        }
        $.messager.confirm('确认','确定恢复ID为 '+ids+' 的订单吗？',function(r) {
            if (r) {
                var params = {"ids": ids};
                $.post("/order/restore", params, function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', '恢复订单成功!', undefined, function () {
                            $('#tt').datagrid('load', {
                                params: $('#orderid').val()
                            });
                        });
                    }
                });
            }
        });
    });
    $("#order-can").click(function() {
        var ids = getOrderSelectionsIds();
        if(ids.length == 0){
            $.messager.alert('提示','未选中订单!');
            return ;
        }
        if(ids.indexOf(',') > 0){
            $.messager.alert('提示','只能选择一条订单!');
            return ;
        }
        $.messager.confirm('确认','确定取消ID为 '+ids+' 的订单吗？',function(r) {
            if (r) {
                var params = {"ids": ids};
                $.post("/order/cancel", params, function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', '取消订单成功!', undefined, function () {
                            $('#tt').datagrid('load', {
                                params: $('#orderid').val()
                            });
                        });
                    }
                });
            }
        });

    });

</script>