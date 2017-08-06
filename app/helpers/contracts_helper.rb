module ContractsHelper	
  def alpha_time_adjustment(purchase_time)
	adjusted_time = purchase_time - 4.hours
	formatted_time = adjusted_time.change(:sec => 0).strftime("%Y-%m-%d %H:%M:%S")
  end

  def markets_open?
  	today_date = Time.now.strftime("%Y-%m-%d")
  	if alpha_time_adjustment(Time.now) > today_date + " 15:59:00" || Date.today.saturday? || Date.today.sunday?
  	  false
  	else
  	  true
  	end
  end

end
