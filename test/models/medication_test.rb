# require 'test_helper'
#
# class MedicationTest < ActiveSupport::TestCase
#   def setup
#     @user = users(:one)
#   end
#
#   test "should be destroyed when associated user is destroyed" do
#       @user.save
#       @user.medications.create!(generic_name: "aspirin",  dose: "10mg qd")
#       assert_difference 'Medication.count', -1 do
#         @user.destroy
#       end
#     end
#   end
