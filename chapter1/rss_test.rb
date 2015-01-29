#-*- coding: utf-8 -*-
require "rss"

rss = RSS::Maker.make("2.0") do |maker|
  maker.channel.language = "ja"
  maker.channel.author = "kdtm"
  maker.channel.updated = Time.now.to_s