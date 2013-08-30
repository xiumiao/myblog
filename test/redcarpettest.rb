# coding: utf-8

require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)


puts markdown.render("this is a *strong* text!\n www.bfb56.com <p style='color:red'>fddd </p>")
