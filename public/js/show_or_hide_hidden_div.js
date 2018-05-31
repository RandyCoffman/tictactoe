function show_hidden_div(){
  	document.getElementById('hidden_div').style.display ='block';
  	hidden_radio.setAttribute("required", "");
}

function hide_hidden_div(){
  	document.getElementById('hidden_div').style.display ='none';
  	hidden_radio.removeAttribute("required");
}