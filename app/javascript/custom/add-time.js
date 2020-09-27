/*
window.onload = function () {
	var time_button = document.getElementById("js-datetime_button");
	var i = 0;
	time_button.onclick = function(){
  var starttime = document.getElementsByClassName("start-datetime")[0].value;
	if(starttime){
	var datetime = document.createTextNode(starttime);
	var div = document.createElement("div");
	var span = document.createElement("span");
	div.classList.add('m-1', 'float-left', 'add-time');
	div.setAttribute('id', i);
	var delete_icon = document.createTextNode("×");
	span.appendChild(delete_icon);
	span.classList.add("datetime_delete");
	span.setAttribute('id', 'datetime_delete' + i );
	div.appendChild(datetime);
	div.insertBefore(span, div.firstChild);
	document.getElementById("js-add_datetime").append(div);
	i += 1;
			}
		}
	}
*/
