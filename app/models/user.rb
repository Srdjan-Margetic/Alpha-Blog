class User < ApplicationRecord
  validates: :username, presence: true, 
                        uniqueness: {case_sensitive: false}, 
                        lenght{ minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates: :email, presence: true, 
                      uniqueness: {case_sensitive: false},
                      lenght{ maximum: 105 },
                      format: { VALID_EMAIL_REGEX }

end