class StatisticsController < ApplicationController
  def update
    @statistic = Statistic.find(params[:id])

    @statistic.update(statistic_params)
    redirect_to @statistic.character
  end

  private

  def statistic_params
    params.require(:statistic).permit(:added_strength, :added_dexterity, :added_stamina, :added_initiative)
  end
end