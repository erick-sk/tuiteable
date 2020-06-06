module TuitsHelper
  #def like_form (tuit, user)
    #if Like.where(tuit: tuit, user: user).exits?
      #<form action=tuit_likes_path(tuit.id) method=post>
        #<button class="button-like" type= submit>
         # <i class="far fa-heart" aria-hidden="true"></i>
         # <label class="tuit-numeric"><%= tuit.like_count %></label>
        #</button>
      #</form>
    #end  
  #end
end
