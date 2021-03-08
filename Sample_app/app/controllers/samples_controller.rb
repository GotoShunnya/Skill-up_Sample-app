class SamplesController < ApplicationController

  def top
  end

  def index
    @sample = Sample.new
    @samples = Sample.all

    puts "作成した環境変数#{ENV["SECRET_KEY"]}"
  end

  def create
    @sample = Sample.new(sample_params)
    @sample.save
    redirect_to sample_path(@sample.id)
  end

  def show
    @sample = Sample.find(params[:id])
    @samples = Sample.new
  end

  private

  def sample_params
    params.require(:sample).permit(:title, :body)
  end
end
