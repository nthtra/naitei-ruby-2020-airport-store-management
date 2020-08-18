module ContractsHelper
  def modify_label_color status
    case status
    when Settings.status.pending
      :warning
    when Settings.status.approve
      :success
    when Settings.status.deny
      :danger
    when Settings.status.expire
      :dark
    end
  end
end
