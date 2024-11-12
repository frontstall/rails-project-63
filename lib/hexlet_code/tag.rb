# frozen_string_literal: true

module HexletCode
  # renders html tags
  module Tag
    SINGLE_TAGS = %w[area base br col embed hr img input link meta param source track wbr].to_set

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
