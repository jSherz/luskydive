class MembersController < ApplicationController
  def index
    @committee = CommitteeMember.all.order('-weighting')
  end
end
