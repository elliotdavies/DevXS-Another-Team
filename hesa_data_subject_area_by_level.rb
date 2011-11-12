#!/usr/bin/env ruby

require 'rubygems'
require 'fastercsv'
require 'couchrest'
require 'pp'

def convert_to_int(str)
  str.sub(/,/, "").to_i
end

$db = CouchRest.database!("http://127.0.0.1:5984/hesa_subject_areas")

FasterCSV.foreach("HESA DATA (1).csv") do |row|
  next if row.first == "HE students by subject area and level of study 2009/10"
  next if row.first == nil
  next if row.first =~ /^Total/

  subject, post, post_pc, under, under_pc, other, other_pc = row
  post = convert_to_int(post)
  post_pc = post_pc.to_f
  under = convert_to_int(under)
  under_pc = under_pc.to_f
  other = convert_to_int(other)
  other_pc = other_pc.to_f

  $db.save_doc({
    :subject_area => subject,
    :postgraduate => post,
    :postgraduate_percentage => post_pc,
    :undergraduate => under,
    :undergraduate_percentage => under_pc,
    :other => other,
    :other_percentage => other_pc
  })

end


