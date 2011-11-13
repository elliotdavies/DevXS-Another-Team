(function() {
  var UUGRouter;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.UUG = {};
  window.UUG.render = function(selector, tmpl, data, callback) {
    return $.get("templates/" + tmpl + ".ms", function(template) {
      $(selector).html($.mustache(template, data));
      if (callback) {
        return callback.call();
      }
    });
  };
  UUGRouter = (function() {
    __extends(UUGRouter, Backbone.Router);
    function UUGRouter() {
      this.setActive = __bind(this.setActive, this);
      this.other = __bind(this.other, this);
      this.university = __bind(this.university, this);
      this.universities = __bind(this.universities, this);
      this.subject = __bind(this.subject, this);
      this.subjects = __bind(this.subjects, this);
      this.index = __bind(this.index, this);
      UUGRouter.__super__.constructor.apply(this, arguments);
    }
    UUGRouter.prototype.routes = {
      "": "index",
      "subjects": "subjects",
      "subjects/:subject": "subject",
      "universities": "universities",
      "universities/:university": "university",
      "other": "other",
      "other/:info": "other"
    };
    UUGRouter.prototype.index = function() {
      $(".topbar li").removeClass("active");
      return UUG.render("#app", "index", {});
    };
    UUGRouter.prototype.subjects = function() {
      this.setActive("subjects");
      return UUG.render("#app", "subjects", {}, function() {
        return $.couch.db("subjects").view("subjects/by_id", {
          success: function(data) {
            return UUG.render("#subjects_list", "subject_li", data);
          }
        });
      });
    };
    UUGRouter.prototype.subject = function(subject) {
      this.setActive("subjects");
      return UUG.render("#app", "subjects", {}, function() {
        $.couch.db("subjects").view("subjects/by_id", {
          success: function(data) {
            return UUG.render("#subjects_list", "subject_li", data);
          }
        });
        return $.couch.db("subjects").openDoc(subject, {
          success: __bind(function(data) {
            return UUG.render("#subject_area", "subject_area", data);
          }, this)
        });
      });
    };
    UUGRouter.prototype.universities = function() {
      this.setActive("universities");
      return UUG.render("#app", "universities", {}, function() {
        $.couch.db("universities").view("universities/by_id", {
          success: function(data) {
            return UUG.render("#universities_list", "universities_li", data);
          }
        });
        return $.couch.db("universities").view("universities/league", {
          startkey: 0,
          endkey: 100,
          success: function(data) {
            console.log(data);
            return UUG.render("#universities_league", "universities_league", data);
          }
        });
      });
    };
    UUGRouter.prototype.university = function(university) {
      this.setActive("universities");
      return UUG.render("#app", "universities", {}, function() {
        $.couch.db("universities").view("universities/by_id", {
          success: function(data) {
            return UUG.render("#universities_list", "universities_li", data);
          }
        });
        return $.couch.db("universities").openDoc(university, {
          success: __bind(function(data) {
            return UUG.render("#university_info", "university_info", data);
          }, this)
        });
      });
    };
    UUGRouter.prototype.other = function(info) {
      return this.setActive("other");
    };
    UUGRouter.prototype.setActive = function(section) {
      $(".topbar a[href!=#" + section + "]").parent("li").removeClass("active");
      return $(".topbar a[href=#" + section + "]").parent("li").addClass("active");
    };
    return UUGRouter;
  })();
  window.UUGRouter = UUGRouter;
  $(function() {
    UUG.render("#app", "index", {});
    window.router = new UUGRouter;
    return Backbone.history.start();
  });
}).call(this);
