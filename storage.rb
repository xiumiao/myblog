require 'securerandom'
require 'pstore'
require_relative 'record'

class Page  < Record::Base


  def initialize( page_name, author, contents )
    @page_name = page_name
    add_revision(author, contents)
    super()
  end
  attr_reader :page_name
  attr_accessor :url


  def add_revision( author, contents )
    @revisions =  { :created  => Time.now,
                    :title    => page_name,
                    :url      => url,
                    :author   => author,
                    :contents => contents,
                    :id     => id
                    }
  end

  def page_references
     @revisions
  end


end





