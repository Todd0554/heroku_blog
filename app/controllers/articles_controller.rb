class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
    
    
    def index
        @time = Time.now
        @articles = Article.all

       
    end

    def new
        @article = Article.new

        # console
    end
    def create
        @article = Article.new(article_params)
        @article.user = current_user

        if @article.save
            redirect_to articles_path
        else
            render :new
        end
    end
  
    def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		
		if @article.update(article_params)
			redirect_to articles_path
		else
			render :edit
		end
	end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end


    def show
        @find_article = Article.find(params[:id])
        @toast = params[:toast]
        
    end


 
    
    private
    def article_params
        params.require(:article).permit(:title, :body, :importance)
    end
end
