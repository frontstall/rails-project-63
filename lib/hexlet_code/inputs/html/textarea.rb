# frozen_string_literal: true

module HexletCode
  module Inputs
    module HTML
      # renders textarea to html
      class Textarea
        include Tag

        def initialize(attrs)
          id = attrs.fetch(:id, attrs[:name])
          default_attrs = { cols: 20, rows: 40, id: }
          @attrs = default_attrs.merge(attrs)
        end

        def render
          textarea_attrs = @attrs.except(:value)
          label_text = @attrs[:name].capitalize
          input = render_paired_tag(:textarea, textarea_attrs) { @attrs[:value] }
          label_str = HexletCode::Inputs::HTML::Label.new({ id: @attrs[:id] }).render { label_text }

          label_str + input
        end
      end
    end
  end
end
