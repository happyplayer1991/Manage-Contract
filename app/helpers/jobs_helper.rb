module JobsHelper
  def experience_counter(aggreg, exp)
    return unless aggreg['experience']
    exp = Job::EXPERIENCE_LEVELS[exp][:range]
    elem = aggreg['experience']['buckets'].find do |bucketed_item|
      bucketed_item['to'] == exp[:to]&.to_f &&
      bucketed_item['from'] == exp[:from]&.to_f
    end
    elem ? elem['doc_count'] : 0
  end
end
