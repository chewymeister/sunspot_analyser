class Locator
  def assign_sunspot_neighbours(sunspots)
    #includes itself as its coords are within range specified
    @sunspots = sunspots
    @sunspots.each { |sunspot| sunspot.set(neighbours_at(sunspot.coords)) }
  end

  def neighbours_at(coords)
    @sunspots.select { |sunspot| in_range?(coords, sunspot.coords) }
  end

  def in_range?(coords, candidate_coords)
    neighbours?(:x, candidate_coords, coords) && neighbours?(:y, candidate_coords, coords)
  end

  def neighbours?(axis, candidate_coords, coords)
    ((coords[axis] - 1)..(coords[axis] + 1)).include?(candidate_coords[axis])
  end
end
