var fileNode=document.querySelector("input[type=file]");
var picNode=document.querySelector(".pic");
var picNrNode=document.querySelector(".picNr");
console.log(picNrNode);

var URL=window.URL;
var formFile = new FormData();
fileNode.onchange=function(){
	var fileList=this.files;
	
	for(var i=0;i<fileList.length;i++){
		var tpNode=document.createElement("div");
		tpNode.className="tp";

		var img=new Image();
		img.src=URL.createObjectURL(fileList.item(i));
		img.width=60;
		img.height=60;

		var closeNode=document.createElement("span");
		closeNode.innerHTML="&times;";
		closeNode.className="close";

		tpNode.appendChild(img);
		tpNode.appendChild(closeNode);

		picNrNode.appendChild(tpNode);
		formFile.append("upload",$('#file_in')[0].files[i]);
	}

	picNode.style.display="block";
}

picNrNode.addEventListener("click",function(event){
	if(event.target.className=="close"){
		var temp=event.target.parentElement;
		this.removeChild(temp);
	}
})

	$(".tj").click(function(){
		var name = $("#na").val();
		var fileput = $(".file_in").val();
		if(fileput ==''){
			alert('请选择文件上传')
		}else{
			if(name.length>1 && name.length<6){
				console.log(formFile)
				var major = $('.major').val()
				var classid = $('.classid').val()
				$.ajax({
					type: 'post',
					url: "addPlayer/major/"+major+"/classid/"+classid+"/name/"+name,
					data:formFile,
					dataType: 'json',
					processData :false, // 不处理发送的数据，因为data值是Formdata对象，不需要对数据做处理
					contentType :false, // 不设置Content-type请求头
					success(res) {
						console.log(res)
						if(res==200){
							$(".mask").slideDown(1000);
							$(".mask .mask_in").fadeIn(1800);	
						}else if(res==403){
							$(".mask1").slideDown(1000);
							$(".mask1 .mask_in1").fadeIn(1800);
						}
						
					}
				})
									
			}else{
					alert('姓名输入有误')
			}
		}
		
		
	})



