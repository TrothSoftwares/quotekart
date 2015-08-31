class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
  
  
  
  
    @user = current_user
    @quote = @user.quotes.build(quote_params)
    @quote.status = "open"
    
    # Getting QuoteItems
    
    #Quote Details 
    
    quote_details_form = params["quote"]["details"]
    
    quote_details_form.each do |item,value|
    logger.info ####### category #####
    
    logger.info value
    #logger.info value["category"]
    
    item_category = value["category"]
    
    logger.info ####### name #####
    #logger.info item[:name]
    
    @quote_item = @quote.quote_items.build(category: item_category , quote_details: value.to_a)
    #@quote_item.save 
    end
    
    
    
    
    
    ###############   ADMIN VIEW   ######################
     # for adding quotebids for user
    #@quote_bid = @quote_item.quote_bids.build
    
    #@quote_bid.dealer_id= 5
    
    

    respond_to do |format|
      if @quote.save #&& @quote_bid.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
     @user = current_user
      params.require(:quote).permit(:name , :details=>[])
    end
end
