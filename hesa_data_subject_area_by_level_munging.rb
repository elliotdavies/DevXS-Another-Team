#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'
require 'pp'

$db = CouchRest.database!("http://127.0.0.1:5984/hesa_subject_areas")

under_vals = []
post_vals = []
other_vals = []

$db.all_docs(:include_docs => true)["rows"].each do |mr_d|
  doc = mr_d["doc"]
  under_vals << doc["undergraduate"]
  post_vals << doc["postgraduate"]
  other_vals << doc["other"]
end

under_vals.sort!.reverse!
post_vals.sort!.reverse!
other_vals.sort!.reverse!

$db.all_docs(:include_docs => true)["rows"].each do |mr_d|
  doc = mr_d["doc"]
  doc["undergraduate_rank"] = under_vals.index(doc["undergraduate"]) + 1
  doc["postgraduate_rank"] = post_vals.index(doc["postgraduate"]) + 1
  doc["other_rank"] = other_vals.index(doc["other"]) + 1

  $db.save_doc(doc)
end




