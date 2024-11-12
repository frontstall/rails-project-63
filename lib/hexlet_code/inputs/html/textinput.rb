# frozen_string_literal: true

module HexletCode
  module Inputs
    module HTML
      # renders text input to html
      class Textinput
        include Tag

        def initialize(attrs)
          id = attrs.fetch(:id, attrs[:name])
          default_attrs = { type: 'text', id: }
          @attrs = default_attrs.merge(attrs)
        end

        def render
          label_text = @attrs[:name].capitalize
          input = render_single_tag(:input, @attrs)
          label_str = HexletCode::Inputs::HTML::Label.new({ id: @attrs[:id] }).render { label_text }

          label_str + input
        end
      end
    end
  end
end
