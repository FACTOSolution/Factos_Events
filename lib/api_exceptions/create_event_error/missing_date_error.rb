module ApiExceptions
  class CreateEventError < ApiExceptions::BaseException
    class MissingDateError < ApiExceptions::CreateEventError
    end
  end
end
