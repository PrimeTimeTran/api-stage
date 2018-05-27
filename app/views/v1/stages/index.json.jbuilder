# frozen_string_literal: true

json.call(@stages) do |stage|
  json.id stage.id
  json.name stage.name
end
