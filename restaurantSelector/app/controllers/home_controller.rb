require 'yelp'
require 'json'
require 'http'

class HomeController < ApplicationController

  API_HOST = "https://api.yelp.com";
  SEARCH_PATH = "/v3/businesses/search";
  BUSINESS_PATH = "/v3/businesses/"; # trailing / because we append the business id to the path
  TOKEN_PATH = "/oauth2/token";

  GRANT_TYPE = "client_credentials";
  APP_ID = "MpTMLRWfJfu4nFy3v6R19A";
  APP_SECRET = "q8j8GJDVd4AcHpobJnAnvfS7kIIEqKFKjUYI5eIzTQlJzEf8Is7TuOtlGt8FNnp3";

  ACCESS_TOKEN = "Bearer k-yhjzLkLb8bSrgX59dJx4TkV-MT5vTK6OgY1z5d-iOI6Tuh3ZoeRX-FeWWpt-Af0znVn0zckwVLWS9s-EsIhNhfosggVPH7Fg_UDwVRSn2X3-x2d4cpK2_TMJ3OWHYx";


  def selector
    if params.has_key?("distance")
      setDistance(params[:distance]);
    end
  end

  def get_radius(miles)
    meters = miles *1609;
    if (meters > 40000)
      meters = 40000;
    end
    return "#{meters}";
  end


  def submit
    @term = params[:term];
    @location = params[:location];
    @distance = params[:distance];
    @dining = params[:dining];
    @price = params[:price];
    @sort_by = params[:sort_by];
    url = "#{API_HOST}#{SEARCH_PATH}";
    parameters = {
      term: @term,
      radius: @distance,
      price: @price,
      location: @location,
      sort_by: @sort_by,
      limit: 50
    }

    response = HTTP.auth(ACCESS_TOKEN).get(url, params: parameters);
    @response = response.parse;
  end

  def setTerm(term)
    @term = term;
  end

  def setLocation(location)
    @location = location;
  end

  def setRadius(radius)
    @distance = radius;
  end

  def setDining(dining)
    @dining = dining
  end

  def setPrice(price)
    @price = price
  end

  def setSortBy(sort_by)
    @sort_by = sort_by
  end



  def question1

  end

  def question2
    @term = params[:term];
  end

  def question3
    @term = params[:term];
    @location = params[:location];
  end

  def question4
    @term = params[:term];
    @location = params[:location];
    @distance = get_radius(params[:restaurant][:distance].to_i);
  end

  def question5
    @term = params[:term];
    @location = params[:location];
    @distance = params[:distance];
    @dining = params[:dining];
  end

  def question6
    @term = params[:term];
    @location = params[:location];
    @distance = params[:distance];
    @dining = params[:dining];
    @price = params[:restaurant][:price];
  end


end
