module EggHelper
  def badge_color(egg)
    if egg.difficulty == "medium"
      "green"
    else
      "orange"
    end
  end
end
