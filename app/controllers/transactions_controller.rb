class TransactionsController < ApplicationController
#needs two methods
def create
	book = Book.find_by!(slug: params[:slug])
	sale = book.sale.create(
		amount: book.price,
		buyer_email: current_user.email,
		seller_email: book.user.email,
		stripe_token: params[:stripeToken])
	sale.process!
	
	if sale.finished?
		redirect_to pickup_url(uuid: sale.uuid)
	else
		  redirect_to book_path(book), notice: e.message
	end
end

def pickup
	@sale = Sale.find_by!(uuid: params[:uuid])
	@book = @sale.book
end
end