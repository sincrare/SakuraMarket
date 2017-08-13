class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy, :edit_address]

  def edit_address
  end

  def update_address
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = update_resource(resource, account_update_params)
    if resource_updated
      redirect_to order_confirmation_stocked_items_path, notice: '送付先を更新しました。'
    else
      render :edit_address
    end
  end
end
