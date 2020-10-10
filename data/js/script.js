//Check-Out Taste bei Bericht ausfühlen
$('#stop_stracking').click(function (){
    let time = new Date();
		$('#checkout').val( String(time.getHours()).padStart(2,0) + 
		':' + String(time.getMinutes()).padStart(2,0));
})






