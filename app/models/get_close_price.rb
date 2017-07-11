# class GetClosePrice
#   include Delayed::RecurringJob
#   run_every 1.minute
#   queue 'job'
#   def perform
#     puts 'test'
#   end
# end