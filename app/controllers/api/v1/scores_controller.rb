class Api::V1::ScoresController < ApiController
  before_action :set_score, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    scores = Score.all
    render json: scores
  end

  def show
    render json: @score
  end

  private

    def set_score
      @score = Score.find(params[:id])
    end
end