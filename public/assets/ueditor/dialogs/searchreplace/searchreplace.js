function clickHandler(e,t,i){for(var n=0,o=e.length;o>n;n++)e[n].className="";i.className="focus";for(var a=i.getAttribute("tabSrc"),r=0,s=t.length;s>r;r++){var l=t[r],d=l.getAttribute("id");l.onclick=function(){this.style.zoom=1},l.style.zIndex=d!=a?1:200}}function switchTab(e){for(var t=$G(e).children,i=t[0].children,n=t[1].children,o=0,a=i.length;a>o;o++){var r=i[o];"focus"===r.className&&clickHandler(i,n,r),r.onclick=function(){clickHandler(i,n,this)}}}function getMatchCase(e){return $G(e).checked?!0:!1}editor.firstForSR=0,editor.currentRangeForSR=null,$G("nextFindBtn").onclick=function(){var e,t=$G("findtxt").value;return t?(e={searchStr:t,dir:1,casesensitive:getMatchCase("matchCase")},frCommond(e)||alert(lang.getEnd),void 0):!1},$G("nextReplaceBtn").onclick=function(){var e,t=$G("findtxt1").value;return t?(e={searchStr:t,dir:1,casesensitive:getMatchCase("matchCase1")},frCommond(e),void 0):!1},$G("preFindBtn").onclick=function(){var e,t=$G("findtxt").value;return t?(e={searchStr:t,dir:-1,casesensitive:getMatchCase("matchCase")},frCommond(e)||alert(lang.getStart),void 0):!1},$G("preReplaceBtn").onclick=function(){var e,t=$G("findtxt1").value;return t?(e={searchStr:t,dir:-1,casesensitive:getMatchCase("matchCase1")},frCommond(e),void 0):!1},$G("repalceBtn").onclick=function(){var e,t=$G("findtxt1").value.replace(/^\s|\s$/g,""),i=$G("replacetxt").value.replace(/^\s|\s$/g,"");return t?t==i||!getMatchCase("matchCase1")&&t.toLowerCase()==i.toLowerCase()?!1:(e={searchStr:t,dir:1,casesensitive:getMatchCase("matchCase1"),replaceStr:i},frCommond(e),void 0):!1},$G("repalceAllBtn").onclick=function(){var e,t=$G("findtxt1").value.replace(/^\s|\s$/g,""),i=$G("replacetxt").value.replace(/^\s|\s$/g,"");if(!t)return!1;if(t==i||!getMatchCase("matchCase1")&&t.toLowerCase()==i.toLowerCase())return!1;e={searchStr:t,casesensitive:getMatchCase("matchCase1"),replaceStr:i,all:!0};var n=frCommond(e);n&&alert(lang.countMsg.replace("{#count}",n))};var frCommond=function(e){return editor.execCommand("searchreplace",e)};switchTab("searchtab");