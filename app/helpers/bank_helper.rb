def bankroll
  bankroll = current_user.contracts.select{|contract| contract.bank == @equity.ticker }

end
