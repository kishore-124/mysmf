class ApplicationMailbox < ActionMailbox::Base
  #routing /^save@/i     => :forwards
  #routing /@replies\./i => :replies
end
