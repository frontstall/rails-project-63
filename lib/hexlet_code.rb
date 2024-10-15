# frozen_string_literal: true

require_relative "hexlet_code/version"

# building form utility
module HexletCode
  class Error < StandardError; end

  HexletCode.autoload :Tag, "./lib/hexlet_code/tag"

  class << self
    def form_for(_entity, attrs = {})
      action = attrs[:url]
      action ||= "#"
      method = attrs[:method]
      method ||= "post"
      self::Tag.build "form", action:, method:
    end
  end
end
