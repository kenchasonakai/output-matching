class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = '原稿を作成しました'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy!
    redirect_to user_path(current_user)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
