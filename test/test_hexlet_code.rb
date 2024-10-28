# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def load_fixture(filename)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', filename)).strip
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_has_default_attrs
    Struct.new 'User', :name, keyword_init: true
    user = Struct::User.new name: 'Vasyan'
    expected = load_fixture 'form_with_default_attrs.txt'

    form = HexletCode.form_for user
    assert { form == expected }
  end

  def test_form_has_action
    Struct.new 'User', :name, keyword_init: true
    user = Struct::User.new name: 'Vasyan'
    expected = load_fixture 'form_with_action.txt'

    form = HexletCode.form_for user, url: '/users'
    assert { form == expected }
  end

  def test_creating_form_fields
    Struct.new 'User', :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: 'Vasyan', job: 'Hexlet', gender: 'male'
    expected = load_fixture 'form_with_fields.txt'

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { form == expected }
  end

  def test_creating_form_fields_with_attrs
    Struct.new 'User', :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: 'Vasyan', job: 'Hexlet', gender: 'male'
    expected = load_fixture 'form_with_fields_with_attrs.txt'

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit 'Custom submit text'
    end

    assert { form == expected }
  end

  def test_creating_form_fields_with_default_attrs
    Struct.new 'User', :name, :job, :gender, keyword_init: true
    user = Struct::User.new name: 'Vasyan', job: 'Hexlet', gender: 'male'
    expected = load_fixture 'form_with_fields_with_default_attrs.txt'

    form = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end

    assert { form == expected }
  end

  def test_missing_prop_raises_error
    Struct.new 'User', :name, :job, :gender, keyword_init: true
    user = Struct::User.new

    assert_raises(NoMethodError, "undefined method `age' for #<struct User id=nil, name=nil, job=nil>") do
      HexletCode.form_for user do |f|
        f.input :age
      end
    end
  end
end
