class CommitteeMember < ActiveRecord::Base
  # TODO: Add validation
  # TOOD: Allow uploads of new committee photos
  has_paper_trail
end
