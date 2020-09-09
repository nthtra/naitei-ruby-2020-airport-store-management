class Ability
  include CanCan::Ability

  def initialize employee
    employee ||= Employee.new

    if employee.manager?
      can :manage, [Contract, Slot]
    elsif employee.admin?
      can :manage, :all
    elsif employee.employee?
      can :read, [Slot]
    end
  end
end
