feature 'entering names' do
  scenario 'when names entered they are displayed on screen' do
    visit('/')
    fill_in :player1, with: "Ben"
    fill_in :player2, with:"Hamid"
    click_button "Submit"
    expect(page).to have_content 'Ben Hamid'
  end
end