class ImageLinksController < ApplicationController
    before_action :set_image_link, only: %i[ show edit update destroy ]
  
    # GET /image_links or /image_links.json
    def index
      @image_links = ImageLink.order(created_at: :desc)
    end
  
    
    # GET /image_links/1 or /image_links/1.json
    def show
      @image_link = ImageLink.find(params[:id])
    end
  
    # GET /image_links/new
    def new
      @image_link = ImageLink.new
    end
  
    # GET /image_links/1/edit
    def edit
    end
  
    # POST /image_links or /image_links.json
    def create
      @image_link = ImageLink.new(image_link_params)
  
     
      respond_to do |format|
        if @image_link.save
          format.html { redirect_to image_link_url(@image_link), notice: "Image link was successfully created." }
          format.json { render :show, status: :created, location: @image_link }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @image_link.errors, status: :unprocessable_entity }
        end
      end
    end
    
  
    # PATCH/PUT /image_links/1 or /image_links/1.json
    def update
      respond_to do |format|
        if @image_link.update(image_link_params)
          format.html { redirect_to image_link_url(@image_link), notice: "Image link was successfully updated." }
          format.json { render :show, status: :ok, location: @image_link }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @image_link.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /image_links/1 or /image_links/1.json
    def destroy
      @image_link.destroy!
  
      respond_to do |format|
        format.html { redirect_to image_links_url, notice: "Image link was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    
    
   def search
    @tag = params[:tag]
    @search_results = ImageLink.tagged_with(@tag) if @tag.present?
  
    if @search_results.blank?
      raise ActiveRecord::RecordNotFound, "No ImageLink records found with tag: '#{@tag}'"
    end
  end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image_link
        @image_link = ImageLink.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def image_link_params
        params.require(:image_link).permit(:url, :tag_list)
      end
    end
  
      