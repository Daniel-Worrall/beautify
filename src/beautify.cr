require "duktape/runtime"

module Beautify
  @@runtime : Runtime? = nil
  private FILES = [:js, :css, :html]

  {% for name in FILES %}
    private {{name.id.upcase}}_BEAUTIFY_JS   = \{{read_file("#{__DIR__}/../js-beautify/beautify-{{name.id}}.js")}}

    def self.{{name.id}}(data : String) : String
      @@runtime ||= Runtime.new
      runtime = @@runtime.not_nil!
      runtime.{{name.id}}(data)
    end
  {% end %}

  class Runtime
    @[Flags]
    private enum Initialised
      {% for name in FILES %}
        {{name.id.upcase}}
      {% end %}
    end

    @flags = Initialised::None

    @runtime = Duktape::Runtime.new do |sandbox|
      sandbox.eval!("global = {};") # Beautify assumes a global object to bind to.
    end

    {% for name in FILES %}
      def {{name.id}}(data : String) : String
        unless @flags.{{name.id}}?
          @runtime.exec({{name.id.upcase}}_BEAUTIFY_JS)
          @flags |= Initialised::{{name.id.upcase}}
        end
        @runtime.call("global.{{name.id}}_beautify", data).as(String)
      end
    {% end %}
  end
end
