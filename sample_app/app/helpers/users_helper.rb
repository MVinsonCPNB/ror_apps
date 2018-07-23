module UsersHelper

    # Returns the Gravatar for the given user.
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
       # (ABOVE) Gravatar URLs are based on MD5 hash of the users's email
       # address.  Gravatar is a free service that allows users to upload
       # images and associate them with eamil addresses they control.
       # Gravatars are a convenient way to include user profile images 
       # without going throught the trouble of managing image upload,
       # cropping, and storage */
end
