class EventValidator < ActiveModel::Validator
  def validate(record)
    validate_name(record)
    validate_date(record)
    validate_description(record)
    validate_value(record)
  end

  def validate_name(record)
    raise ApiExceptions::CreateEventError::MissingNameError.new unless record.name
  end

  def validate_date(record)
    raise ApiExceptions::CreateEventError::MissingDateError.new unless record.date
  end

  def validate_value(record)
    raise ApiExceptions::CreateEventError::MissingValueError.new unless record.value
  end

  def validate_description(record)
    raise ApiExceptions::CreateEventError::MissingDescriptionError.new unless record.description
  end
end
