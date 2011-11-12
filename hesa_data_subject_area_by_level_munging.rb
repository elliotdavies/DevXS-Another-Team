#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'
require 'pp'

$db = CouchRest.database!("http://127.0.0.1:5984/hesa_subject_areas")

$db.all_docs(:include_docs => true)["rows"].each do |mr_d|
  id = mr_d["id"]
  doc = mr_d["doc"]
  rev = doc["_rev"]

  pp doc
end


