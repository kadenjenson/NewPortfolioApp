class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :show, :update, :destroy]
  layout "portfolios"

  def index
    @portfolios = Portfolio.by_position.all
    @page_title = "KJ | Portfolios"
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html {redirect_to portfolios_path, notice: 'Nice! The post is now live'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @page_title = @portfolio.title
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Great editing on that portfolio post!' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @page_title = @portfolio.title
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'That post was not worthy!' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                  :body, 
                                  technologies_attributes: [:id, :_destroy]
                                  )
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
