(function() {
  var ATUUGApp, ATUUGRouter;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  ATUUGRouter = (function() {
    __extends(ATUUGRouter, Backbone.Router);
    function ATUUGRouter() {
      this.university = __bind(this.university, this);
      this.universities = __bind(this.universities, this);
      this.subject = __bind(this.subject, this);
      this.subjects = __bind(this.subjects, this);
      ATUUGRouter.__super__.constructor.apply(this, arguments);
    }
    ATUUGRouter.prototype.routes = {
      "subjects": "subjects",
      "subjects/:subject": "subject",
      "universities": "universities",
      "universities/:university": "university"
    };
    ATUUGRouter.prototype.subjects = function() {};
    ATUUGRouter.prototype.subject = function(subject) {};
    ATUUGRouter.prototype.universities = function() {};
    ATUUGRouter.prototype.university = function(university) {};
    return ATUUGRouter;
  })();
  ATUUGApp = (function() {
    __extends(ATUUGApp, Backbone.View);
    function ATUUGApp() {
      ATUUGApp.__super__.constructor.apply(this, arguments);
    }
    ATUUGApp.prototype.initialize = function() {
      var self;
      this.router = new ATUUGRouter;
      self = this;
      return $.get("templates/foo.ms", function(template) {
        return self.el.html($.mustache(template, {
          foo: "bar"
        }));
      });
    };
    return ATUUGApp;
  })();
  $(function() {
    window.ATUUGApp = ATUUGApp;
    window.app = new ATUUGApp({
      el: $("#app")
    });
    return Backbone.history.start();
  });
}).call(this);
