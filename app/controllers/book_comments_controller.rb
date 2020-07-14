class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(parems[:book_id])
		@book_new = Book.new
		@book_comment = @book.book_comment.new(book_commnet_params)
		@book_comment.user_id = current_user.id
		if @book_commnet.save
			flash[:success] = "Comment was successfully created."
		else
			@book_comments = BookComment.where(book_id: @book.id)
			render '/books/show'
		end
	end

	def destroy
		@book_comment = BookComment.find(params[:book_id])
		if @book_comment.user != current_user
			redirect_to request.referer
		end
		@book_comment.destroy
	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:commnet)
	end
end
