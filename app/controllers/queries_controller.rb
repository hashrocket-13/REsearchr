class QueriesController < ApplicationController

  before_action :load_user, only: [:index, :create, :show]

  def index
    @query = Query.where(user_id: params[:user_id])
    @listings_data = @query.map do |listing|
      get_data(listing.q_string).merge({'id' => listing.id})
    end
  end

  def new
    @query = Query.new
    render(:new)
  end

  def create
    @query = @user.queries.new(title: params[:title], q_string: create_string(params[:title], params[:zip], params[:beds], params[:baths]))
    if @query.save
      redirect_to ("/users/#{params[:user_id]}/queries")
    else
      render(:new)
    end
  end

  def show
    @query = Query.find(params[:id])
    @result = @query.q_string 
    @api = get_data(@result)
  end

  def destroy
    @query = Query.find_by(id: params[:id])
    @query.destroy
    redirect_to ("/users/#{params[:user_id]}/queries")
  end

  private

  def load_user
    return @user = User.find(params[:user_id])
  end

  def get_data(result)
    from_streeteasy = HTTParty.get(result)
    return from_streeteasy
  end

  def create_string(title, zip, beds, baths)
    return "http://streeteasy.com/nyc/api/#{title}/data?criteria=zip:#{zip}%7Cbeds:#{beds}%7Cbaths:#{baths}&key=#{STREETEASY_CLIENT_ID}&format=json"
  end
end