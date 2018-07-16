﻿/*!
 * Smooth Scroll - v1.4.12 - 2013-09-19
 * https://github.com/kswedberg/jquery-smooth-scroll
 * Copyright (c) 2013 Karl Swedberg
 * Licensed MIT (https://github.com/kswedberg/jquery-smooth-scroll/blob/master/LICENSE-MIT)
 */
(function(t){function l(t){return t.replace(/(:|\.)/g,"\\$1")}var e="1.4.12",o={exclude:[],excludeWithin:[],offset:0,direction:"top",scrollElement:null,scrollTarget:null,beforeScroll:function(){},afterScroll:function(){},easing:"swing",speed:400,autoCoefficent:2,preventDefault:!0},n=function(l){var e=[],o=!1,n=l.dir&&"left"==l.dir?"scrollLeft":"scrollTop";return this.each(function(){if(this!=document&&this!=window){var l=t(this);l[n]()>0?e.push(this):(l[n](1),o=l[n]()>0,o&&e.push(this),l[n](0))}}),e.length||this.each(function(){"BODY"===this.nodeName&&(e=[this])}),"first"===l.el&&e.length>1&&(e=[e[0]]),e};t.fn.extend({scrollable:function(t){var l=n.call(this,{dir:t});return this.pushStack(l)},firstScrollable:function(t){var l=n.call(this,{el:"first",dir:t});return this.pushStack(l)},smoothScroll:function(e){e=e||{};var o=t.extend({},t.fn.smoothScroll.defaults,e),n=t.smoothScroll.filterPath(location.pathname);return this.unbind("click.smoothscroll").bind("click.smoothscroll",function(e){var r=this,s=t(this),c=o.exclude,i=o.excludeWithin,a=0,f=0,h=!0,u={},d=location.hostname===r.hostname||!r.hostname,m=o.scrollTarget||(t.smoothScroll.filterPath(r.pathname)||n)===n,p=l(r.hash);if(o.scrollTarget||d&&m&&p){for(;h&&c.length>a;)s.is(l(c[a++]))&&(h=!1);for(;h&&i.length>f;)s.closest(i[f++]).length&&(h=!1)}else h=!1;h&&(o.preventDefault&&e.preventDefault(),t.extend(u,o,{scrollTarget:o.scrollTarget||p,link:r}),t.smoothScroll(u))}),this}}),t.smoothScroll=function(l,e){var o,n,r,s,c=0,i="offset",a="scrollTop",f={},h={};"number"==typeof l?(o=t.fn.smoothScroll.defaults,r=l):(o=t.extend({},t.fn.smoothScroll.defaults,l||{}),o.scrollElement&&(i="position","static"==o.scrollElement.css("position")&&o.scrollElement.css("position","relative"))),o=t.extend({link:null},o),a="left"==o.direction?"scrollLeft":a,o.scrollElement?(n=o.scrollElement,/^(?:HTML|BODY)$/.test(n[0].nodeName)||(c=n[a]())):n=t("html, body").firstScrollable(o.direction),o.beforeScroll.call(n,o),r="number"==typeof l?l:e||t(o.scrollTarget)[i]()&&t(o.scrollTarget)[i]()[o.direction]||0,f[a]=r+c+o.offset,s=o.speed,"auto"===s&&(s=f[a]||n.scrollTop(),s/=o.autoCoefficent),h={duration:s,easing:o.easing,complete:function(){o.afterScroll.call(o.link,o)}},o.step&&(h.step=o.step),n.length?n.stop().animate(f,h):o.afterScroll.call(o.link,o)},t.smoothScroll.version=e,t.smoothScroll.filterPath=function(t){return t.replace(/^\//,"").replace(/(?:index|default).[a-zA-Z]{3,4}$/,"").replace(/\/$/,"")},t.fn.smoothScroll.defaults=o})(jQuery);