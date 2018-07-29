module JobSearch
  extend ActiveSupport::Concern

  #Note that this aggregation includes the from value and excludes the to value for each range.
  EXPERIENCE_LEVELS = {
    'less_than_1_year' => { where: { lt: 1 }, range: { to: 1 } },
    '1-2_years' => { where: 1..2, range: { from: 1, to: 3 } },
    '3-5_years' => { where: 3..5, range: { from: 3, to: 6 } },
    '6-10_years' => { where: 6..10, range: { from: 6, to: 11 } },
    '11-15_years' => { where: 11..15, range: { from: 11, to: 16 } },
    '15+_years' => { where: { gt: 15 }, range: { from: 16 } }
  }.freeze

  SORT_PARAMS = {
    'relevance' => { updated_at: :asc },
    'last_updated' => { updated_at: :desc }
  }.freeze

  DEFAULT_SORT = 'relevance'.freeze

  included do
    searchkick

    def self.prepare_search(params)
      {
        fields: [:q],
        where: where_condition(params),
        order: get_order(params[:sort_by]),
        body_options: { aggs: aggs },
        aggs: {
          title: { limit: 15 },
          'education.title': {},
          'job_type.title': {},
          city: { limit: 15 }
        },
        smart_aggs: false,
        page: params[:page],
        per_page: Job::JOBS_PER_PAGE
      }
    end

    def self.where_condition(params = nil)
      filter = {}
      return filter unless params
      filter[:_and] = []
      filter[:_and] << Job.build_cities(params[:city]) if params[:city].present?
      filter[:_and] << Job.build_experience(params[:experience]) if params[:experience].present?
      filter[:_and] << Job.build_job_types(params[:job_type]) if params[:job_type].present?
      filter[:_and] << Job.build_education(params[:education]) if params[:education].present?
      filter[:_and] << { title: params[:job_title] } if params[:job_title].present?
      filter
    end

    def self.get_order(params = nil)
      return SORT_PARAMS[DEFAULT_SORT] unless params
      selected = SORT_PARAMS[params]
      selected || SORT_PARAMS[DEFAULT_SORT]
    end

    def self.aggs
      exp_ranges = EXPERIENCE_LEVELS.values.collect { |i| i[:range] }
      {
        experience: {
          range: {
              field: "experience",
              ranges: exp_ranges
          }
        }
      }
    end

    def search_data
      {
        q: [title, description].join(' '),
        title: title,
        address: address.downcase,
        updated_at: updated_at,
        experience: experience,
        job_type: job_type,
        education: education,
        city: companies&.first&.city&.downcase || "Other"
      }
    end

    private

    def self.build_titles(params)
      result = []
      params.each do |title|
        next unless title.present?
        result << title
      end
      { title: result }
    end

    def self.build_cities(cities)
      result = []
      cities.each do |city|
        next unless city.present?
        result << city.downcase
      end
      { city: result }
    end

    def self.build_experience(exp_params)
      result = { _or: [] }
      exp_params.each do |exp|
        val = EXPERIENCE_LEVELS[exp]
        result << { experience: val[:where] } if val
      end
      result
    end

    def self.build_job_types(exp_params)
      result = []
      exp_params.each do |exp|
        next unless exp.present?
        result << exp
      end
      {'job_type.title' => result}
    end

    def self.build_education(exp_params)
      result = { _or: [] }
      exp_params.each do |exp|
        val = Education.find_by(title: exp)
        result[:_or] << { 'education.title' => val.title } if val
      end
      result
    end
  end
end
