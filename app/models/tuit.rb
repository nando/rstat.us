# encoding: utf-8
# An Tuit is a "piido" that has been sent to us.

class Tuit
  require 'cgi'
  include MongoMapper::Document

  key :text, String, :default => ""
  validates_length_of :text, :minimum => 1, :maximum => 140

  def to_indexed_json
    self.to_json
  end

  timestamps!
end
