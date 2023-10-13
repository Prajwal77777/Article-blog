class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destory]
    def show
         
    end

    def index 
        @articles = Article.all
    end

    def create 
        @articles = Article.new(article_params)
        if @articles.save
            flash[:notice] = "Article was created Sucessfully."
            redirect_to @articles
        else 
            render 'new'
        end
    end

    def new 
        @articles = Article.new
    end

    def update 
        if @articles.update(article_params)
            flash[:notice] = "Article was updated sucessfully"
            redirect_to @articles
        else
            render 'edit'
        end
    end

    def edit 
    end

    def destroy 
        @articles.destroy
        redirect_to articles_path
    end

    private

    def set_article 
        @articles = Article.find(params[:id])
    end

    def article_params 
        params.require(:article).permit(:title,:description)
    end

end