class MembersController < ApplicationController
  def index
    @committee = CommitteeMember.all.order :weighting, order: :DESC
  end
end
