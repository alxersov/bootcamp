module AdminPanel
  class Shipping < ActiveRecord::Base
    attr_accessible :text, :title

    validates :title, presence: true,
      uniqueness: {case_sensitive: false,
        message: "Title \"%{value}\" already exists."},
      length: { minimum: 4, maximum: 120}

    validates :title, presence: true
  end
end
