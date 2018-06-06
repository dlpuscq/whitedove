<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="jobEditForm" class="itemForm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>职业方向:</td>
                <td><input class="easyui-textbox" type="text" name="career"
                           data-options="required:true" style="width: 280px;"/></td>
            </tr>
            <tr>
                <td>图片:</td>
                <td>
                    <input type="hidden" name="img" />
                    <a href="javascript:void(0)" class="easyui-linkbutton onePicUpload">图片上传</a>
                </td>
            </tr>
        </table>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentEditPage.submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentEditPage.clearForm()">重置</a>
    </div>
</div>
<script type="text/javascript">
    var itemAddEditor ;
    $(function(){
        TT.initOnePicUpload();
    });

    var contentEditPage = {
        submitForm : function(){
            if(!$('#jobEditForm').form('validate')){
                $.messager.alert('提示','表单还未填写完成!');
                return ;
            }

            $.post("/job/update",$("#jobEditForm").serialize(), function(data){
                if(data.status == 200){
                    $.messager.alert('提示','修改成功!');
                    $("#jobList").datagrid("reload");
                }
            });
        },
        clearForm : function(){
            $('#jobEditForm').form('reset');
            itemAddEditor.html('');
        }
    };

</script>