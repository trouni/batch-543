class CookbookHelper
  def initialize(params = {})
    @file_name = params[:file_name]
    @class_name = params[:class_name]
  end

  def file_exists?
    File.exists?("#{__dir__}/../lib/#{@file_name}.rb")
  end

  def class_defined?
    Object.const_defined?(@class_name)
  end

  def file_and_class_valid?
    file_exists? && class_defined?
  end
end
