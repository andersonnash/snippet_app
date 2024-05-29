require 'redcarpet'
require 'pygments'

class HTMLWithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

MARKDOWN = Redcarpet::Markdown.new(HTMLWithPygments, fenced_code_blocks: true, autolink: true)
