feature 'entering names' do
  scenario 'when names entered they are displayed on screen' do
    sign_in_and_play
    expect(page).to have_content 'Ben vs. Hamid'
  end

  feature 'display HP' do
    scenario 'display player2 HP' do
      sign_in_and_play
      expect(page).to have_content 'Hamid: 100HP'
    end
  end

  feature 'attack player' do
    scenario 'player 1 attacks player 2' do
      sign_in_and_play
      click_button "Attack"
      expect(page).to have_content 'Ben attacked Hamid'
    end
  end
end