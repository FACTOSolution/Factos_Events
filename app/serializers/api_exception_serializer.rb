class ApiExceptionSerilizer < ActiveModel::Serializer
  attributes :status, :code, :message
end
