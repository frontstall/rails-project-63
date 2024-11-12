# frozen_string_literal: true

# core module
module HexletCode
  autoload :Inputs, 'hexlet_code/inputs/base'
  module Renders
    # renders form to html
    class Html
      include Tag

      def render(form)
        render_paired_tag(:form, form.attrs) do
          form.content.map { |field| render_field field }.join
        end
      end

      private

      def render_field(field)
        input_class = HexletCode::Inputs::HTML.const_get(field[:name].capitalize)
        input_class.new(field[:attrs]).render
      end
    end
  end
end
