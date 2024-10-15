# frozen_string_literal: true

module HexletCode
  # building tags
  module Tag
    SINGLE_TAGS = %w[area base br col embed hr img input link meta param source track wbr].to_set

    class << self
      def build(name, attrs = {})
        if SINGLE_TAGS.include?(name.downcase)
          build_single_tag(name, attrs)
        else
          content = block_given? ? yield : ""
          build_paired_tag(name, content, attrs)
        end
      end

      private

      def build_attrs_string(attrs)
        attrs.to_a.map { |key, value| " #{key}=\"#{value}\"" }.join
      end

      def build_single_tag(name, attrs = {})
        attrs_string = build_attrs_string(attrs)
        "<#{name}#{attrs_string}>"
      end

      def build_paired_tag(name, content, attrs = {})
        attrs_string = build_attrs_string(attrs)
        "<#{name}#{attrs_string}>#{content}</#{name}>"
      end
    end
  end
end
