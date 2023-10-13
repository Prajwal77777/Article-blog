class ArticlesController < ApplicationController
    def show
        @articles = Article.find(
        params[:id]
        ) 
    end

    def index 
        @articles = Article.all
    end

    def create 
        @articles = Article.new(params.require(:article).permit(:title,:description))
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
        @articles = Article.find(params[:id])
        if @articles.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated sucessfully"
            redirect_to @articles
        else
            render 'edit'
        end
    end

    def edit 
        @articles = Article.find(params[:id])
    end

    def destroy 
        @articles = Article.find(params[:id])
        @articles.destroy
        redirect_to articles_path
    end

end