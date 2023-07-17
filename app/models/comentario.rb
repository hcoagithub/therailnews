class Comentario < ApplicationRecord
    belongs_to :user
    belongs_to :notice

    validates :contenido, presence: true
    
end
