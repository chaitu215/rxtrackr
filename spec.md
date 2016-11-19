# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
 ```text
 User has many medications.
Medication has many notes.```
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
```text
Medication belongs to user.````
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
```text
User has many notes through medications.```
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
```text
For "through" relationhip, User submitted attribute is notes.content.```
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 ```text
 Validates presence of medication brand or generic name through custom validation on Medication model.```
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
```text
medications/missing_info
```
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
```text
medication/new, notes/new```
- [x] Include signup (how e.g. Devise) _Devise_
- [x] Include login (how e.g. Devise) _Devise_
- [x] Include logout (how e.g. Devise) _Devise_
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) _Devise/OmniAuth_
- [x] Include nested resource show or index (URL e.g. users/2/recipes) _users/1/medications_
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
```text
medications/1/notes```
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
```text
Validation error messages and custom messages displayed after form submission, along with confirmation after successful delete.```

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate
