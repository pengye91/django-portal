
function mega_equal_cols(){}
function mega_fix_arrow_pos(){var ul=$E('#ja-megamenu .level0');if(!ul)return;var lis=ul.getChildren();if(!lis)return;lis.each(function(li){if(!li.hasClass('haschild'))return;var submenu=li.getElement('.childcontent');if(!submenu)return;var ml=submenu.getStyle('margin-left');if(ml)ml=ml.toInt();if(!ml)return;var childinner=submenu.getElement('.childcontent-inner');if(!childinner)return;var curpos=26;childinner.setStyle('background-position',(curpos-ml)+'px top');});}
window.addEvent('load',function(){mega_fix_arrow_pos.delay(10);});