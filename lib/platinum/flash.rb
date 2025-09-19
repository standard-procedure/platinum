# frozen_string_literal: true

class Platinum::Flash < Platinum::Base
  include Phlex::Rails::Helpers::Flash

  def view_template(&)
    keys.each do |key|
      Alert(key, title: flash[key].to_s)
    end
  end

  def keys = Alert::ICONS.keys.select { |key| flash[key.to_sym].present? }
end
