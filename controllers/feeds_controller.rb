class Rstatus

  # We do have to provide a rendered feed to the hub, and this controller does
  # it. Publishers will also view a feed in order to verify their subscription.
  get "/feeds/:id.atom" do
    content_type "application/atom+xml"

    feed = Feed.first :id => params[:id]

    # XXX: wilkie needs to handle this.
    # I'm baleeting his commented out code, because that's what `git` is for.
    if params['hub.challenge']
<<<<<<< HEAD
      #sub = OSub::Subscription.new(request.url, feed.url, nil, feed.verify_token)

      # perform the hub's challenge
      #respond = sub.perform_challenge(params['hub.challenge'])

      # verify that the random token is the same as when we
      # subscribed with the hub initially and that the topic
      # url matches what we expect
=begin
      if verified and sub.verify_subscription(params['hub.verify_token'])
        if development?
          puts "Verified"
        end
        body respond[:body]
        status respond[:status]
      else
        if development?
          puts "Verification Failed"
        end
=end
        # if the verification fails, the specification forces us to
        # return a 404 status
        status 404
      #end
=======
      status 404
>>>>>>> 8bfe77a2d47af2358a7159f1318213f4d7b50707
    else
      # XXX: Abide by headers that supply cache information
      body feed.atom(uri("/"))
    end
  end

end
