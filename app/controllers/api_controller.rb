class ApiController < ApplicationController
  def create
    TwitterInterface.tweet!(params[:annoying][:message])
    render :text => 'ANNOY OK'
  end
end
