class IndexController < ApplicationController
  protect_from_forgery except: :preview
  layout false, only: :preview

  SAMPLE_TEXT = File.read("#{Rails.root.to_s}/lib/sample.md")
  CSS = File.read("#{Rails.root.to_s}/lib/style.css")

  def index
    @text = SAMPLE_TEXT
  end

  def preview
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "POST"
  end

  def style
    container = params[:container] || ".markdown"
    css = CSS.gsub("$$$", container.blank? ? "" : "#{container} ")
    response.headers['Content-Type'] = 'text/css; charset=utf-8'
    render text: css
  end

  def download
    zip_name = "mdpv.zip"
    zip_path = "#{Rails.root}/tmp/#{zip_name}"
    unless File.exists?(zip_path)
      require 'zip'
      Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
        %w(mdpv.html sample.md).each do |content|
          zipfile.add(content, "#{Rails.root}/lib/#{content}")
        end
      end
    end
    send_file zip_path, :type => 'application/zip', :filename => zip_name
  end

end
