tinymce.PluginManager.add("mantlink",function(t){function e(e){return function(){var n=t.settings.link_list;"string"==typeof n?tinymce.util.XHR.send({url:n,success:function(t){e(tinymce.util.JSON.parse(t))}}):e(n)}}function n(e){function n(){var t=[{text:"None",value:""}];return tinymce.each(e,function(e){t.push({text:e.text||e.title,value:e.value||e.url,menu:e.menu})}),t}function l(e){var n=[{text:"None",value:""}];return tinymce.each(t.settings.rel_list,function(t){n.push({text:t.text||t.title,value:t.value,selected:e===t.value})}),n}function i(e){var n=[{text:"None",value:""}];return t.settings.target_list||n.push({text:"New window",value:"_blank"}),tinymce.each(t.settings.target_list,function(t){n.push({text:t.text||t.title,value:t.value,selected:e===t.value})}),n}function a(){u||0!==x.text.length||this.parent().parent().find("#text")[0].value(this.value())}var o,r,u,s,c,d,f,x={},g=t.selection,h=t.dom;t.focus(),o=g.getNode(),r=h.getParent(o,"a[href]"),r&&g.select(r),x.text=u=g.getContent({format:"text"}),x.href=r?h.getAttrib(r,"href"):"",x.target=r?h.getAttrib(r,"target"):"",x.rel=r?h.getAttrib(r,"rel"):"","IMG"==o.nodeName&&(x.text=u=" "),e&&(c={type:"listbox",label:"Link list",values:n(),onselect:function(t){var e=s.find("#text");(!e.value()||t.lastControl&&e.value()==t.lastControl.text())&&e.value(t.control.text()),s.find("#href").value(t.control.value())}}),t.settings.target_list!==!1&&(f={name:"target",type:"listbox",label:"Target",values:i(x.target)}),t.settings.rel_list&&(d={name:"rel",type:"listbox",label:"Rel",values:l(x.rel)}),s=t.windowManager.open({title:"Insert link",data:x,body:[{name:"href",type:"filepicker",filetype:"file",size:40,autofocus:!0,label:"Url",classes:"document-url-input",onchange:a,onkeyup:a},{name:"text",type:"textbox",size:40,label:"Text to display",classes:"document-text-input",onchange:function(){x.text=this.value()}},f,d,c,{name:"upload",type:"button",size:40,text:"Upload New File",onclick:function(){t.windowManager.open({title:"Upload New File",url:"/admin/documents/new_inline",width:505,height:153})}}],onSubmit:function(e){function n(e,n){window.setTimeout(function(){t.windowManager.confirm(e,n)},0)}function l(){i.text!=u?r?(t.focus(),r.innerHTML=i.text,h.setAttribs(r,{href:a,target:i.target?i.target:null,rel:i.rel?i.rel:null}),g.select(r)):t.insertContent(h.createHTML("a",{href:a,target:i.target?i.target:null,rel:i.rel?i.rel:null},i.text)):t.execCommand("mceInsertLink",!1,{href:a,target:i.target,rel:i.rel?i.rel:null})}var i=e.data,a=i.href;return a?a.indexOf("@")>0&&-1==a.indexOf("//")&&-1==a.indexOf("mailto:")?void n("The URL you entered seems to be an email address. Do you want to add the required mailto: prefix?",function(t){t&&(a="mailto:"+a),l()}):/^\s*www\./i.test(a)?void n("The URL you entered seems to be an external link. Do you want to add the required http:// prefix?",function(t){t&&(a="http://"+a),l()}):void l():void t.execCommand("unlink")}})}t.addButton("link",{icon:"link",tooltip:"Insert/edit link",shortcut:"Ctrl+K",onclick:e(n),stateSelector:"a[href]"}),t.addButton("unlink",{icon:"unlink",tooltip:"Remove link",cmd:"unlink",stateSelector:"a[href]"}),t.addShortcut("Ctrl+K","",e(n)),this.showDialog=n,t.addMenuItem("link",{icon:"link",text:"Insert link",shortcut:"Ctrl+K",onclick:e(n),stateSelector:"a[href]",context:"insert",prependToContext:!0})});