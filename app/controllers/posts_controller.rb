# Controller responsável pelos posts do blog

class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@posts = Post.all.order('created_at DESC') # Na view posts/index.html exibe todos (all) posts e ordena de acordo com a data de criação
	end

	def new
		@post = Post.new # Action que cria um novo post, na view 'new.html' ele renderiza a partial '_form.html' que contem o formulário que cria um novo post
	end
	
	def create
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	# Os métodos privados só podem ser chamados dentro do seu próprio objeto, não pode ser acessado a partir de outro objeto

	private 
		def post_params
			params.require(:post).permit(:title, :body)
		end

end
