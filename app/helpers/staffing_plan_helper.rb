module StaffingPlanHelper
  def populate(value)
    value.present? ? value : "0"
  end

  def offshore_amount_billed(plan)
    plan.offshore_rate.to_i * plan.no_of_pm_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_ba_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_dev_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_qa_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_ux_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_ui_offshore.to_i +
    plan.offshore_rate.to_i * plan.no_of_cp_offshore.to_i
  end

  def onsite_amount_billed(plan)
    plan.onsite_rate.to_i * plan.no_of_pm_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_ba_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_dev_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_qa_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_ux_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_ui_onsite.to_i +
    plan.onsite_rate.to_i * plan.no_of_cp_onsite.to_i
  end

  def cumulative_offshore_amount_billed(plans, index)
    return offshore_amount_billed(plans[index]) if index == 0
    cumulative_amount = 0
    index.downto(0).each do |i|
      cumulative_amount += offshore_amount_billed(plans[i])
    end
    cumulative_amount  
  end

  def cumulative_onsite_amount_billed(plans, index)
    return onsite_amount_billed(plans[index]) if index == 0
    cumulative_amount = 0
    index.downto(0).each do |i|
      cumulative_amount += onsite_amount_billed(plans[i])
    end
    cumulative_amount
  end

  def offshore_velocity(plan)
    plan.offshore_velocity.to_i * (plan.no_of_dev_offshore.to_i / 2)
  end

  def cumulative_offshore_velocity(plans, index)
    return offshore_velocity(plans[index]) if index == 0
    cumulative_velocity = 0
    index.downto(0).each do |i|
      cumulative_velocity += offshore_velocity(plans[i])
    end
    cumulative_velocity
  end

  def onsite_velocity(plan)
    plan.onsite_velocity.to_i * (plan.no_of_dev_onsite.to_i / 2)
  end

  def cumulative_onsite_velocity(plans, index)
    return onsite_velocity(plans[index]) if index == 0
    cumulative_velocity = 0
    index.downto(0).each do |i|
      cumulative_velocity += onsite_velocity(plans[i])
    end
    cumulative_velocity
  end

  def total_velocity(plans, index)
    return offshore_velocity(plans[index]) + onsite_velocity(plans[index]) if index == 0
    cumulative_velocity = 0
    index.downto(0).each do |i|
      cumulative_velocity += offshore_velocity(plans[i]) + onsite_velocity(plans[i])
    end
    cumulative_velocity
  end

  def total_cost(plans, index)
    return offshore_amount_billed(plans[index]) + onsite_amount_billed(plans[index]) if index == 0
    cumulative_amount = 0
    index.downto(0).each do |i|
      cumulative_amount += offshore_amount_billed(plans[i]) + onsite_amount_billed(plans[i])
    end
    cumulative_amount
  end
end
