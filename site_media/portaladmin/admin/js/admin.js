
function progressbar(){
    $('#contentblock').hide();
    $('#footer').hide();
    $('#loadblock').show();
}

function deleteitem(id, module, sub, text){
    if(text == null){
        text = 'Are you sure?';
    }

    if(confirm(text)){
        $.post("/administrator/" + module + "/delete/", {
            'id': id,
            'type': 'delete',
            'sub': sub,
            success: function(msg) {
                     $('tr#row' + id).hide("slow");
            }
        });
    }
}

function changeactivity(id, changestatus, module, sub){
    $.post("/administrator/" + module + "/action/", {
        'id': id,
        'type': 'activity',
        'sub': sub,
        'status': changestatus,
        success: function(msg) {
                $('#imgyes' + id).toggle("slow");
                $('#imgno' + id).toggle("slow");
        }
    });
}

$(function() {
    var theTable = $('table#tablelist')

    $("#filter").keyup(function() {
        $.uiTableFilter( theTable, this.value );
        $('tr.tablehead').show()
    })

    $('#filter-form').submit(function(){
        theTable.find("tbody > tr:visible > td:eq(1)").mousedown();
        return false;
    }).focus(); //Give focus to input field

    var t = $('table#tablelist')
    var options = {}
    //$.uiTableEdit( t, options ) // returns t

});

$('html').ajaxSend(function(event, xhr, settings) {
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
        // Only send the token to relative URLs i.e. locally.
        xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
    }
});

$(function(){
    $("ul.subnav").parent().append("<span></span>");
    $("#topmenuline ul li a").hover(function() {
        $(this).parent().find("ul.subnav").slideDown('fast').show();

        $(this).parent().hover(function() {
        }, function(){
            $(this).parent().find("ul.subnav").slideUp('fast'); //When the mouse hovers out of the subnav, move it back up
        });

        //Following events are applied to the trigger (Hover events for the trigger)
        }).hover(function() {
            $(this).addClass("subhover"); //On hover over, add class "subhover"
        }, function(){  //On Hover Out
            $(this).removeClass("subhover"); //On hover out, remove class "subhover"
    });

});