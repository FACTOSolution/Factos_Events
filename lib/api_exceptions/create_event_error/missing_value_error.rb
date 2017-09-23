module ApiExceptions
  class CreateEventError < ApiExceptions::BaseException
    class MissingValueError < ApiExceptions::CreateEventError
    end
  end
end
