$(function(){
	var newsitems;
	var curritem=0;

  newsitems = $("#featured li").hide().size();
  $("#ticker li:eq("+curritem+")").fadeIn(1000);
  setInterval(ticknews,4000); //time in milliseconds

	function ticknews() {
	    $("#featured li:eq("+curritem+")").hide();
	    curritem = ++curritem%newsitems;
	    $("#featured li:eq("+curritem+")").fadeIn(1000);
	}
});


