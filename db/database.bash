rails g model user firebase_identifier:string email:string
rails g scaffold session user:references
rails g scaffold library session:references
rails g scaffold todo session:references
rails g scaffold history session:references
#BEGIN todo: add polymorphic association to history
sed -i '4i \\t\t\tt.bigint   :historiable_id' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '4i \\t\t\tt.string   :historiable_type' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '10i \\t\tadd_index  :historiable, [:historiable_id, :historiable_type]' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#END todo
rails g model remotefile filename:string awsbucked_identifier:string
#BEGIN todo: add polymorphic association to file
sed -i '4i \\t\t\tt.bigint   :fileable_id' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '4i \\t\t\tt.string   :fileable_type' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '11i \\t\tadd_index  :fileable, [:historiable_id, :historiable_type]' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#END todo
rails g model status text:string
#BEGIN todo: add polymorphic association to status
sed -i '4i \\t\t\tt.bigint   :fileable_id' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '4i \\t\t\tt.string   :fileable_type' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
sed -i '11i \\t\tadd_index  :fileable, [:historiable_id, :historiable_type]' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#END todo
rails g model category name:string
rails g scaffold state session:references
rails g scaffold ingredient name:string
rails g scaffold tag name:string
rails g scaffold profile name:string session:references
rails g scaffold blog session:references title:string introduction:string unbounded:string file:references
rails g scaffold recipe session:references title:string introduction:string unbounded:string file:references
rails g scaffold instruction recipe:references name:string number:integer
#BEGIN todo: add polymorphic association from history to historiables blogs and recipes 
sed -i '2i \\tbelongs_to :historiable, polymorphic: true' ./app/models/history.rb;
sed -i '2i \\thas_many :histories, as: :historiable' ./app/models/blog.rb;
sed -i '2i \\thas_many :histories, as: :historiable' ./app/models/recipe.rb;
#END todo
#BEGIN todo: add polymorphic association from file to fileables blogs, recipes, profiles and states
sed -i '2i \\tbelongs_to :fileable, polymorphic: true' ./app/models/remotefile.rb;
sed -i '2i \\thas_many :remotefiles, as: :fileable' ./app/models/blog.rb;
sed -i '2i \\thas_many :remotefiles, as: :fileable' ./app/models/recipe.rb;
sed -i '2i \\thas_many :remotefiles, as: :fileable' ./app/models/profile.rb;
sed -i '2i \\thas_many :remotefiles, as: :fileable' ./app/models/state.rb;
#END todo
#BEGIN todo: add polymorphic association from status to statusable profiles and states
sed -i '2i \\tbelongs_to :statusable, polymorphic: true' ./app/models/status.rb;
sed -i '2i \\thas_many :status, as: :statusable' ./app/models/profile.rb;
sed -i '2i \\thas_many :status, as: :statusable' ./app/models/state.rb;
#END todo
#BEGIN todo: add many to many relationships
bin/rails g migration CreateRecipesFilesJoinTable;
sed -i '3i \\t\tcreate_join_table :recipes, :remotefiles do |t|\n\t\t\tt.index :recipe_id\n\t\t\tt.index :remotefile_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateBlogsFilesJoinTable;
sed -i '3i \\t\tcreate_join_table :blogs, :remotefiles do |t|\n\t\t\tt.index :blog_id\n\t\t\tt.index :remotefile_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateBlogsTagsJoinTable;
sed -i '3i \\t\tcreate_join_table :blogs, :tags do |t|\n\t\t\tt.index :blog_id\n\t\t\tt.index :tag_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateCategoriesRecipesJoinTable;
sed -i '3i \\t\tcreate_join_table :categories, :recipes do |t|\n\t\t\tt.index :category_id\n\t\t\tt.index :recipe_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateIngredientsRecipesJoinTable;
sed -i '3i \\t\tcreate_join_table :ingredients, :recipes do |t|\n\t\t\tt.index :ingredient_id\n\t\t\tt.index :recipe_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateRecipesTodosJoinTable;
sed -i '3i \\t\tcreate_join_table :recipes, :todos do |t|\n\t\t\tt.index :recipe_id\n\t\t\tt.index :todo_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateLibraryRecipesJoinTable;
sed -i '3i \\t\tcreate_join_table :libraries, :recipes do |t|\n\t\t\tt.index :library_id\n\t\t\tt.index :recipe_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#
bin/rails g migration CreateUsersUsersJoinTable;
sed -i '3i \\t\tcreate_join_table :users, :users do |t|\n\t\t\tt.index :user_a_id\n\t\t\tt.index :user_b_id\n\t\tend' ./db/migrate/$(ls ./db/migrate -Art | tail -n 1);
#END todo
#BEGIN Many to many relationships propagation on Ruby Classes.
sed -i '3i \\t\thas_and_belongs_to_many :remotefiles' ./app/models/recipe.rb;
sed -i '3i \\t\thas_and_belongs_to_many :categories' ./app/models/recipe.rb;
sed -i '3i \\t\thas_and_belongs_to_many :ingredients' ./app/models/recipe.rb;
sed -i '3i \\t\thas_and_belongs_to_many :todos' ./app/models/recipe.rb;
sed -i '3i \\t\thas_and_belongs_to_many :libraries' ./app/models/recipe.rb;
sed -i '3i \\t\thas_and_belongs_to_many :recipes' ./app/models/file.rb;
sed -i '3i \\t\thas_and_belongs_to_many :blogs' ./app/models/file.rb;
sed -i '3i \\t\thas_and_belongs_to_many :tags' ./app/models/blog.rb;
sed -i '3i \\t\thas_and_belongs_to_many :remotefiles' ./app/models/blog.rb;
sed -i '3i \\t\thas_and_belongs_to_many :blogs' ./app/models/tag.rb;
sed -i '3i \\t\thas_and_belongs_to_many :recipes' ./app/models/category.rb;
sed -i '3i \\t\thas_and_belongs_to_many :recipes' ./app/models/ingredient.rb;
sed -i '3i \\t\thas_and_belongs_to_many :recipes' ./app/models/todo.rb;
sed -i '3i \\t\thas_and_belongs_to_many :recipes' ./app/models/library.rb;
sed -i '3i \\t\thas_and_belongs_to_many :users' ./app/models/user.rb;