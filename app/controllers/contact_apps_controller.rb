class ContactAppsController < ApplicationController
  before_action :set_contact_app, only: %i[ show update destroy ]
  # before_action :authenticate_user!
  # before_action :correct_user, only: [:show, :update, :destroy]

  # GET /contact_apps
  def index
    @contact_apps = ContactApp.all

    render json: @contact_apps
  end

  # GET /contact_apps/1
  def show
    render json: @contact_app
  end

  # POST /contact_apps
  def create
    @contact_app = ContactApp.new(contact_app_params)
    # @contact_app = current_user.contact_apps.build(contact_app_params)

    required = [:firstname, :lastname, :phonenumber, :address, :sex, :age]
    if required.all? {|k| params.has_key? k}
      if @contact_app.save
        render json: @contact_app, status: :created, location: @contact_app
      else
        render json: @contact_app.errors, status: :unprocessable_entity
      end
    else
      render json: @contact_app.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_apps/1
  def update
    if @contact_app.update(contact_app_params)
      render json: @contact_app
    else
      render json: @contact_app.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_apps/1
  def destroy
    @contact_app.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_app
      @contact_app = ContactApp.find(params[:id])
    end

  # def correct_user 
  #   @contact_app = current_user.contact_apps.find_by(id: params[:id])
  #   if @friend.nil?
  #     render json: @contact_app.errors, status: :unprocessable_entity
  #   end
  # end

    # Only allow a list of trusted parameters through.
    def contact_app_params
      params.require(:contact_app).permit(:firstname, :lastname, :phonenumber, :address, :sex, :age)
    end
end
