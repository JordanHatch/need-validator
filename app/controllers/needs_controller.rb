class NeedsController < ApplicationController

  def index
  end

  def results
  end

  def next
    redirect_to_random_need
  end

  def show
  end

  def review
    need.submit_score(opinion)
    redirect_to_random_need
  end

private

  def needs_in_order
    scope = Need

    if params[:min].present?
      scope = scope.where('total_rating_count > ?', params[:min])
    end

    @needs ||= scope.order("percentage_score desc").all
  end
  helper_method :needs_in_order

  def need
    @need ||= Need.find_by_need_api_id(params[:id])
  end
  helper_method :need

  def redirect_to_random_need
    redirect_to need_path(Need.random)
  end

  def opinion
    case params[:opinion]
    when 'Looks good' then :positive
    when 'Not sure' then :neutral
    when 'Needs work' then :negative
    end
  end

end
