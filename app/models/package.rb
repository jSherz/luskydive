class Package < ActiveRecord::Base
  default_scope { where active: true }
  default_scope { order weighting: :desc }

  # TODO: Add validation
  has_paper_trail
end
