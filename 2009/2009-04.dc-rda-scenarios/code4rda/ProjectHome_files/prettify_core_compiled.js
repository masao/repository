(function() {
/*
 Copyright (C) 2006 Google Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/
var l=!0,q=null,x=!1;window.PR_SHOULD_USE_CONTINUATION=l;window.PR_TAB_WIDTH=8;window.PR_normalizedHtml=window.PR=window.prettyPrintOne=window.prettyPrint=void 0;window._pr_isIE6=function(){var a=navigator&&navigator.userAgent&&navigator.userAgent.match(/\bMSIE ([678])\./),a=a?+a[1]:x;window._pr_isIE6=function(){return a};return a};
var I=function(a){return a.replace(y,"&amp;").replace(z,"&lt;").replace(D,"&gt;")},N=function(a,f,g){switch(a.nodeType){case 1:var j=a.tagName.toLowerCase();f.push("<",j);var c=a.attributes,m=c.length;if(m){if(g){for(var h=[],n=m;0<=--n;)h[n]=c[n];h.sort(function(a,f){return a.name<f.name?-1:a.name===f.name?0:1});c=h}for(n=0;n<m;++n)h=c[n],h.specified&&f.push(" ",h.name.toLowerCase(),'="',h.value.replace(y,"&amp;").replace(z,"&lt;").replace(D,"&gt;").replace(aa,"&quot;"),'"')}f.push(">");for(c=a.firstChild;c;c=
c.nextSibling)N(c,f,g);(a.firstChild||!/^(?:br|link|img)$/.test(j))&&f.push("</",j,">");break;case 3:case 4:f.push(I(a.nodeValue))}},O=function(a){function f(a){if("\\"!==a.charAt(0))return a.charCodeAt(0);switch(a.charAt(1)){case "b":return 8;case "t":return 9;case "n":return 10;case "v":return 11;case "f":return 12;case "r":return 13;case "u":case "x":return parseInt(a.substring(2),16)||a.charCodeAt(1);case "0":case "1":case "2":case "3":case "4":case "5":case "6":case "7":return parseInt(a.substring(1),
8);default:return a.charCodeAt(1)}}function g(a){if(32>a)return(16>a?"\\x0":"\\x")+a.toString(16);a=String.fromCharCode(a);if("\\"===a||"-"===a||"["===a||"]"===a)a="\\"+a;return a}function j(a){var e=a.substring(1,a.length-1).match(RegExp("\\\\u[0-9A-Fa-f]{4}|\\\\x[0-9A-Fa-f]{2}|\\\\[0-3][0-7]{0,2}|\\\\[0-7]{1,2}|\\\\[\\s\\S]|-|[^-\\\\]","g"));a=[];for(var b=[],j="^"===e[0],d=j?1:0,v=e.length;d<v;++d){var i=e[d];switch(i){case "\\B":case "\\b":case "\\D":case "\\d":case "\\S":case "\\s":case "\\W":case "\\w":a.push(i);
continue}var i=f(i),c;d+2<v&&"-"===e[d+1]?(c=f(e[d+2]),d+=2):c=i;b.push([i,c]);65>c||122<i||(65>c||90<i||b.push([Math.max(65,i)|32,Math.min(c,90)|32]),97>c||122<i||b.push([Math.max(97,i)&-33,Math.min(c,122)&-33]))}b.sort(function(a,b){return a[0]-b[0]||b[1]-a[1]});e=[];i=[NaN,NaN];for(d=0;d<b.length;++d)v=b[d],v[0]<=i[1]+1?i[1]=Math.max(i[1],v[1]):e.push(i=v);b=["["];j&&b.push("^");b.push.apply(b,a);for(d=0;d<e.length;++d)v=e[d],b.push(g(v[0])),v[1]>v[0]&&(v[1]+1>v[0]&&b.push("-"),b.push(g(v[1])));
b.push("]");return b.join("")}function c(a){for(var e=a.source.match(RegExp("(?:\\[(?:[^\\x5C\\x5D]|\\\\[\\s\\S])*\\]|\\\\u[A-Fa-f0-9]{4}|\\\\x[A-Fa-f0-9]{2}|\\\\[0-9]+|\\\\[^ux0-9]|\\(\\?[:!=]|[\\(\\)\\^]|[^\\x5B\\x5C\\(\\)\\^]+)","g")),b=e.length,f=[],d=0,c=0;d<b;++d){var i=e[d];"("===i?++c:"\\"===i.charAt(0)&&(i=+i.substring(1))&&i<=c&&(f[i]=-1)}for(d=1;d<f.length;++d)-1===f[d]&&(f[d]=++m);for(c=d=0;d<b;++d)i=e[d],"("===i?(++c,void 0===f[c]&&(e[d]="(?:")):"\\"===i.charAt(0)&&(i=+i.substring(1))&&
i<=c&&(e[d]="\\"+f[c]);for(c=d=0;d<b;++d)"^"===e[d]&&"^"!==e[d+1]&&(e[d]="");if(a.ignoreCase&&h)for(d=0;d<b;++d)i=e[d],a=i.charAt(0),2<=i.length&&"["===a?e[d]=j(i):"\\"!==a&&(e[d]=i.replace(/[a-zA-Z]/g,function(a){a=a.charCodeAt(0);return"["+String.fromCharCode(a&-33,a|32)+"]"}));return e.join("")}for(var m=0,h=x,n=x,p=0,k=a.length;p<k;++p){var r=a[p];if(r.ignoreCase)n=l;else if(/[a-z]/i.test(r.source.replace(/\\u[0-9a-f]{4}|\\x[0-9a-f]{2}|\\[^ux]/gi,""))){h=l;n=x;break}}for(var u=[],p=0,k=a.length;p<
k;++p){r=a[p];if(r.global||r.multiline)throw Error(""+r);u.push("(?:"+c(r)+")")}return RegExp(u.join("|"),n?"gi":"g")},P=function(a,f,g,j){f&&(a={source:f,basePos:a},g(a),j.push.apply(j,a.decorations))},Q=function(a,f){for(var g={},j,c=a.concat(f),m=[],h={},n=0,p=c.length;n<p;++n){var k=c[n],r=k[3];if(r)for(var u=r.length;0<=--u;)g[r.charAt(u)]=k;k=k[1];r=""+k;h.hasOwnProperty(r)||(m.push(k),h[r]=q)}m.push(/[\0-\uffff]/);j=O(m);var A=f.length,e=function(a){for(var c=a.source,d=a.basePos,k=[d,"pln"],
i=0,c=c.match(j)||[],u={},n=0,m=c.length;n<m;++n){var h=c[n],p=u[h],r=void 0,s;if("string"===typeof p)s=x;else{var t=g[h.charAt(0)];if(t)r=h.match(t[1]),p=t[0];else{for(s=0;s<A;++s)if(t=f[s],r=h.match(t[1])){p=t[0];break}r||(p="pln")}if((s=5<=p.length&&"lang-"===p.substring(0,5))&&!(r&&"string"===typeof r[1]))s=x,p="src";s||(u[h]=p)}t=i;i+=h.length;if(s){s=r[1];var B=h.indexOf(s),w=B+s.length;r[2]&&(w=h.length-r[2].length,B=w-s.length);p=p.substring(5);P(d+t,h.substring(0,B),e,k);P(d+t+B,s,ba(p,s),
k);P(d+t+w,h.substring(w),e,k)}else k.push(d+t,p)}a.decorations=k};return e},S=function(a){var f=[],g=[];a.tripleQuotedStrings?f.push(["str",/^(?:\'\'\'(?:[^\'\\]|\\[\s\S]|\'{1,2}(?=[^\']))*(?:\'\'\'|$)|\"\"\"(?:[^\"\\]|\\[\s\S]|\"{1,2}(?=[^\"]))*(?:\"\"\"|$)|\'(?:[^\\\']|\\[\s\S])*(?:\'|$)|\"(?:[^\\\"]|\\[\s\S])*(?:\"|$))/,q,"'\""]):a.multiLineStrings?f.push(["str",/^(?:\'(?:[^\\\']|\\[\s\S])*(?:\'|$)|\"(?:[^\\\"]|\\[\s\S])*(?:\"|$)|\`(?:[^\\\`]|\\[\s\S])*(?:\`|$))/,q,"'\"`"]):f.push(["str",/^(?:\'(?:[^\\\'\r\n]|\\.)*(?:\'|$)|\"(?:[^\\\"\r\n]|\\.)*(?:\"|$))/,
q,"\"'"]);a.verbatimStrings&&g.push(["str",/^@\"(?:[^\"]|\"\")*(?:\"|$)/,q]);var j=a.hashComments;j&&(a.cStyleComments?(1<j?f.push(["com",/^#(?:##(?:[^#]|#(?!##))*(?:###|$)|.*)/,q,"#"]):f.push(["com",/^#(?:(?:define|elif|else|endif|error|ifdef|include|ifndef|line|pragma|undef|warning)\b|[^\r\n]*)/,q,"#"]),g.push(["str",/^<(?:(?:(?:\.\.\/)*|\/?)(?:[\w-]+(?:\/[\w-]+)+)?[\w-]+\.h|[a-z]\w*)>/,q])):f.push(["com",/^#[^\r\n]*/,q,"#"]));a.cStyleComments&&(g.push(["com",/^\/\/[^\r\n]*/,q]),g.push(["com",/^\/\*[\s\S]*?(?:\*\/|$)/,
q]));a.regexLiterals&&g.push(["lang-regex",RegExp("^"+ha+"(/(?=[^/*])(?:[^/\\x5B\\x5C]|\\x5C[\\s\\S]|\\x5B(?:[^\\x5C\\x5D]|\\x5C[\\s\\S])*(?:\\x5D|$))+/)")]);a=a.keywords.replace(/^\s+|\s+$/g,"");a.length&&g.push(["kwd",RegExp("^(?:"+a.replace(/\s+/g,"|")+")\\b"),q]);f.push(["pln",/^\s+/,q," \r\n\t\u00a0"]);g.push(["lit",/^@[a-z_$][a-z_$@0-9]*/i,q],["typ",/^@?[A-Z]+[a-z][A-Za-z_$@0-9]*/,q],["pln",/^[a-z_$][a-z_$@0-9]*/i,q],["lit",/^(?:0x[a-f0-9]+|(?:\d(?:_\d+)*\d*(?:\.\d*)?|\.\d\+)(?:e[+\-]?\d+)?)[a-z]*/i,
q,"0123456789"],["pun",/^.[^\s\w\.$@\'\"\`\/\#]*/,q]);return Q(f,g)},U=function(a,f){for(var g=f.length;0<=--g;){var j=f[g];T.hasOwnProperty(j)?"console"in window&&console.warn("cannot override language handler %s",j):T[j]=a}},ba=function(a,f){if(!a||!T.hasOwnProperty(a))a=/^\s*</.test(f)?"default-markup":"default-code";return T[a]},ta=function(a){var f=a.sourceCodeHtml,g=a.langExtension;a.prettyPrintedHtml=f;try{var j,c=f.match(ia),f=[],m=0,h=[];if(c)for(var n=0,p=c.length;n<p;++n){var k=c[n];if(1<
k.length&&"<"===k.charAt(0)){if(!ja.test(k))if(ka.test(k))f.push(k.substring(9,k.length-3)),m+=k.length-12;else if(la.test(k))f.push("\n"),++m;else if(0<=k.indexOf("nocode")&&k.replace(/\s(\w+)\s*=\s*(?:\"([^\"]*)\"|'([^\']*)'|(\S+))/g,' $1="$2$3$4"').match(/[cC][lL][aA][sS][sS]=\"[^\"]*\bnocode\b/)){var r=k.match(ma)[2],u=1,A;A=n+1;a:for(;A<p;++A){var e=c[A].match(ma);if(e&&e[2]===r)if("/"===e[1]){if(0===--u)break a}else++u}A<p?(h.push(m,c.slice(n,A+1).join("")),n=A):h.push(m,k)}else h.push(m,k)}else{var b;
var u=k,C=u.indexOf("&");if(0>C)b=u;else{for(--C;0<=(C=u.indexOf("&#",C+1));){var d=u.indexOf(";",C);if(0<=d){var v=u.substring(C+3,d),i=10;v&&"x"===v.charAt(0)&&(v=v.substring(1),i=16);var X=parseInt(v,i);isNaN(X)||(u=u.substring(0,C)+String.fromCharCode(X)+u.substring(d+1))}}b=u.replace(na,"<").replace(oa,">").replace(pa,"'").replace(qa,'"').replace(ra," ").replace(sa,"&")}f.push(b);m+=b.length}}j={source:f.join(""),tags:h};var Y=j.source;a.source=Y;a.basePos=0;a.extractedTags=j.tags;ba(g,Y)(a);
var g=function(a){if(a>B){w&&w!==J&&(t.push("</span>"),w=q);!w&&J&&(w=J,t.push('<span class="',w,'">'));var b=I(ca(Z.substring(B,a))).replace(da?va:wa,"$1&#160;");da=xa.test(b);t.push(b.replace(ya,R));B=a}},Z=a.source,G=a.extractedTags,E=a.decorations,H=a.numberLines,s=a.sourceNode,t=[],B=0,w=q,J=q,c=j=0,ca,ea=window.PR_TAB_WIDTH,F=0;ca=function(a){for(var b=q,c=0,d=0,e=a.length;d<e;++d){var f=a.charAt(d);switch(f){case "\t":b||(b=[]);b.push(a.substring(c,d));c=ea-F%ea;for(F+=c;0<=c;c-=16)b.push("                ".substring(0,
c));c=d+1;break;case "\n":F=0;break;default:++F}}if(!b)return a;b.push(a.substring(c));return b.join("")};var wa=/([\r\n ]) /g,va=/(^| ) /gm,ya=/\r\n?|\n/g,xa=/[ \r\n]$/,da=l,K=window._pr_isIE6(),fa=K?s&&"PRE"===s.tagName?6===K?"&#160;\r\n":7===K?"&#160;<br />\r":8===K?"&#160;<br />":"&#160;\r":"&#160;<br />":"<br />",R;if(H){for(var ga=[],s=0;10>s;++s)ga[s]=fa+'</li><li class="L'+s+'">';var L="number"===typeof H?H-1:0;t.push('<ol class="linenums"><li class="L',L%10,'"');L&&t.push(' value="',L+1,
'"');t.push(">");R=function(){var a=ga[++L%10];return w?"</span>"+a+'<span class="'+w+'">':a}}else R=fa;for(;;){var za;if(za=j<G.length?c<E.length?G[j]<=E[c]:l:x)g(G[j]),w&&(t.push("</span>"),w=q),t.push(G[j+1]),j+=2;else if(c<E.length)g(E[c]),J=E[c+1],c+=2;else break}g(Z.length);w&&t.push("</span>");H&&t.push("</li></ol>");a.prettyPrintedHtml=t.join("")}catch(M){"console"in window&&console.log(M&&M.stack?M.stack:M)}},ua=function(a,f,g){a={sourceCodeHtml:a,langExtension:f,numberLines:g};ta(a);return a.prettyPrintedHtml},
Ba=function(a){function f(){for(var c=window.PR_SHOULD_USE_CONTINUATION?n.now()+250:Infinity;p<j.length&&n.now()<c;p++){var g=j[p];if(g.className&&0<=g.className.indexOf("prettyprint")){var h=g.className.match(/\blang-(\w+)\b/);h&&(h=h[1]);for(var e=x,b=g.parentNode;b;b=b.parentNode)if(("pre"===b.tagName||"code"===b.tagName||"xmp"===b.tagName)&&b.className&&0<=b.className.indexOf("prettyprint")){e=l;break}if(!e){b=g;q===V&&(e=document.createElement("PRE"),e.appendChild(document.createTextNode('<!DOCTYPE foo PUBLIC "foo bar">\n<foo />')),
V=!/</.test(e.innerHTML));if(V)if(e=b.innerHTML,"XMP"===b.tagName)e=I(e);else{if("PRE"===b.tagName||!Aa.test(e))b=l;else{var m="";b.currentStyle?m=b.currentStyle.whiteSpace:window.getComputedStyle&&(m=window.getComputedStyle(b,q).whiteSpace);b=!m||"pre"===m}b||(e=e.replace(/(<br\s*\/?>)[\r\n]+/g,"$1").replace(/(?:[\r\n]+[ \t]*)+/g," "))}else{e=[];for(b=b.firstChild;b;b=b.nextSibling)N(b,e);e=e.join("")}e=e.replace(/(?:\r\n?|\n)$/,"");b=g.className.match(/\blinenums\b(?::(\d+))?/);k={sourceCodeHtml:e,
langExtension:h,sourceNode:g,numberLines:b?b[1]&&b[1].length?+b[1]:l:x};ta(k);if(g=k.prettyPrintedHtml)if(h=k.sourceNode,"XMP"===h.tagName){e=document.createElement("PRE");for(b=0;b<h.attributes.length;++b)if(m=h.attributes[b],m.specified){var d=m.name.toLowerCase();"class"===d?e.className=m.value:e.setAttribute(m.name,m.value)}e.innerHTML=g;h.parentNode.replaceChild(e,h)}else h.innerHTML=g}}}p<j.length?setTimeout(f,250):a&&a()}for(var g=[document.getElementsByTagName("pre"),document.getElementsByTagName("code"),
document.getElementsByTagName("xmp")],j=[],c=0;c<g.length;++c)for(var m=0,h=g[c].length;m<h;++m)j.push(g[c][m]);var g=q,n=Date;n.now||(n={now:function(){return(new Date).getTime()}});var p=0,k;f()},Ca,Da="! != !== # % %= & && &&= &= ( * *= += , -= -> / /= : :: ; < << <<= <= = == === > >= >> >>= >>> >>>= ? @ [ ^ ^= ^^ ^^= { | |= || ||= ~ break case continue delete do else finally instanceof return throw try typeof".split(" "),W="(?:^^|[+-]",$=0;
for(;$<Da.length;++$)W+="|"+Da[$].replace(/([^=<>:&a-z])/g,"\\$1");
var ha=Ca=W+=")\\s*",y=/&/g,z=/</g,D=/>/g,aa=/\"/g,na=/&lt;/g,oa=/&gt;/g,pa=/&apos;/g,qa=/&quot;/g,sa=/&amp;/g,ra=/&nbsp;/g,Aa=/[\r\n]/g,V=q,ia=RegExp("[^<]+|\x3c!--[\\s\\S]*?--\x3e|<!\\[CDATA\\[[\\s\\S]*?\\]\\]>|</?[a-zA-Z](?:[^>\"']|'[^']*'|\"[^\"]*\")*>|<","g"),ja=/^<\!--/,ka=/^<!\[CDATA\[/,la=/^<br\b/i,ma=/^<(\/?)([a-zA-Z][a-zA-Z0-9]*)/,Ea=S({keywords:"break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof alignof align_union asm axiom bool concept concept_map const_cast constexpr decltype dynamic_cast explicit export friend inline late_check mutable namespace nullptr reinterpret_cast static_assert static_cast template typeid typename using virtual wchar_t where break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof abstract boolean byte extends final finally implements import instanceof null native package strictfp super synchronized throws transient as base by checked decimal delegate descending dynamic event fixed foreach from group implicit in interface internal into is lock object out override orderby params partial readonly ref sbyte sealed stackalloc string select uint ulong unchecked unsafe ushort var break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof debugger eval export function get null set undefined var with Infinity NaN caller delete die do dump elsif eval exit foreach for goto if import last local my next no our print package redo require sub undef unless until use wantarray while BEGIN END break continue do else for if return while and as assert class def del elif except exec finally from global import in is lambda nonlocal not or pass print raise try with yield False True None break continue do else for if return while alias and begin case class def defined elsif end ensure false in module next nil not or redo rescue retry self super then true undef unless until when yield BEGIN END break continue do else for if return while case done elif esac eval fi function in local set then until ",hashComments:l,
cStyleComments:l,multiLineStrings:l,regexLiterals:l}),T={};U(Ea,["default-code"]);U(Q([],[["pln",/^[^<?]+/],["dec",/^<!\w[^>]*(?:>|$)/],["com",/^<\!--[\s\S]*?(?:-\->|$)/],["lang-",/^<\?([\s\S]+?)(?:\?>|$)/],["lang-",/^<%([\s\S]+?)(?:%>|$)/],["pun",/^(?:<[%?]|[%?]>)/],["lang-",/^<xmp\b[^>]*>([\s\S]+?)<\/xmp\b[^>]*>/i],["lang-js",/^<script\b[^>]*>([\s\S]*?)(<\/script\b[^>]*>)/i],["lang-css",/^<style\b[^>]*>([\s\S]*?)(<\/style\b[^>]*>)/i],["lang-in.tag",/^(<\/?[a-z][^<>]*>)/i]]),"default-markup htm html mxml xhtml xml xsl".split(" "));
U(Q([["pln",/^[\s]+/,q," \t\r\n"],["atv",/^(?:\"[^\"]*\"?|\'[^\']*\'?)/,q,"\"'"]],[["tag",/^^<\/?[a-z](?:[\w.:-]*\w)?|\/?>$/i],["atn",/^(?!style[\s=]|on)[a-z](?:[\w:-]*\w)?/i],["lang-uq.val",/^=\s*([^>\'\"\s]*(?:[^>\'\"\s\/]|\/(?=\s)))/],["pun",/^[=<>\/]+/],["lang-js",/^on\w+\s*=\s*\"([^\"]+)\"/i],["lang-js",/^on\w+\s*=\s*\'([^\']+)\'/i],["lang-js",/^on\w+\s*=\s*([^\"\'>\s]+)/i],["lang-css",/^style\s*=\s*\"([^\"]+)\"/i],["lang-css",/^style\s*=\s*\'([^\']+)\'/i],["lang-css",/^style\s*=\s*([^\"\'>\s]+)/i]]),
["in.tag"]);U(Q([],[["atv",/^[\s\S]+/]]),["uq.val"]);
U(S({keywords:"break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof alignof align_union asm axiom bool concept concept_map const_cast constexpr decltype dynamic_cast explicit export friend inline late_check mutable namespace nullptr reinterpret_cast static_assert static_cast template typeid typename using virtual wchar_t where ",hashComments:l,
cStyleComments:l}),"c cc cpp cxx cyc m".split(" "));U(S({keywords:"null true false"}),["json"]);
U(S({keywords:"break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof abstract boolean byte extends final finally implements import instanceof null native package strictfp super synchronized throws transient as base by checked decimal delegate descending dynamic event fixed foreach from group implicit in interface internal into is lock object out override orderby params partial readonly ref sbyte sealed stackalloc string select uint ulong unchecked unsafe ushort var ",hashComments:l,
cStyleComments:l,verbatimStrings:l}),["cs"]);
U(S({keywords:"break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof abstract boolean byte extends final finally implements import instanceof null native package strictfp super synchronized throws transient ",cStyleComments:l}),["java"]);
U(S({keywords:"break continue do else for if return while case done elif esac eval fi function in local set then until ",hashComments:l,multiLineStrings:l}),["bsh","csh","sh"]);U(S({keywords:"break continue do else for if return while and as assert class def del elif except exec finally from global import in is lambda nonlocal not or pass print raise try with yield False True None ",hashComments:l,multiLineStrings:l,tripleQuotedStrings:l}),["cv","py"]);
U(S({keywords:"caller delete die do dump elsif eval exit foreach for goto if import last local my next no our print package redo require sub undef unless until use wantarray while BEGIN END ",hashComments:l,multiLineStrings:l,regexLiterals:l}),["perl","pl","pm"]);
U(S({keywords:"break continue do else for if return while alias and begin case class def defined elsif end ensure false in module next nil not or redo rescue retry self super then true undef unless until when yield BEGIN END ",hashComments:l,multiLineStrings:l,regexLiterals:l}),["rb"]);
U(S({keywords:"break continue do else for if return while auto case char const default double enum extern float goto int long register short signed sizeof static struct switch typedef union unsigned void volatile catch class delete false import new operator private protected public this throw true try typeof debugger eval export function get null set undefined var with Infinity NaN ",cStyleComments:l,regexLiterals:l}),["js"]);
U(S({keywords:"all and by catch class else extends false finally for if in is isnt loop new no not null of off on or return super then true try unless until when while yes ",hashComments:3,cStyleComments:l,multilineStrings:l,tripleQuotedStrings:l,regexLiterals:l}),["coffee"]);U(Q([],[["str",/^[\s\S]+/]]),["regex"]);window.PR_normalizedHtml=N;window.prettyPrintOne=ua;window.prettyPrint=Ba;
window.PR={combinePrefixPatterns:O,createSimpleLexer:Q,registerLangHandler:U,sourceDecorator:S,PR_ATTRIB_NAME:"atn",PR_ATTRIB_VALUE:"atv",PR_COMMENT:"com",PR_DECLARATION:"dec",PR_KEYWORD:"kwd",PR_LITERAL:"lit",PR_NOCODE:"nocode",PR_PLAIN:"pln",PR_PUNCTUATION:"pun",PR_SOURCE:"src",PR_STRING:"str",PR_TAG:"tag",PR_TYPE:"typ"};
})();