# frozen_string_literal: true

module HexletCode
  # creating forms from data
  class Form
    attr_accessor :attrs, :content

    def initialize(model, attrs)
      @model = model
      @attrs = attrs.except :url
      @attrs[:action] = attrs.fetch(:url, '#')
      @attrs[:method] ||= 'post'
      @content = []
    end

    def input(name, attrs = {})
      rest_attrs = attrs.except :as

      as = attrs.fetch(:as, :textinput)
      value = @model.public_send name
      rest_attrs[:value] = value
      rest_attrs[:name] = name

      field = public_send(as, rest_attrs)

      @content << field
    end

    def text(attrs)
      { name: :textarea, attrs: }
    end

    def textinput(attrs)
      { name: :textinput, attrs: }
    end

    def submit(text = 'Save', attrs = {})
      attrs[:type] = 'submit'
      attrs[:value] = text

      @content << { name: :submit, attrs: }
    end
  end
end
