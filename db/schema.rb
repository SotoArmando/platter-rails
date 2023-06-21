# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_17_215759) do
  create_table "blogs", force: :cascade do |t|
    t.integer "session_id", null: false
    t.string "title"
    t.string "introduction"
    t.string "unbounded"
    t.integer "remotefile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remotefile_id"], name: "index_blogs_on_remotefile_id"
    t.index ["session_id"], name: "index_blogs_on_session_id"
  end

  create_table "blogs_remotefiles", id: false, force: :cascade do |t|
    t.integer "blog_id", null: false
    t.integer "remotefile_id", null: false
    t.index ["blog_id"], name: "index_blogs_remotefiles_on_blog_id"
    t.index ["remotefile_id"], name: "index_blogs_remotefiles_on_remotefile_id"
  end

  create_table "blogs_tags", id: false, force: :cascade do |t|
    t.integer "blog_id", null: false
    t.integer "tag_id", null: false
    t.index ["blog_id"], name: "index_blogs_tags_on_blog_id"
    t.index ["tag_id"], name: "index_blogs_tags_on_tag_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "recipe_id", null: false
    t.index ["category_id"], name: "index_categories_recipes_on_category_id"
    t.index ["recipe_id"], name: "index_categories_recipes_on_recipe_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "user_a_id", null: false
    t.integer "user_b_id", null: false
    t.index ["user_a_id", "user_b_id"], name: "index_friends_on_user_a_id_and_user_b_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "historiable_type"
    t.bigint "historiable_id"
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["historiable_id", "historiable_type"], name: "index_histories_on_historiable_id_and_historiable_type"
    t.index ["session_id"], name: "index_histories_on_session_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "recipe_id", null: false
    t.index ["ingredient_id"], name: "index_ingredients_recipes_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredients_recipes_on_recipe_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_instructions_on_recipe_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_libraries_on_session_id"
  end

  create_table "libraries_recipes", id: false, force: :cascade do |t|
    t.integer "library_id", null: false
    t.integer "recipe_id", null: false
    t.index ["library_id"], name: "index_libraries_recipes_on_library_id"
    t.index ["recipe_id"], name: "index_libraries_recipes_on_recipe_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_profiles_on_session_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "session_id", null: false
    t.string "title"
    t.string "introduction"
    t.string "unbounded"
    t.integer "remotefile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["remotefile_id"], name: "index_recipes_on_remotefile_id"
    t.index ["session_id"], name: "index_recipes_on_session_id"
  end

  create_table "recipes_remotefiles", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "remotefile_id", null: false
    t.index ["recipe_id"], name: "index_recipes_remotefiles_on_recipe_id"
    t.index ["remotefile_id"], name: "index_recipes_remotefiles_on_remotefile_id"
  end

  create_table "recipes_todos", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "todo_id", null: false
    t.index ["recipe_id"], name: "index_recipes_todos_on_recipe_id"
    t.index ["todo_id"], name: "index_recipes_todos_on_todo_id"
  end

  create_table "remotefiles", force: :cascade do |t|
    t.string "filename"
    t.string "awsbucked_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_states_on_session_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "statusable_type"
    t.bigint "statusable_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statusable_id", "statusable_type"], name: "index_statuses_on_statusable_id_and_statusable_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_todos_on_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firebase_identifier"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blogs", "remotefiles"
  add_foreign_key "blogs", "sessions"
  add_foreign_key "histories", "sessions"
  add_foreign_key "instructions", "recipes"
  add_foreign_key "libraries", "sessions"
  add_foreign_key "profiles", "sessions"
  add_foreign_key "recipes", "remotefiles"
  add_foreign_key "recipes", "sessions"
  add_foreign_key "sessions", "users"
  add_foreign_key "states", "sessions"
  add_foreign_key "todos", "sessions"
end
