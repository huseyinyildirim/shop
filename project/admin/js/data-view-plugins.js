/*!
 * Ext JS Library 3.3.0
 * Copyright(c) 2006-2010 Ext JS, Inc.
 * licensing@extjs.com
 * http://www.extjs.com/license
 */
/**
 * @class Ext.DataView.LabelEditor
 * @extends Ext.Editor
 * 
 */
Ext.DataView.LabelEditor=Ext.extend(Ext.Editor,{alignment:"tl-tl",hideEl:false,cls:"x-small-editor",shim:false,completeOnEnter:true,cancelOnEsc:true,labelSelector:"span.x-editable",constructor:function(b,a){Ext.DataView.LabelEditor.superclass.constructor.call(this,a||new Ext.form.TextField({allowBlank:false,growMin:90,growMax:240,grow:true,selectOnFocus:true}),b)},init:function(a){this.view=a;a.on("render",this.initEditor,this);this.on("complete",this.onSave,this)},initEditor:function(){this.view.on({scope:this,containerclick:this.doBlur,click:this.doBlur});this.view.getEl().on("mousedown",this.onMouseDown,this,{delegate:this.labelSelector})},doBlur:function(){this.editing&&this.field.blur()},onMouseDown:function(a,c){if(!a.ctrlKey&&!a.shiftKey){var d=this.view.findItemFromChild(c);a.stopEvent();var b=this.view.store.getAt(this.view.indexOf(d));this.startEdit(c,b.data[this.dataIndex]);this.activeRecord=b}else a.preventDefault()},onSave:function(b,a){this.activeRecord.set(this.dataIndex,a)}}) 
Ext.DataView.DragSelector=function(f){f=f||{};var a,b,e,d,h,c=new Ext.lib.Region(0,0,0,0),k=f.dragSafe===true;this.init=function(b){a=b;a.on("render",l)};function j(){d=[];a.all.each(function(a){d[d.length]=a.getRegion()});h=a.el.getRegion()}function g(){return false}function i(b){return!k||b.target==a.el.dom}function m(){a.on("containerclick",g,a,{single:true});if(!b)b=a.el.createChild({cls:"x-view-selector"});else{b.dom.parentNode!==a.el.dom&&a.el.dom.appendChild(b.dom);b.setDisplayed("block")}j();a.clearSelections()}function n(){var i=e.startXY,j=e.getXY(),l=Math.min(i[0],j[0]),m=Math.min(i[1],j[1]),p=Math.abs(i[0]-j[0]),o=Math.abs(i[1]-j[1]);c.left=l;c.top=m;c.right=l+p;c.bottom=m+o;c.constrainTo(h);b.setRegion(c);for(var f=0,n=d.length;f<n;f++){var g=d[f],k=c.intersect(g);if(k&&!g.selected){g.selected=true;a.select(f,true)}else if(!k&&g.selected){g.selected=false;a.deselect(f)}}}function o(){!Ext.isIE&&a.un("containerclick",g,a);b&&b.setDisplayed(false)}function l(a){e=new Ext.dd.DragTracker({onBeforeStart:i,onStart:m,onDrag:n,onEnd:o});e.initEl(a.el)}}