class QueriesController < ApplicationController

def index
    @user = User.find(params[:user_id])
    @query = Query.where(user_id: params[:user_id])
    #@query = Query.all
    @result = @query
    
    @arr=[]
    i=0
    while i < @result.length 
       string = @result[i].q_string
       @api = get_data(string)
       @arr << @api
         i += 1
    end

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
    @query = Query.find(params[:id])
    @result = @query
    @result = @result.q_string 
    @api = get_data(@result)
  end

  def destroy
    @query = Query.find_by(id: params[:id])
    @query.destroy
    #session.destroy
    redirect_to root_path
  end

  private

  def get_data(result)
    from_streeteasy = HTTParty.get(result)
    return from_streeteasy
  end

  def create_string(title, zip, beds, baths)
    return "http://streeteasy.com/nyc/api/#{title}/data?criteria=zip:#{zip}%7Cbeds:#{beds}%7Cbaths:#{baths}&key=#{STREETEASY_CLIENT_ID}&format=json"
  end

 

  # def query_params
  #   params.require(:query).permit(:title, :zip, :beds, :baths)
  # end


end