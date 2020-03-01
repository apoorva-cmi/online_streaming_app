class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def readme
    f = File.open("README.md", "r") 
    data = ''
    f.each_line do |line|
        data += line
    end
    f.close
    render html: data.html_safe, status: :ok
  rescue StandardError => e
    Log.error("Rescue error in Method: contract readme: ", e)  
    render json: {
      status: "ERROR",
      response: e.inspect
    }, status: :bad_request              
  end
end
