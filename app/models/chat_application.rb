class ChatApplication < ApplicationRecord  
  has_secure_token 
  has_many :chats, dependent: :destroy
  validates :name, presence: true

  swagger_schema :create_chat_application do
    key :required, [:name]
    property :name do
      key :type, :string
    end
    property :token do
      key :type, :string
    end
    property :chats_count do
      key :type, :integer
    end
  end

  swagger_schema :update_chat_application do
    property :name do
      key :type, :string
    end
    property :token do
      key :type, :string
    end
    property :chats_count do
      key :type, :integer
    end
    property :number do
      key :type, :integer
    end
  end

  def as_json(options = nil)
    super(except: :id)
  end

end
