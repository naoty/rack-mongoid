module Rack
  class Mongoid
    module Controllers
      class ShowController < SingleResourceController
        private

        def response_status
          if resource
            200
          else
            404
          end
        end

        def response_body
          if resource
            JSON.pretty_generate(resource) + "\n"
          else
            response_body_for_not_found
          end
        end
      end
    end
  end
end
