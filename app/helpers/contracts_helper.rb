module ContractsHelper	
	def purchase_time_adjustment(purchase_time)
		adjusted_time = purchase_time - 4.hours
		formatted_time = adjusted_time.change(:sec => 0).strftime("%Y-%m-%d %H:%M:%S")
	end
end
