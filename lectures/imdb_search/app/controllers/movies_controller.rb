class MoviesController < ApplicationController
  def index
    if params[:query].blank?
      @movies = Movie.all
    else
      ## PgSearch Approach
      # @movies = Movie.search_by_title_and_synopsis(params[:query])
      @movies = PgSearch.multisearch(params[:query])

      ## ActiveRecord Approach
      # sql_query = <<-SQL
      #   title @@ :query
      #   OR synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    end
  end
end