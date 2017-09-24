module ContractsHelper	
  def alpha_time_adjustment(purchase_time)
    adjusted_time = purchase_time - 4.hours
    adjusted_time.change(:sec => 0).strftime("%Y-%m-%d %H:%M:%S")
  end

  def markets_open?
    today_date = Time.now.strftime("%Y-%m-%d")
    if Time.now.strftime("%Y-%m-%d %H:%M:%S") < today_date + " 06:29:00" || 
       Time.now.strftime("%Y-%m-%d %H:%M:%S") > today_date + " 13:00:00" || 
       Date.today.saturday? || Date.today.sunday?
      return false
    end
    true
  end

end
