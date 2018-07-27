require 'rails_helper'

RSpec.describe OrderCountNotifierJob, type: :job do
  describe 'have_enqueued_job' do
    it 'should have a enqueued job' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        OrderCountNotifierJob.perform_later('order_count')
      end.to have_enqueued_job.with('order_count')
    end
  end
end
