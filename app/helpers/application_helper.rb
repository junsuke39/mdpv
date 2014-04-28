module ApplicationHelper

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      lang, filename = parse_language(language)
      html = CodeRay.scan(code, lang).div
      html = inject_filename_div(html, filename) if filename.present?
      html
    end

    private

    def parse_language(language)
      if language =~ /\A(.*?):(.*)\z/
        language, filename = $1, $2
      end
      unless language =~ /\A[a-zA-Z0-9_]*\z/
        language = '' 
      end
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when ''
        lang = 'md'
      else
        lang = language
      end
      return lang, filename
    end

    ROOT_DIV = '<div class="CodeRay">'
    
    def inject_filename_div(html, filename)
      html.gsub(ROOT_DIV, "#{ROOT_DIV}<div class=\"filename\">#{ERB::Util.html_escape(filename)}</div>")
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true,
      strikethrough: true,
    }
    markdown    = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
