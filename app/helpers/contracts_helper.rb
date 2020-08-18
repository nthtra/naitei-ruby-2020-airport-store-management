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

  def modify_contract_action status_id
    contract_actions = []
    case status_id
    when Settings.status.pending
      contract_actions.push(Settings.status.approve)
      contract_actions.push(Settings.status.deny)
    when Settings.status.approve
      contract_actions.push(Settings.status.deny)
    when Settings.status.deny
      contract_actions.push(Settings.status.approve)
    end
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
