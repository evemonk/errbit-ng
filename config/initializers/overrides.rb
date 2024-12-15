# frozen_string_literal: true

require Rails.root.join("lib/hoptoad_notifier")

class BSON::ObjectId
  def as_json(*_args)
    to_s
  end
end
