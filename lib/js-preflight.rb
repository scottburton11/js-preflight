$:.unshift("./lib")
require 'js-preflight/lint'
require 'js-preflight/pack'
require 'js-preflight/scanner'
require 'js-preflight/version'

module Js
  module Preflight
    JsRegexp =  %r|src=\"(.+\.js)\"|
    CSSRegexp = %r|href=\"(.+\.css)\"|
    Basedir  = File.expand_path(File.join(__FILE__, "..", ".."))
  end
end
