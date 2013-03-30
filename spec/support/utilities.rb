def full_title(page_title)
  base_title = "Pahths"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in (user)
   visit login_path
   fill_in "Email",    with: user.email.upcase
   fill_in "Password", with: user.password
   click_button "Submit"
end  
