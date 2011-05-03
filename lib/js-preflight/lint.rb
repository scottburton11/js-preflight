module Js
  module Preflight
    class Lint
      attr_reader :filename, :executable_path
      def initialize(filename, options = {})
        @filename = filename
        @executable_path = options[:executable_path] || File.join(::Js::Preflight::Basedir, "bin")
      end

      def errors
        @errors ||= lint
      end

      def clean?
        errors == "jslint: No problems found."
      end

      def self.build(files)
        files.each do |file|
          lint = Lint.new(file)
          yield lint unless lint.clean?
        end
      end

      private

      def lint
        unless `which js`.empty?
          `js -f #{executable_path}/jslint < #{filename}`
        else
          "No js interpreter found; consider installing Spidermonkey"
        end
      end  
    end
  end
end