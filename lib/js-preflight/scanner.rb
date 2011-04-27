module Js
  module Preflight
    class Scanner
      class << self
        def scan(file, options = {})
          exclude_paths = options[:exclude_paths] || []
          file = File.open(file, "r") unless file.kind_of?(File)
          while line = file.gets do
            line.scan(::Js::Preflight::JsRegexp).each do |js_file|
              yield js_file[0] unless exclude_paths.any? { |p| js_file[0].match(p) }
            end
          end
        end
      end      
    end
  end
end