class EggsController < ApplicationController
  def index
    @eggs = Egg.all
  end
end
