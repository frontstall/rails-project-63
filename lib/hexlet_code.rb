# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  HexletCode.autoload :Tag, "./lib/hexlet_code/tag"
end
