function chooseMarker(cell) {
	var cell_id = document.getElementById(cell);
    var text = cell_id.innerHTML
    if (text != "x" || text != "o"){
    	document.getElementById("move").value = text
    	document.getElementById("form").submit()
    }
}