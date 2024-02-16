class Doc < ApplicationRecord
    belongs_to :user
    before_save :Normalize_value
    validates :title, uniqueness: true, presence: true, length: {minimum:3, message:"is too Short",maximum:20,message:"is too Long!!"}
    validates :content, presence: true, uniqueness: true, length: {minimum:50,message:" is too Short"}
    def Normalize_value
        self.title = title.capitalize
        self.content=content.capitalize
    end
end