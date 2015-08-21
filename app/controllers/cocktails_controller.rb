class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.all
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save ? (redirect_to cocktail_path(@cocktail)) : (render'new')
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end


  {
  "Statement": [{
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "arn:aws:s3:::*"
    }, {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::antonin-mister-cocktail"
      ]
  }]
}
end
