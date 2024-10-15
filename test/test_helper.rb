# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov"
SimpleCov.start

require "hexlet_code"

require "minitest/autorun"
require "minitest/power_assert"
