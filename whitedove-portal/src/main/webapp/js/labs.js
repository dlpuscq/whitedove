webpackJsonp([9, 46], {
        0 : function(e, t) {
            e.exports = function(e, t, n, a) {
                var o, i = e = e || {},
                    s = typeof e.
                        default;
                "object" !== s && "function" !== s || (o = e, i = e.
                    default);
                var r = "function" == typeof i ? i.options: i;
                if (t && (r.render = t.render, r.staticRenderFns = t.staticRenderFns), n && (r._scopeId = n), a) {
                    var c = Object.create(r.computed || null);
                    Object.keys(a).forEach(function(e) {
                        var t = a[e];
                        c[e] = function() {
                            return t
                        }
                    }),
                        r.computed = c
                }
                return {
                    esModule: o,
                    exports: i,
                    options: r
                }
            }
        },
        1 : function(e, t) {
            e.exports = function() {
                var e = [];
                return e.toString = function() {
                    for (var e = [], t = 0; t < this.length; t++) {
                        var n = this[t];
                        n[2] ? e.push("@media " + n[2] + "{" + n[1] + "}") : e.push(n[1])
                    }
                    return e.join("")
                },
                    e.i = function(t, n) {
                        "string" == typeof t && (t = [[null, t, ""]]);
                        for (var a = {},
                                 o = 0; o < this.length; o++) {
                            var i = this[o][0];
                            "number" == typeof i && (a[i] = !0)
                        }
                        for (o = 0; o < t.length; o++) {
                            var s = t[o];
                            "number" == typeof s[0] && a[s[0]] || (n && !s[2] ? s[2] = n: n && (s[2] = "(" + s[2] + ") and (" + n + ")"), e.push(s))
                        }
                    },
                    e
            }
        },
        11 : function(e, t) {
            function n(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            var a = function() {
                    function e(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var a = t[n];
                            a.enumerable = a.enumerable || !1,
                                a.configurable = !0,
                            "value" in a && (a.writable = !0),
                                Object.defineProperty(e, a.key, a)
                        }
                    }
                    return function(t, n, a) {
                        return n && e(t.prototype, n),
                        a && e(t, a),
                            t
                    }
                } (),
                o = function() {
                    function e() {
                        n(this, e),
                            this.$lastModal = null,
                            this.setup()
                    }
                    return a(e, [{
                        key: "setup",
                        value: function() {
                            var e = this;
                            $(document).on("show.bs.modal", ".modal",
                                function() {
                                    e.$lastModal && e.$lastModal.attr("id") != this.id && e.$lastModal.modal("hide"),
                                        e.$lastModal = $(this)
                                })
                        }
                    }]),
                        e
                } ();
            new o
        },
        12 : function(e, t) {
            e.exports = function(e, t) {
                for (var n = [], a = {},
                         o = 0; o < t.length; o++) {
                    var i = t[o],
                        s = i[0],
                        r = i[1],
                        c = i[2],
                        l = i[3],
                        d = {
                            id: e + ":" + o,
                            css: r,
                            media: c,
                            sourceMap: l
                        };
                    a[s] ? a[s].parts.push(d) : n.push(a[s] = {
                        id: s,
                        parts: [d]
                    })
                }
                return n
            }
        },
        13 : function(e, t, n) {
            "use strict";
            Object.defineProperty(t, "__esModule", {
                value: !0
            });
            var a = n(10),
                o = n.n(a),
                i = n(20),
                s = n.n(i),
                r = n(21),
                c = n.n(r);
            $("#header-message").length && new o.a({
                el: "#header-message",
                render: function(e) {
                    return e(s.a)
                }
            }),
            $("#header-userbox").length && new o.a({
                el: "#header-userbox",
                render: function(e) {
                    return e(c.a)
                }
            })
        },
        14 : function(e, t, n) {
            "use strict";
            Object.defineProperty(t, "__esModule", {
                value: !0
            });
            var a = n(6),
                o = n.n(a),
                i = $("#header-message").data() || {};
            t.
                default = {
                data: function() {
                    return {
                        screenWidth: document.body.clientWidth,
                        href: i.href,
                        hasMsg: i.hasMsg,
                        msgPage: i.msgPage,
                        show: !1,
                        timer: !1,
                        isNotMobile: !0,
                        data: {}
                    }
                },
                watch: {
                    screenWidth: function(e) {
                        var t = this;
                        this.timer || (this.screenWidth = e, this.timer = !0, setTimeout(function() {
                                t.screenWidth <= 769 ? t.isNotMobile = !1 : t.isNotMobile = !0,
                                    t.timer = !1
                            },
                            500))
                    }
                },
                mounted: function() {
                    var e = this;
                    this.screenWidth <= 769 && (this.isNotMobile = !1),
                        o.a.on("event:msg:new",
                            function(t) {
                                e.data = t,
                                    e.hasMsg = !0,
                                    e.show = !0
                            }),
                        $(window).on("resize",
                            function() {
                                window.screenWidth = document.body.clientWidth,
                                    e.screenWidth = window.screenWidth
                            })
                }
            }
        },
        15 : function(e, t, n) {
            "use strict";
            Object.defineProperty(t, "__esModule", {
                value: !0
            });
            var a = $("#header-userbox").data() || {};
            t.
                default = {
                data: function() {
                    return {
                        screenWidth: document.body.clientWidth,
                        username: a.username,
                        level: a.level,
                        home: a.home,
                        setting: a.setting,
                        logout: a.logout,
                        avatar: a.avatar,
                        isMember: a.isMember,
                        isSeniorMember: a.isSeniorMember,
                        memberIcon: a.memberIcon,
                        show: !1,
                        timer: !1,
                        useMobile: !1
                    }
                },
                watch: {
                    screenWidth: function(e) {
                        var t = this;
                        this.timer || (this.screenWidth = e, this.timer = !0, setTimeout(function() {
                                t.screenWidth <= 768 ? t.useMobile = !0 : t.useMobile = !1,
                                    t.timer = !1
                            },
                            500))
                    }
                },
                mounted: function() {
                    var e = this;
                    this.screenWidth <= 768 && (this.useMobile = !0),
                        $(window).on("resize",
                            function() {
                                window.screenWidth = document.body.clientWidth,
                                    e.screenWidth = window.screenWidth
                            })
                }
            }
        },
        16 : function(e, t, n) {
            t = e.exports = n(1)(),
                t.push([e.i, "\n.fade-enter-active[data-v-07a2dd56],\n.fade-leave-active[data-v-07a2dd56] {\n  transition: opacity .5s;\n}\n.fade-enter[data-v-07a2dd56],\n.fade-leave-active[data-v-07a2dd56] {\n  opacity: 0;\n}\n.header-message[data-v-07a2dd56] {\n  position: relative;\n}\n.header-message > a[data-v-07a2dd56] {\n  position: relative;\n}\n.popover[data-v-07a2dd56] {\n  display: block;\n  position: absolute;\n  top: 50px;\n  left: -66px;\n  width: 180px;\n  background: #fff;\n}\n.popover .msg-content[data-v-07a2dd56] {\n    padding: 8px;\n    font-size: 14px;\n    text-align: center;\n}\n.popover .msg-content a[data-v-07a2dd56] {\n      color: #f66;\n}\n.popover .msg-content a[data-v-07a2dd56]:focus, .popover .msg-content a[data-v-07a2dd56]:hover {\n        text-decoration: none;\n}\n.mark[data-v-07a2dd56] {\n  position: absolute;\n  top: 18px;\n  right: 15px;\n  width: 1px;\n  height: 1px;\n  background: #f66;\n  border-radius: 50%;\n}\n@media (max-width: 768px) {\n.mark[data-v-07a2dd56] {\n    top: 14px;\n    right: calc(50% - 8px);\n}\n}\n", ""])
        },
        17 : function(e, t, n) {
            t = e.exports = n(1)(),
                t.push([e.i, '\n.fade-enter-active[data-v-815c5224],\n.fade-leave-active[data-v-815c5224] {\n  transition: opacity .5s;\n}\n.fade-enter[data-v-815c5224],\n.fade-leave-active[data-v-815c5224] {\n  opacity: 0;\n}\n.header-userbox a[data-v-815c5224] {\n  display: block;\n  padding: 0;\n}\n.header-avatar[data-v-815c5224] {\n  width: 48px;\n  height: 48px;\n  border-radius: 50%;\n}\n.vip-icon[data-v-815c5224] {\n  position: absolute;\n  bottom: 0;\n  right: calc(50% - 30px);\n  width: 20px;\n  height: 20px;\n}\n@media (min-width: 768px) {\n.vip-icon[data-v-815c5224] {\n    right: 0;\n}\n}\n.user[data-v-815c5224] {\n  display: block;\n  position: absolute;\n  top: 50px;\n  left: -150px;\n  width: 220px;\n  padding: 20px;\n  background: #fff;\n  border-radius: 5px;\n  box-shadow: 0 0 4px 1px #ccc;\n}\n.user[data-v-815c5224]:before {\n    content: "";\n    position: absolute;\n    top: -20px;\n    right: 0;\n    width: 220px;\n    height: 50px;\n}\n.user.popover > .arrow[data-v-815c5224] {\n    left: 80%;\n}\n.user-info[data-v-815c5224] {\n  overflow: hidden;\n}\n.user-info a[data-v-815c5224] {\n    float: left;\n}\n.user-info a img[data-v-815c5224] {\n      width: 65px;\n      height: 65px;\n      margin-right: 10px;\n      border-radius: 50%;\n}\n.username[data-v-815c5224] {\n  margin-top: 10px;\n}\n.username > img[data-v-815c5224] {\n    width: 20px;\n}\n.username > span[data-v-815c5224] {\n    display: inline-block;\n    width: 75px;\n    color: #666;\n    font-size: 16px;\n    overflow: hidden;\n    text-overflow: ellipsis;\n    vertical-align: middle;\n}\n.user-level[data-v-815c5224] {\n  margin-top: 10px;\n  color: #666;\n  font-size: 12px;\n}\n.user-level span[data-v-815c5224] {\n    color: #fec42d;\n    font-size: 12px;\n    font-weight: 700;\n}\n.user-links[data-v-815c5224] {\n  margin-top: 20px;\n}\n.user-links a[data-v-815c5224] {\n    display: block;\n    width: 90%;\n    padding: 8px 0;\n    margin: 0 auto;\n    color: #666;\n    font-size: 16px;\n    text-align: center;\n    border-radius: 20px;\n}\n.user-links a[data-v-815c5224]:focus, .user-links a[data-v-815c5224]:hover {\n      text-decoration: none;\n      background: #efefef;\n}\n', ""])
        },
        18 : function(e, t, n) {
            var a = n(16);
            "string" == typeof a && (a = [[e.i, a, ""]]);
            n(3)(a, {});
            a.locals && (e.exports = a.locals)
        },
        19 : function(e, t, n) {
            var a = n(17);
            "string" == typeof a && (a = [[e.i, a, ""]]);
            n(3)(a, {});
            a.locals && (e.exports = a.locals)
        },
        2 : function(e, t, n) {
            function a(e) {
                for (var t = 0; t < e.length; t++) {
                    var n = e[t],
                        a = d[n.id];
                    if (a) {
                        a.refs++;
                        for (var o = 0; o < a.parts.length; o++) a.parts[o](n.parts[o]);
                        for (; o < n.parts.length; o++) a.parts.push(s(n.parts[o]));
                        a.parts.length > n.parts.length && (a.parts.length = n.parts.length)
                    } else {
                        for (var i = [], o = 0; o < n.parts.length; o++) i.push(s(n.parts[o]));
                        d[n.id] = {
                            id: n.id,
                            refs: 1,
                            parts: i
                        }
                    }
                }
            }
            function o(e, t) {
                for (var n = [], a = {},
                         o = 0; o < t.length; o++) {
                    var i = t[o],
                        s = i[0],
                        r = i[1],
                        c = i[2],
                        l = i[3],
                        d = {
                            css: r,
                            media: c,
                            sourceMap: l
                        };
                    a[s] ? (d.id = e + ":" + a[s].parts.length, a[s].parts.push(d)) : (d.id = e + ":0", n.push(a[s] = {
                        id: s,
                        parts: [d]
                    }))
                }
                return n
            }
            function i() {
                var e = document.createElement("style");
                return e.type = "text/css",
                    u.appendChild(e),
                    e
            }
            function s(e) {
                var t, n, a = document.querySelector('style[data-vue-ssr-id~="' + e.id + '"]'),
                    o = null != a;
                if (o && h) return m;
                if (v) {
                    var s = p++;
                    a = f || (f = i()),
                        t = r.bind(null, a, s, !1),
                        n = r.bind(null, a, s, !0)
                } else a = a || i(),
                    t = c.bind(null, a),
                    n = function() {
                        a.parentNode.removeChild(a)
                    };
                return o || t(e),
                    function(a) {
                        if (a) {
                            if (a.css === e.css && a.media === e.media && a.sourceMap === e.sourceMap) return;
                            t(e = a)
                        } else n()
                    }
            }
            function r(e, t, n, a) {
                var o = n ? "": a.css;
                if (e.styleSheet) e.styleSheet.cssText = g(t, o);
                else {
                    var i = document.createTextNode(o),
                        s = e.childNodes;
                    s[t] && e.removeChild(s[t]),
                        s.length ? e.insertBefore(i, s[t]) : e.appendChild(i)
                }
            }
            function c(e, t) {
                var n = t.css,
                    a = t.media,
                    o = t.sourceMap;
                if (a && e.setAttribute("media", a), o && (n += "\n/*# sourceURL=" + o.sources[0] + " */", n += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(o)))) + " */"), e.styleSheet) e.styleSheet.cssText = n;
                else {
                    for (; e.firstChild;) e.removeChild(e.firstChild);
                    e.appendChild(document.createTextNode(n))
                }
            }
            var l = "undefined" != typeof document;
            if ("undefined" != typeof DEBUG && DEBUG && !l) throw new Error("vue-style-loader cannot be used in a non-browser environment. Use { target: 'node' } in your Webpack config to indicate a server-rendering environment.");
            var o = n(12),
                d = {},
                u = l && (document.head || document.getElementsByTagName("head")[0]),
                f = null,
                p = 0,
                h = !1,
                m = function() {},
                v = "undefined" != typeof navigator && /msie [6-9]\b/.test(navigator.userAgent.toLowerCase());
            e.exports = function(e, t, n) {
                h = n;
                var i = o(e, t);
                return a(i),
                    function(t) {
                        for (var n = [], s = 0; s < i.length; s++) {
                            var r = i[s],
                                c = d[r.id];
                            c.refs--,
                                n.push(c)
                        }
                        t ? (i = o(e, t), a(i)) : i = [];
                        for (var s = 0; s < n.length; s++) {
                            var c = n[s];
                            if (0 === c.refs) {
                                for (var l = 0; l < c.parts.length; l++) c.parts[l]();
                                delete d[c.id]
                            }
                        }
                    }
            };
            var g = function() {
                var e = [];
                return function(t, n) {
                    return e[t] = n,
                        e.filter(Boolean).join("\n")
                }
            } ()
        },
        20 : function(e, t, n) {
            n(24);
            var a = n(0)(n(14), n(22), "data-v-07a2dd56", null);
            a.options.__file = "/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/message.vue",
            a.esModule && Object.keys(a.esModule).some(function(e) {
                return "default" !== e && "__esModule" !== e
            }) && console.error("named exports are not supported in *.vue files."),
            a.options.functional && console.error("[vue-loader] message.vue: functional components are not supported with templates, they should use render functions."),
                e.exports = a.exports
        },
        21 : function(e, t, n) {
            n(25);
            var a = n(0)(n(15), n(23), "data-v-815c5224", null);
            a.options.__file = "/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/userbox.vue",
            a.esModule && Object.keys(a.esModule).some(function(e) {
                return "default" !== e && "__esModule" !== e
            }) && console.error("named exports are not supported in *.vue files."),
            a.options.functional && console.error("[vue-loader] userbox.vue: functional components are not supported with templates, they should use render functions."),
                e.exports = a.exports
        },
        22 : function(e, t, n) {
            e.exports = {
                render: function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("li", {
                            staticClass: "header-message"
                        },
                        [n("a", {
                                attrs: {
                                    href: e.href
                                }
                            },
                            [n("i", {
                                staticClass: "fa fa-bell-o"
                            }), e._v(" "), e.hasMsg ? n("div", {
                                staticClass: "mark"
                            }) : e._e()]), e._v(" "), e.isNotMobile ? n("transition", {
                                attrs: {
                                    name: "fade"
                                }
                            },
                            [e.show ? n("div", {
                                    staticClass: "popover bottom fade in",
                                    on: {
                                        mouseleave: function(t) {
                                            e.show = !1
                                        }
                                    }
                                },
                                [n("div", {
                                    staticClass: "arrow"
                                }), e._v(" "), n("div", {
                                        staticClass: "msg-content"
                                    },
                                    [n("a", {
                                            attrs: {
                                                href: e.msgPage
                                            }
                                        },
                                        [e._v("有新消息啦～")])])]) : e._e()]) : e._e()], 1)
                },
                staticRenderFns: []
            },
                e.exports.render._withStripped = !0
        },
        23 : function(e, t, n) {
            e.exports = {
                render: function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("li", {
                            staticClass: "header-userbox",
                            class: {
                                dropdown: e.useMobile
                            },
                            on: {
                                mouseover: function(t) {
                                    e.show = !0
                                },
                                mouseleave: function(t) {
                                    e.show = !1
                                }
                            }
                        },
                        [n("a", {
                                class: {
                                    "dropdown-toggle": e.useMobile
                                },
                                attrs: {
                                    "data-toggle": "dropdown"
                                }
                            },
                            [n("img", {
                                staticClass: "header-avatar",
                                attrs: {
                                    src: e.avatar
                                }
                            }), e._v(" "), e.isMember ? n("img", {
                                staticClass: "vip-icon",
                                attrs: {
                                    src: e.memberIcon
                                }
                            }) : e._e(), e._v(" "), e.useMobile ? n("span", {
                                staticClass: "caret"
                            }) : e._e()]), e._v(" "), e.useMobile ? n("ul", {
                                staticClass: "dropdown-menu"
                            },
                            [n("li", [n("a", {
                                    attrs: {
                                        href: e.home
                                    }
                                },
                                [e._v("我的主页")])]), e._v(" "), n("li", [n("a", {
                                    attrs: {
                                        href: e.setting
                                    }
                                },
                                [e._v("个人设置")])]), e._v(" "), n("li", [n("a", {
                                    attrs: {
                                        href: e.logout
                                    }
                                },
                                [e._v("安全退出")])])]) : n("transition", {
                                attrs: {
                                    name: "fade"
                                }
                            },
                            [n("div", {
                                    directives: [{
                                        name: "show",
                                        rawName: "v-show",
                                        value: e.show,
                                        expression: "show"
                                    }],
                                    staticClass: "popover bottom fade in user"
                                },
                                [n("div", {
                                    staticClass: "arrow"
                                }), e._v(" "), n("div", {
                                        staticClass: "user-info"
                                    },
                                    [n("a", {
                                            attrs: {
                                                href: e.home
                                            }
                                        },
                                        [n("img", {
                                            staticClass: "pull-left",
                                            attrs: {
                                                src: e.avatar
                                            }
                                        })]), e._v(" "), n("div", {
                                            staticClass: "pull-left username"
                                        },
                                        [e.isMember ? n("img", {
                                            attrs: {
                                                src: e.memberIcon
                                            }
                                        }) : e._e(), e._v(" "), n("span", [e._v(e._s(e.username))]), e._v(" "), n("div", {
                                                staticClass: "user-level"
                                            },
                                            [e._v("\n                        楼层："), n("span", [e._v(e._s(e.level))])])])]), e._v(" "), n("div", {
                                        staticClass: "user-links"
                                    },
                                    [n("a", {
                                            attrs: {
                                                href: e.home
                                            }
                                        },
                                        [e._v("我的主页")]), e._v(" "), n("a", {
                                            attrs: {
                                                href: e.setting
                                            }
                                        },
                                        [e._v("个人设置")]), e._v(" "), n("a", {
                                            attrs: {
                                                href: e.logout
                                            }
                                        },
                                        [e._v("安全退出")])])])])], 1)
                },
                staticRenderFns: []
            },
                e.exports.render._withStripped = !0
        },
        24 : function(e, t, n) {
            var a = n(18);
            "string" == typeof a && (a = [[e.i, a, ""]]),
            a.locals && (e.exports = a.locals);
            n(2)("21733be4", a, !1)
        },
        25 : function(e, t, n) {
            var a = n(19);
            "string" == typeof a && (a = [[e.i, a, ""]]),
            a.locals && (e.exports = a.locals);
            n(2)("9890ef90", a, !1)
        },
        250 : function(e, t, n) {
            function a(e, t, n, r, c) {
                $.get(e, {
                        owner_id: t || "None",
                        lab_id: n || "None",
                        page: r || 1,
                        page_size: c || 12
                    },
                    function(r) {
                        for (var c = r.data.page,
                                 l = r.data.pages,
                                 d = r.data.items.length,
                                 u = r.data.items,
                                 f = "",
                                 p = 0; p < d; p++) f += '<div class="col-md-3 report-item clearfix"><a href="/courses/reports/' + u[p].id + '" target="_blank"><div class="report-item-course">',
                        u[p].is_top && (f += '<img src="' + s.recommentImg + '">'),
                            f += u[p].course_name + '</div><div class="report-item-lab">' + u[p].lab_name + '</div><div class="report-item-count"><span>' + u[p].length + ' 字</span><div class="report-item-arrow"><div class="report-item-arrow-line"></div></div></div>',
                        u[p].benchmark && (f += '<div class="report-item-benchmark"><img src="' + u[p].benchmark.img_url + '"></div>'),
                            f += '</a><div class="col-xs-8""><div class="report-item-author">' + i.userAvatar(u[p].author, "report-item-avatar") + i.userName(u[p].author) + '</div></div><div class="col-xs-4"><div class="pull-right report-item-comments"><i class="fa fa-comments-o"></i>' + u[p].comments_count + '</div><div class="pull-right report-item-update"> ' + u[p].updated_at + "</div></div></div>";
                        f = f.length > 0 ? f: '<div class="col-md-12 text-center report-item">暂没有公开的实验报告！</div>',
                            $(".report-items").html(f),
                            l > 1 ? (o.pagination(r.data), o.switchPage(c, l,
                                function(o) {
                                    a(e, t, n, o)
                                })) : $(".pagination-container").html("")
                    })
            }
            var o = n(49),
                i = n(9),
                s = $("#jinja-data").data();
            e.exports = {
                getReport: a
            }
        },
        26 : function(e, t, n) {
            n(43);
            var a = n(0)(n(29), n(42), "data-v-9b3c8994", null);
            a.options.__file = "/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/weibo.vue",
            a.esModule && Object.keys(a.esModule).some(function(e) {
                return "default" !== e && "__esModule" !== e
            }) && console.error("named exports are not supported in *.vue files."),
            a.options.functional && console.error("[vue-loader] weibo.vue: functional components are not supported with templates, they should use render functions."),
                e.exports = a.exports
        },
        27 : function(e, t, n) {
            "use strict";
            function a(e) {
                return function() {
                    var t = e.apply(this, arguments);
                    return new Promise(function(e, n) {
                        function a(o, i) {
                            try {
                                var s = t[o](i),
                                    r = s.value
                            } catch(e) {
                                return void n(e)
                            }
                            if (!s.done) return Promise.resolve(r).then(function(e) {
                                    a("next", e)
                                },
                                function(e) {
                                    a("throw", e)
                                });
                            e(r)
                        }
                        return a("next")
                    })
                }
            }
            Object.defineProperty(t, "__esModule", {
                value: !0
            });
            var o = $("#search-box").data() || {};
            t.
                default = {
                data: function() {
                    return {
                        searchJson: "/search/json",
                        url: o.url,
                        keyword: "",
                        items: []
                    }
                },
                methods: {
                    search: function() {
                        var e = this;
                        return a(regeneratorRuntime.mark(function t() {
                            var n;
                            return regeneratorRuntime.wrap(function(t) {
                                    for (;;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.prev = 0,
                                                t.next = 3,
                                                $.get(e.searchJson, {
                                                    search: e.keyword
                                                });
                                        case 3:
                                            n = t.sent,
                                            n.data.length && (e.items = n.data),
                                                t.next = 9;
                                            break;
                                        case 7:
                                            t.prev = 7,
                                                t.t0 = t.
                                                catch(0);
                                        case 9:
                                        case "end":
                                            return t.stop()
                                    }
                                },
                                t, e, [[0, 7]])
                        }))()
                    }
                }
            }
        },
        28 : function(e, t, n) {
            "use strict";
            function a(e) {
                return function() {
                    var t = e.apply(this, arguments);
                    return new Promise(function(e, n) {
                        function a(o, i) {
                            try {
                                var s = t[o](i),
                                    r = s.value
                            } catch(e) {
                                return void n(e)
                            }
                            if (!s.done) return Promise.resolve(r).then(function(e) {
                                    a("next", e)
                                },
                                function(e) {
                                    a("throw", e)
                                });
                            e(r)
                        }
                        return a("next")
                    })
                }
            }
            Object.defineProperty(t, "__esModule", {
                value: !0
            });
            var o = $("#side-new-contest").data() || {};
            t.
                default = {
                data: function() {
                    return {
                        contest: {
                            name: "没有进行中的比赛",
                            url: !1
                        },
                        fetchContest: o.url
                    }
                },
                mounted: function() {
                    var e = this;
                    return a(regeneratorRuntime.mark(function t() {
                        var n;
                        return regeneratorRuntime.wrap(function(t) {
                                for (;;) switch (t.prev = t.next) {
                                    case 0:
                                        return t.next = 2,
                                            $.get(e.fetchContest);
                                    case 2:
                                        n = t.sent,
                                        n.name && (e.contest.name = n.name, e.contest.url = n.url);
                                    case 4:
                                    case "end":
                                        return t.stop()
                                }
                            },
                            t, e)
                    }))()
                }
            }
        },
        29 : function(e, t, n) {
            "use strict";
            Object.defineProperty(t, "__esModule", {
                value: !0
            }),
                t.
                    default = {
                    props: ["isBtn", "path", "title", "pic"],
                    data: function() {
                        return {
                            href: "",
                            params: {
                                title: this.title,
                                appkey: "1343713053",
                                pic: this.pic && this.pic.length ? this.pic: ["https://static.shiyanlou.com/img/logo-base.png"],
                                searchPic: !1
                            },
                            weiboUrl: "http://service.weibo.com/share/share.php?url=https://www.shiyanlou.com"
                        }
                    },
                    mounted: function() {
                        this.href = "" + this.weiboUrl + this.path + "&title=" + encodeURIComponent(this.params.title) + "&appkey=" + this.params.appkey + "&pic=" + this.params.pic.join("||") + "&searchPic=" + this.params.searchPic
                    }
                }
        },
        3 : function(e, t) {
            function n(e, t) {
                for (var n = 0; n < e.length; n++) {
                    var a = e[n],
                        o = f[a.id];
                    if (o) {
                        o.refs++;
                        for (var i = 0; i < o.parts.length; i++) o.parts[i](a.parts[i]);
                        for (; i < a.parts.length; i++) o.parts.push(c(a.parts[i], t))
                    } else {
                        for (var s = [], i = 0; i < a.parts.length; i++) s.push(c(a.parts[i], t));
                        f[a.id] = {
                            id: a.id,
                            refs: 1,
                            parts: s
                        }
                    }
                }
            }
            function a(e) {
                for (var t = [], n = {},
                         a = 0; a < e.length; a++) {
                    var o = e[a],
                        i = o[0],
                        s = o[1],
                        r = o[2],
                        c = o[3],
                        l = {
                            css: s,
                            media: r,
                            sourceMap: c
                        };
                    n[i] ? n[i].parts.push(l) : t.push(n[i] = {
                        id: i,
                        parts: [l]
                    })
                }
                return t
            }
            function o(e, t) {
                var n = m(),
                    a = b[b.length - 1];
                if ("top" === e.insertAt) a ? a.nextSibling ? n.insertBefore(t, a.nextSibling) : n.appendChild(t) : n.insertBefore(t, n.firstChild),
                    b.push(t);
                else {
                    if ("bottom" !== e.insertAt) throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
                    n.appendChild(t)
                }
            }
            function i(e) {
                e.parentNode.removeChild(e);
                var t = b.indexOf(e);
                t >= 0 && b.splice(t, 1)
            }
            function s(e) {
                var t = document.createElement("style");
                return t.type = "text/css",
                    o(e, t),
                    t
            }
            function r(e) {
                var t = document.createElement("link");
                return t.rel = "stylesheet",
                    o(e, t),
                    t
            }
            function c(e, t) {
                var n, a, o;
                if (t.singleton) {
                    var c = g++;
                    n = v || (v = s(t)),
                        a = l.bind(null, n, c, !1),
                        o = l.bind(null, n, c, !0)
                } else e.sourceMap && "function" == typeof URL && "function" == typeof URL.createObjectURL && "function" == typeof URL.revokeObjectURL && "function" == typeof Blob && "function" == typeof btoa ? (n = r(t), a = u.bind(null, n), o = function() {
                    i(n),
                    n.href && URL.revokeObjectURL(n.href)
                }) : (n = s(t), a = d.bind(null, n), o = function() {
                    i(n)
                });
                return a(e),
                    function(t) {
                        if (t) {
                            if (t.css === e.css && t.media === e.media && t.sourceMap === e.sourceMap) return;
                            a(e = t)
                        } else o()
                    }
            }
            function l(e, t, n, a) {
                var o = n ? "": a.css;
                if (e.styleSheet) e.styleSheet.cssText = $(t, o);
                else {
                    var i = document.createTextNode(o),
                        s = e.childNodes;
                    s[t] && e.removeChild(s[t]),
                        s.length ? e.insertBefore(i, s[t]) : e.appendChild(i)
                }
            }
            function d(e, t) {
                var n = t.css,
                    a = t.media;
                if (a && e.setAttribute("media", a), e.styleSheet) e.styleSheet.cssText = n;
                else {
                    for (; e.firstChild;) e.removeChild(e.firstChild);
                    e.appendChild(document.createTextNode(n))
                }
            }
            function u(e, t) {
                var n = t.css,
                    a = t.sourceMap;
                a && (n += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(a)))) + " */");
                var o = new Blob([n], {
                        type: "text/css"
                    }),
                    i = e.href;
                e.href = URL.createObjectURL(o),
                i && URL.revokeObjectURL(i)
            }
            var f = {},
                p = function(e) {
                    var t;
                    return function() {
                        return void 0 === t && (t = e.apply(this, arguments)),
                            t
                    }
                },
                h = p(function() {
                    return /msie [6-9]\b/.test(self.navigator.userAgent.toLowerCase())
                }),
                m = p(function() {
                    return document.head || document.getElementsByTagName("head")[0]
                }),
                v = null,
                g = 0,
                b = [];
            e.exports = function(e, t) {
                if ("undefined" != typeof DEBUG && DEBUG && "object" != typeof document) throw new Error("The style-loader cannot be used in a non-browser environment");
                t = t || {},
                void 0 === t.singleton && (t.singleton = h()),
                void 0 === t.insertAt && (t.insertAt = "bottom");
                var o = a(e);
                return n(o, t),
                    function(e) {
                        for (var i = [], s = 0; s < o.length; s++) {
                            var r = o[s],
                                c = f[r.id];
                            c.refs--,
                                i.push(c)
                        }
                        if (e) {
                            n(a(e), t)
                        }
                        for (var s = 0; s < i.length; s++) {
                            var c = i[s];
                            if (0 === c.refs) {
                                for (var l = 0; l < c.parts.length; l++) c.parts[l]();
                                delete f[c.id]
                            }
                        }
                    }
            };
            var $ = function() {
                var e = [];
                return function(t, n) {
                    return e[t] = n,
                        e.filter(Boolean).join("\n")
                }
            } ()
        },
        30 : function(e, t) {
            var n = {
                placement: "top",
                html: !0,
                title: "实验楼用户群",
                content: '<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=c080b8e55a975b6c9cf38cbaa8c9af764ddae862bdb4e78682af132862e3c57e">469785612<br>(在校生学习群)</a><a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=c89a6f4810351a227cb5a8db5f2dd43331da23316d8c55ecaf37fb2c858785b9">群1 : 241818371 </a><a>群2：235772301</a><a>群3：450412940</a>',
                template: '<div class="popover footer-qq-group" role="tooltip"><div class="arrow"></div><h3 class="popover-title footer-qq-group-header"></h3><div class="popover-content footer-qq-group-body"></div></div>',
                trigger: "click"
            };
            $(".footer-qq-item").popover(n)
        },
        31 : function(e, t, n) {
            function a(e) {
                return function() {
                    var t = e.apply(this, arguments);
                    return new Promise(function(e, n) {
                        function a(o, i) {
                            try {
                                var s = t[o](i),
                                    r = s.value
                            } catch(e) {
                                return void n(e)
                            }
                            if (!s.done) return Promise.resolve(r).then(function(e) {
                                    a("next", e)
                                },
                                function(e) {
                                    a("throw", e)
                                });
                            e(r)
                        }
                        return a("next")
                    })
                }
            }
            function o(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            var i = function() {
                    function e(e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var a = t[n];
                            a.enumerable = a.enumerable || !1,
                                a.configurable = !0,
                            "value" in a && (a.writable = !0),
                                Object.defineProperty(e, a.key, a)
                        }
                    }
                    return function(t, n, a) {
                        return n && e(t.prototype, n),
                        a && e(t, a),
                            t
                    }
                } (),
                s = (n(4),
                    function() {
                        function e() {
                            o(this, e),
                                this.$signModal = $("#sign-modal"),
                                this.$verifyCode = $("#sign-modal .verify-code"),
                                this.$signinForm = $("#signin-form form"),
                                this.$signupForm = $("#signup-form form"),
                                this.$errMsg = this.$signModal.find(".error-msg"),
                                this.needLoginCode = !1,
                                this.next = {
                                    updated: !1,
                                    url: ""
                                },
                                this.activeSign = "signin",
                                this.errTimer = [],
                                this.setup()
                        }
                        return i(e, [{
                            key: "setup",
                            value: function() {
                                var e = this,
                                    t = this;
                                $(document).on("click", '[href="#sign-modal"]',
                                    function() {
                                        t.activeSign = $(this).data("sign");
                                        var e = $(this).data("next");
                                        e ? t.next = {
                                            updated: !0,
                                            url: e
                                        }: t.next.updated = !1
                                    }),
                                    this.$verifyCode.on("click",
                                        function() {
                                            t.updateVerifyCode($(this))
                                        }),
                                    this.$signModal.on("shown.bs.modal",
                                        function() {
                                            $('[href="#' + t.activeSign + '-form"]').click(),
                                                e.updateVerifyCode(e.$verifyCode),
                                            e.needLoginCode && e.showLoginCode()
                                        }),
                                    this.$signinForm.on("submit",
                                        function() {
                                            return e.signin(),
                                                !1
                                        }),
                                    this.$signupForm.on("submit",
                                        function() {
                                            return e.signup(),
                                                !1
                                        })
                            }
                        },
                            {
                                key: "signin",
                                value: function() {
                                    function e() {
                                        return t.apply(this, arguments)
                                    }
                                    var t = a(regeneratorRuntime.mark(function e() {
                                        var t, n, a;
                                        return regeneratorRuntime.wrap(function(e) {
                                                for (;;) switch (e.prev = e.next) {
                                                    case 0:
                                                        return t = this.$signinForm.attr("action"),
                                                            n = this.$signinForm.find('[name="remember"]'),
                                                            a = {
                                                                login: this.$signinForm.find('[name="login"]').val(),
                                                                password: this.$signinForm.find('[name="password"]').val(),
                                                                captcha_v: this.$signinForm.find('[name="captcha_v"]').val(),
                                                                remember: n.is(":checked") ? n.val() : ""
                                                            },
                                                        a.login || this.errMsg("请输入邮箱"),
                                                        a.password || this.errMsg("请输入密码"),
                                                            e.next = 7,
                                                            this.ajax(t, a);
                                                    case 7:
                                                    case "end":
                                                        return e.stop()
                                                }
                                            },
                                            e, this)
                                    }));
                                    return e
                                } ()
                            },
                            {
                                key: "signup",
                                value: function() {
                                    function e() {
                                        return t.apply(this, arguments)
                                    }
                                    var t = a(regeneratorRuntime.mark(function e() {
                                        var t, n;
                                        return regeneratorRuntime.wrap(function(e) {
                                                for (;;) switch (e.prev = e.next) {
                                                    case 0:
                                                        return t = this.$signupForm.attr("action"),
                                                            n = {
                                                                email: this.$signupForm.find('[name="email"]').val(),
                                                                password: this.$signupForm.find('[name="password"]').val(),
                                                                captcha_v: this.$signupForm.find('[name="captcha_v"]').val()
                                                            },
                                                        n.email || this.errMsg("请输入邮箱"),
                                                        n.password || this.errMsg("请输入密码"),
                                                        n.captcha_v || this.errMsg("请输入验证码"),
                                                            e.next = 7,
                                                            this.ajax(t, n);
                                                    case 7:
                                                    case "end":
                                                        return e.stop()
                                                }
                                            },
                                            e, this)
                                    }));
                                    return e
                                } ()
                            },
                            {
                                key: "ajax",
                                value: function() {
                                    function e(e, n) {
                                        return t.apply(this, arguments)
                                    }
                                    var t = a(regeneratorRuntime.mark(function e(t, n) {
                                        var a;
                                        return regeneratorRuntime.wrap(function(e) {
                                                for (;;) switch (e.prev = e.next) {
                                                    case 0:
                                                        return e.next = 2,
                                                            $.ajax({
                                                                type: "POST",
                                                                url: t,
                                                                data: n,
                                                                xhrFields: {
                                                                    withCredentials: !0
                                                                }
                                                            });
                                                    case 2:
                                                        if (a = e.sent, this.setNeedLoginCode(a.need_captcha), "success" != a.status) {
                                                            e.next = 12;
                                                            break
                                                        }
                                                        if (this.$signModal.modal("hide"), !a.next) {
                                                            e.next = 9;
                                                            break
                                                        }
                                                        return window.location.href = a.next,
                                                            e.abrupt("return", !1);
                                                    case 9:
                                                        this.next.updated ? window.location.href = this.next.url: window.location.reload(),
                                                            e.next = 13;
                                                        break;
                                                    case 12:
                                                        "error" == a.status && (this.updateVerifyCode(this.$verifyCode), this.needLoginCode && this.showLoginCode(), this.errMsg(a.message));
                                                    case 13:
                                                    case "end":
                                                        return e.stop()
                                                }
                                            },
                                            e, this)
                                    }));
                                    return e
                                } ()
                            },
                            {
                                key: "updateVerifyCode",
                                value: function(e) {
                                    e.attr("src", e.attr("source") + "?" + (new Date).getTime())
                                }
                            },
                            {
                                key: "setNeedLoginCode",
                                value: function(e) {
                                    this.needLoginCode = !!e,
                                        localStorage.needLoginCode = !!e
                                }
                            },
                            {
                                key: "showLoginCode",
                                value: function() {
                                    this.$signinForm.find(".verify-code-item").show()
                                }
                            },
                            {
                                key: "errMsg",
                                value: function(e) {
                                    var t = this;
                                    this.errTimer.map(function(e) {
                                        clearTimeout(e),
                                            t.errTimer.pop()
                                    }),
                                        this.$errMsg.hide(),
                                        this.$errMsg.find(".alert").text(""),
                                        this.$errMsg.find(".alert").text(e),
                                        this.$errMsg.show();
                                    var n = setTimeout(function() {
                                            t.$errMsg.hide(),
                                                t.$errMsg.find(".alert").text(""),
                                                t.errTimer.pop()
                                        },
                                        5e3);
                                    this.errTimer.push(n)
                                }
                            }]),
                            e
                    } ());
            new s
        },
        32 : function(e, t, n) {
            var a = n(6);
            a && (a.on("event:user:logout",
                function() {
                    if (localStorage.isClient) return ! 1;
                    a.emit("disconnection", ""),
                        a.disconnect()
                }), a.on("event:msg:all_read",
                function(e) {
                    $(".header-msg-count").hide(),
                        $(".header-msg-mark").hide()
                }))
        },
        33 : function(e, t, n) {
            t = e.exports = n(1)(),
                t.push([e.i, "\n.search-autocomplete[data-v-72bea96c] {\n  position: absolute;\n  top: 35px;\n  left: 1px;\n  width: 195px;\n  padding: 4px;\n  border: solid 1px #ddd;\n  border-top: none;\n  background: #fff;\n  z-index: 1000;\n}\n.search-autocomplete a[data-v-72bea96c] {\n    display: block;\n    padding: 6px 8px;\n    color: #4c5157;\n    font-size: 13px;\n}\n.search-autocomplete a[data-v-72bea96c]:hover, .search-autocomplete a[data-v-72bea96c]:focus {\n      color: #fff;\n      background: #0c9;\n      text-decoration: none;\n}\n", ""])
        },
        34 : function(e, t, n) {
            t = e.exports = n(1)(),
                t.push([e.i, "\n.side-new-contest .sidebox-body[data-v-7d67fa2d] {\n  overflow: hidden;\n}\n.side-new-contest .sidebox-body span[data-v-7d67fa2d] {\n    position: relative;\n    top: 4px;\n    color: #3a3a3a;\n    font-size: 14px;\n}\n.side-new-contest .sidebox-body .btn[data-v-7d67fa2d] {\n    padding: 2px 10px;\n    color: #08bf91;\n    font-size: 14px;\n    border: solid 1px #08bf91;\n}\n.side-new-contest .sidebox-body .btn[data-v-7d67fa2d]:hover, .side-new-contest .sidebox-body .btn[data-v-7d67fa2d]:focus {\n      color: #fff;\n      background: #09bf91;\n}\n", ""])
        },
        35 : function(e, t, n) {
            t = e.exports = n(1)(),
                t.push([e.i, "\na[data-v-9b3c8994] {\n    display: inline-block;\n}\n.fa[data-v-9b3c8994] {\n    padding: 4px;\n    color: #274a59;\n    background: #fff;\n    font-size: 14px;\n    border-radius: 4px;\n}\n.fa[data-v-9b3c8994]:hover {\n    color: #ec5353;\n}\n", "", {
                    version: 3,
                    sources: ["/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/weibo.vue?1f60b06f"],
                    names: [],
                    mappings: ";AAiCA;IACA,sBAAA;CACA;AACA;IACA,aAAA;IACA,eAAA;IACA,iBAAA;IACA,gBAAA;IACA,mBAAA;CACA;AACA;IACA,eAAA;CACA",
                    file: "weibo.vue",
                    sourcesContent: ["<template>\n<a :href=\"href\" :class=\"{ 'btn btn-primary': isBtn }\" target=\"_blank\">\n    <span v-if=\"isBtn\">分享到微博</span>\n    <i v-else class=\"fa fa-weibo\"></i>\n</a>\n</template>\n\n<script>\nexport default {\n    props: ['isBtn', 'path', 'title', 'pic'],\n    data() {\n        return {\n            href: '',\n            params: {\n                title: this.title,\n                appkey: '1343713053',\n                pic: (this.pic && this.pic.length) ? this.pic : ['https://static.shiyanlou.com/img/logo-base.png'],\n                searchPic: false,\n            },\n            weiboUrl: 'http://service.weibo.com/share/share.php?url=https://www.shiyanlou.com',\n        };\n    },\n    mounted() {\n        this.href = `${this.weiboUrl}${this.path}`\n            + `&title=${encodeURIComponent(this.params.title)}`\n            + `&appkey=${this.params.appkey}`\n            + `&pic=${this.params.pic.join('||')}`\n            + `&searchPic=${this.params.searchPic}`;\n    }\n}\n</script>\n\n<style scoped>\na {\n    display: inline-block;\n}\n.fa {\n    padding: 4px;\n    color: #274a59;\n    background: #fff;\n    font-size: 14px;\n    border-radius: 4px;\n}\n.fa:hover {\n    color: #ec5353;\n}\n</style>\n\n"],
                    sourceRoot: ""
                }])
        },
        36 : function(e, t, n) {
            var a = n(33);
            "string" == typeof a && (a = [[e.i, a, ""]]);
            n(3)(a, {});
            a.locals && (e.exports = a.locals)
        },
        37 : function(e, t, n) {
            var a = n(34);
            "string" == typeof a && (a = [[e.i, a, ""]]);
            n(3)(a, {});
            a.locals && (e.exports = a.locals)
        },
        38 : function(e, t, n) {
            n(44);
            var a = n(0)(n(27), n(40), "data-v-72bea96c", null);
            a.options.__file = "/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/search.vue",
            a.esModule && Object.keys(a.esModule).some(function(e) {
                return "default" !== e && "__esModule" !== e
            }) && console.error("named exports are not supported in *.vue files."),
            a.options.functional && console.error("[vue-loader] search.vue: functional components are not supported with templates, they should use render functions."),
                e.exports = a.exports
        },
        39 : function(e, t, n) {
            n(45);
            var a = n(0)(n(28), n(41), "data-v-7d67fa2d", null);
            a.options.__file = "/home/shiyanlou/shiyanlou/simplecloud/app/src/base/components/sideNewContest.vue",
            a.esModule && Object.keys(a.esModule).some(function(e) {
                return "default" !== e && "__esModule" !== e
            }) && console.error("named exports are not supported in *.vue files."),
            a.options.functional && console.error("[vue-loader] sideNewContest.vue: functional components are not supported with templates, they should use render functions."),
                e.exports = a.exports
        },
        4 : function(e, t, n) {
            function a(e, t, n, a) {
                var o;
                "function" != typeof n || a ? "function" == typeof a && (o = a) : (o = n, n = null),
                e === !0 && (e = "success"),
                e === !1 && (e = "error");
                var i = $("#flash-message"),
                    n = parseInt(n) || 3e3,
                    e = "error" == e ? "danger": e,
                    s = '<div class="alert alert-' + e + '" style="text-align: center;">' + t + "</div>";
                i.find(".modal-dialog").html(s),
                    i.modal("show"),
                    i.on("hidden.bs.modal",
                        function() {
                            o && o()
                        }),
                    setTimeout(function() {
                            i.modal("hide")
                        },
                        n)
            }
            function o() {
                a("error", "操作过于频繁，请稍后重试")
            }
            function i(e, t, n) {
                var a = $("#modal-message"),
                    e = "error" == e ? "danger": e,
                    o = '<div class="alert alert-' + e + '" style="text-align: center;">' + t + "</div>";
                n && "string" == typeof n && a.find(".modal-title").html(n),
                    a.find(".modal-body").html(o),
                    a.modal("show")
            }
            function s(e, t, n) {
                $.get(e).done(function(e) {
                    if ("success" == e.status) {
                        var a = e.rank,
                            o = "";
                        o += '<div class="sidebox users-top"><div class="sidebox-header users-top-header"><h4 class="sidebox-title">学习排名<span>（有效学习时间）</span></h4></div>';
                        for (var i = 0,
                                 s = a.length; i < s; i++) o += '<div class="clearfix sidebox-body users-top-body"><div class="pull-left users-top-left">' + d.userAvatar(a[i], "pull-left") + '<div class="users-top-info pull-left">' + d.userName(a[i]) + '<br><span class="users-top-study-time">' + a[i].study_time + ' 分钟</span></div></div><div class="pull-right users-top-right"><img src="' + a[i].image + '"></div></div>';
                        o += "</div>",
                            "html" == n ? $(t).html(o) : $(t).append(o)
                    }
                })
            }
            function r(e) {
                return $("<div/>").text(e).html()
            }
            function c(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "MMMDo HH:mm";
                return l(e).format(t)
            }
            n(11);
            var l = n(5),
                d = n(9);
            $("#jinja-data").data();
            l.locale("zh-cn"),
                function(e) {
                    e.fn.serializeJSON = function() {
                        var t = {},
                            n = this.serializeArray();
                        this.serialize();
                        return e(n).each(function() {
                            t[this.name] ? e.isArray(t[this.name]) ? t[this.name].push(this.value) : t[this.name] = [t[this.name], this.value] : t[this.name] = this.value
                        }),
                            t
                    }
                } (jQuery),
                function() {
                    var e = $("meta[name=csrf-token]").attr("content");
                    $.ajaxSetup({
                        beforeSend: function(t, n) { / ^(GET | HEAD | OPTIONS | TRACE) $ / i.test(n.type) || t.setRequestHeader("X-CSRFToken", e)
                        }
                    })
                } (),
                e.exports = {
                    escape: r,
                    flashMessage: a,
                    modalMessage: i,
                    usersTop: s,
                    flash429Error: o,
                    formatTime: c
                }
        },
        40 : function(e, t, n) {
            e.exports = {
                render: function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("form", {
                            staticClass: "navbar-form navbar-right",
                            attrs: {
                                action: e.url,
                                method: "get",
                                role: "search"
                            }
                        },
                        [n("div", {
                                staticClass: "form-group"
                            },
                            [e._m(0), e._v(" "), n("input", {
                                directives: [{
                                    name: "model",
                                    rawName: "v-model",
                                    value: e.keyword,
                                    expression: "keyword"
                                }],
                                staticClass: "form-control",
                                attrs: {
                                    type: "text",
                                    name: "search",
                                    autocomplete: "off",
                                    placeholder: "搜索 课程/问答"
                                },
                                domProps: {
                                    value: e.keyword
                                },
                                on: {
                                    keyup: e.search,
                                    input: function(t) {
                                        t.target.composing || (e.keyword = t.target.value)
                                    }
                                }
                            }), e._v(" "), e.items.length ? n("div", {
                                    staticClass: "search-autocomplete",
                                    on: {
                                        mouseleave: function(t) {
                                            e.items = []
                                        }
                                    }
                                },
                                e._l(e.items,
                                    function(t) {
                                        return n("a", {
                                                attrs: {
                                                    href: "/search?search=" + encodeURIComponent(t)
                                                }
                                            },
                                            [e._v(e._s(t))])
                                    })) : e._e()])])
                },
                staticRenderFns: [function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("label", [n("i", {
                        staticClass: "fa fa-search"
                    })])
                }]
            },
                e.exports.render._withStripped = !0
        },
        41 : function(e, t, n) {
            e.exports = {
                render: function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("div", {
                            staticClass: "sidebox side-new-contest"
                        },
                        [e._m(0), e._v(" "), n("div", {
                                staticClass: "sidebox-body"
                            },
                            [n("span", [e._v(e._s(e.contest.name))]), e._v(" "), e.contest.url ? n("a", {
                                    staticClass: "pull-right btn",
                                    attrs: {
                                        href: e.contest.url
                                    }
                                },
                                [e._v("进入比赛")]) : e._e()])])
                },
                staticRenderFns: [function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("div", {
                            staticClass: "sidebox-header"
                        },
                        [n("h4", {
                                staticClass: "sidebox-title"
                            },
                            [e._v("最新比赛")])])
                }]
            },
                e.exports.render._withStripped = !0
        },
        42 : function(e, t, n) {
            e.exports = {
                render: function() {
                    var e = this,
                        t = e.$createElement,
                        n = e._self._c || t;
                    return n("a", {
                            class: {
                                "btn btn-primary": e.isBtn
                            },
                            attrs: {
                                href: e.href,
                                target: "_blank"
                            }
                        },
                        [e.isBtn ? n("span", [e._v("分享到微博")]) : n("i", {
                            staticClass: "fa fa-weibo"
                        })])
                },
                staticRenderFns: []
            },
                e.exports.render._withStripped = !0
        },
        43 : function(e, t, n) {
            var a = n(35);
            "string" == typeof a && (a = [[e.i, a, ""]]),
            a.locals && (e.exports = a.locals);
            n(2)("41efdbec", a, !1)
        },
        435 : function(e, t, n) {
            function a(e, t, n) {
                localStorage.newLab = !0,
                    $.post(e, n || {}).done(function(e) {
                        "success" == e.status ? $(window).width() < 769 ? (S.hide(), window.location.href = t) : setTimeout(function() {
                                S.hide(),
                                    window.location.href = e.nexturl
                            },
                            2e3) : e.nexturl ? window.location.href = e.nexturl: (S.hide(), A.flashMessage(e.status, e.message))
                    }).fail(function() {
                        console.log("ajax failed")
                    })
            }
            function o() {
                function e(e) {
                    var t = $(e).data("url"),
                        o = $(e).data("mobileUrl");
                    if ($(e).hasClass("is-evaluation-course")) n.modal("show"),
                        n.find(".start-confirm").off("click").on("click",
                            function() {
                                n.modal("hide"),
                                    S.show(),
                                    a(t, o)
                            });
                    else if ($(e).hasClass("member-vm")) {
                        var i = $("#vip-startlab-modal");
                        i.modal("show"),
                            $(".newvm", i).off("click").on("click",
                                function() {
                                    i.modal("hide"),
                                        S.show(),
                                        a(t, o)
                                }),
                            $(".oldvm", i).off("click").on("click",
                                function() {
                                    var e = {
                                        new_env: 0
                                    };
                                    i.modal("hide"),
                                        S.show(),
                                        a(t, o, e)
                                })
                    } else S.show(),
                        a(t, o);
                    return ! 1
                }
                var t = void 0,
                    n = $("#start-evaluation-course");
                $("#consume-beans-modal .btn-confirm").on("click",
                    function() {
                        $("#consume-beans-modal").modal("hide"),
                            e(t)
                    }),
                    $(".lab-item-start").on("click",
                        function() {
                            return t = this,
                                $("#consume-beans-modal").length ? ($("#consume-beans-modal").modal("show"), !1) : (e(this), !1)
                        }),
                    $(".lab-item-start-newlab").on("click",
                        function() {
                            if ($(this).hasClass("lab-item-started")) window.location.href = $("#header-continue-lab").attr("href");
                            else {
                                var e = $(this).data("url"),
                                    t = $(this).data("mobileUrl");
                                if ($(this).hasClass("is-evaluation-course")) n.find(".start-newlab").html("<strong>一个实验正在进行，是否停止它，开始新实验？</strong>"),
                                    n.modal("show"),
                                    n.find(".start-confirm").off("click").on("click",
                                        function() {
                                            n.modal("hide"),
                                                S.show(),
                                                $.post(P.startNewlabUrl, {
                                                    userlab: U
                                                }).done(function(n) {
                                                    "success" == n.status ? setTimeout(function() {
                                                            a(e, t)
                                                        },
                                                        3e3) : (S.hide(), A.flashMessage(n.status, n.message))
                                                }).fail(function() {
                                                    console.log("ajax failed")
                                                })
                                        });
                                else if ($(this).hasClass("member-vm")) {
                                    var o = $("#vip-startlab-modal");
                                    o.find(".start-newlab").html("<strong>一个实验正在进行，是否停止它，开始新实验？</strong>"),
                                        o.modal("show"),
                                        $(".newvm", o).off("click").on("click",
                                            function() {
                                                o.modal("hide"),
                                                    S.show(),
                                                    $.post(P.startNewlabUrl, {
                                                        userlab: U
                                                    }).done(function(n) {
                                                        "success" == n.status ? setTimeout(function() {
                                                                a(e, t)
                                                            },
                                                            3e3) : (S.hide(), A.flashMessage(n.status, n.message))
                                                    }).fail(function() {
                                                        console.log("ajax failed")
                                                    })
                                            }),
                                        $(".oldvm", o).off("click").on("click",
                                            function() {
                                                o.modal("hide"),
                                                    S.show(),
                                                    $.post(P.startNewlabUrl, {
                                                        userlab: U
                                                    }).done(function(n) {
                                                        "success" == n.status ? setTimeout(function() {
                                                                a(e, t, {
                                                                    new_env: 0
                                                                })
                                                            },
                                                            3e3) : (S.hide(), A.flashMessage(n.status, n.message))
                                                    }).fail(function() {
                                                        console.log("ajax failed")
                                                    })
                                            })
                                } else $("#start-newlab").modal("show"),
                                    $(".start-newlab-confirm").off("click").on("click",
                                        function() {
                                            $("#start-newlab").modal("hide"),
                                                S.show(),
                                                $.post(P.startNewlabUrl, {
                                                    userlab: U
                                                }).done(function(n) {
                                                    "success" == n.status ? setTimeout(function() {
                                                            a(e, t)
                                                        },
                                                        3e3) : (S.hide(), A.flashMessage(n.status, n.message))
                                                }).fail(function() {
                                                    console.log("ajax failed")
                                                })
                                        })
                            }
                        })
            }
            function i() {
                var e = $(".course-infobox-type");
                switch (e.data("courseType")) {
                    case 0:
                        e.addClass("course-type-basic");
                        break;
                    case 1:
                        e.addClass("course-type-project");
                        break;
                    case 2:
                        e.addClass("course-type-charge");
                        break;
                    case 3:
                        e.addClass("course-type-evaluation");
                        break;
                    default:
                        e.addClass("course-type-basic")
                }
            }
            function s() {
                function e(e) {
                    e && ($("#flash-modal").modal("hide"), $('a[href="' + e + '"]').click())
                }
                P.userJoined && $('.nav-tabs a[href="#labs"]').tab("show"),
                    $("btn.disabled, a.disabled").on("click",
                        function() {
                            return ! 1
                        }),
                    $('[data-toggle="tooltip"]').tooltip(),
                    $(function() {
                        e(window.location.hash),
                        "onhashchange" in window && (window.onhashchange = function() {
                            e(window.location.hash)
                        })
                    })
            }
            function r() {
                if ($(window).width() < 541) {
                    var e = $(".lab-box div:nth-child(3)"),
                        t = $(".lab-box"),
                        n = $(".lab-box span"),
                        a = $(".lab-box .line"),
                        o = $(".labs-container");
                    $(".labs-list .lab-box:first-child").remove(),
                        $(".labs-list .lab-box:last-child").remove(),
                        o.css("overflow-x", "hidden"),
                        e.removeClass("content-left").removeClass("content-right"),
                        t.css("height", "200px").css("width", "290px").css("margin", "0").css("border-radius", "0").css("background", "none"),
                        n.css("display", "none"),
                        a.css("display", "none")
                }
            }
            function c() {
                var e = $(".course-infobox-follow"),
                    t = e.find("i"),
                    n = $(".course-infobox-followers");
                R.follow(t, e, n)
            }
            function l() {
                var e = $("#charge-course-detail textarea").val(),
                    t = e && j(e);
                $(".charge-course-detail-content").html(t)
            }
            function d() {
                if (!P.userLogined) return ! 1;
                $(".join-private-course").on("click",
                    function() {
                        return $("#private-course-modal").modal("show"),
                            !1
                    })
            }
            function u() {
                return !! P.showStudentInfoModal && ($("#update-private-course-modal").modal("show"), !1)
            }
            function f() {
                $(".join-bootcamp-course").on("click",
                    function() {
                        return window.open($(this).attr("href"), "_blank"),
                            !1
                    })
            }
            function p() {
                q.init(P.commentPost),
                    q.getComment(P.commentPost),
                    $('a[href="#comments"]').on("click",
                        function() {
                            q.getComment(P.commentPost)
                        })
            }
            function h() {
                $('a[href="#reports"]').on("click",
                    function() {
                        $(".report-items").html(""),
                            T.getReport(P.reportPost),
                            $(".report-owner-all").find(".active").removeClass("active"),
                            $(".report-all").addClass("active")
                    })
            }
            function m() {
                $(".report-owner .owner-list").on("click",
                    function() {
                        if (!$(this).hasClass("active")) {
                            var e = $(this).data("userId"),
                                t = $("#reports .lab-id.active").data("labId");
                            T.getReport(P.reportPost, e, t),
                                $(".report-owner .owner-list").removeClass("active"),
                                $(this).addClass("active")
                        }
                    }),
                    $("#reports .lab-id").on("click",
                        function() {
                            if (!$(this).hasClass("active")) {
                                var e = $(".report-owner .owner-list.active").data("userId"),
                                    t = $(this).data("labId");
                                T.getReport(P.reportPost, e, t),
                                    $("#reports .lab-id").removeClass("active"),
                                    $(this).addClass("active")
                            }
                        })
            }
            function v() {
                $('a[href="#questions"]').on("click",
                    function() {
                        I.getQuestion(P.getQuestionUrl)
                    })
            }
            function g() {
                $(".bootcamp-infobox-buy").on("click",
                    function() {
                        if (!P.userLogined) return $("#sign-modal").modal("show"),
                            !1;
                        $("#bootcamp-pay-modal").modal("show");
                        var e = $('.bootcamp-checkbox input[type="checkbox"]');
                        if (e.length) {
                            e.get(0).checked = !0,
                                $(".bootcamp-send-msg").show();
                            var t = !0;
                            e.on("click",
                                function() {
                                    1 == this.checked ? ($(".bootcamp-send-msg").show(), $(".price-without-book").hide(), $(".real-price").show(), t = !0) : ($(".bootcamp-send-msg").hide(), $(".real-price").hide(), $(".price-without-book").show(), t = !1)
                                })
                        }
                        $("#bootcamp-pay-modal").on("hide.bs.modal",
                            function() {
                                $(".price-without-book").hide(),
                                    $(".real-price").show()
                            }),
                            $(".consume-beans input[type=checkbox]", O).on("change",
                                function() {
                                    z = $(this).is(":checked");
                                    var e = $(this).parent().find("input[type=text]");
                                    z ? e.attr("disabled", !1) : (e.attr("disabled", !0), e.val(0), e.trigger("change"))
                                }),
                            $(".consume-beans input[type=text]", O).on("keypress keyup change",
                                function() {
                                    var e = $(this).parent().find(".used-beans"),
                                        t = $(this).parent().find(".left-beans strong");
                                    E = $(this).val(),
                                        E = parseInt(E) || 0,
                                        E = x(E),
                                        $(this).val(E),
                                        e.text(E),
                                        t.text(L - E),
                                        y()
                                }),
                            $(".bootcamp-confirm-pay").off("click").on("click",
                                function() {
                                    var e = $(".bootcamp-recipient").length && $(".bootcamp-recipient").val().trim(),
                                        n = $(".bootcamp-recipient-addr").length && $(".bootcamp-recipient-addr").val().trim();
                                    if (_ = $(".pay-method.active").data("pay"), _.includes("ALI") && F.any && (_ = "ALI_WAP"), t) if (e.length && n.length) {
                                        var a = "?need_book=" + t + "&recipient=" + e + "&recipient_addr=" + n + "&beans=" + E,
                                            o = $("#bootcamp-pay-modal form").data("payUrl") + a;
                                        $.ajax({
                                            url: o,
                                            method: "post",
                                            data: {
                                                channel: _
                                            },
                                            async: !1
                                        }).done(function(e) {
                                            if ("success" == e.status) if (C = e.data.bill_no, e.data.form) {
                                                var t = $(e.data.form)[0];
                                                $(t).attr("target", "_blank"),
                                                    $(t).appendTo("body").submit(),
                                                    $("#bootcamp-confirm-pay").modal("hide"),
                                                    $("#paid-modal").modal("show"),
                                                    $("#bootcamp-pay-modal").modal("hide")
                                            } else $("#bootcamp-pay-modal .modal-body, #bootcamp-pay-modal .modal-footer").hide(),
                                                $(".vip-wx-price span").text("1fdsfsd0"),
                                                $(".vip-wx-qrcode").html(""),
                                                $(".vip-modal-qrcode").show(),
                                                $(".vip-wx-qrcode").qrcode(e.data.qrcode_url),
                                                $(".vip-wx-qrcode").append("<br><br><div>微信扫描二维码完成支付</div>"),
                                                b();
                                            else $("#bootcamp-pay-modal").modal("hide"),
                                                A.flashMessage(e.status, e.message)
                                        }).fail(function() {
                                            console.log("ajax failed")
                                        }),
                                            $("#bootcamp-pay-modal").modal("hide")
                                    } else $("#bootcamp-pay-modal").modal("hide"),
                                        A.flashMessage("error", "请完整填写信息！");
                                    else {
                                        var a = "?beans=" + E,
                                            o = $("#bootcamp-pay-modal form").data("payUrl") + a;
                                        $.ajax({
                                            url: o,
                                            method: "post",
                                            data: {
                                                channel: _
                                            },
                                            async: !1
                                        }).done(function(e) {
                                            if ("success" == e.status) if (C = e.data.bill_no, e.data.form) {
                                                var t = $(e.data.form)[0];
                                                $(t).attr("target", "_blank"),
                                                    $(t).appendTo("body").submit(),
                                                    $("#bootcamp-confirm-pay").modal("hide"),
                                                    $("#paid-modal").modal("show"),
                                                    $("#bootcamp-pay-modal").modal("hide")
                                            } else $("#bootcamp-pay-modal .modal-body, #bootcamp-pay-modal .modal-footer").hide(),
                                                $(".vip-wx-price span").text($("span.real-price").text()),
                                                $(".vip-wx-qrcode").html(""),
                                                $(".vip-modal-qrcode").show(),
                                                $(".vip-wx-qrcode").qrcode(e.data.qrcode_url),
                                                $(".vip-wx-qrcode").append("<br><br><div>微信扫描二维码完成支付</div>"),
                                                b();
                                            else $("#bootcamp-pay-modal").modal("hide"),
                                                A.flashMessage(e.status, e.message)
                                        }).fail(function() {
                                            console.log("ajax failed")
                                        })
                                    }
                                })
                    })
            }
            function b() {
                M = setInterval(function() {
                        w(C, _, M)
                    },
                    2e3)
            }
            function w(e, t, n) {
                $.post(P.queryBill, {
                    bill_no: e,
                    channel: t
                }).done(function(e) {
                    n ? e.is_pay && (clearInterval(n), $("#bootcamp-pay-modal").modal("hide"), A.flashMessage("success", "支付成功"), window.location.href = "?bootcamp_paid=true") : ($("#bootcamp-pay-modal").modal("hide"), e.is_pay ? (A.flashMessage("success", "支付成功"), window.location.href = "?bootcamp_paid=true") : A.flashMessage("error", "支付失败"))
                }).fail(function() {
                    console.log("ajax failed")
                })
            }
            function x(e) {
                var t = 20;
                return e > L && (A.flashMessage("error", "你只有" + L + "个实验豆", 5e3), e = L),
                e > N - 1 && (A.flashMessage("error", "当前最多只能消费" + (N - 1) + "个实验豆", 5e3), e = N - 1),
                e > t && (A.flashMessage("error", "购买训练营最多只能消费" + t + "个实验豆", 5e3), e = t),
                    e
            }
            function y() {
                var e = z ? N - E > 0 ? N - E: 0 : N;
                $(".real-price", O).text("￥" + e),
                    $(".vip-wx-price span").text("￥" + e)
            }
            function k() {
                var e = $(".modal.in").length;
                $("body").addClass("modal-open"),
                    $(".modal-backdrop").addClass("hidden"),
                    $(".modal.in:last").css("z-index", 1050 + 20 * (e - 1)),
                    $(".modal-backdrop.in:last").css("z-index", 1040 + 20 * (e - 1)).removeClass("hidden")
            }
            n(54);
            var _, C, M, A = n(7),
                j = n(46),
                q = n(52),
                T = n(250),
                S = n(8),
                R = n(74),
                I = n(75),
                F = n(78),
                P = $("#jinja-data").data(),
                U = P.userlabId,
                N = parseFloat($(".real-price").text().substr(1)),
                L = $(".left-beans strong", O).text(),
                E = 0,
                O = $("#bootcamp-pay-modal"),
                z = !1;
            $(".pay-method").on("click",
                function() {
                    $(".pay-method").removeClass("active"),
                        $(this).addClass("active")
                }),
                $(".vip-modal-qrcode").on("click", ".vip-wx-method",
                    function() {
                        clearInterval(M),
                            $("#bootcamp-pay-modal .modal-body").show(),
                            $("#bootcamp-pay-modal .modal-footer").show(),
                            $(".vip-modal-qrcode").hide()
                    }),
                $("#bootcamp-pay-modal").on("hide.bs.modal",
                    function() {
                        clearInterval(M),
                            $("#bootcamp-pay-modal .modal-body").show(),
                            $("#bootcamp-pay-modal .modal-footer").show(),
                            $(".vip-modal-qrcode").hide()
                    }),
                $("#paid-modal .paid-confirm").on("click",
                    function() {
                        $("#paid-modal").modal("hide"),
                            w(C, _)
                    }),
                $("#paid-modal .paid-method").on("click",
                    function() {
                        $("#paid-modal").modal("hide"),
                            $(".bootcamp-infobox-buy").click()
                    }),
                $("#flash-modal .comment-btn").on("click",
                    function() {
                        var e = ($("#base-data").data(), this),
                            t = {
                                lab_id: $(e).data("labId"),
                                content: $("#flash-modal form textarea").val().trim()
                            };
                        t.content.length ? $.post(P.commentPost, t).done(function(e) {
                            $("#flash-modal").modal("hide"),
                            "success" == e.status && A.flashMessage("success", "评论成功")
                        }).fail(function(e) {
                            429 == e.status && A.flash429Error()
                        }) : $("#flash-modal").modal("hide")
                    }),
                $(".member-price").popover().on("mouseover",
                    function() {
                        $(this).popover("show"),
                            $("div.popover").css({
                                "text-align": "center",
                                "z-index": "0"
                            }),
                            $("div.popover-content").css("color", "#031308"),
                            $("span.price-number").css("color", "#FA3D2E")
                    }).on("mouseleave",
                    function() {
                        $(this).popover("hide")
                    }),
                $(document).on("show.bs.modal", ".modal",
                    function(e) {
                        $(this).appendTo($("body"))
                    }).on("shown.bs.modal", ".modal.in",
                    function(e) {
                        k()
                    }).on("hidden.bs.modal", ".modal",
                    function(e) {
                        k(),
                        0 == $(".modal.in").length && $("body").removeClass("modal-open")
                    });
            var B = new ZeroClipboard($(".invite-user-btn").get(0)),
                W = new ZeroClipboard($(".invite-user-btn").get(1)),
                K = $(".invite-user-link").val(); [B, W].forEach(function(e) {
                e.on("ready",
                    function(e) {
                        this.on("copy",
                            function(e) {
                                this.setData("text/plain", "我正在实验楼撸代码，你也快来！800+编程实战教程，无需搭环境，直接练习！用我的链接注册,你我都能获得3个实验豆！" + K)
                            }),
                            this.on("aftercopy",
                                function(e) {
                                    $(".copy-msg").removeAttr("hidden"),
                                        setTimeout(function() {
                                                $(".copy-msg").attr("hidden", !0)
                                            },
                                            3e3)
                                })
                    })
            }),
                i(),
                c(),
                d(),
                u(),
                f(),
                s(),
                p(),
                h(),
                v(),
                o(),
                r(),
                l(),
                g(),
                m()
        },
        44 : function(e, t, n) {
            var a = n(36);
            "string" == typeof a && (a = [[e.i, a, ""]]),
            a.locals && (e.exports = a.locals);
            n(2)("366cf0d2", a, !1)
        },
        45 : function(e, t, n) {
            var a = n(37);
            "string" == typeof a && (a = [[e.i, a, ""]]),
            a.locals && (e.exports = a.locals);
            n(2)("63f9fd48", a, !1)
        },
        46 : function(e, t, n) {
            function a(e) {
                if ("$" === e[0] && "$" === e[e.length - 1]) {
                    if (e = e.substr(1, e.length - 2), "$" === e[0] && "$" === e[e.length - 1]) {
                        if (e = e.substr(1, e.length - 2), !e.length) return null;
                        try {
                            return katex.renderToString(e)
                        } catch(e) {
                            return null
                        }
                    }
                }
                return null
            }
            function o(e) {
                if ("@" === e[0] && "@" === e[e.length - 1]) {
                    e = e.substr(1, e.length - 2).trim();
                    var t = e.split(/[,\s]+/g),
                        n = {},
                        a = /\.(\w+)$/g;
                    t.map(function(e, t, o) {
                        if (a.lastIndex = 0, a.test(e)) {
                            a.lastIndex = 0;
                            n[a.exec(e)[1]] = e
                        }
                    });
                    var o = "";
                    for (var i in n) {
                        var s = "flv" === i ? "x-flv": i;
                        o += '<source src="' + n[i] + '" type="video/' + s + '">'
                    }
                    var r = !1;
                    try {
                        r = Boolean(new ActiveXObject("ShockwaveFlash.ShockwaveFlash"))
                    } catch(e) {
                        r = void 0 !== navigator.mimeTypes["application/x-shockwave-flash"]
                    }
                    var c = "";
                    return r || (c = '<blockquote><p>您还没有安装flash播放器，请点击<a href="http://www.adobe.com/go/getflash" target="_blank">这里</a>安装</p>\n                <p>安装后重启浏览器即可播放视频</p></blockquote>'),
                        $("<div>" + c + '<video class="video-js vjs-default-skin" controls preload="auto"\n            data-setup=\'{"fluid":true}\'>' + o + "</video></div>").html()
                }
                return null
            }
            function i(e, t) {
                if (t = t || {},
                    Object.keys(c).forEach(function(e) {
                        void 0 === t[e] && (t[e] = c[e])
                    }), t.renderer = new s.Renderer, t.renderer.paragraph = function(e) {
                    return e.split("\n").map(function(e) {
                        return "<p>" + e + "</p>\n"
                    }).join("")
                },
                t.math !== !1) {
                    var n = t.renderer.codespan.bind(t.renderer);
                    t.renderer.codespan = function(e) {
                        var t = void 0;
                        return (t = a(e)) ? t: n(e)
                    }
                }
                if (t.video !== !1) {
                    var i = t.renderer.codespan.bind(t.renderer);
                    t.renderer.codespan = function(e) {
                        var t = void 0;
                        return (t = o(e)) ? t: i(e)
                    }
                }
                var l = s(e, t);
                return l = l.replace(/\<(\s*s\s*c\s*r\s*i\s*p\s*t.*?)\>/gi, "&lt;$1&gt;"),
                    l = l.replace(/\<(\s*\/\s*s\s*c\s*r\s*i\s*p\s*t\s*)\>/gi, "&lt;$1&gt;"),
                    l = r().process(l, {
                        sync: !0
                    }).html
            }
            var s = n(50),
                r = n(51);
            s.Lexer.rules.gfm.heading = s.Lexer.rules.normal.heading,
                s.Lexer.rules.tables.heading = s.Lexer.rules.normal.heading;
            var c = {
                gfm: !0,
                tables: !0,
                breaks: !1,
                pedantic: !0,
                sanitize: !1,
                smartLists: !0,
                smartypants: !1
            };
            e.exports = i
        },
        49 : function(e, t) {
            function n(e) {
                var t = e.page,
                    n = e.pages,
                    a = "";
                if (a += '<ul class="pagination">', a += e.has_prev ? '<li class="prev-page"><a href="javascript:;">上一页</a></li>': '<li class="disabled prev-page"><a href="javascript:;">上一页</a></li>', t >= 6) {
                    a += '<li><a href="#" data-page="1">1</a></li>',
                        a += '<li><a href="#">...</a></li>';
                    for (var o = t - 3; o < t; o++) a += '<li><a href="#" data-page="' + o + '">' + o + "</a></li>"
                } else for (var o = 1; o < t; o++) a += '<li><a href="#" data-page="' + o + '">' + o + "</a></li>";
                if (a += '<li class="active"><a href="#" data-page="' + t + '">' + t + "</a></li>", n - t >= 5) {
                    for (var o = t + 1; o < t + 4; o++) a += '<li><a href="#" data-page="' + o + '">' + o + "</a></li>";
                    a += '<li><a href="#">...</a></li>',
                        a += '<li><a href="#" data-page="' + n + '">' + n + "</a></li>"
                } else for (var o = t + 1; o <= n; o++) a += '<li><a href="#" data-page="' + o + '">' + o + "</a></li>";
                a += e.has_next ? '<li class="next-page"><a href="javascript:;">下一页</a></li>': '<li class="disabled next-page"><a href="javascript:;">下一页</a></li>',
                    a += "</ul>",
                    $(".pagination-container").html(a)
            }
            function a(e, t, n) {
                $(".pagination-container li").on("click",
                    function() {
                        if (!$(this).attr("class") && !$("a", this).data("page")) return ! 1;
                        var a;
                        return !! (a = $(this).hasClass("prev-page") && e > 1 ? e - 1 : $(this).hasClass("next-page") && e != t ? e + 1 : $("a", this).data("page")) && (n && "function" == typeof n && n(a), !1)
                    })
            }
            e.exports = {
                pagination: n,
                switchPage: a
            }
        },
        52 : function(e, t, n) {
            function a(e) {
                i(e)
            }
            function o(e, t, n) {
                $.get(e, {
                    page: t || 1,
                    page_size: n || 10
                }).done(function(t) {
                    for (var n = t.data.page,
                             a = t.data.pages,
                             i = t.data.items,
                             c = i.length,
                             p = "",
                             h = 0; h < c; h++) {
                        p += '<div class="row comment-list-item"><div class="col-md-1">' + u.userAvatar(i[h].author) + '</div><div class="col-md-11 comment-item-body">',
                            p += i[h].reply ? u.userName(i[h].author) + "<span> 回复 </span>" + u.userName(i[h].reply) : "" + u.userName(i[h].author);
                        var m = i[h].content;
                        m = d(m),
                            p += '<div class="comment-item-content markdown-box">' + m + '</div><div class="comment-item-date">' + i[h].created_at + "</div>",
                        i[h].lab && (p += '<div class="comment-item-lab">来自：' + i[h].lab.name + "</div>"),
                        i[h].can_be_deleted && (p += '<div class="comment-item-delete" data-url="' + i[h].del_url + '">删除</div>'),
                            p += f.userLogined ? '<div class="comment-item-reply" data-pid="' + i[h].id + '"><i class="fa fa-share"></i>回复</div>': '<div class="comment-item-reply"><a href="#sign-modal" data-toggle="modal" data-sign="signin"><i class="fa fa-share"></i>回复</a></div>',
                            p += "</div></div>"
                    }
                    $(".comment-list").html(p),
                        $(".comment-list pre > code").each(function() {
                            hljs.highlightBlock(this)
                        }),
                        a > 1 ? (l.pagination(t.data), l.switchPage(n, a,
                            function(t) {
                                o(e, t)
                            })) : $(".pagination-container").html(""),
                        s(e),
                        r(e)
                })
            }
            function i(e, t) {
                $(".comment-form-add").off("click").on("click",
                    function() {
                        var n = $(this).parents(".comment-form"),
                            a = t || {};
                        a.content = $(".comment-form-content", n).val().trim(),
                            $(".comment-form-content", n).val(""),
                            a.content ? $.post(e, a,
                                function(t) {
                                    if (t.ok) {
                                        a = null,
                                            $(".comment-form-content", n).val("").attr("placeholder", "至少输入5个字");
                                        var i = $(".comments-count");
                                        i.text(Number(i.text()) + 1),
                                            o(e)
                                    }
                                    $(".comment-form-reset").trigger("click"),
                                        c.flashMessage(t.ok, t.message)
                                }).fail(function(e) {
                                429 == e.status && c.flash429Error()
                            }) : c.flashMessage("error", "请输入内容后提交~")
                    })
            }
            function s(e) {
                $(".comment-item-reply").on("click",
                    function() {
                        var t = $(this).parents(".comment-list-item").find(".username").first().text().trim(),
                            n = {};
                        return n.parent_id = $(this).data("pid"),
                            $(".comment-form-content").val("").attr("placeholder", "回复 " + t + "：").focus(),
                            $(".comment-form-reset").show(),
                            $(document).scrollTop($(".comment-form-content").offset().top - 80),
                            i(e, n),
                            !1
                    }),
                    $(".comment-form-reset").on("click",
                        function() {
                            var t = $(this).parents(".comment-box");
                            $(".comment-form-content", t).attr("placeholder", "输入您想说的话..."),
                                $(this).hide(),
                                i(e)
                        })
            }
            function r(e) {
                $(".comment-item-delete").on("click",
                    function() {
                        $.ajax({
                            url: $(this).data("url"),
                            method: "delete"
                        }).done(function(t) {
                            if ("success" == t.status) {
                                var n = $(".comments-count");
                                n.text(Number(n.text()) - 1),
                                    o(e)
                            }
                            c.flashMessage(t.status, t.message)
                        })
                    })
            }
            var c = n(4),
                l = n(49),
                d = n(46),
                u = n(9),
                f = ($("#base-data").data(), $("#jinja-data").data());
            e.exports = {
                init: a,
                getComment: o
            }
        },
        53 : function(e, t, n) {
            function a(e) {
                var t = "https://dn-simplecloud.shiyanlou.com/";
                Qiniu.uploader({
                    runtimes: "html5,flash,html4",
                    browse_button: e.find(".mkeditor-btn-img").attr("id"),
                    custom_uptoken_url: c.qiniuTokenUrl,
                    custom_uptoken_data: {
                        doc_edit: "True"
                    },
                    domain: t,
                    bucket: "simplecloud",
                    max_file_size: "5mb",
                    max_retries: 5,
                    dragdrop: !0,
                    drop_element: e.find(".mkeditor-btn-img").attr("id"),
                    chunk_size: "1mb",
                    auto_start: !1,
                    unique_names: !1,
                    save_key: !1,
                    init: {
                        FilesAdded: function(e, t) {
                            plupload.each(t,
                                function(t) {
                                    e.start()
                                })
                        },
                        UploadProgress: function(e, t) {
                            r.show()
                        },
                        FileUploaded: function(n, a, i) {
                            var i = "string" == typeof i ? $.parseJSON(i) : i,
                                s = i.key;
                            o(e.find("textarea"), "\n![图片描述](" + t + s + "-wm)\n"),
                                setTimeout(function() {
                                        r.hide()
                                    },
                                    1e3)
                        },
                        Error: function(e, t, n) {
                            r.hide(),
                                i.flashMessage("error", "插入图片失败，请刷新后重试")
                        },
                        Key: function(e, t) {
                            var n = (new Date).getTime();
                            return "uid/" + c.userid + "/" + n + ".png"
                        }
                    }
                })
            }
            function o(e, t) {
                e instanceof jQuery && (e = e.get(0)),
                    e.focus();
                var n = window.getSelection().toString() || null,
                    a = void 0;
                "string" == typeof t ? a = t: "function" == typeof t && (a = t && t(n));
                var o = e.selectionStart,
                    i = e.selectionEnd,
                    s = o,
                    r = e.value;
                e.value = r.substring(0, o) + a + r.substring(i, r.length),
                    s += a.length,
                    e.selectionStart = e.selectionEnd = s,
                    $(e).trigger("keypress").trigger("keyup")
            }
            var i = n(4),
                s = n(46),
                r = n(8),
                c = $("#jinja-data").data(),
                l = {
                    bold: function(e) {
                        return e ? "**" + e + "**": "**加粗文字**\n"
                    },
                    italic: function(e) {
                        return e ? "*" + e + "*": "*斜体文字*\n"
                    },
                    link: function() {
                        return "[连接描述](https://www.shiyanlou.com/)\n"
                    },
                    quote: function(e) {
                        return e ? "> " + e: "> 引用文字\n"
                    },
                    code: function(e) {
                        return e ? "```\n" + e + "\n```\n": "```\n输入代码\n```\n"
                    },
                    ol: function(e) {
                        return e ? " 1. " + e + "\n": " 1. 列表项目\n"
                    },
                    ul: function(e) {
                        return e ? " -. " + e + "\n": " - 列表项目\n"
                    }
                };
            $(".mkeditor").on("mouseover",
                function() {
                    var e = $("textarea", this),
                        t = $(".mkeditor-viewer div", this),
                        n = $(".mkeditor-btn-bold", this),
                        a = $(".mkeditor-btn-italic", this),
                        i = $(".mkeditor-btn-link", this),
                        r = $(".mkeditor-btn-quote", this),
                        c = $(".mkeditor-btn-code", this),
                        d = $(".mkeditor-btn-listol", this),
                        u = $(".mkeditor-btn-listul", this),
                        f = $(".mkeditor-btn-view", this);
                    n.off("click").on("click",
                        function() {
                            o(e, l.bold)
                        }),
                        a.off("click").on("click",
                            function() {
                                o(e, l.italic)
                            }),
                        i.off("click").on("click",
                            function() {
                                o(e, l.link)
                            }),
                        r.off("click").on("click",
                            function() {
                                o(e, l.quote)
                            }),
                        c.off("click").on("click",
                            function() {
                                o(e, l.code)
                            }),
                        d.off("click").on("click",
                            function() {
                                o(e, l.ol)
                            }),
                        u.off("click").on("click",
                            function() {
                                o(e, l.ul)
                            }),
                        f.off("click").on("click",
                            function() {
                                var n = e.val();
                                n = s(n),
                                    t.html(n),
                                    $("pre > code", t).each(function() {
                                        hljs.highlightBlock(this)
                                    })
                            })
                }).each(function() {
                c.isAuthenticated && a($(this))
            })
        },
        54 : function(e, t, n) {
            n(53);
            var a = n(4),
                o = $("#jinja-data").data(),
                i = $("#askquestion");
            o.isAuthenticated || $('a[href="#askquestion"]').on("click",
                function(e) {
                    return $("#sign-modal").modal("show"),
                        !1
                }),
                i.find("input[name=title]").on("keypress keyup",
                    function() {
                        localStorage.questionTitle = $(this).val()
                    }),
                i.find("textarea").on("keypress keyup",
                    function() {
                        localStorage.questionContent = $(this).val()
                    }),
                i.on("show.bs.modal",
                    function() {
                        $("input[name=title]", this).val(localStorage.questionTitle || ""),
                            $("textarea", this).val(localStorage.questionContent || "")
                    }),
                i.on("show.bs.modal",
                    function() {
                        var e = $(".q-tags", this),
                            t = $(".q-types", this);
                        $.get(o.questionForm).done(function(n) {
                            var a = [],
                                o = [],
                                i = Object.keys(n.area_types);
                            i = i.sort(function(e, t) {
                                return e - t
                            }),
                                i.shift(),
                                i.map(function(e) {
                                    2 == e ? a.push('<span class="label label-success" value="' + e + '">') : a.push('<span class="label label-default" value="' + e + '">'),
                                        a.push(n.area_types[e] + "</span>")
                                }),
                                n.tags.map(function(e) {
                                    o.push('<span class="label label-default" value="' + e.name + '">'),
                                        o.push(e.name + "</span>")
                                }),
                                t.html(a.join("")),
                                e.html(o.join("")),
                                t.off("click", "span").on("click", "span",
                                    function() {
                                        var e = "label-default",
                                            n = "label-success";
                                        t.find("span").removeClass(n).addClass(e),
                                            $(this).removeClass(e).addClass(n)
                                    }),
                                e.off("click", "span").on("click", "span",
                                    function() {
                                        var t = "label-default",
                                            n = "label-success",
                                            a = t;
                                        if ($(this).hasClass(n)) {
                                            var o = [n, a];
                                            t = o[0],
                                                n = o[1]
                                        } else if (3 == $("span.label-success", e).length) return ! 1;
                                        $(this).removeClass(t).addClass(n)
                                    })
                        }).fail(function() {
                            a.flashMessage("error", "获取标签失败，请刷新页面后重试")
                        })
                    }),
                i.on("click", ".submit-question",
                    function() {
                        var e = i.find("form"),
                            t = e.attr("action"),
                            n = e.serializeJSON(),
                            s = i.find(".q-tags .label-success"),
                            r = i.find(".q-types .label-success");
                        n.area_code = r.attr("value"),
                            $.makeArray(s).map(function(e, t, a) {
                                n["tag-" + (t + 1)] = $(e).attr("value")
                            }),
                        o.labid && (n.lab_id = o.labid, n["tag-1"] = "课程相关"),
                        o.courseId && (n.course_id = o.courseId, n["tag-1"] = "课程相关", n.area_code = 1),
                        "true" == localStorage.courseError && (n.area_code = 6),
                        n.offered_money || (n.offered_money = 0),
                            $.post(t, n).done(function(t) {
                                if ("success" == t.status) {
                                    if (localStorage.removeItem("questionTitle"), localStorage.removeItem("questionContent"), o.labid && o.courseId) return $("input", e).val(""),
                                        $("textarea", e).val(""),
                                        i.modal("hide"),
                                        void a.flashMessage(t.status, t.message);
                                    window.location.href = t.next
                                } else i.modal("hide"),
                                    a.flashMessage(t.status, t.message)
                            }).fail(function() {
                                a.flashMessage("error", "提问失败，请刷新页面后重试")
                            })
                    })
        },
        6 : function(e, t, n) {
            var a = n(47),
                o = $("#base-data").data(),
                i = null;
            if (o && o.isLogin) {
                var s = {
                    query: "token=" + o.jwtToken,
                    transports: ["websocket"]
                };
                o.isJwt || (s.query = "uid=" + o.userId),
                    i = a(o.socketUrl, s),
                    i.on("disconnect",
                        function() {
                            i.disconnect()
                        })
            }
            e.exports = i
        },
        7 : function(e, t, n) {
            function a(e) {
                return function() {
                    var t = e.apply(this, arguments);
                    return new Promise(function(e, n) {
                        function a(o, i) {
                            try {
                                var s = t[o](i),
                                    r = s.value
                            } catch(e) {
                                return void n(e)
                            }
                            if (!s.done) return Promise.resolve(r).then(function(e) {
                                    a("next", e)
                                },
                                function(e) {
                                    a("throw", e)
                                });
                            e(r)
                        }
                        return a("next")
                    })
                }
            }
            n(13),
                n(30),
                n(31),
                n(32);
            var o = n(10),
                i = n(39),
                s = (n(26), n(38)),
                r = n(8),
                c = n(4),
                l = $("#base-data").data();
            $(function() {
                var e = function() {
                    var e = a(regeneratorRuntime.mark(function e(t) {
                        var n, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                        return regeneratorRuntime.wrap(function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2,
                                            $.post(t, {
                                                new_env: a
                                            });
                                    case 2:
                                        n = e.sent,
                                            "success" == n.status ? setTimeout(function() {
                                                    window.location.href = n.nexturl
                                                },
                                                2e3) : (r.hide(), c.flashMessage(n.status, n.message));
                                    case 4:
                                    case "end":
                                        return e.stop()
                                }
                            },
                            e, this)
                    }));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                } ();
                $("#side-new-contest").length && new o({
                    el: "#side-new-contest",
                    render: function(e) {
                        return e(i)
                    }
                }),
                $("#search-box").length && new o({
                    el: "#search-box",
                    render: function(e) {
                        return e(s)
                    }
                });
                var t = $("#hello-modal");
                t.find(".yes-btn").on("click", a(regeneratorRuntime.mark(function n() {
                    var a;
                    return regeneratorRuntime.wrap(function(n) {
                            for (;;) switch (n.prev = n.next) {
                                case 0:
                                    return t.modal("hide"),
                                        r.show(),
                                        a = $(this).data("url"),
                                        n.next = 5,
                                        e(a, 1);
                                case 5:
                                    return r.hide(),
                                        n.abrupt("return", !1);
                                case 7:
                                case "end":
                                    return n.stop()
                            }
                        },
                        n, this)
                }))),
                    t.on("show.bs.modal",
                        function() {
                            localStorage.helloModal = !0
                        }),
                "true" != localStorage.helloModal && t.modal("show"),
                    $(".user-vm-btn").on("click",
                        function() {
                            var t = $(this).data("clear"),
                                n = $(this).data("start");
                            $(this).data("run");
                            return r.show(),
                                $.post(t, {
                                    userlab: l.userlabId
                                }).done(function(t) {
                                    "success" == t.status ? setTimeout(function() {
                                            e(n)
                                        },
                                        3e3) : "error" == t.status && e(n)
                                }),
                                !1
                        }),
                    $(document).on("click", ".stat-event",
                        function() {
                            var e = $(this).data("stat");
                            $.post("/api/logstash", {
                                name: e
                            }).fail(function() {
                                console.log("ajax failed")
                            })
                        }),
                    $(".switch-btn input[type=checkbox]").bootstrapSwitch({
                        onText: "是",
                        offText: "否",
                        onColor: "success"
                    }),
                    $('[data-toggle="tooltip"]').tooltip(),
                    $('[data-toggle="popover"]').popover(),
                l.flash && ($("#flash").modal("show"), setTimeout(function() {
                        $("#flash").modal("hide")
                    },
                    3e3)),
                    $(".header .user-vip").on("click",
                        function() {
                            var e = $(this).data("url");
                            return window.location.href = e,
                                !1
                        }),
                    $(".header").on("click", ".tooltip",
                        function() {
                            var e = $(this).data("url");
                            return window.location.href = e,
                                !1
                        }),
                    $("#flash-modal").modal(),
                    $("#new-features").modal("show").find(".btn").on("click",
                        function() {
                            window.open($(this).data("href"), "blank")
                        }),
                    $(".words-ctrl form input, .words-ctrl form textarea").on("keyup keypress",
                        function() {
                            var e = $(this).attr("min"),
                                t = $(this).attr("max"),
                                n = $(this).val().length,
                                a = "";
                            void 0 !== e && void 0 !== t && (a = n < e ? '<span class="text-danger">字数太少，至少需要' + e + "字</span>": n > t ? '<span class="text-danger">字数太多，不能超过' + t + "字</span>": '<span class="text-success">还能输入' + (t - n) + "字</span>", $(this).parent().find(".help-block").html(a).show())
                        })
            }),
                $(function() {
                    $("input[name=school]").on("keypress keyup",
                        function() {
                            $(".college-suggestion").remove();
                            var e = this,
                                t = $(this).val();
                            $.get("/search/college", {
                                search: t
                            }).done(function(t) {
                                if (t.data.length) {
                                    for (var n = t.data,
                                             a = '<div class="college-suggestion">',
                                             o = 0; o < n.length; o++) a += "<a>" + n[o] + "</a>";
                                    a += "</div>",
                                        $(e).parent().append(a),
                                        $(".college-suggestion").css({
                                            position: "absolute",
                                            padding: "4px",
                                            border: "solid 1px #eee",
                                            "border-top": "none",
                                            background: "#fff",
                                            "z-index": 2e3
                                        }).find("a").css({
                                            display: "block",
                                            padding: "6px 8px",
                                            color: "#4c5157",
                                            "font-size": "13px"
                                        }).hover(function() {
                                                $(this).css({
                                                    color: "#fff",
                                                    background: "#0c9",
                                                    "text-decoration": "none"
                                                }),
                                                    $(e).val($(this).text())
                                            },
                                            function() {
                                                $(this).css({
                                                    color: "#4c5157",
                                                    background: "#fff"
                                                })
                                            }),
                                        $(".college-suggestion").on("click",
                                            function() {
                                                $(".college-suggestion").remove()
                                            })
                                }
                            })
                        })
                }),
                e.exports = c
        },
        74 : function(e, t, n) {
            function a(e, t, n) {
                function a(e, t, n) {
                    e.removeClass("fa-star-o").addClass("fa-star"),
                    t && t.text(n)
                }
                function s(e, t, n) {
                    e.removeClass("fa-star").addClass("fa-star-o"),
                    t && t.text(n)
                }
                e.on("click",
                    function() {
                        if ("False" == i.isLogin) return $("#sign-modal").modal("show"),
                            !1;
                        var e, r, c, l, d = n,
                            u = this;
                        return t ? (e = t.data("followUrl"), r = t.data("unfollowUrl")) : (e = $(u).data("followUrl"), r = $(u).data("unfollowUrl")),
                            $(u).hasClass("fa-star") ? (c = r, l = s) : (c = e, l = a),
                            $.post(c).done(function(e) {
                                "success" == e.status ? (l == s && $(u).addClass("fa-star-o"), l($(u), d, e.count)) : $("#sign-modal").modal("show"),
                                d && o.flashMessage(e.status, e.message)
                            }).fail(function() {
                                $("#sign-modal").modal("show")
                            }),
                            !1
                    })
            }
            var o = n(4),
                i = $("#jinja-data").data();
            e.exports = {
                follow: a
            }
        },
        75 : function(e, t, n) {
            function a(e, t, n) {
                $.get(e, {
                    page: t || 1,
                    page_size: n || 10
                }).done(function(t) {
                    for (var n = t.data.page,
                             r = t.data.pages,
                             c = t.data.items,
                             l = c.length,
                             d = [], u = 0; u < l; u++) d.push('\n                <li class="question-item">\n                    <div class="col-md-10">\n                        <div class="col-sm-2 question-item-author">\n                            ' + s.userAvatar(c[u].author) + '\n                        </div>\n                        <div class="col-sm-10">\n                            <h4>\n                                <a class="question-item-title" href="' + c[u].question_url + '" target="_blank">' + o.escape(c[u].title) + '</a>\n                            </h4>\n                            <div class="question-item-summary">\n                                ' + s.userName(c[u].author) + '\n                                <span class="question-item-date">' + c[u].created_at + '</span>\n                            </div>\n                        </div>\n                    </div>\n                    <div class="col-md-2 question-item-rank">\n                        <div class="{% if q.answers_count > 0 %}question-item-answered{% endif %}">\n                            <div>' + (c[u].ans || 0) + '</div>\n                            <div>回复</div>\n                        </div>\n                        <div class="question-item-views">\n                            <div>' + (c[u].views || 0) + "</div>\n                            <div>查看</div>\n                        </div>\n                    </div>\n                </li>\n            ");
                    $(".question-items").html(d.join("")),
                        r > 1 ? (i.pagination(t.data), i.switchPage(n, r,
                            function(t) {
                                a(e, t)
                            })) : $(".pagination-container").html("")
                })
            }
            var o = n(4),
                i = n(49),
                s = n(9);
            $("#jinja-data").data();
            e.exports = {
                getQuestion: a
            }
        },
        78 : function(e, t, n) {
            var a, o, i;
            /**
             * isMobile.js v0.4.0
             *
             * A simple library to detect Apple phones and tablets,
             * Android phones and tablets, other mobile devices (like blackberry, mini-opera and windows phone),
             * and any kind of seven inch device, via user agent sniffing.
             *
             * @author: Kai Mallea (kmallea@gmail.com)
             *
             * @license: http://creativecommons.org/publicdomain/zero/1.0/
             */
            !
                function(n) {
                    var s = /iPhone/i,
                        r = /iPod/i,
                        c = /iPad/i,
                        l = /(?=.*\bAndroid\b)(?=.*\bMobile\b)/i,
                        d = /Android/i,
                        u = /(?=.*\bAndroid\b)(?=.*\bSD4930UR\b)/i,
                        f = /(?=.*\bAndroid\b)(?=.*\b(?:KFOT|KFTT|KFJWI|KFJWA|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|KFARWI|KFASWI|KFSAWI|KFSAWA)\b)/i,
                        p = /IEMobile/i,
                        h = /(?=.*\bWindows\b)(?=.*\bARM\b)/i,
                        m = /BlackBerry/i,
                        v = /BB10/i,
                        g = /Opera Mini/i,
                        b = /(CriOS|Chrome)(?=.*\bMobile\b)/i,
                        $ = /(?=.*\bFirefox\b)(?=.*\bMobile\b)/i,
                        w = new RegExp("(?:Nexus 7|BNTV250|Kindle Fire|Silk|GT-P1000)", "i"),
                        x = function(e, t) {
                            return e.test(t)
                        },
                        y = function(e) {
                            var t = e || navigator.userAgent,
                                n = t.split("[FBAN");
                            if (void 0 !== n[1] && (t = n[0]), n = t.split("Twitter"), void 0 !== n[1] && (t = n[0]), this.apple = {
                                phone: x(s, t),
                                ipod: x(r, t),
                                tablet: !x(s, t) && x(c, t),
                                device: x(s, t) || x(r, t) || x(c, t)
                            },
                                this.amazon = {
                                    phone: x(u, t),
                                    tablet: !x(u, t) && x(f, t),
                                    device: x(u, t) || x(f, t)
                                },
                                this.android = {
                                    phone: x(u, t) || x(l, t),
                                    tablet: !x(u, t) && !x(l, t) && (x(f, t) || x(d, t)),
                                    device: x(u, t) || x(f, t) || x(l, t) || x(d, t)
                                },
                                this.windows = {
                                    phone: x(p, t),
                                    tablet: x(h, t),
                                    device: x(p, t) || x(h, t)
                                },
                                this.other = {
                                    blackberry: x(m, t),
                                    blackberry10: x(v, t),
                                    opera: x(g, t),
                                    firefox: x($, t),
                                    chrome: x(b, t),
                                    device: x(m, t) || x(v, t) || x(g, t) || x($, t) || x(b, t)
                                },
                                this.seven_inch = x(w, t), this.any = this.apple.device || this.android.device || this.windows.device || this.other.device || this.seven_inch, this.phone = this.apple.phone || this.android.phone || this.windows.phone, this.tablet = this.apple.tablet || this.android.tablet || this.windows.tablet, "undefined" == typeof window) return this
                        },
                        k = function() {
                            var e = new y;
                            return e.Class = y,
                                e
                        };
                    void 0 !== e && e.exports && "undefined" == typeof window ? e.exports = y: void 0 !== e && e.exports && "undefined" != typeof window ? e.exports = k() : (o = [], a = n.isMobile = k(), void 0 !== (i = "function" == typeof a ? a.apply(t, o) : a) && (e.exports = i))
                } (this)
        },
        8 : function(e, t) {
            function n(e, t) {
                if (e && i.css({
                    top: e.offset().top,
                    left: e.offset().left,
                    width: e.width(),
                    height: e.height()
                }), t) {
                    var n = $("<div>" + t + "</div>");
                    n.css({
                        "margin-top": "10px",
                        color: "#fff",
                        "font-size": "15px",
                        "text-align": "center"
                    }),
                        i.append(n)
                }
                i.show()
            }
            function a() {
                i.css({
                    top: 0,
                    left: 0,
                    width: "auto",
                    height: "auto"
                }),
                    i.hide()
            }
            var o = '<div><i class="fa fa-spinner fa-pulse"></i></div>',
                i = $(o);
            $("body").append(i),
                i.css({
                    display: "none",
                    position: "fixed",
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    background: "rgba(0,0,0,0.5)",
                    "text-align": "center",
                    "z-index": 1600
                }),
                i.find(".fa").css({
                    "margin-top": .4 * $(window).height(),
                    color: "#fff",
                    "font-size": "35px"
                }),
                $(window).on("resize",
                    function() {
                        i.find(".fa").css({
                            "margin-top": .4 * $(window).height()
                        })
                    }),
                e.exports = {
                    show: n,
                    hide: a
                }
        },
        9 : function(e, t) {
            function n(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "",
                    n = "";
                return e.is_member && (n = '\n            <a class="member-icon" href="/vip" target="_blank">\n                <img src="' + e.member_icon + '">\n            </a>'),
                '\n        <div class="user-avatar ' + t + '">\n            <a class="avatar" href="' + e.home_page + '" target="_blank">\n                <img src="' + e.avatar + '">\n            </a>\n            ' + n + "\n        </div>"
            }
            function a(e) {
                return '\n        <div class="user-username">\n            <a class="username" href="' + e.home_page + '" target="_blank">\n                ' + e.name + '\n            </a>\n            <span class="user-level">L' + e.level + "</span>\n        </div>"
            }
            e.exports = {
                userAvatar: n,
                userName: a
            }
        }
    },
    [435]);