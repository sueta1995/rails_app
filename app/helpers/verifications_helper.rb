module VerificationsHelper
	def set_params
		@verifications_form_code = params.require(:verification).permit(:code)[:code]
	end

	def delete_info
		session.delete(:ver_code)
    session.delete(:ver_params)
	end
end
