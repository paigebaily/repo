class ArticlesController < ApplicationController
    def new
      @article = Article.new
    end
    def index
      @articles=Article.all 
    end
    def show
      @article =Article.find(params[:id])
   end
  def create
  @article =Article.new(article_params)
  if @article.save
    redirect_to @article
    else
    render'new'
    end
  end
def edit
  @article = Article.edit(find(params[:id]))
  @article.save
  redirect_to @article
end
def update
@article = Article.find(params[:id])
if @article.update(article_params)
redirect_to @article
else
render 'edit'
end
end
end

private 
def article_params
  params.require(params[:id]).permit(:title, :text)
end