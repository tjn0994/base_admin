class Admin::CategoriesController < DashboardController
  before_action :load_category, only: [:edit, :update, :destroy, :show]

  def index
    @search = Category.ransack params[:q]
    @per_page = params[:per_page] || Settings.per_pages.second
    @categories = @search.result.recent.page(params[:page]).per @per_page
    respond_to :js if request.xhr?
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.messages.create_success", name: t("admin.forders.category").downcase
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.messages.update_success", name: t("admin.forders.category").downcase
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] =  t "admin.messages.delete_success", name: t("admin.forders.category").downcase
    else
      flash[:error] = t "admin.messages.delete_fail", name: t("admin.forders.category").downcase
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :code, :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "admin.messages.not_found", name: t("admin.forders.category").downcase
    redirect_to admin_categories_path
  end
end
