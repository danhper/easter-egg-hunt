class EggsController < ApplicationController
  def index
    @eggs = Egg.all
    @answers = Answer.where(user: current_user).index_by(&:egg_id)
  end

  def show
    @egg = Egg.find(params[:id])
    @answer = Answer.find_by(egg: @egg, user: current_user) || Answer.new
    @edit = params[:edit]
  end
end
