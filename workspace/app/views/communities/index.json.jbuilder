json.array!(@communities) do |community|
  json.extract! community, :id, :com_category, :com_title, :com_content, :com_writer, :com_hits
  json.url community_url(community, format: :json)
end
