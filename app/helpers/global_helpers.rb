module Merb

  module GlobalHelpers

    @@views = {
      :jquery => [
        "core",
        "json",
        "metadata",
        "ui",
        "form",
        "templater",
        "autocomplete",
        "cookie",
        "history",
        "cookiejar",
        "servercookiejar"
      ],
      :app => [
        "master",
        "public"
      ]
    }

    # helpers defined here available to all views.  
    def javascripts_for(view = :default)
      @@views[view].collect do |file|
        "<script type=\"text/javascript\" src=\"/javascripts/#{view}/#{file}.js\"></script>"
      end.join("\n")
    end

    def templates_for(*namespaces)
      namespaces.to_a.collect do |namespace|
        Dir["#{Merb.root}/app/views/#{namespace}/*.jqt"].map { |file| File.read(file) }.join("\n")
      end.join("\n")
    end
    
    # allows us to load up the layout with some pseduo-constant data, like queues, ticket statuses, etc...
    def buffer_js_for(*buffers)
      buffers.to_a.inject('') do |output,buffer|
        output << "<script type=\"text/javascript\" >"
        output << "$.app['#{buffer.to_s}'] = #{instance_variable_get(('@'+buffer.to_s))}"
        output << "</script>\n"
        output
      end
    end
  end

end
