(function(){var e,t=editor,n=$G("preview"),i=$G("preitem"),o=templates,r=function(){for(var e,t="",n=0;e=o[n++];)t+='<div class="preitem" onclick="pre('+n+')"><img src="'+"images/"+e.pre+'" '+(e.title?"alt="+e.title+" title="+e.title:"")+"></div>";i.innerHTML=t},a=function(t){var r=o[t-1];e=r,s(),domUtils.setStyles(i.childNodes[t-1],{"background-color":"lemonChiffon",border:"#ccc 1px solid"}),n.innerHTML=r.preHtml?r.preHtml:""},s=function(){for(var e,t=i.children,n=0;e=t[n++];)domUtils.setStyles(e,{"background-color":"",border:"white 1px solid"})};dialog.onok=function(){$G("issave").checked||t.execCommand("cleardoc");var n={html:e&&e.html};t.execCommand("template",n)},r(),window.pre=a,a(2)})();