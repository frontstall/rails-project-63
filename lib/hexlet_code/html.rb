# frozen_string_literal: true

# renders tag to html
module Html
  SINGLE_TAGS = %w[area base br col embed hr img input link meta param source track wbr].to_set

  def to_html
    if SINGLE_TAGS.include?(@name.downcase)
      build_single_tag(@name, @attrs)
    else
      build_paired_tag(@name, @attrs)
    end
  end

  private

  def build_children
    return '' if @children.nil?

    return @children.to_s unless @children.instance_of? Array

    children = @children.map do |child|
      child.respond_to?(:to_html) ? child.to_html : child.to_s
    end

    children.join
  end

  def build_attrs_string(attrs)
    attrs.to_a.sort.map { |key, value| " #{key}=\"#{value}\"" }.join
  end

  def build_single_tag(name, attrs = {})
    attrs_string = build_attrs_string(attrs)
    "<#{name}#{attrs_string}>"
  end

  def build_paired_tag(name, attrs = {})
    attrs_string = build_attrs_string(attrs)
    "<#{name}#{attrs_string}>#{build_children}</#{name}>"
  end
end
