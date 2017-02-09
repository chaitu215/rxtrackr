# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)

 ```ruby
User has many medications.
Medication has many notes.
```

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)

 ```ruby
Medication belongs to user.
Note belongs to medication.
```

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)

 ```ruby
  User has many notes through medications.
```

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

 ```ruby
  For "through" relationship, User submitted attribute is notes.content.
```

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

 ```ruby
  class Note
    validates :medication_id, presence: true
    validates :content, presence: true
  end

  class Medication
    validates :user_id, presence: true
    validate  :brand_or_generic

    def brand_or_generic
      if self.brand_name.empty? && self.generic_name.empty?
        errors.add(:brand_or_generic, "must have either a brand or generic name")
      end
    end
  end
 ```

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

 ```ruby
  Class method sends results to: medications/most_recent
```

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

 ```ruby
  # Custom attribute writer at User.rb:
  def allergies_attributes=(allergies_attributes)
    allergies_attributes.values.each do |attribute|
      if attribute[:name].present?
        allergy = Allergy.find_or_create_by(attribute)
        if !self.user_allergies.include?(attribute[:name])
          self.user_allergies.build(allergy_id: allergy.id)
        end
      end
    end
  end

  # Params: app/controllers/users/registrations_controller.rb
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :email,
                                 :password, :password_confirmation, :current_password,
                                 allergy_ids: [], user_allergy_ids: [],
                                 allergies_attributes: [:user_id, :name, :description])
  end

  # Nested form: app/views/devise/registrations/edit.html.erb
  <div class="field">
    <%= f.fields_for :allergies, current_user.allergies.build do |ff| %>
    <%= ff.label :name, "Add New Allergy Name" %>
    <%= ff.text_field :name, class: 'form-control' %><br />
    <% end %>
  </div>
```

- [x] Include signup (how e.g. Devise) _Devise_
- [x] Include login (how e.g. Devise) _Devise_
- [x] Include logout (how e.g. Devise) _Devise_
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) _Devise/OmniAuth_
- [x] Include nested resource show or index (URL e.g. users/2/recipes) _users/1/medications_
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

 ```text
  Nested resource "new" form at: medications/1/notes
```

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

 ```text
  Validation error messages and custom messages displayed after form submission,
  along with confirmation after successful delete.
```

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
