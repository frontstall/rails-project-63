# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_has_default_attrs
    user = Struct.new :name, keyword_init: true
    form = HexletCode.form_for user
    assert { form == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_form_has_action
    user = Struct.new :name, keyword_init: true
    form = HexletCode.form_for user, url: "/users"
    assert { form == "<form action=\"/users\" method=\"post\"></form>" }
  end
end
