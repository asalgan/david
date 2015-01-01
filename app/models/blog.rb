include ActionView::Helpers::SanitizeHelper

class Blog < ActiveRecord::Base

	def clean_html
  	sanitized_output = strip_tags(html_input)
	end
	
end
