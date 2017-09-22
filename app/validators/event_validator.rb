class EventValidator < ActiveModel::Validator
  def validate(record)
    validate_name(record)
  end

  def validate_name(record)
    raise ApiExceptions::CreateEventError::MissingNameError.new unless record.name
  end
end
