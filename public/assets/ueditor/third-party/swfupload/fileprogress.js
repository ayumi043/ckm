function FileProgress(e,t){if(this.fileProgressID=e.id,this.opacity=100,this.height=0,this.fileProgressWrapper=document.getElementById(this.fileProgressID),this.fileProgressWrapper)this.fileProgressElement=this.fileProgressWrapper.firstChild,this.reset();else{this.fileProgressWrapper=document.createElement("div"),this.fileProgressWrapper.className="progressWrapper",this.fileProgressWrapper.id=this.fileProgressID,this.fileProgressElement=document.createElement("div"),this.fileProgressElement.className="progressContainer";var i=document.createElement("a");i.className="progressCancel",i.href="#",i.style.visibility="hidden",i.appendChild(document.createTextNode(" ")),i.onclick=function(){alert(1)};var n=document.createElement("div");n.className="progressName",n.appendChild(document.createTextNode(e.name));var o=document.createElement("div");o.className="progressBarInProgress";var r=document.createElement("div");r.className="progressBarStatus",r.innerHTML="&nbsp;",this.fileProgressElement.appendChild(i),this.fileProgressElement.appendChild(n),this.fileProgressElement.appendChild(r),this.fileProgressElement.appendChild(o),this.fileProgressWrapper.appendChild(this.fileProgressElement),document.getElementById(t).appendChild(this.fileProgressWrapper)}this.height=this.fileProgressWrapper.offsetHeight,this.setTimer(null)}FileProgress.prototype.setTimer=function(e){this.fileProgressElement.FP_TIMER=e},FileProgress.prototype.getTimer=function(){return this.fileProgressElement.FP_TIMER||null},FileProgress.prototype.reset=function(){this.fileProgressElement.className="progressContainer",this.fileProgressElement.childNodes[2].innerHTML="&nbsp;",this.fileProgressElement.childNodes[2].className="progressBarStatus",this.fileProgressElement.childNodes[3].className="progressBarInProgress",this.fileProgressElement.childNodes[3].style.width="0%",this.appear()},FileProgress.prototype.setProgress=function(e){this.fileProgressElement.className="progressContainer green",this.fileProgressElement.childNodes[3].className="progressBarInProgress",this.fileProgressElement.childNodes[3].style.width=e+"%",this.appear()},FileProgress.prototype.setComplete=function(){this.fileProgressElement.className="progressContainer blue",this.fileProgressElement.childNodes[3].className="progressBarComplete",this.fileProgressElement.childNodes[3].style.width="",this.setTimer(setTimeout(function(){},1e4))},FileProgress.prototype.setError=function(){this.fileProgressElement.className="progressContainer red",this.fileProgressElement.childNodes[3].className="progressBarError",this.fileProgressElement.childNodes[3].style.width="",this.setTimer(setTimeout(function(){},3e3))},FileProgress.prototype.setCancelled=function(){this.fileProgressElement.className="progressContainer",this.fileProgressElement.childNodes[3].className="progressBarError",this.fileProgressElement.childNodes[3].style.width="";var e=this;this.setTimer(setTimeout(function(){e.disappear()},1e3))},FileProgress.prototype.setStatus=function(e){this.fileProgressElement.childNodes[2].innerHTML=e},FileProgress.prototype.toggleCancel=function(e,t,i){var n=this.fileProgressElement.childNodes[0];if(n.style.visibility=e?"visible":"hidden",n.title=i?i:"取消上传",t){var o=this,r=o.fileProgressID,a=o.fileProgressElement;a.children[0].onclick=function(){return o.disappear(),t.cancelUpload(r),!1}}},FileProgress.prototype.appear=function(){if(null!==this.getTimer()&&(clearTimeout(this.getTimer()),this.setTimer(null)),this.fileProgressWrapper.filters)try{this.fileProgressWrapper.filters.item("DXImageTransform.Microsoft.Alpha").opacity=100}catch(e){this.fileProgressWrapper.style.filter="progid:DXImageTransform.Microsoft.Alpha(opacity=100)"}else this.fileProgressWrapper.style.opacity=1;this.fileProgressWrapper.style.height="",this.height=this.fileProgressWrapper.offsetHeight,this.opacity=100,this.fileProgressWrapper.style.display=""},FileProgress.prototype.disappear=function(){var e=15,t=4,i=30;if(this.opacity>0)if(this.opacity-=e,0>this.opacity&&(this.opacity=0),this.fileProgressWrapper.filters)try{this.fileProgressWrapper.filters.item("DXImageTransform.Microsoft.Alpha").opacity=this.opacity}catch(n){this.fileProgressWrapper.style.filter="progid:DXImageTransform.Microsoft.Alpha(opacity="+this.opacity+")"}else this.fileProgressWrapper.style.opacity=this.opacity/100;if(this.height>0&&(this.height-=t,0>this.height&&(this.height=0),this.fileProgressWrapper.style.height=this.height+"px"),this.height>0||this.opacity>0){var o=this;this.setTimer(setTimeout(function(){o.disappear()},i))}else this.fileProgressWrapper.style.display="none",this.setTimer(null)};