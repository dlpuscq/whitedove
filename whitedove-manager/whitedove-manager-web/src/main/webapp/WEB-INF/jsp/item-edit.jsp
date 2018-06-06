<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding: 10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="id" />
		<table cellpadding="5">
			<tr>
				<td>学科种类:</td>
				<td><a href="javascript:void(0)"
					class="easyui-linkbutton selectItemCat">选择类目</a> <input
					type="hidden" name="cid" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>学科标题:</td>
				<td><input class="easyui-textbox" type="text" name="title"
					data-options="required:true" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>学科特点:</td>
				<td><input class="easyui-textbox" name="sellPoint"
					data-options="multiline:true,validType:'length[0,150]'"
					style="height: 60px; width: 280px;"></input></td>
			</tr>
			<tr>
				<td>学科价格:</td>
				<td><input class="easyui-numberbox" type="text"
					name="priceView"
					data-options="min:1,max:99999999,precision:2,required:true" /> <input
					type="hidden" name="price" /></td>
			</tr>
			<tr>
				<td>视频:</td>
				<td>
					<input type="hidden" name="barcode" />
					<a href="javascript:void(0)" class="easyui-linkbutton oneMediaUpload">视频上传</a>
				</td>
			</tr>
			<tr>
				<td>学科图片:</td>
				<td><a href="javascript:void(0)"
					class="easyui-linkbutton picFileUpload">上传图片</a> <input
					type="hidden" name="image" /></td>
			</tr>
			<tr>
				<td>学科描述:</td>
				<td><textarea
						style="width: 800px; height: 300px; visibility: hidden;"
						name="desc"></textarea></td>
			</tr>
			<tr class="params hide">
				<td>学科规格:</td>
				<td></td>
			</tr>
		</table>
		<input type="hidden" name="itemParams" /> <input type="hidden"
			name="itemParamId" />
	</form>
	<div style="padding: 5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var itemEditEditor ;
	$(function(){
		//实例化编辑器
        itemEditEditor = TAOTAO.createEditor("#itemeEditForm [name=desc]");
    });

    $(".oneMediaUpload").click(function(){
        var _self = $(this);
        KindEditor.editor(TT.kingEditorParams).loadPlugin('image', function() {
            this.plugin.imageDialog({
                showRemote : false,
                clickFn : function(url, title, width, height, border, align) {
                    var input = _self.siblings("input");
                    input.val(url);
                    input.after("<a href='"+url+"' target='_blank'>视频上传成功</a>");
                    this.hideDialog();
                }
            });
        });
    });

	function submitForm(){
		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$("#itemeEditForm [name=price]").val(eval($("#itemeEditForm [name=priceView]").val()) * 1000);
		itemEditEditor.sync();
		
		var paramJson = [];
		$("#itemeEditForm .params li").each(function(i,e){
			var trs = $(e).find("tr");
			var group = trs.eq(0).text();
			var ps = [];
			for(var i = 1;i<trs.length;i++){
				var tr = trs.eq(i);
				ps.push({
					"k" : $.trim(tr.find("td").eq(0).find("span").text()),
					"v" : $.trim(tr.find("input").val())
				});
			}
			paramJson.push({
				"group" : group,
				"params": ps
			});
		});
		paramJson = JSON.stringify(paramJson);
		
		$("#itemeEditForm [name=itemParams]").val(paramJson);
		
		$.post("/item/update",$("#itemeEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改学科成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#itemList").datagrid("reload");
				});
			}
		});
	}
</script>
