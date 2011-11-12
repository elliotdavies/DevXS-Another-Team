
class ATUUGRouter extends Backbone.Router
  routes:
    "subjects" : "subjects"
    "subjects/:subject": "subject"
    "universities" : "universities"
    "universities/:university": "university"

  subjects: () =>

  subject: (subject) =>

  universities: () =>

  university: (university) =>

class ATUUGApp extends Backbone.View
  initialize: () ->
    @router = new ATUUGRouter
    self = @
    $.get "templates/foo.ms", (template) ->
      self.el.html $.mustache(template, foo: "bar")


$ () ->
  window.ATUUGApp = ATUUGApp
  window.app = new ATUUGApp(el: $("#app"))

  Backbone.history.start()




