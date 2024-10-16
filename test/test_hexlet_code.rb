# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_has_default_attrs
    Struct.new "User", :name, keyword_init: true
    user = Struct::User.new name: "Vasyan"

    form = HexletCode.form_for user
    assert { form == "<form action=\"#\" method=\"post\"></form>" }
  end

  def test_form_has_action
    Struct.new "User", :name, keyword_init: true
    user = Struct::User.new name: "Vasyan"

    form = HexletCode.form_for user, url: "/users"
    assert { form == "<form action=\"/users\" method=\"post\"></form>" }
  end

  def test_creating_form_fields
    Struct.new "User", :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: "Vasjan", job: "Hexlet", gender: "male"

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { form == " " }
  end

  def test_creating_form_fields_with_attrs
    Struct.new "User", :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: "Vasjan", job: "Hexlet", gender: "male"

    form = HexletCode.form_for user do |f|
      f.input :name, class: "user-input"
    end

    assert { form == " " }
  end

  def test_creating_form_fields_with_default_attrs
    Struct.new "User", :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: "Vasjan", job: "Hexlet", gender: "male"

    form = HexletCode.form_for user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert { form == " " }
  end

  def test_missing_prop_raises_error
    Struct.new "User", :name, :job, :gender, keyword_init: true
    user = Struct::User.new

    assert_raises(NoMethodError, "undefined method `age' for #<struct User id=nil, name=nil, job=nil>") do
      HexletCode.form_for user do |f|
        f.input :age
      end
    end
  end
end
