# frozen_string_literal: true

module FormCrmSubmission
  extend ActiveSupport::Concern
  included do
    helper_method def record_form_submission(object)
      FormCrmService.new(
        object,
        [request.protocol, request.host].join,
        cookies[:cuvid]
      ).call
    end
  end
end
