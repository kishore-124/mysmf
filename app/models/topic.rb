class Topic < ApplicationRecord
  validates_presence_of :name

  after_create_commit {broadcast_prepend_to 'topics'}
  after_update_commit {broadcast_replace_to 'topics'}
  after_destroy_commit {broadcast_remove_to 'topics'}
end
