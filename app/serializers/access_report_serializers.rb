class AccessReportSerializers
  def self.call
    new.call
  end

  def call
    accesses_ordered
  end

  private

  def accesses_to_json
    json_result = []

    accesses_grouped.keys.each_with_index do |key, index|
      json_result << accesses_grouped[key].each do |a|
        a.merge!({ "user": (index + 1)})
      end
    end

    json_result
  end

  def accesses_ordered
    accesses_to_json.flatten.sort do |a, b|
      b['created_at'] <=> a['created_at']
    end
  end

  def accesses_grouped
    Access.order(created_at: :desc).last(50).group_by(&:uuid).as_json
  end
end
