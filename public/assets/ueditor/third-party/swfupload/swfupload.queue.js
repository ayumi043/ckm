var SWFUpload;"function"==typeof SWFUpload&&(SWFUpload.queue={},SWFUpload.prototype.initSettings=function(e){return function(t){"function"==typeof e&&e.call(this,t),this.queueSettings={},this.queueSettings.queue_cancelled_flag=!1,this.queueSettings.queue_upload_count=0,this.queueSettings.user_upload_complete_handler=this.settings.upload_complete_handler,this.queueSettings.user_upload_start_handler=this.settings.upload_start_handler,this.settings.upload_complete_handler=SWFUpload.queue.uploadCompleteHandler,this.settings.upload_start_handler=SWFUpload.queue.uploadStartHandler,this.settings.queue_complete_handler=t.queue_complete_handler||null}}(SWFUpload.prototype.initSettings),SWFUpload.prototype.startUpload=function(e){this.queueSettings.queue_cancelled_flag=!1,this.callFlash("StartUpload",[e])},SWFUpload.prototype.cancelQueue=function(){this.queueSettings.queue_cancelled_flag=!0,this.stopUpload();for(var e=this.getStats();e.files_queued>0;)this.cancelUpload(),e=this.getStats()},SWFUpload.queue.uploadStartHandler=function(e){var t;return"function"==typeof this.queueSettings.user_upload_start_handler&&(t=this.queueSettings.user_upload_start_handler.call(this,e)),t=t===!1?!1:!0,this.queueSettings.queue_cancelled_flag=!t,t},SWFUpload.queue.uploadCompleteHandler=function(e){var t,n=this.queueSettings.user_upload_complete_handler;if(e.filestatus===SWFUpload.FILE_STATUS.COMPLETE&&this.queueSettings.queue_upload_count++,t="function"==typeof n?n.call(this,e)===!1?!1:!0:e.filestatus===SWFUpload.FILE_STATUS.QUEUED?!1:!0){var i=this.getStats();i.files_queued>0&&this.queueSettings.queue_cancelled_flag===!1?this.startUpload():this.queueSettings.queue_cancelled_flag===!1?(this.queueEvent("queue_complete_handler",[this.queueSettings.queue_upload_count]),this.queueSettings.queue_upload_count=0):(this.queueSettings.queue_cancelled_flag=!1,this.queueSettings.queue_upload_count=0)}});