function show_hidden_div(){
  	document.getElementById('hidden_div').style.visibility ='visible';
  	hidden_radio.setAttribute("required", "");
}

function hide_hidden_div(){
  	document.getElementById('hidden_div').style.visibility ='hidden';
  	hidden_radio.removeAttribute("required");
}