class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = current_user.votes.build()
  end

  def create
    @vote = current_user.votes.build(params[:vote])
    if @vote.save
      redirect_to votes_url, notice: I18n.t('vote.created')
    else
      render action: 'new'
    end
  end

  def edit
    @vote = current_user.votes.find(params[:id])
  end

  def update
    @vote = current_user.votes.find(params[:id])
    if @vote.update_attributes(params[:vote])
     redirect_to votes_url, notice: I18n.t('vote.updated')
    else
      render action: 'edit'
    end
  end

  def show
    @vote = Vote.find(params[:id])
  end
end