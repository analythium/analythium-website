#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "date"
require "digest"
require "fileutils"
require "net/http"
require "rexml/document"
require "rexml/xpath"
require "uri"
require "yaml"

RSS_URL = "https://blog.analythium.io/rss/"
ROOT = File.expand_path("..", __dir__)
POSTS_DIR = File.join(ROOT, "_posts")
IMAGES_DIR = File.join(ROOT, "assets", "images", "blog")
SPAM_HOSTS = %w[
  1win-argentina-official.live
  1winkenya.top
  atlantis-megaways.com
  bajicasino.live
  betika-official.club
  betika-official.lol
  mmc-plus.ru
  spinorhinocasino-nederland.biz
].freeze

def fetch(url)
  uri = URI(url)
  response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
    http.get(uri.request_uri, "User-Agent" => "Analythium blog importer")
  end
  raise "Could not download #{url}: #{response.code}" unless response.is_a?(Net::HTTPSuccess)

  response.body
end

def remove_spam_links(html)
  html.gsub(/<a\b[^>]*\bhref=(['"])(.*?)\1[^>]*>.*?<\/a>/im) do |link|
    host = URI(CGI.unescapeHTML(Regexp.last_match(2))).host
    SPAM_HOSTS.include?(host) ? "" : link
  rescue URI::InvalidURIError
    link
  end
end

def local_image(url, slug, images)
  return images[url] if images.key?(url)

  uri = URI(CGI.unescapeHTML(url))
  extension = File.extname(uri.path).downcase
  extension = ".jpg" unless %w[.avif .gif .ico .jpeg .jpg .png .svg .webp].include?(extension)
  filename = "#{slug}-#{images.length + 1}-#{Digest::SHA256.hexdigest(url)[0, 8]}#{extension}"
  destination = File.join(IMAGES_DIR, filename)
  File.binwrite(destination, fetch(uri.to_s)) unless File.exist?(destination)

  images[url] = "/assets/images/blog/#{filename}"
rescue StandardError => error
  warn "Keeping unavailable image URL #{url}: #{error.message}"
  images[url] = url
end

def localize_images(html, slug)
  images = {}
  html = html.gsub(/\s+(?:srcset|sizes)=(['"]).*?\1/im, "")
  html.gsub(/(<img\b[^>]*\bsrc=)(['"])(.*?)\2/i) do
    "#{Regexp.last_match(1)}#{Regexp.last_match(2)}#{local_image(Regexp.last_match(3), slug, images)}#{Regexp.last_match(2)}"
  end
end

def front_matter(post)
  YAML.dump(post).sub(/\A---\n/, "").prepend("---\n").concat("---\n\n")
end

FileUtils.mkdir_p([POSTS_DIR, IMAGES_DIR])
xml = REXML::Document.new(fetch(RSS_URL))

REXML::XPath.each(xml, "//item") do |item|
  title = item.elements["title"].text
  source_url = item.elements["link"].text
  slug = URI(source_url).path.split("/").reject(&:empty?).last
  date = DateTime.rfc2822(item.elements["pubDate"].text)
  content = item.elements["content:encoded"].text
  thumbnail = item.elements["media:content"]&.attributes&.fetch("url", nil)&.value
  images = {}

  content = remove_spam_links(content)
  content = localize_images(content, slug)
  thumbnail = local_image(thumbnail, slug, images) if thumbnail

  post = {
    "layout" => "post",
    "title" => title,
    "date" => date.strftime("%Y-%m-%d %H:%M:%S %z"),
    "author" => item.elements["dc:creator"].text,
    "thumbnail" => thumbnail,
    "thumbnail_alt" => title,
    "tags" => item.elements.to_a("category").map(&:text),
    "source" => source_url
  }

  filename = "#{date.strftime("%Y-%m-%d")}-#{slug}.md"
  File.write(File.join(POSTS_DIR, filename), front_matter(post) + content.strip + "\n")
  puts "Imported #{filename}"
end