# Relationship:
#   <blogs> >=< <configurations_blogs> >=< <configurations>
class Configuration < Sequel::Model(:configurations)
  set_schema do
    primary_key   :id
    varchar       :key
    varchar       :value
  end
end