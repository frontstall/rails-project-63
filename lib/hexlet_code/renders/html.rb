# frozen_string_literal: true

module HexletCode
  module Renders
    # renders form to html
    class Html
      SINGLE_TAGS = %w[area base br col embed hr img input link meta param source track wbr].to_set

      def render(form)
        render_paired_tag(:form, form.attrs) do
          form.content.map { |field| render_field field }.join
        end
      end

      def textinput(attrs)
        default_attrs = { type: 'text' }
        label_text = attrs[:name].capitalize

        label = render_paired_tag(:label, for: attrs[:id]) { label_text }
        input = render_single_tag(:input, default_attrs.merge(attrs))

        label + input
      end

      def textarea(attrs)
        rest_attrs = attrs.except :value
        label_text = attrs[:name].capitalize

        textarea = render_paired_tag(:textarea, rest_attrs) { attrs[:value] }
        label = render_paired_tag(:label, for: attrs[:id]) { label_text }

        label + textarea
      end

      def submit(attrs)
        render_single_tag(:input, attrs)
      end

      private

      def render_field(field)
        public_send(field[:name], field[:attrs])
      end

      def build_attrs_string(attrs)
        attrs.to_a.sort.map { |key, value| " #{key}=\"#{value}\"" }.join
      end

      def render_single_tag(name, attrs = {})
        attrs_string = build_attrs_string(attrs)
        "<#{name}#{attrs_string}>"
      end

      def render_paired_tag(name, attrs = {})
        attrs_string = build_attrs_string(attrs)

        content = block_given? ? yield : ''

        "<#{name}#{attrs_string}>#{content}</#{name}>"
      end
    end
  end
end
