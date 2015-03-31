class OfficialsController < ApplicationController
  before_action :set_official, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @officials = Official.all
    respond_with(@officials)
  end

  def show
    respond_with(@official)
  end

  def new
    @official = Official.new
    respond_with(@official)
  end

  def edit
  end

  def create
    @official = Official.new(official_params)
    @official.save
    respond_with(@official)
  end

  def update
    @official.update(official_params)
    respond_with(@official)
  end

  def destroy
    @official.destroy
    respond_with(@official)
  end

  private
    def set_official
      @official = Official.find(params[:id])
    end

    def official_params
      params[:official]
    end
end
