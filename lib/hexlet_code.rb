# frozen_string_literal: true

require_relative 'hexlet_code/version'

# building form utility
module HexletCode
  HexletCode.autoload :Form, 'hexlet_code/form'
  HexletCode.autoload :Renders, 'hexlet_code/renders/html'

  class << self
    def form_for(model, attrs = {})
      form = HexletCode::Form.new model, attrs
      yield form if block_given?
      HexletCode::Renders::Html.new.render form
    end
  end
end
