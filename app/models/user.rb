class User < ApplicationRecord
    has_and_belongs_to_many(:friends,
        :join_table => "friends",
        :foreign_key => "user_a_id",
        :association_foreign_key => "user_b_id")
end
