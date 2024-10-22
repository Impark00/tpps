$(document).ready(function(){
	$("#idcheck").on("click",function(event){
		event.preventDefault();
		var userId=$("#userId").val();
		
		$.ajax({
			type:"POST",
			url:"/idcheck",
			contentType:"application/json; charset=UTF-8",
			dataType:"json",
			data:JSON.stringify({userId:userId}),
			success:function(idCheck){
				if(idCheck===1){
					$("#checkResult").text("사용가능");
				}else{
					$("#checkResult").text("이미 사용중");
				}
			},
			error:function(){
				$("#checkResult").text("오류발생");
			}
		});
	});
});
