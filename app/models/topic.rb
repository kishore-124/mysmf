class Topic < ApplicationRecord

  #===============validations==========
  validates_presence_of :name

  #=================associatations==============
  has_rich_text :content

  #callbacks
  after_create_commit {broadcast_prepend_to 'topics'}
  after_update_commit {broadcast_replace_to 'topics'}
  after_destroy_commit {broadcast_remove_to 'topics'}
end
