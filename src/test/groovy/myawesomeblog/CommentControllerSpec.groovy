package myawesomeblog

import grails.test.mixin.*
import spock.lang.*

@Mock([Comment, Post])
@TestFor(CommentController)
class CommentControllerSpec extends Specification {

  void setupSpec() {
    mockDomain(Post)
    Post post = new Post([title: "Title of a blogpost", body: "content of the blogpost", author: "CalvinCruzader", dateCreated: new Date()])
    post.save(flush: true)
    Comment comment = new Comment()
  }

  void "saveComment() saves a single comment"() {
    params["title"] = "Title of a blogpost"
    params["body"] = "content of a comment"
    params["author"] = "CalvinCruzader"
    params["dateCreated"] = new Date()

    controller.saveComment()
    def blogpost = Post.findByTitle(params.title)

    expect:
      blogpost.comments.size() == 1
      blogpost.comments[0].body == "content of a comment"
  }
}
