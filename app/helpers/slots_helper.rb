module SlotsHelper
  def modify_slot_status status
    case status
    when true
      :empty
    when false
      :not_empty
    end
  end

  def find_store_by_slot_id id
    @store_of_slot = Store.find_by slot_id: id
  end
end
