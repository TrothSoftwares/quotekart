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
  
  @dealers = Dealer.all
  end

  # POST /quotes
  # POST /quotes.json
  
 def sent_quote
       @quote.update_attribute(:status,  'admin_sent')
       @quote.update_attribute(:submitted_at, DateTime.now)
      item_category = params[:quote_category]
      sent_to_dealers = Dealer.all.select { |m| m.shop_type.include? item_category  }
      if sent_to_dealers.present?
       sent_to_dealers.each do|sent_to_dealer| 
         @quote_items= @quote.quote_items
          @quote_items.each do |qitem|
            @quote_bid = qitem.quote_bids.create(dealer_id: sent_to_dealer.id , status: 'inbox')
          end
          # sent emails 
          QuoteMailer.send_dealer(sent_to_dealer, @quote).deliver_later
        end
      end 
 end
 
 
 
 def releasequote
 
 @quote = Quote.find(params[:quote])
 @quote.update_attribute(:status,  'released')
 redirect_to @quote
 end
  
  
  
  def create
  
    @user = current_user
    @quote = @user.quotes.build(quote_params)
    @quote.status = "created"
    @quote.category = params["quote_category"]||"default"
    
    quote_details_form = params["quote"]["details"]
    quote_details_form.each do |item,value|
      item_category = params["quote_category"]||"default"
      @quote_item = @quote.quote_items.build(category: item_category , quote_details: value.to_a)
    end


    if params[:commit] == "Submit"
      sent_quote   
    end
    
    
    respond_to do |format|
      if @quote.save  
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
  
    @dealers = Dealer.all
    
    ###### CLIENT UPDATE #########
    if params[:update_type] == "client_update"
      @user = current_user
      @quote = @user.quotes.find(params[:id])
      quote_details_form = params["quote"]["details"]
      @quote.quote_items.destroy_all
      quote_details_form.each do |item,value|
        item_category = params["quote_category"]||"default"
        @quote_item = @quote.quote_items.build(category: item_category , quote_details: value.to_a)
      end
      
    if params[:commit] == "Submit"
       sent_quote   
    end
    end 
    ###### -------------- #########
    
    
     
     
     
    ########   ADMIN UPDATE   #####
    if params[:admin_update]
      @quote.update_attribute(:status,  'admin_sent')
      sent_to_dealers = params[:sent_to_dealers]
      if sent_to_dealers.present?
       sent_to_dealers.each do|sent_to_dealer| 
         @quote_items= @quote.quote_items
          @quote_items.each do |qitem|
            @quote_bid = qitem.quote_bids.create(dealer_id: sent_to_dealer)
          end
      end
      end     
    end
    #####-------------------########
    
    
        ########   DEALER UPDATE   #####
    if params[:update_type] == "dealer_update"
       
       if params[:commit] == "Submit"
         @quote.quote_bids.where(dealer: current_dealer).update_all(:status => 'submitted')   
       end
       
       if params[:commit] == "Draft"
         @quote.quote_bids.where(dealer: current_dealer).update_all(:status => 'drafted')   
       end
          
       
       
       
       
      
      
      
      
      
      '''
      sent_to_dealers = params[:sent_to_dealers]
      if sent_to_dealers.present?
       sent_to_dealers.each do|sent_to_dealer| 
         @quote_items= @quote.quote_items
          @quote_items.each do |qitem|
            @quote_bid = qitem.quote_bids.create(dealer_id: sent_to_dealer)
          end
        end
      end
      '''
           
    end
    #####-------------------########

    
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
      format.html { redirect_to dashboardurl, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
 def dashboardurl
    if current_user.present?
      user_path
    elsif current_dealer.present?
      dealer_path
    elsif current_admin.present?
      admin_path
    end
  end


    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:name , :quote_bid   ,  :quote_bids_attributes=>[:amount,:name, :bid_amount , :id , :unit_amount, :remarks] ,  :details=>[] )
    end
end
