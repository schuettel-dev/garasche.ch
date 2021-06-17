class OpeningHoursComponent < ViewComponent::Base
  def open?
    opening_hours.include?(todays_key)
  end

  def opening_hours_sentence
    opening_hours[todays_key].map(&method(:from_to_sentence)).join(' and from ')
  end

  private

  def from_to_sentence(from_to)
    "#{from_to[:from]} to #{from_to[:to]}"
  end

  def opening_hours
    {
      tuesday: [{ from: '16:00', to: '00:00' }],
      wednesday: [{ from: '16:00', to: '00:00' }],
      thursday: [{ from: '11:30', to: '14:00' }, { from: '16:00', to: '00:00' }],
      friday: [{ from: '11:30', to: '02:00' }],
      saturday: [{ from: '09:00', to: '02:00' }]
    }
  end

  def todays_key
    Time.zone.now.strftime('%A').downcase.to_sym
  end
end
