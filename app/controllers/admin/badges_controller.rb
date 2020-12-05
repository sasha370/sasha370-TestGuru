class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  before_action :set_rules, only: [:new, :edit, :update, :create]
  before_action :set_images, only: [:new, :edit, :update, :create]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], notice: 'Badge was successfully created.'
    else
      render :new, alert: 'Нужно азаполнить все поля'
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: 'Badge was successfully destroyed.'
  end

  private

  def prepare_params
    @badge_params = badge_params
  end

  def set_rules
    @rules = Badge::RULES
  end

  def set_images
    @images = Dir.glob("./app/assets/images/badges/**/*").select { |e| File.file? e }
    @images.map! { |image| image.split('/').last }
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :rule_name, :rule_params)
  end
end
