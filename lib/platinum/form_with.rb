# frozen_string_literal: true

class Platinum::FormWith < Platinum::Base
  include Phlex::Rails::Helpers::FormWith

  def initialize title = nil, **form_params
    @title = title
    @form_params = form_params
  end

  def view_template(&contents)
    card.title { @title.to_s } unless @title.nil?

    form_with(**@form_params) do |form|
      Column gap: 1, class: "p-1" do
        contents.call(form)
      end
    end
  end
end
