User.create!(email: "test@test.com", password: "123123", password_confirmation: "123123", interface: 0)
User.create!(email: "test2@test.com", password: "123123", password_confirmation: "123123", interface: 0)
User.create!(email: "test3@test.com", password: "123123", password_confirmation: "123123", interface: 1)
User.create!(email: "test4@test.com", password: "123123", password_confirmation: "123123", interface: 1)
User.create!(email: "test5@test.com", password: "123123", password_confirmation: "123123", interface: 1)
User.create!(email: "admin@test.com", password: "123123", password_confirmation: "123123", interface: nil, role: 'superadmin')

JobArea.create!(title: "Engineering")
JobArea.create!(title: "Sales and Marketing")
JobArea.create!(title: "Accounting and Finance")
JobArea.create!(title: "Information Technology")
JobArea.create!(title: "Human Resources")
JobArea.create!(title: "Legal")
JobArea.create!(title: "Logistic")
JobArea.create!(title: "Supply Chain")
JobArea.create!(title: "Procurement")
JobArea.create!(title: "Project Management")

JobType.create!(title: "full time")
JobType.create!(title: "part time")
JobType.create!(title: "temporary")
JobType.create!(title: "contract")
JobType.create!(title: "internship")
JobType.create!(title: "commission")
JobType.create!(title: "volunteer")
JobType.create!(title: "permanent")

Education.create!(title: 'GCE "O" Level or equivalent')
Education.create!(title: "Professional Qualification or Diploma")
Education.create!(title: "Bachelor's")
Education.create!(title: "Master's")
Education.create!(title: "Doctorate")

Job.create!(title: "First", job_type_id: 1, job_area_id: 1, salary_min: 500, salary_max: 1500, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 3, education_id: 1, user_id: 1, expiry_date: Time.now + 30.days)
Job.create!(title: "Second", job_type_id: 2, job_area_id: 2, salary_min: 100, salary_max: 2500, hires: 2, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 1, education_id: 2, user_id: 1, expiry_date: Time.now + 30.days)
Job.create!(title: "Interesting", job_type_id: 3, job_area_id: 3, salary_min: 1500, salary_max: 1500, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 2, education_id: 3, user_id: 1, expiry_date: Time.now + 30.days)
Job.create!(title: "Super", job_type_id: 4, job_area_id: 4, salary_min: 1500, salary_max: 3500, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 4, education_id: 4, user_id: 2, expiry_date: Time.now + 30.days)
Job.create!(title: "Nice", job_type_id: 5, job_area_id: 5, salary_min: 4500, salary_max: 5000, hires: 3, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 1, education_id: 5, user_id: 2, expiry_date: Time.now + 30.days)
Job.create!(title: "Ruby on Rails programmer", job_type_id: 1, job_area_id: 1, salary_min: 450, salary_max: 500, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 1, education_id: 2, user_id: 2, expiry_date: Time.now + 30.days)
Job.create!(title: "Rails Developer", job_type_id: 1, job_area_id: 1, salary_min: 500, salary_max: 1000, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 2, education_id: 3, user_id: 2, expiry_date: Time.now + 30.days)
Job.create!(title: "Talent Rails proger", job_type_id: 1, job_area_id: 1, salary_min: 4500, salary_max: 5000, hires: 2, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 4, education_id: 4, user_id: 2, expiry_date: Time.now + 30.days)
Job.create!(title: "Senior Ruby on Rails", job_type_id: 1, job_area_id: 1, salary_min: 14500, salary_max: 15000, hires: 1, description: "Some description", email: "seed@example.com", address: "Some Address", experience: 3, education_id: 5, user_id: 2, expiry_date: Time.now + 30.days)

Company.create!(title: "Amazon", hires_per_year: 5, name: "Bill", phone: "1234567899", country: "USA", city: "Boston", postal_code: "12345", payment_info: "PayPal", about: "We are Great company", why_join_us: "Because we Great!", website: "google.com", industry: "Some Industry", number_of_employee: 150, user_id: 1)
Company.create!(title: "Google", hires_per_year: 15, name: "Smith", phone: "1234567899", country: "Canada", city: "Toronto", postal_code: "12345", payment_info: "PayPal", about: "We are Great company", why_join_us: "Because we Great!", website: "camp.com", industry: "Some Industry", number_of_employee: 50, user_id: 2)
Company.create!(title: "NBA", hires_per_year: 25, name: "Jack", phone: "1234567899", country: "Some Coutry", city: "Some City", postal_code: "12345", payment_info: "PayPal", about: "We are Great company", why_join_us: "Because we Great!", website: "bong.com", industry: "Some Industry", number_of_employee: 15, user_id: 3)

#Resume.create!(first_name: "Bill", last_name: "Roger", user_id: 1, status: 1)

#WorkExperience.create!(job_title: "RoR Developer", resume_id: 1)

Resume.create!(first_name: "Mike", last_name: "Tison", country: "Ukraine", city: "Poltava", contact_information: "taison@gmail.com",
  phone: "0991231212", status: "public_resume", degree: "Master", school: "Technical", field_of_study: "Electromechanicl",
  education_country: "Ukraine", education_city: "Poltava", education_start_date: "2002-02-01", education_end_date: "2007-06-01",
  work_experiences_attributes: [{job_title: "System Administrator", company: "UCRF", country: "Ukraine", city: "Poltava",
    job_type_work_exp: 1, i_currently_work_here: false, start_date: "2007-06-06", end_date: "2014-12-31", years_of_experience: 7,
    less_than_one_year: false, job_description: "Good Job", salary: "400"}], desired_job_title: "RoR Developer", job_type_ids:["", "1", "2"],
  desired_salary_per_month: 2000, desired_salary_per_year: 25000, employment_eligibility: "authorized", relocation: 0,
  additional_information_step_4: "I want to find good work",
  skills_attributes: [{title: "Ruby", experience: 1}],
  certifications_attributes: [{title: "Cert", start_date: "2012-02-01", end_date: "2018-05-04", description: "Certificate"}],
  blog_url:" blog.com", personal_homepage: "personal.com", facebook: "fecebook.com", twitter: "twitter.com",
  militaries_attributes: [{service_country: "Ukraine", branch: "navi", rank: "major", start_date: "2006-05-01", end_date: "2014-03-02", i_am_currently_serving: false, description: "Army", commendations: "no"}],
  awards_attributes: [{title: "Oskar", date_awarded: "2017-06-05", description: "Best Actor"}],
  groups_attributes: [{title: "Metallica", start_date: "2001-06-04", end_date: "2018-06-23", i_am_still_a_member: true, description: "Rock"}],
  patents_attributes: [{patent_number: "patent03567", title: "Water", url: "water.com", date_awarded: "2001-01-01", description: "All water"}],
  publications_attributes: [{title: "Best article", url: "best.article.com", date_published: "2003-06-05", description: "Best Article"}],
  additional_information_step_5: "Many interesting about me", user_id: 3)

Resume.create!(first_name: "Pol", last_name: "Twen", country: "USA", city: "Boston", contact_information: "pol_twen@gmail.com",
  phone: "0441231212", status: "public_resume", degree: "Master", school: "Some one", field_of_study: "Medical",
  education_country: "USA", education_city: "Boston", education_start_date: "2005-02-01", education_end_date: "2010-06-01",
  work_experiences_attributes: [{job_title: "Administrator", company: "Amazon", country: "USA", city: "Boston",
    job_type_work_exp: 2, i_currently_work_here: true, start_date: "2014-06-06", end_date: "2018-06-23", years_of_experience: 4,
    less_than_one_year: false, job_description: "Good Job forever", salary: "4000"}], desired_job_title: "JS Developer", job_type_ids:["", "1", "2"],
  desired_salary_per_month: 8000, desired_salary_per_year: 100000, employment_eligibility: "authorized", relocation: 0,
  additional_information_step_4: "I want to find good work",
  skills_attributes: [{title: "JavaScript", experience: 4}],
  certifications_attributes: [{title: "Cert 2", start_date: "2016-02-01", end_date: "2018-05-04", description: "Certificate of earth"}],
  blog_url:" blog2.com", personal_homepage: "personal2.com", facebook: "fecebook2.com", twitter: "twitter2.com",
  militaries_attributes: [{service_country: "USA", branch: "navi", rank: "major", start_date: "2009-05-01", end_date: "2016-03-02", i_am_currently_serving: false, description: "Army2", commendations: "many"}],
  awards_attributes: [{title: "Oskar2", date_awarded: "2017-09-05", description: "Best Music"}],
  groups_attributes: [{title: "Some group", start_date: "2011-06-04", end_date: "2015-06-23", i_am_still_a_member: false, description: "Proramming"}],
  patents_attributes: [{patent_number: "patent044559877", title: "Some title", url: "some.url.com", date_awarded: "2011-01-01", description: "Some description"}],
  publications_attributes: [{title: "Best article 2", url: "best2.article.com", date_published: "2013-06-05", description: "Best Article ever"}],
  additional_information_step_5: "Many interesting about me and more", user_id: 4)

Resume.create!(first_name: "Some name", last_name: "Good", country: "Poland", city: "Warshava", contact_information: "cool_boss@gmail.com",
  phone: "0321231212", status: "private_resume", degree: "Master", school: "Some two", field_of_study: "Some",
  education_country: "Some country", education_city: "some city", education_start_date: "2003-02-01", education_end_date: "2011-06-01",
  work_experiences_attributes: [{job_title: "Great worker", company: "Google", country: "USA", city: "Some city",
    job_type_work_exp: 4, i_currently_work_here: true, start_date: "2013-06-06", end_date: "2018-06-23", years_of_experience: 5,
    less_than_one_year: false, job_description: "Good Job forever and more", salary: "5000"}], desired_job_title: "Best Job", job_type_ids:["", "1"],
  desired_salary_per_month: 6000, desired_salary_per_year: 72000, employment_eligibility: "authorized", relocation: 1,
  additional_information_step_4: "I want to find good work",
  skills_attributes: [{title: "Some skill", experience: 2}, {title: "Some other skill", experience: 4}],
  certifications_attributes: [{title: "Cert 4", start_date: "2017-02-01", end_date: "2018-09-04", description: "Certificate of everything"}],
  blog_url:" blog3.com", personal_homepage: "personal3.com", facebook: "fecebook3.com", twitter: "twitter3.com",
  additional_information_step_5: "Many interesting about me and more and more", user_id: 5)
