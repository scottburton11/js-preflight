module Js
  module Preflight
    class Pack
      attr_reader :filename, :executable_path
      def initialize(filename, options = {})
        @filename = filename
        @executable_path = options[:executable_path] || File.join(::Js::Preflight::Basedir, "bin")
      end

      def packed
        @pack ||= pack
      end

      def self.build(files)
        files.each do |file|
          yield Pack.new(file).packed
        end
      end

      private

      def pack
        `#{executable_path}/jsmin < #{filename}`
      end
    end
  end
end