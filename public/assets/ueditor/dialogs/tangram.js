// Copyright (c) 2009, Baidu Inc. All rights reserved.
var T,baidu=T=baidu||{version:"1.5.0"};baidu.guid="$BAIDU$",baidu.$$=window[baidu.guid]=window[baidu.guid]||{global:{}},baidu.flash=baidu.flash||{},baidu.dom=baidu.dom||{},baidu.dom.g=function(e){return e?"string"==typeof e||e instanceof String?document.getElementById(e):!e.nodeName||1!=e.nodeType&&9!=e.nodeType?null:e:null},baidu.g=baidu.G=baidu.dom.g,baidu.array=baidu.array||{},baidu.each=baidu.array.forEach=baidu.array.each=function(e,t,i){var n,o,a,r=e.length;if("function"==typeof t)for(a=0;r>a&&(o=e[a],n=t.call(i||e,o,a),n!==!1);a++);return e},baidu.lang=baidu.lang||{},baidu.lang.isFunction=function(e){return"[object Function]"==Object.prototype.toString.call(e)},baidu.lang.isString=function(e){return"[object String]"==Object.prototype.toString.call(e)},baidu.isString=baidu.lang.isString,baidu.browser=baidu.browser||{},baidu.browser.opera=/opera(\/| )(\d+(\.\d+)?)(.+?(version\/(\d+(\.\d+)?)))?/i.test(navigator.userAgent)?+(RegExp.$6||RegExp.$2):void 0,baidu.dom.insertHTML=function(e,t,i){e=baidu.dom.g(e);var n,o;return e.insertAdjacentHTML&&!baidu.browser.opera?e.insertAdjacentHTML(t,i):(n=e.ownerDocument.createRange(),t=t.toUpperCase(),"AFTERBEGIN"==t||"BEFOREEND"==t?(n.selectNodeContents(e),n.collapse("AFTERBEGIN"==t)):(o="BEFOREBEGIN"==t,n[o?"setStartBefore":"setEndAfter"](e),n.collapse(o)),n.insertNode(n.createContextualFragment(i))),e},baidu.insertHTML=baidu.dom.insertHTML,baidu.swf=baidu.swf||{},baidu.swf.version=function(){var e=navigator;if(e.plugins&&e.mimeTypes.length){var t=e.plugins["Shockwave Flash"];if(t&&t.description)return t.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s)+r/,".")+".0"}else if(window.ActiveXObject&&!window.opera)for(var i=12;i>=2;i--)try{var n=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+i);if(n){var o=n.GetVariable("$version");return o.replace(/WIN/g,"").replace(/,/g,".")}}catch(a){}}(),baidu.string=baidu.string||{},baidu.string.encodeHTML=function(e){return String(e).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#39;")},baidu.encodeHTML=baidu.string.encodeHTML,baidu.swf.createHTML=function(e){e=e||{};var t,i,n,o,a,r,s=baidu.swf.version,l=e.ver||"6.0.0",d={},c=baidu.string.encodeHTML;for(o in e)d[o]=e[o];if(e=d,!s)return"";for(s=s.split("."),l=l.split("."),n=0;3>n&&(t=parseInt(s[n],10),i=parseInt(l[n],10),!(t>i));n++)if(i>t)return"";var u=e.vars,m=["classid","codebase","id","width","height","align"];if(e.align=e.align||"middle",e.classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",e.codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0",e.movie=e.url||"",delete e.vars,delete e.url,"string"==typeof u)e.flashvars=u;else{var C=[];for(o in u)r=u[o],C.push(o+"="+encodeURIComponent(r));e.flashvars=C.join("&")}var h=["<object "];for(n=0,a=m.length;a>n;n++)r=m[n],h.push(" ",r,'="',c(e[r]),'"');h.push(">");var f={wmode:1,scale:1,quality:1,play:1,loop:1,menu:1,salign:1,bgcolor:1,base:1,allowscriptaccess:1,allownetworking:1,allowfullscreen:1,seamlesstabbing:1,devicefont:1,swliveconnect:1,flashvars:1,movie:1};for(o in e)r=e[o],o=o.toLowerCase(),f[o]&&(r||r===!1||0===r)&&h.push('<param name="'+o+'" value="'+c(r)+'" />');e.src=e.movie,e.name=e.id,delete e.id,delete e.movie,delete e.classid,delete e.codebase,e.type="application/x-shockwave-flash",e.pluginspage="http://www.macromedia.com/go/getflashplayer",h.push("<embed");var p;for(o in e)if(r=e[o],r||r===!1||0===r){if(new RegExp("^salign$","i").test(o)){p=r;continue}h.push(" ",o,'="',c(r),'"')}return p&&h.push(' salign="',c(p),'"'),h.push("></embed></object>"),h.join("")},baidu.swf.create=function(e,t){e=e||{};var i=baidu.swf.createHTML(e)||e.errorMessage||"";t&&"string"==typeof t&&(t=document.getElementById(t)),baidu.dom.insertHTML(t||document.body,"beforeEnd",i)},baidu.browser.ie=baidu.ie=/msie (\d+\.\d+)/i.test(navigator.userAgent)?document.documentMode||+RegExp.$1:void 0,baidu.array.remove=function(e,t){for(var i=e.length;i--;)i in e&&e[i]===t&&e.splice(i,1);return e},baidu.lang.isArray=function(e){return"[object Array]"==Object.prototype.toString.call(e)},baidu.lang.toArray=function(e){if(null===e||void 0===e)return[];if(baidu.lang.isArray(e))return e;if("number"!=typeof e.length||"string"==typeof e||baidu.lang.isFunction(e))return[e];if(e.item){for(var t=e.length,i=new Array(t);t--;)i[t]=e[t];return i}return[].slice.call(e)},baidu.swf.getMovie=function(e){var t,i=document[e];return 9==baidu.browser.ie?i&&i.length?1==(t=baidu.array.remove(baidu.lang.toArray(i),function(e){return"embed"!=e.tagName.toLowerCase()})).length?t[0]:t:i:i||window[e]},baidu.flash._Base=function(){function e(){return a+Math.floor(2147483648*Math.random()).toString(36)}function t(e){return"undefined"!=typeof e&&"undefined"!=typeof e.flashInit&&e.flashInit()?!0:!1}function i(e,t){var i=null;e=e.reverse(),baidu.each(e,function(e){i=t.call(e.fnName,e.params),e.callBack(i)})}function n(t){var i="";return baidu.lang.isFunction(t)?(i=e(),window[i]=function(){t.apply(window,arguments)},i):baidu.lang.isString?t:void 0}function o(t){t.id||(t.id=e());var i=t.container||"";return delete t.container,baidu.swf.create(t,i),baidu.swf.getMovie(t.id)}var a="bd__flash__";return function(e,a){function r(){t(u)&&(clearInterval(h),h=null,s(),m=!0)}function s(){i(C,u),C=[]}var l=this,d="undefined"!=typeof e.autoRender?e.autoRender:!0,c=e.createOptions||{},u=null,m=!1,C=[],h=null,a=a||[];l.render=function(){u=o(c),a.length>0&&baidu.each(a,function(t,i){a[i]=n(e[t]||new Function)}),l.call("setJSFuncName",[a])},l.isReady=function(){return m},l.call=function(e,t,i){if(!e)return null;i=i||new Function;var n=null;m?(n=u.call(e,t),i(n)):(C.push({fnName:e,params:t,callBack:i}),!h&&(h=setInterval(r,200)))},l.createFunName=function(e){return n(e)},d&&l.render()}}(),baidu.flash.imageUploader=baidu.flash.imageUploader||function(e){var t=this,e=e||{},i=new baidu.flash._Base(e,["selectFileCallback","exceedFileCallback","deleteFileCallback","startUploadCallback","uploadCompleteCallback","uploadErrorCallback","allCompleteCallback","changeFlashHeight"]);t.upload=function(){i.call("upload")},t.pause=function(){i.call("pause")},t.addCustomizedParams=function(e,t){i.call("addCustomizedParams",[e,t])}},baidu.object=baidu.object||{},baidu.extend=baidu.object.extend=function(e,t){for(var i in t)t.hasOwnProperty(i)&&(e[i]=t[i]);return e},baidu.flash.fileUploader=baidu.flash.fileUploader||function(e){var t=this,e=e||{};e.createOptions=baidu.extend({wmod:"transparent"},e.createOptions||{});var i=new baidu.flash._Base(e,["selectFile","exceedMaxSize","deleteFile","uploadStart","uploadComplete","uploadError","uploadProgress"]);i.call("setMaxNum",e.maxNum?[e.maxNum]:[1]),t.setHandCursor=function(e){i.call("setHandCursor",[e||!1])},t.setMSFunName=function(e){i.call("setMSFunName",[i.createFunName(e)])},t.upload=function(e,t,n,o){return"string"!=typeof e||"string"!=typeof t?null:("undefined"==typeof o&&(o=-1),i.call("upload",[e,t,n,o]),void 0)},t.cancel=function(e){"undefined"==typeof e&&(e=-1),i.call("cancel",[e])},t.deleteFile=function(e,t){var n=function(e){t&&t(e)};return"undefined"==typeof e?(i.call("deleteFilesAll",[],n),void 0):("Number"==typeof e&&(e=[e]),e.sort(function(e,t){return t-e}),baidu.each(e,function(e){i.call("deleteFileBy",e,n)}),void 0)},t.addFileType=function(e){var e=e||[[]];e=e instanceof Array?[e]:[[e]],i.call("addFileTypes",e)},t.setFileType=function(e){var e=e||[[]];e=e instanceof Array?[e]:[[e]],i.call("setFileTypes",e)},t.setMaxNum=function(e){i.call("setMaxNum",[e])},t.setMaxSize=function(e){i.call("setMaxSize",[e])},t.getFileAll=function(e){i.call("getFileAll",[],e)},t.getFileByIndex=function(e,t){i.call("getFileByIndex",[],t)},t.getStatusByIndex=function(e,t){i.call("getStatusByIndex",[],t)}},baidu.sio=baidu.sio||{},baidu.sio._createScriptTag=function(e,t,i){e.setAttribute("type","text/javascript"),i&&e.setAttribute("charset",i),e.setAttribute("src",t),document.getElementsByTagName("head")[0].appendChild(e)},baidu.sio._removeScriptTag=function(e){if(e.clearAttributes)e.clearAttributes();else for(var t in e)e.hasOwnProperty(t)&&delete e[t];e&&e.parentNode&&e.parentNode.removeChild(e),e=null},baidu.sio.callByBrowser=function(e,t,i){var n,o=document.createElement("SCRIPT"),a=0,r=i||{},s=r.charset,l=t||function(){},d=r.timeOut||0;o.onload=o.onreadystatechange=function(){if(!a){var e=o.readyState;if("undefined"==typeof e||"loaded"==e||"complete"==e){a=1;try{l(),clearTimeout(n)}finally{o.onload=o.onreadystatechange=null,baidu.sio._removeScriptTag(o)}}}},d&&(n=setTimeout(function(){o.onload=o.onreadystatechange=null,baidu.sio._removeScriptTag(o),r.onfailure&&r.onfailure()},d)),baidu.sio._createScriptTag(o,e,s)},baidu.sio.callByServer=function(e,t,i){function n(e){return function(){try{e?d.onfailure&&d.onfailure():(t.apply(window,arguments),clearTimeout(a)),window[o]=null,delete window[o]}catch(i){}finally{baidu.sio._removeScriptTag(s)}}}var o,a,r,s=document.createElement("SCRIPT"),l="bd__cbs__",d=i||{},c=d.charset,u=d.queryField||"callback",m=d.timeOut||0,C=new RegExp("(\\?|&)"+u+"=([^&]*)");baidu.lang.isFunction(t)?(o=l+Math.floor(2147483648*Math.random()).toString(36),window[o]=n(0)):baidu.lang.isString(t)?o=t:(r=C.exec(e))&&(o=r[2]),m&&(a=setTimeout(n(1),m)),e=e.replace(C,"$1"+u+"="+o),0>e.search(C)&&(e+=(0>e.indexOf("?")?"?":"&")+u+"="+o),baidu.sio._createScriptTag(s,e,c)},baidu.sio.log=function(e){var t=new Image,i="tangram_sio_log_"+Math.floor(2147483648*Math.random()).toString(36);window[i]=t,t.onload=t.onerror=t.onabort=function(){t.onload=t.onerror=t.onabort=null,window[i]=null,t=null},t.src=e};