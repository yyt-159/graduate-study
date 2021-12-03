class SetTermController < ApplicationController
  def index
    @setTerms = SetTerm.all if SetTerm.exists?
  end
  
  def new
    @setTerm = SetTerm.new
  end

  def create
    SetTerm.create(set_term_params)
    redirect_to "/set_term"
  end

  def edit
    @setTerm = SetTerm.new
  end

  def update
    @setTerm = SetTerm.find_by(id:params[:set_term_id])
    @setTerm.update(set_term_params)
    redirect_to set_term_index_path
  end

  def destroy
    @setTerm = SetTerm.find_by(id:params[:id])
    @setTerm.destroy
    redirect_to set_term_index_path
  end

  
  private
  def set_term_params
    params.require(:set_term).permit(:term)
  end

end
