class Admin::CategoriesController < ApplicationController

   http_basic_authenticate_with name: "Jungle", password: "book"
   # , except: :index

   # def index
   #   render plain: "Everyone can see me!"
   # end

   def edit
     render plain: "I'm only accessible if you know the password"
   end


  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end
