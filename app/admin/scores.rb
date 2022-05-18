ActiveAdmin.register Score do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_user, :first_score, :second_user, :second_score, :third_user, :third_score, :fourth_user, :fourth_score
  permit_params :first_user, :first_score, :second_user, :second_score, :third_user, :third_score, :fourth_user, :fourth_score
  # or
  #
  # permit_params do
  #   permitted = [:first_user, :first_score, :second_user, :second_score, :third_user, :third_score, :fourth_user, :fourth_score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
