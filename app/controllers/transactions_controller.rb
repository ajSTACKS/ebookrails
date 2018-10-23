class TransactionsController < ApplicationController
#needs two methods
def create
	book = Book.find_by!(slug: params[:slug])
	token = params[:stripeToken]

	begin
		 charge = Stripe::Charge.create(
		 	:amount    => book.price,
		    :card      => token,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		     )
		@sale = book.sales.create!(buyer_email: current_user.email)
		redirect_to pickup_url(uuid: @sale.uuid)

	rescue Stripe::CardError => e
		  flash[:notice] = e.message
		  redirect_to book_path(book)
	end
end

def pickup
	@sale = Sale.find_by!(uuid: params[:uuid])
	@book = @sale.book
end


end