class UsersBackoffice::CategoriesController < UsersBackofficeController
  before_action :set_category, only: %i[ edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all.page(params[:page])
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to users_backoffice_categories_url, notice: "Categoria criada com sucesso!" }
        format.json { redirect_to users_backoffice_categories_url, status: :created, location: @category }
      else
        format.html { redirect_to users_backoffice_categories_url, status: :unprocessable_entity, alert: @category.errors }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to users_backoffice_categories_url, notice: "Categoria atualizado com sucesso!" }
        format.json { redirect_to users_backoffice_categories_url, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: @category.errors }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_categories_url, notice: "Categoria removida com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title)
    end
end
