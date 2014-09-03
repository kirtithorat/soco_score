class WelcomeController < ApplicationController
	def index
		if params[:username] || params[:userid]
			fetch_user
		end
	end

	private
	def fetch_user
		options={sort: :reputation}
		options[:inname] = params[:username] if params[:username]
		response = RubyStackoverflow.users(options)
		@users = response.data.present? ? response.data.map(&:display_name) : "Not Found"
	end
end
