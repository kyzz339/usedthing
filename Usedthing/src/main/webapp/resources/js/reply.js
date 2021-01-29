console.log("Reply Module..");

var replyService=(function(){
	
	function add(reply,callback,error){
		console.log("add reply.......");
		
		$.ajax({
			type : 'post',
			url  : '/reply/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
	}

	function getList(param,callback,error){
	var p_Idx=param.p_Idx;
	var page = param.page || 1;
	
	$.getJSON("/reply/pages/"+p_Idx+"/"+page+".json",
			function(data){
			if(callback){
				callback(data.replyCount,data.list);
			}
	}).fail(function(xhr,status,err){
		if(error){
			error();
		}
	});
	}
	
	function remove(r_Idx,callback,error){
		$.ajax({
			type : 'delete',
			url : '/reply/'+r_Idx,
			success : function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply,callback,error){
		console.log("p_Idx :"+reply.p_Idx);
		
		$.ajax({
			type : 'put',
			url : '/reply/'+reply.p_Idx,
			data : JSON.stringify(reply),
			contentType : "application/json; charset-utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function displayTime(timeValue){
		var dateObj = new Date(timeValue);
		var str = "";
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [yy,'/',mm,'/',dd].join('');
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};
})();