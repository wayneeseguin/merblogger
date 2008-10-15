module Merb

  module GlobalHelpers
    
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    
    @@config = {
      :javascripts => {
          :jquery => [
            "core", "json", "metadata", "ui", "form", "templater",
            "autocomplete", "cookie", "history", "cookiejar", "servercookiejar"
          ],
          :lib => [:inheritance],
          :app => [:master,:public,:entities],
          :user => [:user],
          :admin => [:admin]
        }
    }
    
    # helpers defined here available to all views.  
    def javascripts_for(*namespaces)
      namespaces.to_a.map do |namespace|
        @@config[:javascripts][namespace].to_a.map do |file|
          "<script type=\"text/javascript\" src=\"/javascripts/#{namespace}/#{file}.js\"></script>"
        end.join("\n")
      end.join("\n")
    end

    def templates_for(*namespaces)
      namespaces.to_a.map do |namespace|
        File.read("#{Merb.root}/app/views/#{namespace}/#{namespace}#{current_user ? '*' : ''}.jqt")
      end.join
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
