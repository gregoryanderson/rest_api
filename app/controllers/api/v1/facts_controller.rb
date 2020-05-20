class Api::V1::FactsController < ApplicationController
  
  before_action :find_fact, only: [:show, :update, :delete]

  def index
    @facts = Facts.all
    render json: @facts
  end 

  def show
    render json: @fact
  end 

  def create
    @fact = Fact.new(params[:id])
    if @fact.save
      render json: @fact
    else
      render error: {error: "Unable to create fact"}, status: 400
    end 
  end 

  def update
    if @fact
      @fact.update(fact_params)
      render json: {message: "fact successfully updated"}, status: 200
    else
      render json: {message: "Unable to update fact"}, status: 400
    end 
  end 

  def destroy
    if @fact
      @fact.destroy
      render json: {message: "fact successfully deleted"}, status: 200
    else
      render json: {message: "Unable to delete facts"}, status: 400
    end 
  end 

  private 

  def fact_params
    params.require(:fact).permit(:username, :password)
  end 

  def find_fact
    @fact = Fact.find(params[:id])
  end 

end
