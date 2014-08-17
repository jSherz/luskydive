class MembersController < ApplicationController
  def index
    @committee = CommitteeMember.all
  end
end
