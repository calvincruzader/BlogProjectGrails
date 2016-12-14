When(/^I visit the blog for my favorite blogger$/) do
  visit_page Blog_Home
  on_page Blog_Home do |page|
     page.goto_login
  end
  on_page Login do |page|
    page.username = "user"
    page.password = "user"
    page.login
  end
end

When(/^I choose a blog post$/) do
  on_page Blog_Home do |page|
    sleep 2
    @blog_portion = page.blog_preview
    page.choose_blog_post
  end
end
