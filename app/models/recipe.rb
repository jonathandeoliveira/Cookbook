class Recipe < ApplicationRecord
  enum status: {rascunho:0,publicada: 2}
  belongs_to :recipe_type
end
