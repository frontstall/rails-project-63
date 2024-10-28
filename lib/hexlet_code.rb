# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload :Tag, "hexlet_code/tag"
autoload :Form, "hexlet_code/form"

# building form utility
module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(model, attrs = {})
      form = Form.new model, attrs
      yield form if block_given?
      form.to_html
    end
  end
end
