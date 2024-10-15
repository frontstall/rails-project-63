# frozen_string_literal: true

require "test_helper"

class TestHexletCodeTag < Minitest::Test
  def test_single_tag_with_attibutes
    tag = ::HexletCode::Tag.build "img", src: "./img.png", alt: "lala"
    assert { tag == "<img src=\"./img.png\" alt=\"lala\">" }
  end

  def test_single_tag_without_attributes
    tag = ::HexletCode::Tag.build "hr"
    assert { tag == "<hr>" }
  end

  def test_paired_tag_with_attributes_and_content
    tag = ::HexletCode::Tag.build "h1", class: "margin-2" do
      "Header"
    end
    assert { tag == "<h1 class=\"margin-2\">Header</h1>" }
  end

  def test_paired_tag_without_content
    tag = ::HexletCode::Tag.build "span"
    assert { tag == "<span></span>" }
  end
end
