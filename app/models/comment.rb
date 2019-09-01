class Comment < ApplicationRecord
  has_ancestry
  belongs_to :user
  belongs_to :node

  def attributes
    { 
      id: id, 
      user: user,
      content: content,
      created_at: created_at,
      updated_at: updated_at,
      ancestry: ancestry,
      node_id: node_id
    }
  end

  def has_replies
    as_json.merge(
      has_replies: children.any?
    )
  end
end
