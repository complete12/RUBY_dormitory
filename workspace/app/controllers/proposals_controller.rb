class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  # GET /proposals
  # GET /proposals.json
  include ApplicationHelper
  
  def index
    @current_page = if params[:current_page] then params[:current_page] else 1 end
    per_page = 12
    @proposals = Proposal.limit(per_page).order(id: :desc).all.offset((@current_page.to_i - 1) * per_page)
    @totalCnt = Proposal.all.count
    @totalPageList = getTotalPageList(@totalCnt, per_page)
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.p_answer = "No"
    @proposal.p_studentID = current_domitory.student_number
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: '작성한 글이 게시판에 등록되었습니다.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: '게시글이 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: '작성한 게시글이 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end
  
  def write_answer
    @w_answer = ReplyProposal.new
    @w_answer.answer_studentID = current_domitory.student_number
    @w_answer.proposal_id  = params[:proposal_id]
    @w_answer.answer_content = params[:my_answer_content]
    @w_answer.save
    @edit_answer = Proposal.find_by_id(params[:proposal_id])
    @edit_answer.p_answer = "Yes"
    @edit_answer.save
    redirect_to :controller => 'proposals', :action => 'show', :id => params[:proposal_id]
  end
  
  def delete_answer
    @w_answer = ReplyProposal.find_by_id(params[:id])
    @w_answer.destroy
    @edit_answer = Proposal.find_by_id(params[:proposal_id])
    if @edit_answer.reply_proposals.count == 0
      @edit_answer.p_answer = "No"
    end
    @edit_answer.save
    redirect_to :controller => 'proposals', :action => 'show', :id => params[:proposal_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:p_category, :p_answer, :p_title, :p_content)
    end
end
