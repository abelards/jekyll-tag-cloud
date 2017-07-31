function hasClass(e, cls) { return e.className.indexOf(cls) != -1; }

function removeClass (e, cls) {    
  var newClass = ' ' + e.className.replace( /[\t\r\n]/g, ' ') + ' ';
  if (hasClass(e, cls)) {
  	while (newClass.indexOf(' ' + cls + ' ') >= 0 ) {
	    newClass = newClass.replace(' ' + cls + ' ', ' ');
	  }
	  e.className = newClass.replace(/^\s+|\s+$/g, '');
  }
}

function dispall(sel, disp) {
    var tags = document.querySelectorAll(sel);
    for (var i = 0; i < tags.length; i++) { tags[i].style.display = disp; }
}

function clickTag(event) {
    var e = this;
    var lit = hasClass(e, 'active');
    var tags = document.querySelectorAll('#tags .active');

    for (var i = 0; i < tags.length; i++) { removeClass(tags[i], 'active'); }

    if (!lit) { e.className += ' active'; }

    if (document.querySelectorAll('#tags .active').length == 0) {
    	dispall('ul.post-list li', 'block');
    } else {
	    dispall('ul.post-list li', 'none');
	    dispall('.' + e.innerHTML, 'block');
    }
}

window.onload = function(){
  var tags = document.getElementById('tags');
  if (tags != null) {
  	var tags = document.getElementsByClassName('tag');
	  for (var i = 0; i < tags.length; i++) {
	    var e = tags[i];
	    if (e.addEventListener) { 
		    e.addEventListener('click', clickTag, false); }
	    else if (e.attachEvent) { // old IEs
		     e.attachEvent('onclick', function() { return clickTag.apply(e, [window.event]) })
	    }
    }
  }
}
