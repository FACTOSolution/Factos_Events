module ApiExceptions
  class CreateEventError < ApiExceptions::BaseException
    class MissingDescriptionError < ApiExceptions::CreateEventError
    end
  end
end
