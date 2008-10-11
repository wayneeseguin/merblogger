def random_time(start_time, end_time)
  Time.at((start_time.to_i..end_time.to_i).pick)
end

Comment.fixture{{
  :title =>  /[:sentence:]/.generate,
  :raw => (3..(4+rand(5))).of { /[:paragraph:]/.generate }.join("\n\n"),
  :markup => "textile",
  :html => raw,
  :email => /[:word:]@[:word:].com/.generate
}}

Article.fixture{{
  :title =>  /[:sentence:]/.generate,
  :sub_title =>  /[:sentence:]/.generate,
  :raw => (3..(4+rand(5))).of { /[:paragraph:]/.generate }.join("\n\n"),
  :markup => "textile",
  :html => raw,
  :slug => /[:word:]/,
  :state => %w(draft preview published)[rand(3)],
  :created_at => random_time(Time.now - 2.years, Time.now - 1.years),
  :updated_at => random_time(Time.now - 1.year, Time.now),
  :comments => (0..rand(10)).of {Comment.generate}
}}

Blog.fixture{{
   :name => /[:word:]/.generate,
   :title =>  /[:sentence:]/.generate,
   :tagline => /[:sentence:]/.generate,
   :created_at => random_time(Time.now - 2.years, Time.now - 1.years),
   :updated_at => random_time(Time.now - 1.year, Time.now),
   :articles => (0..rand(10)).of {Article.generate}
}}

blogs = 10.of { Blog.generate }
