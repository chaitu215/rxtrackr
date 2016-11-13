# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) _User has many medications._
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) _Medication belongs to user._
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) _User has many doses and has many doctors through medications._
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) _User has many doses through medications (medication.dose, medication.doctor)._
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) _Validates `presence: true` for medication name and dose._
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) _User.otc_meds ... /users/otc_meds and user.prescrip_meds ... /users/prescrip_meds_
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) _prescription/new, dose_ and _prescription/new, doctor_
- [x] Include signup (how e.g. Devise) _Devise_
- [x] Include login (how e.g. Devise) _Devise_
- [x] Include logout (how e.g. Devise) _Devise_
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) _Devise/OmniAuth_
- [x] Include nested resource show or index (URL e.g. users/2/recipes) _users/1/medications_
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) _medications/1/details_
- [x] Include form display of validation errors (form URL e.g. /recipes/new) _Validation errors confirmation messages displayed after form submission._

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
