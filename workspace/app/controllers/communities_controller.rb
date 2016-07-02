class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  # GET /communities
  # GET /communities.json
   include ApplicationHelper
  def index
    @current_page = if params[:current_page] then params[:current_page] else 1 end
    per_page = 12
    @communities = Community.limit(per_page).order(id: :desc).all.offset((@current_page.to_i - 1) * per_page)
    @totalCnt = Community.all.count
    @totalPageList = getTotalPageList(@totalCnt, per_page)
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @community.increment!(:com_hits, 1)
  end

  # GET /communities/new
  def new
    @community = Community.new
    @community.com_hits = 0;
  end

  # GET /communities/1/edit
  def edit
  end

  # w_reply /communities
  # w_reply /communities.json
  def create
    @community = Community.new(community_params)
    @community.com_studentID = current_domitory.student_number
    respond_to do |format|
      if @community.save
        @community.update(:com_writer =>@community.id)
        # @community.update(:com_content =>@community.com_content.gsub(/\n/, '<br/>'))
         @community.save
        format.html { redirect_to @community, notice: '작성한 글이 게시판에 등록되었습니다.' }
        format.json { render :notice, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: '게시글이 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: '작성한 게시글이 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end
  
  def write_reply
    @w_reply = Reply.new
    @w_reply.r_studentID = current_domitory.student_number
    @w_reply.community_id  = params[:community_id]
    @w_reply.r_content = params[:my_r_content]
    @w_reply.save
    redirect_to :controller => 'communities', :action => 'show', :id => params[:community_id]
  end
  
  def delete_reply
    @w_reply = Reply.find_by_id(params[:id])
    @w_reply.destroy
    redirect_to :controller => 'communities', :action => 'show', :id => params[:community_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      if params[:id] == nil
      else
        @community = Community.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:com_category, :com_title, :com_content, :com_writer, :com_hits, :id)
    end
end

