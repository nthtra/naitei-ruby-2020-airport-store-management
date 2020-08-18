class DenyContractService
  def initialize contract_id, message
    @contract = Contract.find_by id: contract_id
    @store = Store.find_by id: @contract.store_id
    @slot = Slot.find_by id: @store.slot_id
    @message = message
  end

  def perform
    deny_contract
  end

  attr_reader :contract, :store, :slot, :message, :error

  private

  def deny_contract
    ActiveRecord::Base.transaction do
      if store.is_active
        store_update = true
        update_store_slot
      end
      if store_update &&
         (store.is_active != false || slot.is_empty != true)
        raise ActiveRecord::Rollback
      end

      update_contract
    end
    check_error error
  end

  def update_store_slot
    store.update! is_active: false
    slot.update! is_empty: true
  end

  def update_contract
    contract.update! status_id: Settings.status.deny
    contract.update! deny_message: message

    if contract.status_id != Settings.status.deny ||
       contract.deny_message != message
      raise ActiveRecord::Rollback
    end
  end

  def check_error error
    if error
      :update_database_false
    else
      :deny_successfully
    end
  end
end
