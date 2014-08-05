require 'spec_helper'

feature 'User manages todos' do
  background do
    @current_user = User.create! do |user|
      user.email = 'vik.froberg@gmail.com'
      user.password = 'password'
    end
    login_as(@current_user)
    @project = @current_user.projects.create!(name: 'Meta')
    @task = @project.tasks.create!(title: 'Todos')
  end

  scenario 'User create todo', js: true do
    visit project_task_path @project, @task

    fill_in 'todo_content', :with => 'Write tests'
    click_button 'Add todo'

    within '#todos' do
      expect(page).to have_content 'Write tests'
    end
  end

  scenario 'User complete todo', js: true do
    visit project_task_path @project, @task
    fill_in 'todo_content', :with => 'Write tests'
    click_on 'Add todo'

    todo_element = page.find('.todo-incompleted', :text => 'Write tests')
    within todo_element do
      find('.todo-complete').click
    end

    expect(page).not_to have_content('Write tests')
  end

end
