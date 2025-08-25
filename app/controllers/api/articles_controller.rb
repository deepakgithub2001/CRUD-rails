class Api::ArticlesController < ApplicationController
	before_action :set_article, only: [:detail_article, :update, :destroy ]

	def index
		@articles = Article.all
		render json: ArticleSerializer.new(@articles)
	end

	def detail_article
		render json: DetailedArticleSerializer.new(@article)
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			render json: @article, status: :created
		else 
			render json: @article.errors, status: :unprocessable_entity 
		end
	end 

	def update
		if @article.update(article_params)
			render json: @article, status: :ok
		else
			render json: @article.errors, status: :unprocessable_entity
	    end
	end 

	def destroy
		@article.destroy
		render json: {message: "Article Deleted Successfully"}
	end 

   private	

	def set_article
		begin
			@article = Article.find_by(id: params[:id])
			unless @article.present?
				return render json: {message: "Article Not Found!!"}
			end 
		rescue StandardError => e
			return render json: {message: e.message}
		end
	end

    def article_params
	  params.require(:article).permit(:title, :content)
    end 

end 