# frozen_string_literal: true

module HexletCode
  module Inputs
    module HTML
      # renders label to html
      class Label
        include Tag

        def initialize(attrs)
          @attrs = attrs
        end

        def render(&)
          render_paired_tag(:label, for: @attrs[:id], &)
        end
      end
    end
  end
end
