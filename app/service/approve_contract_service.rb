class ApproveContractService
  def initialize contract_id
    @contract = Contract.find_by id: contract_id
    @store = Store.find_by id: @contract.store_id
    @slot = Slot.find_by id: @store.slot_id
  end

  def perform
    approve_contract
  end

  attr_reader :contract, :store, :slot, :error

  private

  def approve_contract
    if slot.is_empty
      ActiveRecord::Base.transaction do
        update_contract
        if store.is_active != true ||
           slot.is_empty != false ||
           contract.status_id != Settings.status.approve ||
           contract.deny_message != ""
          raise ActiveRecord::Rollback
        end
      end
      check_error error
    else
      :slot_is_full
    end
  end

  def update_contract
    store.update! is_active: true
    slot.update! is_empty: false
    contract.update! status_id: Settings.status.approve
    contract.update! deny_message: ""
  end

  def check_error error
    if error
      :update_database_false
    else
      :approve_successfully
    end
  end
end
