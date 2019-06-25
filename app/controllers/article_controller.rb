class ArticleController<ApplicationController
  def create
    @article = Article.new
    @article.name=params[:name]
    @article.description=params[:description]
    if(@article.save)
      render json: {message:"Successfully Saved"}
    else
      render json: {message:"Not Saved"}
    end
  end

  def destroy
    @article = Article.find(params[:id].to_i)
    if(@article.destroy)
      render json: {message:"Successfully deleted."}
    else
      render json: {message:"Not deleted."}
    end
  end

  def update
    @article = Article.find(params[:id].to_i)
    if(@article.update(article_params))
      render json: {message:"Successfully updated."}
    else
      render json: {message:"Not updated."}
    end
  end

  def index
    @article = Article.all
    render json: {Article:@article}
  end

  private
  def article_params
      params.require(:article).permit(:name, :desc)
  end

end
