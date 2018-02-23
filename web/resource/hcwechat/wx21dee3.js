try {
(function(e) {
if (/msie 6/i.test(navigator.userAgent)) {
window.location = "/cgi-bin/readtemplate?t=err/noie6_tmpl";
return;
}
window.console || (window.console = {
log: function() {},
error: function() {},
info: function() {}
}), e.wx = e.wx || {}, wx.T = function(e, t) {
return template.compile(e)(t);
}, wx.url = function(e) {
if (e.startsWith("javasript:")) return e;
var t = wx.data.param;
return e.indexOf("?") != -1 ? e + t : e + "?1=1" + t;
}, wx.getUrl = function(e) {
var t = (window.location + "&").match(new RegExp("(?:\\?|\\&)" + e + "=(.*?)\\&"));
if (t && t[1]) return String(t[1]).html(!0);
}, $.fn.setClass = function(e) {
this.attr("class", e);
}, function() {
function t(e, t) {
if (t.indexOf("ueditor") != -1 || t.indexOf("media/appmsg_edit") != -1) return;
jQuery.ajax({
url: "/misc/jslog?1=1" + wx.data.param,
data: {
content: t,
id: e,
level: "error"
},
type: "POST"
});
}
var e = {
fakeid: wx.data.uin,
userAgent: window.navigator.userAgent,
url: location.href
};
jQuery("img").error(function() {
t(1, "[fakeid={fakeid}] [img] [url={url}] [useragent={userAgent}] [src={0}]".format(e).format([ jQuery(this).src || "" ]));
}), jQuery("script").error(function() {
t(2, "[fakeid={fakeid}] [script] [url={url}] [useragent={userAgent}] [src={0}]".format(e).format([ jQuery(this).src || "" ]));
}), wx.jslog = function(n, r, i) {
i = i || 3, n = jQuery.extend(n, e);
var s = [];
!r || jQuery.each([ "message", "stack", "lineNumber" ], function(e, t) {
s.push(t + ":" + (r[t] || ""));
}), n.e = s.join(";").replace(/\s/g, " ");
var o = "[fakeid={fakeid}] [script] [url={url}] [useragent={userAgent}] [src={src}] [exception={e}]".format(n);
t(i, o), console && console.error && r && console.error(r);
};
}(), setTimeout(function() {
seajs.use("biz_web/lib/store.js", function(e) {
var t = $("#logout");
t.click(function() {
function r() {
var t = e.get(n);
return new Date - t > 864e5;
}
e.remove("hasNotice"), e.remove("templateClassStatus"), e.remove("templateClassStatusTime");
var t = "__draft__" + wx.data.uin, n = "__draft__time__" + wx.data.uin;
r() && (e.remove(t), e.remove(n));
});
});
}, 5e3), wx.resPath = location.hostname == "mp.weixin.qq.com" ? "https://res.wx.qq.com" : "", wx.injectXss = function(e, t, n) {
function r(e) {
for (var n = 0; n < t.length; n++) if (e == t[n]) return !0;
return !1;
}
if (e == null) return;
t || (t = []), n || (n = "'\"<script>console.log(%s);</script><!--# &");
for (var i in e) {
var s = e[i];
typeof s == "string" ? r(i) || (e[i] = n.sprintf(i) + s) : typeof s == "object" && wx.injectXss(e[i]);
}
};
})(window);
} catch (e) {
wx.jslog({
src: "wx/wx.js"
}, m);
};;//样式居中
$.fn.extend({
center: function() {
this.css("position", "absolute"), this.css("top", ($(window).height() - this.height()) / 2 + $(window).scrollTop() + "px"), this.css("left", ($(window).width() - this.width()) / 2 + $(window).scrollLeft() + "px");
}
});;$.fn.disable = function(e) {
e = e || "btn_disabled";
var t = this.hasClass("btn_input") ? this.find("button") : this;
return t.attr("disabled", "disabled"), e && this.addClass(e), this.parent().filter(".btn_input").addClass(e), this;
}, $.fn.enable = function(e) {
e = e || "btn_disabled";
var t = this.hasClass("btn_input") ? this.find("button") : this;
return t.attr("disabled", !1), e && this.removeClass(e), this.parent().filter(".btn_input").removeClass(e), this;
}, function() {
var e = function(e, t) {
e = e || "btn_loading";
if (!t || $.support.leadingWhitespace) {
var n = this.hasClass("btn_input") ? this.find("button") : this;
n.prepend("<i></i>");
}
return this.disable(e), this;
}, t = function(e, t) {
e = e || "btn_loading";
if (!t || $.support.leadingWhitespace) {
var n = this.hasClass("btn_input") ? this.find("button") : this;
n.find("i:first-child").remove();
}
return this.enable(e), this;
};
$.fn.btn = function(n, r, i) {
return n ? t.call(this, r, i) : e.call(this, r, i);
};
}();;//滚屏延迟加载
$.fn.scrollLoading = function(e) {
function r(t) {
return t.offset().top > $(window).scrollTop() && t.offset().top + t.height() < $(window).scrollTop() + $(window).height() + e.pre;
}
function i() {
$.each(n, function(t, n) {
var i = r($(n.obj));
i && (n.src && n.tag.toLowerCase() == "img" && (n.obj.src = n.src, n.obj.data_src = n.src = ""), $.isFunction(e.callback) ? e.callback.apply(n.obj) : "");
});
}
var t = {
callback: $.noop,
pre: 100,
context: window
};
e = $.extend({}, t, e || {});
var n = [];
$(this).each(function() {
var e = this.nodeName;
if (!e) return;
n.push({
obj: this,
src: $(this).data("src"),
tag: e.toLowerCase()
});
}), i(), e.context.unbind("scroll", i), e.context.bind("scroll", i);
}, $.fn.fixed = function() {
var e = this, t = e.offset().top;
$(document).on("scroll", function(n) {
$(window).scrollTop() < t ? e.css("position", "static") : e.css("position", "fixed").css("top", 0);
});
};;//定义快捷操作
(function(e) {
var t = function() {};
"placeholder" in document.createElement("input") || (t = function() {
var t = e(this), n = t.attr("placeholder");
n && (t.focus(function() {
this.value === n && (this.value = ""), t.removeClass("placeholder");
}).blur(function() {
this.value === "" && (this.value = n, t.addClass("placeholder"));
}), t.val() === "" && t.addClass("placeholder"), t.val() || t.val(n));
}), e.fn.placeholder = t;
})(jQuery);;//控制台输出
$.extend({
log: function(e) {
console && console.log(e);
}
});;$.fn.extend({
serializeObject: function() {
var e = this.serializeArray(), t = {};
return $(e).each(function(e, n) {
t[n.name] = n.value;
}), t;
}
}), define("common/qq/jquery.plugin/serializeObject.js", [], function(e, t, n) {
try {
var r = +(new Date);
"use strict";
} catch (i) {
wx.jslog({
src: "common/qq/jquery.plugin/serializeObject.js"
}, i);
}
});;(function() {
function u(e, t) {
for (var n in t) e[n] = t[n];
return e;
}
function a(e, t) {
if (t === !0) {
var n;
if (Object.isArray(e)) {
n = [];
for (var r in e) e.hasOwnProperty(r) && (Object.isObject(e[r]) ? n.push(Object.clone(e[r], !0)) : n.push(e[r]));
} else {
n = {};
for (var r in e) e.hasOwnProperty(r) && (Object.isObject(e[r]) ? n[r] = Object.clone(e[r], !0) : n[r] = e[r]);
}
return n;
}
return u({}, e);
}
function f(e) {
return !!this && e.nodeType == 1;
}
function l(e) {
return Object.prototype.toString.call(e) === s;
}
function c(e) {
return Object.prototype.toString.call(e) === i;
}
function h(t) {
return Object.prototype.toString.call(t) === e;
}
function p(e) {
return Object.prototype.toString.call(e) === r;
}
function d(e) {
return Object.prototype.toString.call(e) === n;
}
function v(e) {
return Object.prototype.toString.call(e) === o;
}
function m(e) {
return typeof e == "undefined";
}
function g(e, t) {
var n = [];
for (var r in e) e.hasOwnProperty(r) && (t === !0 ? n.push([ encodeURIComponent(r), "=", encodeURIComponent(e[r]), "&" ].join("")) : n.push([ r, "=", e[r], "&" ].join("")));
return n.join("").slice(0, -1);
}
function y(e, t) {
if (typeof t == "undefined") return;
for (var n in e) if (e.hasOwnProperty(n) && t(e[n], n) === !1) break;
}
var e = "[object Function]", t = "[object Boolean]", n = "[object Number]", r = "[object String]", i = "[object Array]", s = "[object Object]", o = "[object Date]";
u(Object, {
extend: u,
clone: a,
isObject: l,
isElement: f,
isArray: c,
isFunction: h,
isString: p,
isNumber: d,
isDate: v,
isUndefined: m,
param: g,
each: y
});
})(), Object.extend(String.prototype, function() {
function e(e) {
return this.replace(/\{(\w+)\}/g, function(t, n) {
return e[n] !== undefined ? e[n] : t;
});
}
function t() {
return this.replace(/[^\x00-\xff]/g, "**").length;
}
function n(e, t) {
return e = e || 30, t = Object.isUndefined(t) ? "..." : t, this.length > e ? this.slice(0, e - t.length) + t : String(this);
}
function r(e) {
return e === !0 ? this.replace(/^\s+/, "") : e === !1 ? this.replace(/\s+$/, "") : this.replace(/^\s+/, "").replace(/\s+$/, "");
}
function s(e) {
var t = [ "&", "&amp;", "<", "&lt;", ">", "&gt;", " ", "&nbsp;", '"', "&quot;", "'", "&#39;" ];
e === !1 && t.reverse();
for (var n = 0, r = this; n < t.length; n += 2) r = r.replace(new RegExp(t[n], "g"), t[1 + n]);
return r;
}
function o(e) {
return this.indexOf(e) > -1;
}
function u(e) {
return this.lastIndexOf(e, 0) === 0;
}
function a(e) {
var t = this.length - e.length;
return t >= 0 && this.indexOf(e, t) === t;
}
function f() {
return this == "";
}
function l() {
return this.replace(/<\/?[^>]*\/?>/g, "");
}
function c() {
return /^\s*$/.test(this);
}
function h() {
var e, t = this, n, r, i = arguments.length;
if (i < 1) return l;
e = 0;
while (e < i) t = t.replace(/%s/, "{#" + e++ + "#}");
t.replace("%s", ""), e = 0;
while ((n = arguments[e]) !== undefined) r = new RegExp("{#" + e + "#}", "g"), t = t.replace(r, n), e++;
return t;
}
function p() {
var e = this, t = 0, n, r = 0;
while (n = e.charAt(t++)) r += n.charCodeAt().toString(16).length / 2;
return r;
}
function d(e, t) {
if (typeof this.split == "function") {
var n = this.split(t || "&"), r = {};
return n.each(function(t) {
arr = t.split("="), arr.length == 2 && arr[0] && arr[1] && (e === !0 ? r[decodeURIComponent(arr[0])] = decodeURIComponent(arr[1]) : r[arr[0]] = arr[1]);
}), r;
}
}
var i = document.createElement("div");
return {
format: e,
sprintf: h,
text: l,
len: t,
truncate: n,
trim: String.prototype.trim || r,
https2http: function() {
return this.replace(/https:\/\/mmbiz\.qlogo\.cn\//g, "http://mmbiz.qpic.cn/");
},
http2https: function() {
return this.replace(/http:\/\/mmbiz\.qpic\.cn\//g, "https://mmbiz.qlogo.cn/");
},
html: s,
has: o,
startsWith: u,
endsWith: a,
param: d,
empty: f,
blank: c,
bytes: p
};
}()), Object.extend(Function.prototype, function() {
function t(e, t) {
var n = e.length, r = t.length;
while (r--) e[n + r] = t[r];
return e;
}
function n(n, r) {
return n = e.call(n, 0), t(n, r);
}
function r(t) {
if (arguments.length < 2 && Object.isUndefined(arguments[0])) return this;
var r = this, i = e.call(arguments, 1);
return function() {
var e = n(i, arguments);
return r.apply(t, e);
};
}
function i(t, n) {
var r = this;
return args = e.call(arguments, 2), t *= 1e3, window.setTimeout(function() {
return r.apply(n || r, args);
}, t);
}
function s() {
var e = t([ .01, null ], arguments);
return this.delay.apply(this, e);
}
function o(e) {
var t = this;
return function() {
return e.apply(this, arguments) === !1 ? !1 : t.apply(this, arguments);
};
}
function u(e) {
var n = this;
return function() {
var r = n.apply(this, arguments), i = t([ r ], arguments);
return e.apply(this, i), r;
};
}
function a(e) {
var n = this;
return function() {
var r = t([ n.bind(this) ], arguments);
return e.apply(this, r);
};
}
var e = Array.prototype.slice;
return {
bind: r,
delay: i,
defer: s,
before: o,
after: u,
wrap: a
};
}()), function() {
function n(e, t) {
for (var n = 0, r = this.length >>> 0; n < r; n++) n in this && e.call(t, this[n], n, this);
}
function r() {
return this[this.length - 1];
}
function i(e) {
return e === !0 ? Object.clone.apply(this, arguments) : t.call(this, 0);
}
function s(e) {
var t = [];
return this.each(function(n, r) {
t.push(e(n, r));
}), t;
}
function o(e) {
var t = -1;
return this.each(function(n, r) {
if (e == n) return t = r, !1;
}), t;
}
var e = Array.prototype, t = e.slice;
Object.extend(e, {
each: Array.prototype.forEach || n,
indexOf: Array.prototype.indexOf || o,
last: r,
clone: i,
map: s
});
}();;define("common/qq/Class.js", [], function(e, t, n) {
try {
var r = +(new Date);
"use strict", t.create = function(e) {
var t = function() {
this.construct && this.construct.apply(this, arguments);
};
return e.apply(t.prototype, arguments), t;
}, function() {
function e(e) {
for (var t = 1, n = arguments.length; t < n; t++) for (var r in arguments[t]) Object.prototype.hasOwnProperty.call(arguments[t], r) && (e[r] = arguments[t][r]);
return e;
}
function n() {
return this.__instance__ || (this.__instance__ = new this(arguments[0], arguments[1], arguments[2]));
}
function r(e) {
var t = i.call(this, e);
return t.prototype.parent = this, t;
}
function i(t) {
var i = typeof this == "function" ? this : function() {}, s = function() {
function n(e, r) {
e.Super && n(e.Super, r), e.init && e.init.apply(r, t);
}
var e = this, t = arguments;
e.Root = i.__base__, e.Super = i.prototype, n(e, e);
};
return e(s.prototype, i.prototype || {}, t), s.__base__ = i.__base__ || s.prototype, s.GetStaticInstance = n, s.Inherit = s.inherit = r, s;
}
t.declare = i;
}();
} catch (i) {
wx.jslog({
src: "common/qq/Class.js"
}, i);
}
});;(function(e) {
function r(e) {
return e >= 49 && e <= 90;
}
function i(e) {
return (e || "").toLowerCase().split("+").sort().join("").replace(/\s/ig, "");
}
function s(e) {
var t = e.type;
return t == "mousewheel" || t == "DOMMouseScroll";
}
function o(e) {
return e.wheelDelta > 0 || e.detail < 0 ? "mousewheelup" : "mousewheeldown";
}
function u(e) {
var i = e.keyCode, u = t[i], a = !u && r(i) && String.fromCharCode(i).toLowerCase() || s(e) && o(e), f = e.ctrlKey, l = e.shiftKey, c = e.altKey, h = l && (n[a] || n[u]), p = [];
return !f && !c && h && (u = h, l = a = null), f && p.push("ctrl"), l && p.push("shift"), c && p.push("alt"), u && p.push(u), a && p.push(a), p.join("+");
}
function a(e, t) {
return i(u(e)) == i(t);
}
var t = {
27: "esc",
9: "tab",
32: "space",
13: "enter",
8: "backspace",
145: "scroll",
20: "capslock",
144: "numlock",
19: "pause",
45: "insert",
36: "home",
46: "del",
35: "end",
33: "pageup",
34: "pagedown",
37: "left",
38: "up",
39: "right",
40: "down",
107: "=",
109: "-",
112: "f1",
113: "f2",
114: "f3",
115: "f4",
116: "f5",
117: "f6",
118: "f7",
119: "f8",
120: "f9",
121: "f10",
122: "f11",
123: "f12",
188: "<",
190: ">",
191: "/",
192: "`",
219: "[",
220: "\\",
221: "]",
222: "'"
}, n = {
"`": "~",
"1": "!",
"2": "@",
"3": "#",
"4": "$",
"5": "%",
"6": "^",
"7": "&",
"8": "*",
"9": "(",
"0": ")",
"-": "_",
"=": "+",
";": ":",
"'": '"',
",": "<",
".": ">",
"/": "?",
"\\": "|"
};
e.wx = e.wx || {}, e.wx.hotkeyStr = u, e.wx.isHotkey = a;
})(window);;define("common/wx/Tips.js", [], function(e, t, n) {
try {
var r = +(new Date);
"use strict";
var i = t, s = {
errMsg: "系统发生错误，请稍后重试",
sucMsg: "操作成功",
delay: 2
}, o;
function u(e, t, n) {
$(".JS_TIPS").remove(), o = $(template.compile('<div class="JS_TIPS page_tips {type}" id="wxTips_' + (new Date).getTime() + '"><div class="inner">{=msg}</div></div>')({
type: e || "error",
msg: t
})).appendTo("body").fadeIn(), a.delay(n || s.delay, null, o);
}
function a(e) {
e.length > 0 && e.fadeOut({
complete: function() {
e.remove();
}
});
}
i.err = function(e, t) {
u("error", e || s.errMsg, t);
}, i.suc = function(e, t) {
u("success", e || s.sucMsg, t);
};
} catch (f) {
wx.jslog({
src: "common/wx/Tips.js"
}, f);
}
});;define("common/wx/Cgi.js", [ "common/qq/mask.js", "common/wx/dialog.js", "common/wx/Tips.js", "common/wx/cgiReport.js", "common/lib/MockJax.js", "common/qq/events.js" ], function(e, t, n) {
try {
var r = +(new Date);
"use strict";
var i = e("common/qq/mask.js"), s = e("common/wx/dialog.js"), o = e("common/wx/Tips.js"), u = e("common/wx/cgiReport.js");
e("common/lib/MockJax.js");
var a = e("common/qq/events.js")(!0), f = {
dataType: "json",
mask: !1,
timeout: 45e3,
error: $.noop,
mock: !1,
data: {
token: wx.data.t,
lang: wx.data.lang,
f: "json",
ajax: "1"
}
};
t.get = function(e, t) {
return l("get", e, t);
}, t.post = function(e, t) {
return l("post", e, t);
};
function l(e, t, n) {
var r, s;
n && typeof n == "object" ? (r = n.done, s = n.fail) : r = n, typeof t == "string" && t.length > 0 && (t = {
url: t
}), t = $.extend(!0, {}, f, {
type: e,
data: {
random: Math.random().toString()
}
}, t), t.mock && (t.mock === !0 ? t.mock = {
responseText: {
ret: 0,
data: {},
url: t.url,
param: t.data
}
} : t.mock && !t.mock.responseText && !t.mock.response && (t.mock = {
responseText: t.mock
}), t.mock.url = t.mock.url || t.url, $.mockjax(t.mock)), !t.mask || ($.isPlainObject(t.mask) ? i.show(t.mask) : i.show());
var o = $.ajax(t);
return o.callback = o.done, o.done(function(e) {
r && r(e);
}).fail(function(e, n, r) {
s && s(n), u.error(n, t), a.trigger("xhrError", e, n, r, t);
}).always(function() {
t.mask && i.hide();
}), o;
}
var c = {
"0": "恭喜你，操作成功！",
"-1": "系统错误，请稍后尝试。",
"-2": "参数错误，请核对参数后重试。",
"-3": "登录态超时，请重新登录。",
"-4": "请求页面的域名没有授权。",
"-5": "请求方式错误，请确认请求方式后重试。",
"-6": "表单名称验证出错，请核对表单名称后重试。",
"-7": "对不起，你没有权限访问目标请求。"
};
t.show = function(e, t) {
var n = c[e.base_resp.ret] || "系统繁忙，请稍后尝试！";
if (e.base_resp.ret == 0) {
t ? s.show({
type: "succ",
msg: "系统提示|" + n
}) : o.suc(n);
return;
}
t ? s.show("系统错误|" + n) : o.err(n);
};
} catch (h) {
wx.jslog({
src: "common/wx/Cgi.js"
}, h);
}
});;define("common/wx/dialog.js", [ "biz_common/jquery.ui/jquery.ui.draggable.js", "tpl/dialog.html.js" ], function(e, t, n) {
try {
var r = +(new Date);
"use strict", e("biz_common/jquery.ui/jquery.ui.draggable.js");
var i = {
title: "温馨提示",
type: "warn",
msg: "错误信息|对不起，系统繁忙请稍后尝试。",
buttons: [ {
text: "确定",
click: function(e) {
this.remove(e);
}
} ],
width: 720,
height: 0,
draggable: !0,
mask: !0,
className: ""
}, s = {
uid: 0,
uiName: "wxDialog",
iconClass: {
succ: "success",
err: "error",
warn: "warn",
info: "info"
},
btTypes: {
primary: "btn_primary",
normal: "btn_default",
disabled: "btn_disabled"
}
};
s.html = e("tpl/dialog.html.js");
function o(e) {
var t = this;
typeof e == "string" && (e = {
msg: e
}), e = $.extend(!0, {}, i, e), t.id = e.id = [ s.uiName, "_", ++s.uid ].join(""), e.icon = s.iconClass[e.type || "warn"];
var n = [];
n = e.msg.split("|"), n[0] ? n[1] ? e.msg = {
title: n[0],
text: n[1],
msgClass: ""
} : e.msg = {
title: e.msg,
msgClass: "single_line"
} : e.msg = {
text: n[1],
msgClass: "single_line"
}, $.each(e.buttons, function(e, t) {
t.type = s.btTypes[t.type || "primary"];
}), t.opt = e, $(template.compile(s.html)(e)).appendTo("body"), t.dom = $("#" + this.id).parent(), t.dom.css("margin-left", -1 * t.dom.outerWidth() / 2).css("margin-top", -1 * t.dom.outerHeight() / 2), t.dom.fadeIn(), e.draggable && t.dom.draggable(), function() {
$.each($("#" + t.id + " .js_btn"), function(n, r) {
e.buttons[n].click && $(r).click(function() {
return e.buttons[n].click.apply(t), !1;
});
}), $("#" + t.id + " .pop_closed").click(function() {
if (e.close && typeof e.close == "function") {
e.close() && t.remove();
return;
}
t.remove();
});
}();
}
o.prototype = {
hide: function() {
this.opt.mask && this.dom.next().remove(), this.dom.fadeOut();
},
remove: function() {
this.opt.mask && this.dom.next().remove(), this.dom.remove();
},
resetPos: function() {
var e = this;
e.dom.css("margin-left", -1 * e.dom.outerWidth() / 2).css("margin-top", -1 * e.dom.outerHeight() / 2);
}
}, t.show = function(e) {
return new o(e);
};
} catch (u) {
wx.jslog({
src: "common/wx/dialog.js"
}, u);
}
});;define("common/wx/popup.js", [ "common/wx/widgetBridge.js", "tpl/popup.html.js" ], function(e, t, n) {
try {
var r = +(new Date);
"use strict", e("common/wx/widgetBridge.js");
var i = e("tpl/popup.html.js"), s = template.compile(i), o = {
disabled: "btn_disabled",
primary: "btn_primary",
"default": "btn_default"
};
$.widgetBridge("popup", {
$dialogWrp: null,
options: {
title: "温馨提示",
width: 726,
height: null,
template: template.compile,
data: {},
buttons: [],
onHide: null,
onShow: null,
onOK: null,
onCancel: null,
mask: !0,
autoShow: !0
},
_create: function() {
var e = this, t = $.extend(!0, {}, this.options), n = function() {
e.hide();
};
t.buttons && !$.isArray(t.buttons) && (t.buttons = [ t.buttons ]), !t.buttons.length && t.onOK && (t.buttons = [ {
text: "确定",
type: "primary",
click: function() {
var e = t.onOK && t.onOK.call(this);
!e && n();
}
}, {
text: "取消",
click: function() {
var e = t.onCancel && t.onCancel.call(this);
!e && n();
}
} ]), $.each(t.buttons, function(e, t) {
t.type = o[t.type || "default"];
});
var r;
if (this.element.is("script[type=text/html]")) r = this.element.html(), this.options.data && this.options.template && (r = this.options.template(r)(this.options.data)); else {
var i = $("<div></div>").append(this.element.clone()), r = i.html();
this.options.data && this.options.template && (r = this.options.template(r)(this.options.data));
}
t.content = r, this.$dialogWrp = $(s(t)).appendTo("body"), this.$dialogWrp.find(".dialog_bd").children(":first").show(), t.autoShow || this.$dialogWrp.hide(), this.$dialogWrp.find(".pop_closed").click(t.onClose || n), this.$dialogWrp.find(".js_btn").each(function(n, r) {
var i = t.buttons[n].click, s = i ? function(t) {
i.call(e, t);
} : function() {};
$(this).click(s);
}), this.resetPosition();
if (t.autoShow) {
var u = e.options.onShow;
typeof u == "function" && u.call(e);
}
return this.get();
},
show: function() {
var e = this, t = e.options.onShow, n = !0;
this.$dialogWrp.fadeIn(function() {
n && (typeof t == "function" && t.call(e), n = !1);
});
},
resetPosition: function() {
$(this.$dialogWrp.get(0)).css({
"margin-left": -1 * this.$dialogWrp.outerWidth() / 2,
"margin-top": -1 * this.$dialogWrp.outerHeight() / 2
});
},
get: function() {
return this.$dialogWrp.filter(".dialog_wrp");
},
hide: function() {
var e = this, t = e.options.onHide || e.options.close, n = !0;
this.$dialogWrp.fadeOut(function() {
n && (typeof t == "function" && t.call(e), n = !1);
});
},
remove: function() {
this.destroy(), this.$dialogWrp.remove();
}
});
} catch (u) {
wx.jslog({
src: "common/wx/popup.js"
}, u);
}
});;