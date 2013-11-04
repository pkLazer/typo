Given /I am signed in as "(.*)" with password "(.*)"/ do |user, pass|
  visit "/accounts/login"
  within(".login") do
    fill_in("user_login", :with => user)
    fill_in("user_password", :with => pass)
  end
  click_button "Login"
  assert page.has_content?("Login successful")
end

Given /articles "(.*)" and "(.*)" were merged/ do |id1, id2|
  art = Article.find_by_id(id1)
  art.merge_with(id2)
end

And /I am on the edit page for an article with id "(.*)"/ do |id|
  art = Article.find_by_id(id)
  visit "/admin/content/edit/#{id}"
end


Given /the following (.*) exist:/ do |element, table|
  table.hashes.each do |item|
    if element == "users" then User.create!(item)
    elsif element == "articles" then Article.create!(item)
    end
  end
end
