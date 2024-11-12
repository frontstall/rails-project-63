# frozen_string_literal: true

module HexletCode
  module Inputs
    module HTML
      # renders submit to html
      class Submit
        include Tag

        def initialize(attrs)
          @attrs = attrs
        end

        def render
          render_single_tag(:input, @attrs)
        end
      end
    end
  end
end
