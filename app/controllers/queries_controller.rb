class QueriesController < ApplicationController

def index
    @user = User.find(params[:user_id])
    @query = Query.all
    @result = @user.queries.last
    @result = @result.q_string 
    @api = get_data(@result)
end


def new
    @query = Query.new
    render(:new)
end

  def create
    @user = User.find(params[:user_id])
    
    @query = @user.queries.new(title: params[:title], q_string: create_string(params[:title], params[:zip], params[:beds], params[:baths]))
    if @query.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @result = @user.queries
    @result = @result.q_string 
    @api = get_data(@result)
  end

  private

  def get_data(result)
    from_streeteasy = HTTParty.get(result)
    return from_streeteasy
  end

  def create_string(title, zip, beds, baths)
    return "http://streeteasy.com/nyc/api/#{title}/data?criteria=zip:#{zip}%7Cbeds:#{beds}%7Cbaths:#{baths}&key=639ac73e9907562d8bb933b31b312eb0e7f92ecc&format=json"
  end

 

  # def query_params
  #   params.require(:query).permit(:title, :zip, :beds, :baths)
  # end


end