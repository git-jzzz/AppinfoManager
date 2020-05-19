/** layui-v2.0.2 MIT License By http://www.layui.com */
;layui.define(["laytpl", "laypage", "layer", "form"], function (e) {
    "use strict";
    var t = layui.$, i = layui.laytpl, a = layui.laypage, l = layui.layer, n = layui.form, d = layui.hint(),
        c = layui.device(), r = {
            config: {checkName: "LAY_CHECKED"},
            cache: {},
            index: layui.table ? layui.table.index + 1e4 : 0,
            set: function (e) {
                var i = this;
                return i.config = t.extend({}, i.config, e), i
            },
            on: function (e, t) {
                return layui.onevent.call(this, s, e, t)
            }
        }, o = function () {
            var e = this;
            return {
                reload: function (t) {
                    e.reload.call(e, t)
                }, config: e.config
            }
        }, s = "table", u = ".layui-table", f = "layui-hide", h = "layui-table-view", y = ".layui-table-header",
        p = ".layui-table-body", v = ".layui-table-main", m = ".layui-table-fixed", x = ".layui-table-fixed-l",
        b = ".layui-table-fixed-r", g = ".layui-table-tool", k = ".layui-table-sort", C = "layui-table-edit",
        w = "layui-table-hover", z = function (e) {
            return e = e || {}, ['<table cellspacing="0" cellpadding="0" border="0" class="layui-table" ', '{{# if(d.data.skin){ }}lay-skin="{{d.data.skin}}"{{# } }} {{# if(d.data.size){ }}lay-size="{{d.data.size}}"{{# } }} {{# if(d.data.even){ }}lay-even{{# } }}>', "<thead>", "{{# layui.each(d.data.cols, function(i1, item1){ }}", "<tr>", "{{# layui.each(item1, function(i2, item2){ }}", '{{# if(item2.fixed && item2.fixed !== "right"){ fixed = true; } }}', "{{# if(item2.fixed){ right = true; } }}", function () {
                return e.fixed && "right" !== e.fixed ? '{{# if(item2.fixed && item2.fixed !== "right"){ }}' : "right" === e.fixed ? '{{# if(item2.fixed === "right"){ }}' : ""
            }(), "{{# if(item2.checkbox){ }}", '<th data-field="{{ item2.field||i2 }}" data-type="checkbox" unresize="true"><div class="layui-table-cell laytable-cell-checkbox"><input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose" {{# if(item2[d.data.checkName]){ }}checked{{# }; }}></div></th>', "{{# } else if(item2.space){ }}", '<th data-field="{{ item2.field||i2 }}" unresize="true"><div class="layui-table-cell laytable-cell-space"></div></th>', "{{# } else { }}", '<th data-field="{{ item2.field||i2 }}" {{#if(item2.colspan){}} colspan="{{item2.colspan}}"{{#} if(item2.rowspan){}} rowspan="{{item2.rowspan}}"{{#}}} {{# if(item2.unresize){ }}unresize="true"{{# } }}>', "{{# if(item2.colspan > 1){ }}", '<div class="layui-table-cell laytable-cell-group" {{#if(item2.align){}}align="{{item2.align}}"{{#}}}>', '<span>{{item2.title||""}}</span>', "</div>", "{{# } else { }}", '<div class="layui-table-cell laytable-cell-{{d.index}}-{{item2.field||i2}}" {{#if(item2.align){}}align="{{item2.align}}"{{#}}}>', '<span>{{item2.title||""}}</span>', "{{# if(item2.sort){ }}", '<span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"></i><i class="layui-edge layui-table-sort-desc"></i></span>', "{{# } }}", "</div>", "{{# } }}", "</th>", "{{# }; }}", e.fixed ? "{{# }; }}" : "", "{{# }); }}", "</tr>", "{{# }); }}", "</thead>", "</table>"].join("")
        },
        T = ['<table cellspacing="0" cellpadding="0" border="0" class="layui-table" ', '{{# if(d.data.skin){ }}lay-skin="{{d.data.skin}}"{{# } }} {{# if(d.data.size){ }}lay-size="{{d.data.size}}"{{# } }} {{# if(d.data.even){ }}lay-even{{# } }}>', "<tbody></tbody>", "</table>"].join(""),
        A = ['<div class="layui-form layui-border-box {{d.VIEW_CLASS}}" lay-filter="LAY-table-{{d.index}}" style="{{# if(d.data.width){ }}width:{{d.data.width}}px;{{# } }} {{# if(d.data.height){ }}height:{{d.data.height}}px;{{# } }}">', "{{# var fixed, right; }}", '<div class="layui-table-header">', z(), "</div>", '<div class="layui-table-body layui-table-main">', T, "</div>", '{{# if(fixed && fixed !== "right"){ }}', '<div class="layui-table-fixed layui-table-fixed-l">', '<div class="layui-table-header">', z({fixed: !0}), "</div>", '<div class="layui-table-body">', T, "</div>", "</div>", "{{# }; }}", "{{# if(right){ }}", '<div class="layui-table-fixed layui-table-fixed-r">', '<div class="layui-table-header">', z({fixed: "right"}), '<div class="layui-table-mend"></div>', "</div>", '<div class="layui-table-body">', T, "</div>", "</div>", "{{# }; }}", "{{# if(d.data.page){ }}", '<div class="layui-table-tool">', '<div class="layui-inline layui-table-page" id="layui-table-page{{d.index}}"></div>', "</div>", "{{# } }}", "<style>", "{{# layui.each(d.data.cols, function(i1, item1){", "layui.each(item1, function(i2, item2){ }}", ".laytable-cell-{{d.index}}-{{item2.field||i2}}{ width:{{item2.width||50}}px }", "{{# });", "}); }}", "</style>", "</div>"].join(""),
        D = t(window), F = t(document), j = function (e) {
            var i = this;
            i.index = ++r.index, i.config = t.extend({}, i.config, r.config, e), i.render()
        };
    j.prototype.config = {limit: 30, loading: !0}, j.prototype.render = function () {
        var e = this, a = e.config;
        if (a.elem = t(a.elem), a.where = a.where || {}, !a.elem[0]) return e;
        var l = a.elem, n = l.next("." + h), d = e.elem = t(i(A).render({VIEW_CLASS: h, data: a, index: e.index}));
        if (a.index = e.index, n[0] && n.remove(), l.after(d), e.layHeader = d.find(y), e.layMain = d.find(v), e.layBody = d.find(p), e.layFixed = d.find(m), e.layFixLeft = d.find(x), e.layFixRight = d.find(b), e.layTool = d.find(g), a.height) {
            var c = parseFloat(a.height) - parseFloat(e.layHeader.height()) - 1;
            a.page && (c -= parseFloat(e.layTool.outerHeight() + 1)), e.layBody.css("height", c)
        }
        e.pullData(1), e.events()
    }, j.prototype.reload = function (e) {
        var i = this;
        i.config = t.extend({}, i.config, e), i.render()
    }, j.prototype.pullData = function (e, i) {
        var a = this, n = a.config;
        if (n.url) t.ajax({
            type: n.method || "get",
            url: n.url,
            data: t.extend({page: e, limit: n.limit}, n.where),
            dataType: "json",
            //添加token至header中
            headers: {"token":localStorage.getItem("token_back")},
            success: function (t) {
                return 0 != t.code ? l.msg(t.msg) : (a.renderData(t, e, t.count), i && l.close(i), void ("function" == typeof n.done && n.done(t, e, t.count)))
            },
            error: function (e, t) {
                l.msg("数据请求异常"), d.error("初始table时的接口" + n.url + "异常：" + t), i && l.close(i)
            }
            ,
            complete: function( xhr,data ){
                if(xhr.getResponseHeader("token_back")!=null){
                    //置换token
                    alert(1);
                    localStorage.setItem("token_back",xhr.getResponseHeader("token_back"));
                }
            }
        }); else if (n.data && n.data.constructor === Array) {
            var c = e * n.limit - n.limit, r = {data: n.data.concat().splice(c, n.limit), count: n.data.length};
            a.renderData(r, e, n.data.length), "function" == typeof n.done && n.done(r, e, r.count)
        }
    }, j.prototype.page = 1, j.prototype.eachCols = function (e) {
        layui.each(this.config.cols, function (t, i) {
            layui.each(i, function (a, l) {
                e(a, l, [t, i])
            })
        })
    }, j.prototype.renderData = function (e, l, d, c) {
        var o = this, s = e.data, u = o.config, f = [], h = [], y = [], p = function () {
            return !c && o.sortKey ? o.sort(o.sortKey.field, o.sortKey.sort, !0) : (layui.each(s, function (e, a) {
                var l = [], n = [], d = [];
                o.eachCols(function (e, c) {
                    var o = a[c.field || e];
                    if (void 0 !== o && null !== o || (o = ""), !(c.colspan > 1)) {
                        var s = ['<td data-field="' + (c.field || e) + '"' + function () {
                            var e = [];
                            return c.edit && e.push(' data-edit="true"'), c.align && e.push(' align="' + c.align + '"'), c.templet && e.push(' data-content="' + o + '"'), c.toolbar && e.push(' data-off="true"'), c.event && e.push(' lay-event="' + c.event + '"'), c.style && e.push(' style="' + c.style + '"'), e.join("")
                        }() + ">", '<div class="layui-table-cell laytable-cell-' + function () {
                            return c.checkbox ? "checkbox" : c.space ? "space" : u.index + "-" + (c.field || e)
                        }() + '">' + function () {
                            return c.checkbox ? '<input type="checkbox" name="layTableCheckbox" lay-skin="primary" ' + function () {
                                var e = r.config.checkName;
                                return c[e] ? (a[e] = c[e], c[e] ? "checked" : "") : a[e] ? "checked" : ""
                            }() + ">" : c.toolbar ? i(t(c.toolbar).html() || "").render(a) : c.templet ? i(t(c.templet).html() || String(o)).render(a) : o
                        }(), "</div></td>"].join("");
                        l.push(s), c.fixed && "right" !== c.fixed && n.push(s), "right" === c.fixed && d.push(s)
                    }
                }), f.push('<tr data-index="' + e + '">' + l.join("") + "</tr>"), h.push('<tr data-index="' + e + '">' + n.join("") + "</tr>"), y.push('<tr data-index="' + e + '">' + d.join("") + "</tr>")
            }), o.layBody.scrollTop(0), o.layMain.find("tbody").html(f.join("")), o.layFixLeft.find("tbody").html(h.join("")), o.layFixRight.find("tbody").html(y.join("")), n.render("checkbox", "LAY-table-" + o.index), o.syncCheckAll(), o.haveInit ? o.scrollPatch() : setTimeout(function () {
                o.scrollPatch()
            }, 50), void (o.haveInit = !0))
        };
        return o.key = u.id || u.index, r.cache[o.key] = s, c ? p() : (o.cacheData = s, 0 === s.length ? o.layMain.html('<div class="layui-none">无数据</div>') : (p(), void (u.page && (o.page = l, o.count = d, a.render({
            elem: "layui-table-page" + u.index,
            count: d,
            groups: 3,
            limits: u.limits || [10, 20, 30, 40, 50, 60, 70, 80, 90],
            limit: u.limit,
            curr: l,
            layout: ["prev", "page", "next", "skip", "count", "limit"],
            prev: '<i class="layui-icon">&#xe603;</i>',
            next: '<i class="layui-icon">&#xe602;</i>',
            jump: function (e, t) {
                t || (o.page = e.curr, u.limit = e.limit, o.pullData(e.curr, o.loading()))
            }
        }), o.layTool.find(".layui-table-count span").html(d)))))
    }, j.prototype.sort = function (e, i, a) {
        var n, c = this, o = c.config, s = r.cache[c.key];
        "string" == typeof e && c.layHeader.find("th").each(function (i, a) {
            var l = t(this), d = l.data("field");
            if (d === e) return e = l, n = d, !1
        });
        try {
            var n = n || e.data("field");
            if (c.sortKey && !a && n === c.sortKey.field && i === c.sortKey.sort) return;
            var u = c.layHeader.find("th .laytable-cell-" + o.index + "-" + n).find(k);
            c.layHeader.find("th").find(k).removeAttr("lay-sort"), u.attr("lay-sort", i || null), c.layFixed.find("th")
        } catch (f) {
            return d.error("未到匹配field")
        }
        c.sortKey = {
            field: n,
            sort: i
        }, "asc" === i ? s = layui.sort(s, n) : "desc" === i ? s = layui.sort(s, n, !0) : (s = c.cacheData, delete c.sortKey), c.renderData({data: s}, c.page, c.count, !0), l.close(c.tipsIndex)
    }, j.prototype.loading = function () {
        var e = this, t = e.config;
        if (t.loading && t.url) return l.msg("数据请求中", {
            icon: 16,
            offset: [e.layTool.offset().top - 100 - D.scrollTop() + "px", e.layTool.offset().left + e.layTool.width() / 2 - 90 - D.scrollLeft() + "px"],
            anim: -1,
            fixed: !1
        })
    }, j.prototype.setCheckData = function (e, t) {
        var i = this, a = i.config, l = r.cache[i.key];
        l[e] && (l[e][a.checkName] = t, i.cacheData[e][a.checkName] = t)
    }, j.prototype.syncCheckAll = function () {
        var e = this, t = e.config, i = e.layHeader.find('input[name="layTableCheckbox"]'), a = function (i) {
            return e.eachCols(function (e, a) {
                a.checkbox && (a[t.checkName] = i)
            }), i
        };
        i[0] && (r.checkStatus(e.key).isAll ? (i[0].checked || (i.prop("checked", !0), n.render("checkbox", "LAY-table-" + e.index)), a(!0)) : (i[0].checked && (i.prop("checked", !1), n.render("checkbox", "LAY-table-" + e.index)), a(!1)))
    }, j.prototype.getCssRule = function (e, t) {
        var i = this, a = i.elem.find("style")[0], l = a.sheet || a.styleSheet, n = l.cssRules || l.rules;
        layui.each(n, function (a, l) {
            if (l.selectorText === ".laytable-cell-" + i.index + "-" + e) return t(l), !0
        })
    }, j.prototype.scrollPatch = function () {
        var e = this, i = e.layMain.width() - e.layMain.prop("clientWidth"),
            a = e.layMain.height() - e.layMain.prop("clientHeight");
        if (i && a) {
            if (!e.elem.find(".layui-table-patch")[0]) {
                var l = t('<th class="layui-table-patch"><div class="layui-table-cell"></div></th>');
                l.find("div").css({width: i}), e.layHeader.eq(0).find("thead tr").append(l)
            }
        } else e.layHeader.eq(0).find(".layui-table-patch").remove();
        e.layFixed.find(p).css("height", e.layMain.height() - a), e.layFixRight[a ? "removeClass" : "addClass"](f), e.layFixRight.css("right", i - 1)
    }, j.prototype.events = function () {
        var e, a = this, d = a.config, o = t("body"), u = {}, f = a.layHeader.find("th"), h = ".layui-table-cell",
            y = d.elem.attr("lay-filter");
        f.on("mousemove", function (e) {
            var i = t(this), a = i.offset().left, l = e.clientX - a;
            i.attr("colspan") > 1 || i.attr("unresize") || u.resizeStart || (u.allowResize = i.width() - l <= 10, o.css("cursor", u.allowResize ? "col-resize" : ""))
        }).on("mouseleave", function () {
            t(this);
            u.resizeStart || o.css("cursor", "")
        }).on("mousedown", function (e) {
            if (u.allowResize) {
                var i = t(this).data("field");
                e.preventDefault(), u.resizeStart = !0, u.offset = [e.clientX, e.clientY], a.getCssRule(i, function (e) {
                    u.rule = e, u.ruleWidth = parseFloat(e.style.width)
                })
            }
        }), F.on("mousemove", function (t) {
            if (u.resizeStart) {
                if (t.preventDefault(), u.rule) {
                    var i = u.ruleWidth + t.clientX - u.offset[0];
                    u.rule.style.width = i + "px", l.close(a.tipsIndex)
                }
                e = 1
            }
        }).on("mouseup", function (t) {
            u.resizeStart && (u = {}, o.css("cursor", ""), a.scrollPatch()), 2 === e && (e = null)
        }), f.on("click", function () {
            var i, l = t(this), n = l.find(k), d = n.attr("lay-sort");
            return n[0] && 1 !== e ? (i = "asc" === d ? "desc" : "desc" === d ? null : "asc", void a.sort(l, i)) : e = 2
        }).find(k + " .layui-edge ").on("click", function (e) {
            var i = t(this), l = i.index(), n = i.parents("th").eq(0).data("field");
            layui.stope(e), 0 === l ? a.sort(n, "asc") : a.sort(n, "desc")
        }), a.elem.on("click", 'input[name="layTableCheckbox"]+', function () {
            var e = t(this).prev(), i = a.layBody.find('input[name="layTableCheckbox"]'),
                l = e.parents("tr").eq(0).data("index"), d = e[0].checked,
                c = "layTableAllChoose" === e.attr("lay-filter");
            c ? (i.each(function (e, t) {
                t.checked = d, a.setCheckData(e, d)
            }), a.syncCheckAll(), n.render("checkbox", "LAY-table-" + a.index)) : (a.setCheckData(l, d), a.syncCheckAll()), layui.event.call(this, s, "checkbox(" + y + ")", {
                checked: d,
                data: r.cache[a.key][l],
                type: c ? "all" : "one"
            })
        }), a.layBody.on("mouseenter", "tr", function () {
            var e = t(this), i = e.index();
            a.layBody.find("tr:eq(" + i + ")").addClass(w)
        }).on("mouseleave", "tr", function () {
            var e = t(this), i = e.index();
            a.layBody.find("tr:eq(" + i + ")").removeClass(w)
        }), a.layBody.on("change", "." + C, function () {
            var e = t(this), i = this.value, l = e.parent().data("field"), n = e.parents("tr").eq(0).data("index");
            layui.event.call(this, s, "edit(" + y + ")", {value: i, data: r.cache[a.key][n], field: l})
        }).on("blur", "." + C, function () {
            var e, l = t(this), n = l.parent().data("field"), d = l.parents("tr").eq(0).data("index"),
                c = r.cache[a.key][d];
            a.eachCols(function (t, i) {
                i.field == n && i.templet && (e = i.templet)
            }), l.siblings(h).html(e ? i(t(e).html() || this.value).render(c) : this.value), l.parent().data("content", this.value), l.remove()
        }), a.layBody.on("click", "td", function () {
            var e = t(this), i = (e.data("field"), e.children(h));
            if (!e.data("off")) {
                if (e.data("edit")) {
                    var n = t('<input class="' + C + '">');
                    return n[0].value = e.data("content") || i.text(), e.find("." + C)[0] || e.append(n), n.focus()
                }
                i.prop("scrollWidth") > i.outerWidth() && (a.tipsIndex = l.tips(['<div class="layui-table-tips-main" style="margin-top: -' + (i.height() + 16) + "px;" + function () {
                    return "sm" === d.size ? "padding: 4px 15px; font-size: 12px;" : "lg" === d.size ? "padding: 14px 15px;" : ""
                }() + '">', i.html(), "</div>", '<i class="layui-icon layui-table-tips-c">&#x1006;</i>'].join(""), i[0], {
                    tips: [3, ""],
                    time: -1,
                    anim: -1,
                    maxWidth: c.ios || c.android ? 300 : 600,
                    isOutAnim: !1,
                    skin: "layui-table-tips",
                    success: function (e, t) {
                        e.find(".layui-table-tips-c").on("click", function () {
                            l.close(t)
                        })
                    }
                }))
            }
        }), a.layBody.on("click", "*[lay-event]", function () {
            var e = t(this), l = e.parents("tr").eq(0).data("index"), n = a.layBody.find('tr[data-index="' + l + '"]'),
                d = "layui-table-click";
            layui.event.call(this, s, "tool(" + y + ")", {
                data: r.cache[a.key][l],
                event: e.attr("lay-event"),
                tr: n,
                del: function () {
                    var e = this.data;
                    delete e[r.config.checkName], n.remove(), a.scrollPatch()
                },
                update: function (e) {
                    var l = this.data;
                    e = e || {}, layui.each(e, function (e, d) {
                        if (e in l) {
                            var c;
                            l[e] = d, a.eachCols(function (t, i) {
                                i.field == e && i.templet && (c = i.templet)
                            }), n.children('td[data-field="' + e + '"]').children(h).html(c ? i(t(c).html() || d).render(l) : d)
                        }
                    })
                }
            }), n.addClass(d).siblings("tr").removeClass(d)
        }), a.layMain.on("scroll", function () {
            var e = t(this), i = e.scrollLeft(), n = e.scrollTop();
            a.layHeader.scrollLeft(i), a.layFixed.find(p).scrollTop(n), l.close(a.tipsIndex)
        }), D.on("resize", function () {
            a.scrollPatch()
        })
    }, r.init = function (e, i) {
        i = i || {};
        var a = this, l = t(e ? 'table[lay-filter="' + e + '"]' : u + "[lay-data]");
        return l.each(function () {
            var a = t(this), l = a.attr("lay-data");
            try {
                l = new Function("return " + l)()
            } catch (n) {
                d.error("table元素属性lay-data配置项存在语法错误：" + l)
            }
            var c = [], o = t.extend({
                elem: this,
                cols: [],
                data: [],
                skin: a.attr("lay-skin"),
                size: a.attr("lay-size"),
                even: "string" == typeof a.attr("lay-even")
            }, r.config, i, l);
            e && a.hide(), a.find("thead>tr").each(function (e) {
                o.cols[e] = [], t(this).children().each(function (i) {
                    var a = t(this), l = a.attr("lay-data");
                    try {
                        l = new Function("return " + l)()
                    } catch (n) {
                        return d.error("table元素属性lay-data配置项存在语法错误：" + l)
                    }
                    var r = t.extend({title: a.text(), colspan: a.attr("colspan"), rowspan: a.attr("rowspan")}, l);
                    c.push(r), o.cols[e].push(r)
                })
            }), a.find("tbody>tr").each(function (e) {
                var i = t(this), a = {};
                i.children("td").each(function (e, i) {
                    var l = t(this), n = l.data("field");
                    if (n) return a[n] = l.html()
                }), layui.each(c, function (e, t) {
                    var l = i.children("td").eq(e);
                    a[t.field] = l.html()
                }), o.data[e] = a
            }), r.render(o)
        }), a
    }, r.checkStatus = function (e) {
        var t = 0, i = [], a = r.cache[e];
        return a ? (layui.each(a, function (e, a) {
            a[r.config.checkName] && (t++, i.push(a))
        }), {data: i, isAll: t === a.length}) : {}
    }, r.render = function (e) {
        var t = new j(e);
        return o.call(t)
    }, r.init(), e(s, r)
});