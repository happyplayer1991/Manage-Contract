module ResumeSearch
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
      exp_ranges = EXPERIENCE_LEVELS.values.collect { |i| i[:range] }
      {
        fields: [:title, :field_of_study, :job_titles, :skills],
        misspellings: {below: 3},
        where: where_condition(params),
        order: get_order(params[:sort_by]),
        aggs: {
          title: { limit: 15, where: {status: "public_resume"} },
          education: { where: {status: "public_resume"} },
          city: { limit: 15, where: {status: "public_resume"}  },
          experience: { ranges: exp_ranges, where: {status: "public_resume"}}
        },
        smart_aggs: false,
        page: params[:page],
        per_page: Resume::RESUMES_PER_PAGE
      }
    end

    def self.where_condition(params = nil)
      filter = {}
      return filter unless params
      filter[:_and] = [{status: 'public_resume'}]
      filter[:_and] << Resume.build_cities(params[:city]) if params[:city].present?
      filter[:_and] << Resume.build_experience(params[:experience]) if params[:experience].present?
      filter[:_and] << Resume.build_education(params[:education]) if params[:education].present?
      filter[:_and] << { title: params[:job_title] } if params[:job_title].present?
      filter
    end

    def self.get_order(params = nil)
      return SORT_PARAMS[DEFAULT_SORT] unless params
      selected = SORT_PARAMS[params]
      selected || SORT_PARAMS[DEFAULT_SORT]
    end

    def search_data
      {
        title: desired_job_title,
        first_of_study: field_of_study,
        job_titles: work_experiences.pluck(:job_title),
        skills: skills.pluck(:title),
        experience: work_experiences&.pluck(:job_type_work_exp)&.sum.to_i,
        updated_at: updated_at,
        education: degree,
        status: status,
        city: city&.downcase || "other"
      }
    end

    private

    def self.build_cities(cities)
      result = { _or: [] }
      cities.each do |city|
        next unless city.present?
        result[:_or] << {city: city.downcase }
      end
      result
    end

    def self.build_experience(exp_params)
      result = { _or: [] }
      exp_params.each do |exp|
        val = EXPERIENCE_LEVELS[exp]
        result[:_or] << { experience: val[:where] } if val
      end
      result
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
