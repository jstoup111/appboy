module Appboy
  module REST
    class SendMessages < Base
      attr_reader :app_group_id, :messages, :external_user_ids, :segment_id,
                  :override_frequency_capping, :recipient_subscription_state

      def initialize(app_group_id, messages: [], external_user_ids: [], segment_id: nil, override_frequency_capping: true, recipient_subscription_state: 'all')
        @app_group_id                 = app_group_id
        @messages                     = messages
        @external_user_ids            = external_user_ids
        @segment_id                   = segment_id
        @override_frequency_capping   = override_frequency_capping
        @recipient_subscription_state = recipient_subscription_state
      end

      def perform
        http.post '/messages/send', {
          app_group_id:                 app_group_id,
          messages:                     messages,
          external_user_ids:            external_user_ids,
          segment_id:                   segment_id,
          override_frequency_capping:   override_frequency_capping,
          recipient_subscription_state: recipient_subscription_state
        }
      end
    end
  end
end
