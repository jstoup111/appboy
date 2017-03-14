module Appboy
  module Endpoints
    module Triggered
      def triggered(**payload)
        triggered_service.new(app_group_id, payload).perform
      end

      def triggered_service
        Appboy::REST::Triggered
      end
    end
  end
end
