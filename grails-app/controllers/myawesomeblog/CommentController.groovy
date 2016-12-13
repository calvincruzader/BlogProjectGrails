package myawesomeblog

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

    @Transactional
    def saveComment() {
      Post blogpost = Post.findByTitle(params.title)
      if (params.author != null && params.body != null) {
        blogpost.addToComments(new Comment(author:params.author,body:params.body)).save()
      }
      render(view:"Show", model: [id: blogpost.id])
    }
}
