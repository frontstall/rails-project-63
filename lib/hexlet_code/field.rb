# frozen_string_literal: true

# building form fields
module Field
  def input(name, attrs = {})
    rest_attrs = attrs.except :as
    rest_attrs[:name] = name

    field = build_tag attrs[:as] || :textinput, @model.send(name), rest_attrs
    @content << field
  end

  def build_tag(name, value, attrs)
    case name
    when :text
      textarea value, attrs
    when :textinput
      textinput value, attrs
    else
      raise "Unknown method name"
    end
  end

  def textarea(value, attrs)
    attrs[:cols] ||= 20
    attrs[:rows] ||= 40
    HexletCode::Tag.build "textarea", attrs do
      value
    end
  end

  def textinput(value, attrs)
    HexletCode::Tag.build "input", attrs.merge(type: "text", value:)
  end
end
