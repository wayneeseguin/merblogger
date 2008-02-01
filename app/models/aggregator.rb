# An aggregator simply selects articles based on conditions.
#
# Example Blog relationship:
#
# Blizzard Games Aggregator # domain.tld
# -> Blizzard Company Blog  # company.domain.tld
# -> Starcraft              # starcraft.domain.tld or starcraftdomain.tld
# -> Diablo                 # diablo.domain.tld or diablodomain.tld
# -> Warcraft               # warcraft.domain.tld or warcraftdomain.tld
#
# The aggregator blog is aggregating based on user (company) owend blogs

# meta-blogs :) 
# we need to track 'selection criteria' for the aggregator.
# eg rules for which the aggregator selects it's article set.
# Note: blogs do not discriminate on articles, it is predetermined which set of articles belongn to a blog.

# It will have
#   rules for blogs - based on which blogs are selected for the user's accessable set
#     ^ will be simply a string of id's I believe. Just store what blog id's were selected.
#   rules for articles - based on whatever criteria we can come up with to allow them to specify / select from 
# TBD (but I'm thinking we'll create rule objects and combine them somehow.)
require "sequel"
require "sequel_model"
class Aggregator < Sequel::Model(:aggregators)
  set_schema do
    primary_key :id
    varchar     :name
    varchar     :title
    varchar     :tagline
    timestamp   :created_at
    timestamp   :updated_at
  end
end
