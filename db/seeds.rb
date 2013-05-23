def seed_users
  5.times do |n|
    first = Faker::Name.first_name
    User.create(first_name: first, last_name: Faker::Name.last_name, username: first, password: first, email: Faker::Internet.email)
  end
end

def seed_posts
  post_title = ['Hi there', 'Batman', 'Cowboy']
  posts = ["asdf;lkjasdf;lkjasdflkjasdfl;kjasdf asdl;fkjadsflkjsadfl;kjsadflkjasdf j;lsadfl;kdsfl;kjasdf", Faker::Lorem.paragraphs, "poqiweurpoiuqewrpoiuqwerpoiu qweropiuqewrpoiuqewropiuqewriu weqrpoiuqwerpoiuqewrpoiiu qweroiuqwerpoiuqwerpppoiuwqer", Faker::Lorem.paragraphs, "cvkncbkjhdfgkjhdgkjdhgkdjhg dkjhg kjdhfg kjdfsgkjh dsgfkl kjlh dsfjkhgiulergeurt kjlsdgh kjdfsgliuhriugkjdfhg liudhgf ihril udfguhdirsuhg idsurgiu drhg ildurhg iludhf  afd" ]

  posts.each do |p|
    User.all.sample.posts << Post.create(title: post_title.sample, content: p)
  end
end

def seed_comments
  comments = ["heythyehrheytheytheytyeht", "wowowowowowowowowowowowowow", "lwolololololololololoololololololol", 'yolo', 'omg']

  comments.each do |c|
    com = Comment.create(content: c)
    Post.all.sample.comments << com
    User.all.sample.comments << com
  end
end

seed_users
seed_posts
seed_comments
