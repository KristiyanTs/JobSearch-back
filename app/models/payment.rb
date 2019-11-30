class Payment < ApplicationRecord
  belongs_to :membership, optional: true

  enum month: [:january, :february, :march, :april, :may, :june, :july, 
               :august, :september, :october, :november, :december]

  def attach_info
    as_json.merge(
      student: membership.user,
      group: membership.group
    )
  end
end
