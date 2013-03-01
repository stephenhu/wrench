require "colorize"
require "erb"
require "open3"
require "open-uri"
require "thor"
require "yaml"
require "zip/zip"

require File.join( File.dirname(__FILE__), "wrench", "cli" )
require File.join( File.dirname(__FILE__), "wrench", "version" )

module Wrench

  ASSETS        = "assets"
  NAME          = "name"
  DIRECTORIES   = "directories"
  FILES         = "files"
  DESTINATION   = "destination"
  TEMPLATE      = "template"
  TEMPLATES     = "templates"
  MAINRB        = "main.rb"

end

