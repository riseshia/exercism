defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
  @earth_year_to_seconds 365.25 * 60 * 60 * 24

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: relative_age(seconds, 1)
  def age_on(:mercury, seconds), do: relative_age(seconds, 0.2408467)
  def age_on(:venus, seconds), do: relative_age(seconds, 0.61519726)
  def age_on(:mars, seconds), do: relative_age(seconds, 1.8808158)
  def age_on(:jupiter, seconds), do: relative_age(seconds, 11.862815)
  def age_on(:saturn, seconds), do: relative_age(seconds, 29.447498)
  def age_on(:uranus, seconds), do: relative_age(seconds, 84.016846)
  def age_on(:neptune, seconds), do: relative_age(seconds, 164.79132)
  def age_on(_planet, _seconds) do
    raise "Not supported"
  end

  defp relative_age(seconds, earth_years) do
    seconds / (earth_years * @earth_year_to_seconds)
  end
end
