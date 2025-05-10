class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def formatted_created_date
    created_at.strftime("%d.%m.%Y")
  end

  def formatted_updated_date
    updated_at.strftime("%d.%m.%Y")
  end

  def formatted_created_time
    created_at.strftime("%H:%M")
  end

  def formatted_updated_time
    updated_at.strftime("%H:%M")
  end
end
