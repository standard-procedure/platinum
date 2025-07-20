# frozen_string_literal: true

class Platinum::BackLink < Platinum::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize url: nil, icon: nil, text: nil, turbo_frame: "_top", **attributes
    @url = url
    @icon = icon || "back"
    @text = text
    @turbo_frame = turbo_frame
    @attributes = mix(class: [theme.link, attributes.delete(:class)], data: {turbo_frame: @turbo_frame}, **attributes)
  end

  def view_template(&) = @url.nil? ? back_link : url_link

  def back_link
    link_to :back, **@attributes do
      Icon(@icon, text: @text)
    end
  end

  def url_link
    a href: @url, **@attributes do
      Icon(@icon, text: @text)
    end
  end
end
