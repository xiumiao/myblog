require 'securerandom'
require 'pstore'

class Page


  def initialize( page_name, author, contents )
    @page_name = page_name
    add_revision(author, contents)
  end
  attr_reader :page_name
  attr_accessor :url

  def add_revision( author, contents )
    @revisions =  { :created  => Time.now,
                    :title    => page_name,
                    :url      => url,
                    :author   => author,
                    :contents => contents,
                    :uuid     => SecureRandom.uuid
                    }
  end

  def page_references
     @revisions
  end


end

module ActiveRecord
  def self.include(base)
    base.extend(ClassMethods)
    base.instance_eval do
      include InstanceMethods
    end
  end
  module InstanceMethods
    def save
      @pstore ||= PStore.new("page.pstore")
      @pstore.transaction do
        @pstore[:index] ||= Array.new
        uuid = self.page_references[:uuid]
        @pstore[:index].push(uuid)
        @pstore[uuid.to_sym] = self.page_references
      end
    end

  end
  module ClassMethods
    def all
      @pstore ||= PStore.new("page.pstore")
      @pstore.transaction do
      pages =  @pstore[:index]
      pages.map do |page|
        @pstore[page.to_sym]
      end
      end
    end
  end
end

ActiveRecord.include(Page) if defined? Page
