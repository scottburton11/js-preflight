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
          yield lint.errors unless lint.clean?
        end
      end

      private

      def lint
        `js -f #{executable_path}/jslint < #{filename}`
      end  
    end
  end
end