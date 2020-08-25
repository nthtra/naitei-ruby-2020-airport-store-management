module SlotsHelper
  def modify_slot_status status
    case status
    when true
      :empty
    when false
      :not_empty
    end
  end
end
