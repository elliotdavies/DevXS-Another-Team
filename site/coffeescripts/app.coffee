
window.UUG = {}
window.UUG.render = (selector, tmpl, data, callback) ->
  $.get "templates/#{tmpl}.ms", (template) ->
    $(selector).html $.mustache(template, data)
    callback.call() if callback

class UUGRouter extends Backbone.Router
  routes:
    "" : "index"
    "subjects" : "subjects"
    "subjects/:subject" : "subject"
    "universities" : "universities"
    "universities/:university": "university"
    "other" : "other"
    "other/:info" : "other"

  index: () =>
    $(".topbar li").removeClass "active"
    UUG.render "#app", "index", {}

  subjects: () =>
    @setActive("subjects")
    UUG.render "#app", "subjects", {}, () ->
      $.couch.db("subjects").view "subjects/by_id", success: (data) ->
        UUG.render "#subjects_list", "subject_li", data

  subject: (subject) =>
    @setActive("subjects")
    UUG.render "#app", "subjects", {}, () ->
      $.couch.db("subjects").view "subjects/by_id", success: (data) ->
        UUG.render "#subjects_list", "subject_li", data
      $.couch.db("subjects").openDoc subject, success: (data) =>
        UUG.render "#subject_area", "subject_area", data


  universities: () =>
    @setActive("universities")
    UUG.render "#app", "universities", {}, () ->
      $.couch.db("universities").view "unis/by_id", success: (data) ->
        UUG.render "#universities_list", "universities_li", data
      $.couch.db("universities").view "unis/league", startkey: 0, endkey: 100, success: (data) ->
        console.log(data)
        UUG.render "#universities_league", "universities_league", data

  university: (university) =>
    @setActive("universities")
    UUG.render "#app", "universities", {}, () ->
      $.couch.db("universities").view "unis/by_id", success: (data) ->
        UUG.render "#universities_list", "universities_li", data
      $.couch.db("universities").openDoc university, success: (data) =>
        UUG.render "#university_info", "university_info", data

  other: (info) =>
    @setActive("other")
    UUG.render "#app", "index", {}

  setActive: (section) =>
    $(".topbar a[href!=##{section}]").parent("li").removeClass("active")
    $(".topbar a[href=##{section}]").parent("li").addClass("active")

window.UUGRouter = UUGRouter

$ () ->
  UUG.render("#app", "index", {})
  window.router = new UUGRouter
  Backbone.history.start()
