class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  include ApplicationHelper
  
  def index
    @current_page = if params[:current_page] then params[:current_page] else 1 end
    per_page = 12
    @notices = Notice.limit(per_page).order(id: :desc).all.offset((@current_page.to_i - 1) * per_page)
    @totalCnt = Notice.all.count
    @totalPageList = getTotalPageList(@totalCnt, per_page)
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
    @notice.increment!(:notice_hits, 1)
  end

  # GET /notices/new
  def new
    @notice = Notice.new
    @notice.notice_hits = 0;
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:notice_title, :notice_content, :notice_hits)
    end
end
 