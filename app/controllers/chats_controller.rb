class ChatsController < ApplicationController
	before_filter :require_login
  
  # Here is the room
  def room
  end
  
  # To send a new message
  def new_message
    # faye = URI.parse 'http://localhost:9292/faye'
    
    # Check if the message is private
    if recipient = params[:message].match(/@(.+) (.+)/)
      
      # It is private, send it to the recipient's channel
      # message = {:username => current_user.username, :msg => recipient.captures.second}.to_json
      # Net::HTTP.post_form(faye, :message => {:channel => "/messages/private/#{recipient.captures.first}", :data => message}.to_json)
      @channel = "/messages/private/#{recipient.captures.first}"
      @message = { :username => current_user.username, :msg => recipient.captures.second }
    else
      # message = {:username => current_user.username, :msg => params[:message]}.to_json
      # Net::HTTP.post_form(faye, :message => {:channel => '/messages/public', :data => message}.to_json)
      @channel = "/messages/public"
      @message = { :username => current_user.username, :msg => params[:message] }
    end
    
    respond_to do |f|
      f.js
    end
  end
  
  #
  
end
