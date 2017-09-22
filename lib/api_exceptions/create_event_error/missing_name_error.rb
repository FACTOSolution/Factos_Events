module ApiExceptions
  class CreateEventError < ApiExceptions::BaseException
    class MissingNameError < ApiExceptions::CreateEventError
    end
  end
end
