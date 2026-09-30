#!/usr/bin/env ruby
# frozen_string_literal: true

require "nokogiri"
require "open3"
require "cgi"
require "uri"

ROOT = File.expand_path("..", __dir__)
POSTS = File.join(ROOT, "_posts", "*.md")
PLACEHOLDER_HOST = "https://liquid-url.invalid"

def split_front_matter(content)
  _, front_matter, body = content.split(/^---\s*$\n?/, 3)
  raise "Expected front matter" unless front_matter && body

  [front_matter, body]
end

def markdown_from_html(html)
  document = Nokogiri::HTML::DocumentFragment.parse(html)

  document.css("figure").each do |figure|
    image = figure.at_css("img")
    caption = figure.at_css("figcaption")
    replacement = image ? image.to_html : ""
    replacement += "<p><em>#{caption.inner_html}</em></p>" if caption
    figure.replace(replacement)
  end

  liquid_urls = {}
  document.css("[src], [href]").each do |node|
    %w[src href].each do |attribute|
      value = node[attribute]
      next unless value&.include?("{{")

      token = "#{PLACEHOLDER_HOST}/#{liquid_urls.length}"
      liquid_urls[token] = value
      node[attribute] = token
    end
  end

  markdown, error, status = Open3.capture3(
    "pandoc", "--from=html", "--to=gfm+raw_html", "--wrap=none",
    stdin_data: document.to_html
  )
  raise error unless status.success?

  liquid_urls.each { |token, value| markdown.gsub!(token, value) }
  normalize_images(markdown)
end

def normalize_images(markdown)
  markdown.gsub(/<img\b[^>]*>/i) do |html_image|
    image = Nokogiri::HTML::DocumentFragment.parse(html_image).at_css("img")
    source = URI.decode_www_form_component(CGI.unescapeHTML(image["src"]))
    alt = image["alt"].to_s
    "![#{alt}](#{source})"
  end
end

Dir.glob(POSTS).sort.each do |path|
  content = File.read(path)
  next unless content.include?("source: https://blog.analythium.io/")

  front_matter, body = split_front_matter(content)
  body = ARGV.include?("--normalize") ? normalize_images(body) : markdown_from_html(body)
  File.write(path, "---\n#{front_matter}---\n#{body}")
  puts "Converted #{File.basename(path)}"
end