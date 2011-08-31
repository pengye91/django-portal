$(function(){$('#options').find('a').click(function(){var klasa=$(this).text(); $('.switch').text(klasa); $('#mapa').removeClass().addClass(klasa+' script'); $(this).attr('href','#');}); $('#pl').find('li').click(function(){$('.active').removeClass(); $(this).find('a').addClass('active'); return false;});$('#pl').find('a').each(function(){if($(this).attr('href')===window.location.hash){$(this).addClass('active');}});});

function showsubmenu(id1, id2){
        $(id1).hover(function() {
                clearTimeout($(this).data('timeout'));
		clearTimeout($(this).data('t'));
                $(id2).slideDown("fast");
        }, function() {
                var t = setTimeout(function() {
                        $(id2).slideUp('fast');
                }, 200);
                $(this).data('timeout', t);
        });
}

function addFriend(fid){
                $.post("/profile/friends/addfriend/", {
                        'friend': fid,
                        success: function(msg) { $('#yf' + fid).html('<span style="font-size: 10px; color: #60AB2A; text-transform: uppercase;">TO TWÓJ ZNAJOMY</span>'); }
                });
}

function sendInvitation(fid){
                $.post("/profile/friends/sendinvitation/", {
                        'friend': fid,
                        success: function(msg) { $('#yf' + fid).html('<span style="font-size: 10px; color: #60AB2A; text-transform: uppercase;">Zaproszenie wysłane</span>'); }
                });
}

function cytuj(id, user){
        var text = $('#' + id).text();
	textc = $('#' + id).html();
        firstc = 0;
	lastc = textc.indexOf('</div><br>') + 14;
	prevc = textc.substring(lastc);
	content = '<b class="usercyt">' + user + ':</b><br />[cytat]<br />' + $.trim($(prevc).text()) + '<br />[/cytat]<br />';
        tinyMCE.activeEditor.setContent(content);
}

function shupdownplacowki(id){
	$('tr[name="placowka"]').hide();

	if ($('tr#' + id).is(":hidden")) {
		$('tr#placowkinaglowek').slideDown("slow");
		$('tr#' + id).slideDown("slow");
	} else {
		$('tr#placowkinaglowek').hide();
		$('tr#' + id).slideUp("fast");
	}
}

$(document).ready(function() {
        var xb1o = false;
        var xb1a = false;

        showsubmenu('#xbl1','#xb1a');
        showsubmenu('#xbl2','#xb2a');
        showsubmenu('#xbl3','#xb3a');
        showsubmenu('#xbl4','#xb4a');
        showsubmenu('#xbl5','#xb5a');
        showsubmenu('#xbl6','#xb6a');
        showsubmenu('#xbl7','#xb7a');
        showsubmenu('#xbl8','#xb8a');
        showsubmenu('#xbl9','#xb9a');
        showsubmenu('#xbl10','#xb10a');
        showsubmenu('#xbl11','#xb11a');

	if(document.getElementById('faceb')){
		zaladujFB();
	}

});

function setstars(starid){
	for (var i=0;i<6;i++){
		if(i<(starid+1)){
			var src = "/site_media/rtm/images/star.jpg";
		}else{
			var src = "/site_media/rtm/images/stargrey.jpg";
		}
		$("#star"+i).attr("src", src);
	}
}

function changeBgImage(image, id) {
	var element = document.getElementById(id);
	element.style.backgroundImage = "url("+image+")";
}

function clearstars(){
	for (var i=1;i<6;i++){
		if(parseInt($("#starv"+i).html(),10)=='1'){
			var src = "/site_media/rtm/images/star.jpg";
		}else{
			var src = "/site_media/rtm/images/stargrey.jpg";
		}
		$("#star"+i).attr("src", src);
	}
}

function rate(id,type,r){
	$.post("/rate/add/", {
		'rid': id,
		'rtype': type,
		'rate': r,
		success: function(msg) { $('#rthanks').html('<span style="font-size: 10px; color: #60AB2A; text-transform: uppercase;">Dziękujemy za oddanie głosu!</span>'); }
	});
	r1 = parseInt(r,10);
	for (var i=0;i<6;i++){
		if(i<(r1+1)){
			var src = "/site_media/rtm/images/star.jpg";
			$("#starv"+i).html("1");
		}else{
			var src = "/site_media/rtm/images/stargrey.jpg";
			$("#starv"+i).html("0");
		}
		$("#star"+i).attr("src", src);
	}
}

function mustlogin(){
	$("#mustlogin").fadeIn();
}
