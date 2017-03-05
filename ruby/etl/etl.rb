module ETL
  module_function

  def transform(old)
    old.each_with_object({}) do |(key, els), obj|
      els.each_with_object(obj) { |el, obj| obj[el.downcase] = key }
    end
  end
end
