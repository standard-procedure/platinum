# frozen_string_literal: true

class Platinum::FormWith < Platinum::Base
  include Phlex::Rails::Helpers::FormWith

  def initialize title = nil, **form_params
    @title = title
    @form_params = form_params
    @model = @form_params[:model]
  end

  def view_template(&contents)
    form_with(**@form_params) do |form|
      Column gap: 1, class: theme.form do
        contents.call(form)
        draw_alert if model_has_errors?
      end
    end
  end

  private def model_has_errors? = @model.present? && @model.errors.any?

  private def draw_alert = Alert(:warning, title: @model.errors.full_messages.to_sentence)
end
