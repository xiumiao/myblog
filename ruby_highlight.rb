require 'redcarpet'
require 'coderay'

module Redcarpet
  module Render
    class HTMLwithRuby < Redcarpet::Render::HTML

      def block_code(code, language)
        CodeRay.scan(code, language).div(:line_numbers => :table)
      end
    end
  end
end

