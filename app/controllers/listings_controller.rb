class ListingsController < ApplicationController
  before_action :set_vendor
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_offers, only: :show
  # GET /listings
  # GET /listings.json

  def index
    if @vendor.nil?
      @current_listings = Listing.where(:created_at => (Date.today - 7.days)..Date.today).order('created_at asc')
      @expired_listings = Listing.where.not(:created_at => (Date.today - 7.days)..Date.today)
      @listings = @current_listings + @expired_listings
    else
      @listings = @vendor.listings
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = @vendor.listings.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = @vendor.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to vendor_listing_path(@vendor, @listing), notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    # binding.pry
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to vendor_listing_path(@vendor, @listing), notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vendor
    p "In set vendor"
    p params[:vendor_id]
    @vendor = Vendor.find_by(id: params[:vendor_id])
    p "After vendor set"
    p @vendor
  end

  def set_listing
    p "In set listing"
      @listing = @vendor.listings.find(params[:id])
  end

  def set_offers
    @offers = Offer.where(listing_id: @listing.id)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:vendor_id, :quantity, :species, buyer_ids: [])
    end
end
