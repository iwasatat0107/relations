class Empathy < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '非常に悪い' },
    { id: 2, name: '悪い' },
    { id: 3, name: '普通' },
    { id: 4, name: '良い' },
    { id: 5, name: '非常に良い' }
  ]

  include ActiveHash::Associations
  has_many :checks
end
