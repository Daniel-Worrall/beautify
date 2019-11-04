require "duktape/runtime"

module Beautify
  {% for name in ["js", "css", "html"] %}
    {{name.id.upcase}}_BEAUTIFY_JS   = \{{read_file("#{__DIR__}/../js-beautify/beautify-{{name.id}}.js")}}

    def self.init_{{name.id}}_runtime : Duktape::Runtime
      runtime = Duktape::Runtime.new do |sandbox|
        sandbox.eval!("global = {};") # Beautify assumes a global object to bind to.
        sandbox.eval!({{name.id.upcase}}_BEAUTIFY_JS)
      end
      runtime
    end

    @@{{name.id}}_rt : Duktape::Runtime? = nil

    def self.{{name.id}}(data : String) : String
      @@{{name.id}}_rt ||= init_{{name.id}}_runtime
      {{name.id}}_rt = @@{{name.id}}_rt.not_nil!
      {{name.id}}_rt.call("global.{{name.id}}_beautify", data).as(String)
    end
  {% end %}
end
