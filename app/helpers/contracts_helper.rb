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

  def modify_action id
    array = []
    case id
    when Settings.status.pending
      array.push(Settings.status.approve)
      array.push(Settings.status.deny)
    when Settings.status.approve
      array.push(Settings.status.deny)
    when Settings.status.deny
      array.push(Settings.status.pending)
      array.push(Settings.status.approve)
    when Settings.status.expire
      array.push(Settings.status.approve)
      array.push(Settings.status.deny)
    end
    array
  end

  def convert_id_to_name id
    case id
    when Settings.status.pending
      :pending
    when Settings.status.approve
      :approve
    when Settings.status.deny
      :deny
    when Settings.status.expire
      :expire
    end
  end
end
