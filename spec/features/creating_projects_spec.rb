require "rails_helper"
RSpec.feature "Create new project" do
	before do 
		visit root_path
        click_link "New Project"
	end
  scenario "creating new Project" do
    visit root_path
    click_link "New Project"
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor for everyone"
    click_button "Create Project"
    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project)

    title = "Sublime Text 3 - Projects - OSSTicket"
    expect(page).to have_title title
  end
end