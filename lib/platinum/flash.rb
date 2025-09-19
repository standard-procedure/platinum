# frozen_string_literal: true

class Platinum::Flash < Platinum::Base
  include Phlex::Rails::Helpers::Flash

  def view_template(&)
    span { flash[:alert].to_s }
    span { flash[:notice].to_s }

    Column do
      keys.each do |key|
        Alert(key, text: flash[key].to_s) if flash[key].present?
      end
    end
  end

  def keys = Alert::ICONS.keys
end
