class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    # If parameters are empty then redirect to a RESTful route with values inserted from session
    if !params.has_key? :ratings
      flash.keep
      redirect_to movies_path(ratings: session[:ratings], sort_by: session[:sort_by])
    end
    session[:ratings] = params[:ratings].keys unless params[:ratings].nil? || params[:ratings] == session[:ratings]
    session[:ratings] ||= @all_ratings 
    @movies = Movie.where(rating: session[:ratings])
    @movies = @movies.order(params[:sort_by]) unless params[:sort_by].nil?
    session[:sort_by] = params[:sort_by]
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end
