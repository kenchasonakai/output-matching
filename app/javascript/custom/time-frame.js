document.addEventListener('DOMContentLoaded', () => {
  var time_frame_button = document.getElementById("js-new_time_frame");
var create_time_frame_button = document.getElementById("js-create_time_frame")
	if(time_frame_button){time_frame_button.onclick = function(){
	var time_frame_form = document.getElementById("js-time_frame_form");
	var is_visible = document.defaultView.getComputedStyle(time_frame_form, null).display;
	if(is_visible == "none"){
		time_frame_form.classList.remove("d-none");
		}
	else if(is_visible == "block"){
		time_frame_form.classList.add("d-none");
		}
	}
	}
	
	var show_time_frame_button = document.getElementById("js-show_time_frame")
	show_time_frame_button.onclick = function(){
	var user_time_frame = document.getElementById("js-user_time_frame");
	var is_visible = document.defaultView.getComputedStyle(user_time_frame, null).display;
	if(is_visible == "none"){
		user_time_frame.classList.remove("d-none");
		}
	else{
		user_time_frame.classList.add("d-none");
		}
	}
});