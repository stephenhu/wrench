require "colorize"
require "erb"
require "thor"
require "yaml"

require File.join( File.dirname(__FILE__), "wrench", "cli" )
require File.join( File.dirname(__FILE__), "wrench", "version" )

module Wrench

  ASSETS        = "assets"
  NAME          = "name"
  DIRECTORIES   = "directories"
  FILES         = "xfiles"

end

