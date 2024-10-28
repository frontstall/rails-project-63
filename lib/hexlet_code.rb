# frozen_string_literal: true

require_relative "hexlet_code/version"

# building form utility
module HexletCode
  class Error < StandardError; end

  HexletCode.autoload :Tag, "./lib/hexlet_code/tag"
  HexletCode.autoload :Form, "./lib/hexlet_code/form"

  class << self
    def form_for(model, attrs = {})
      form = Form.new model, attrs
      yield form if block_given?
      form.to_s
    end
  end
end
