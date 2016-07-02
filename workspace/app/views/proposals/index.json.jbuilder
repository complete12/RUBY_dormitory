json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :p_category, :p_answer, :p_title, :p_content
  json.url proposal_url(proposal, format: :json)
end
