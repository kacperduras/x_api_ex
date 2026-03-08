defmodule XApiEx.Fixtures do
  @moduledoc """
  JSON response fixtures for API tests.
  """

  # Generic error responses
  @doc "Returns a JSON 401 unauthorized error response."
  def unauthorized_response do
    ~s({"errors":[{"message":"Unauthorized","code":32}]})
  end

  @doc "Returns a JSON 429 rate limit exceeded error response."
  def rate_limit_response do
    ~s({"errors":[{"message":"Rate limit exceeded","code":88}]})
  end

  @doc "Returns a JSON 400 bad request error response."
  def bad_request_response do
    ~s({"errors":[{"message":"Invalid Request","code":400}]})
  end

  # Post responses
  @doc "Returns a JSON 200 response for a newly created post. Accepts optional id and text."
  def create_post_200(id \\ "1234567890", text \\ "Hello world") do
    ~s({"data":{"id":"#{id}","text":"#{text}"}})
  end

  @doc "Returns a JSON 200 response for a deleted post. Accepts an optional id."
  def delete_post_200(id \\ "1234567890") do
    ~s({"data":{"deleted":true,"id":"#{id}"}})
  end

  @doc "Returns a JSON 200 response for a single post with edit history. Accepts optional id and text."
  def single_post_200(id \\ "1234567890", text \\ "Test post") do
    ~s({"data":{"id":"#{id}","text":"#{text}","edit_history_tweet_ids":["#{id}"]}})
  end

  @doc "Returns a JSON 200 response containing two posts."
  def multiple_posts_200 do
    ~s({"data":[{"id":"111","text":"Post 1","edit_history_tweet_ids":["111"]},{"id":"222","text":"Post 2","edit_history_tweet_ids":["222"]}]})
  end

  # User responses
  @doc "Returns a JSON 200 response for a single user looked up by ID. Accepts optional id, name, and username."
  def user_by_id_200(id \\ "987654321", name \\ "Test User", username \\ "testuser") do
    ~s({"data":{"id":"#{id}","name":"#{name}","username":"#{username}"}})
  end

  @doc "Returns a JSON 200 response for a single user looked up by username. Accepts optional id, name, and username."
  def user_by_username_200(id \\ "987654321", name \\ "Test User", username \\ "testuser") do
    ~s({"data":{"id":"#{id}","name":"#{name}","username":"#{username}"}})
  end

  @doc "Returns a JSON 200 response containing two users looked up by ID."
  def users_by_id_200 do
    ~s({"data":[{"id":"111","name":"User One","username":"userone"},{"id":"222","name":"User Two","username":"usertwo"}]})
  end

  @doc "Returns a JSON 200 response containing one user looked up by username."
  def users_by_username_200 do
    ~s({"data":[{"id":"111","name":"User One","username":"userone"}]})
  end

  @doc "Returns a JSON 200 response for the authenticated user. Accepts optional id, name, and username."
  def authenticated_user_200(id \\ "12345", name \\ "Me", username \\ "me") do
    ~s({"data":{"id":"#{id}","name":"#{name}","username":"#{username}"}})
  end

  # Follows
  @doc "Returns a JSON 200 response for successfully following a user."
  def follow_user_200 do
    ~s({"data":{"following":true,"pending_follow":false}})
  end

  @doc "Returns a JSON 200 response for successfully unfollowing a user."
  def unfollow_user_200 do
    ~s({"data":{"following":false}})
  end

  @doc "Returns a JSON 200 response listing followers of a user."
  def follower_lookup_200 do
    ~s({"data":[{"id":"111","name":"Follower","username":"follower"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response listing users that a user is following."
  def following_lookup_200 do
    ~s({"data":[{"id":"222","name":"Following","username":"following"}],"meta":{"result_count":1}})
  end

  # Likes
  @doc "Returns a JSON 200 response for liking a post."
  def like_post_200 do
    ~s({"data":{"liked":true}})
  end

  @doc "Returns a JSON 200 response for unliking a post."
  def unlike_post_200 do
    ~s({"data":{"liked":false}})
  end

  @doc "Returns a JSON 200 response listing users who liked a post."
  def liking_users_200 do
    ~s({"data":[{"id":"111","name":"Liker","username":"liker"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response listing posts liked by a user."
  def liked_posts_200 do
    ~s({"data":[{"id":"111","text":"Liked post","edit_history_tweet_ids":["111"]}],"meta":{"result_count":1}})
  end

  # Reposts
  @doc "Returns a JSON 200 response for reposting a post."
  def repost_200 do
    ~s({"data":{"retweeted":true}})
  end

  @doc "Returns a JSON 200 response for undoing a repost."
  def undo_repost_200 do
    ~s({"data":{"retweeted":false}})
  end

  @doc "Returns a JSON 200 response listing users who reposted a post."
  def reposters_200 do
    ~s({"data":[{"id":"111","name":"Reposter","username":"reposter"}],"meta":{"result_count":1}})
  end

  # Bookmarks
  @doc "Returns a JSON 200 response for bookmarking a post."
  def bookmark_post_200 do
    ~s({"data":{"bookmarked":true}})
  end

  @doc "Returns a JSON 200 response for removing a bookmark."
  def remove_bookmark_200 do
    ~s({"data":{"bookmarked":false}})
  end

  @doc "Returns a JSON 200 response listing bookmarked posts for a user."
  def bookmarked_posts_200 do
    ~s({"data":[{"id":"111","text":"Bookmarked","edit_history_tweet_ids":["111"]}],"meta":{"result_count":1}})
  end

  # Blocks
  @doc "Returns a JSON 200 response for blocking a user."
  def block_user_200 do
    ~s({"data":{"blocking":true}})
  end

  @doc "Returns a JSON 200 response for unblocking a user."
  def unblock_user_200 do
    ~s({"data":{"blocking":false}})
  end

  @doc "Returns a JSON 200 response listing users blocked by a given user."
  def blocks_lookup_200 do
    ~s({"data":[{"id":"111","name":"Blocked","username":"blocked"}],"meta":{"result_count":1}})
  end

  # Mutes
  @doc "Returns a JSON 200 response for muting a user."
  def mute_user_200 do
    ~s({"data":{"muting":true}})
  end

  @doc "Returns a JSON 200 response for unmuting a user."
  def unmute_user_200 do
    ~s({"data":{"muting":false}})
  end

  @doc "Returns a JSON 200 response listing users muted by a given user."
  def mutes_lookup_200 do
    ~s({"data":[{"id":"111","name":"Muted","username":"muted"}],"meta":{"result_count":1}})
  end

  # Lists
  @doc "Returns a JSON 201 response for a newly created list."
  def create_list_201 do
    ~s({"data":{"id":"list123","name":"Test List"}})
  end

  @doc "Returns a JSON 200 response for a successfully updated list."
  def update_list_200 do
    ~s({"data":{"updated":true}})
  end

  @doc "Returns a JSON 200 response for a successfully deleted list."
  def delete_list_200 do
    ~s({"data":{"deleted":true}})
  end

  @doc "Returns a JSON 200 response for a single list looked up by ID."
  def list_lookup_200 do
    ~s({"data":{"id":"list123","name":"Test List"}})
  end

  @doc "Returns a JSON 200 response listing lists owned by a user."
  def lists_by_user_200 do
    ~s({"data":[{"id":"list123","name":"Test List"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response listing members of a list."
  def list_members_200 do
    ~s({"data":[{"id":"111","name":"Member","username":"member"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response for adding a member to a list."
  def add_member_200 do
    ~s({"data":{"is_member":true}})
  end

  @doc "Returns a JSON 200 response for removing a member from a list."
  def remove_member_200 do
    ~s({"data":{"is_member":false}})
  end

  @doc "Returns a JSON 200 response listing followers of a list."
  def list_followers_200 do
    ~s({"data":[{"id":"111","name":"Follower","username":"follower"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response for following a list."
  def follow_list_200 do
    ~s({"data":{"following":true}})
  end

  @doc "Returns a JSON 200 response for unfollowing a list."
  def unfollow_list_200 do
    ~s({"data":{"following":false}})
  end

  @doc "Returns a JSON 200 response listing posts from a list timeline."
  def list_posts_200 do
    ~s({"data":[{"id":"111","text":"List post","edit_history_tweet_ids":["111"]}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response listing pinned lists for a user."
  def pinned_lists_200 do
    ~s({"data":[{"id":"list123","name":"Pinned List"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response for pinning a list."
  def pin_list_200 do
    ~s({"data":{"pinned":true}})
  end

  @doc "Returns a JSON 200 response for unpinning a list."
  def unpin_list_200 do
    ~s({"data":{"pinned":false}})
  end

  # Hide replies
  @doc "Returns a JSON 200 response for hiding a reply."
  def hide_reply_200 do
    ~s({"data":{"hidden":true}})
  end

  # Search
  @doc "Returns a JSON 200 response for a post search result with one matching post."
  def search_posts_200 do
    ~s({"data":[{"id":"111","text":"Search result","edit_history_tweet_ids":["111"]}],"meta":{"newest_id":"111","oldest_id":"111","result_count":1}})
  end

  # Timelines
  @doc "Returns a JSON 200 response listing a user's timeline posts."
  def user_timeline_200 do
    ~s({"data":[{"id":"111","text":"Timeline post","edit_history_tweet_ids":["111"]}],"meta":{"newest_id":"111","oldest_id":"111","result_count":1}})
  end

  # Post counts
  @doc "Returns a JSON 200 response for post counts aggregated over a time interval."
  def post_counts_200 do
    ~s({"data":[{"start":"2024-01-01T00:00:00.000Z","end":"2024-01-02T00:00:00.000Z","tweet_count":5}],"meta":{"total_count":5}})
  end

  # Quote posts
  @doc "Returns a JSON 200 response listing quote posts for a given post."
  def quote_posts_200 do
    ~s({"data":[{"id":"111","text":"Quote post","edit_history_tweet_ids":["111"]}],"meta":{"result_count":1}})
  end

  # Spaces
  @doc "Returns a JSON 200 response for a single Space looked up by ID."
  def space_lookup_200 do
    ~s({"data":{"id":"1YpKkgVzNbNKj","state":"live","title":"Test Space"}})
  end

  @doc "Returns a JSON 200 response listing multiple Spaces."
  def spaces_lookup_200 do
    ~s({"data":[{"id":"1YpKkgVzNbNKj","state":"live","title":"Test Space"}]})
  end

  @doc "Returns a JSON 200 response for a Spaces search result."
  def search_spaces_200 do
    ~s({"data":[{"id":"1YpKkgVzNbNKj","state":"live","title":"Test Space"}]})
  end

  # Direct Messages
  @doc "Returns a JSON 200 response listing DM events in a conversation."
  def dm_conversation_200 do
    ~s({"data":[{"id":"msg123","text":"Hello","event_type":"MessageCreate","created_at":"2024-01-01T00:00:00.000Z"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response for a newly created DM event."
  def create_dm_200 do
    ~s({"data":{"dm_conversation_id":"conv123","dm_event_id":"msg123"}})
  end

  # Batch compliance
  @doc "Returns a JSON 200 response listing batch compliance jobs."
  def compliance_jobs_200 do
    ~s({"data":[{"id":"job123","type":"tweets","status":"complete","created_at":"2024-01-01T00:00:00.000Z"}],"meta":{"result_count":1}})
  end

  @doc "Returns a JSON 200 response for a newly created batch compliance job."
  def create_compliance_job_200 do
    ~s({"data":{"id":"job123","type":"tweets","status":"created","created_at":"2024-01-01T00:00:00.000Z"}})
  end

  @doc "Returns a JSON 200 response for a single batch compliance job."
  def compliance_job_200 do
    ~s({"data":{"id":"job123","type":"tweets","status":"complete","created_at":"2024-01-01T00:00:00.000Z"}})
  end

  # Usage
  @doc "Returns a JSON 200 response for post usage metrics including daily project usage."
  def posts_usage_200 do
    ~s({"data":{"cap_reset_day":1,"daily_project_usage":[{"app_id":"123","usage":[{"date":"2024-01-01","usage":[{"metric":"ReadsCapacityConsumed","value":100}]}]}]}})
  end

  # Filtered stream
  @doc "Returns a JSON 200 response listing active filtered stream rules."
  def stream_rules_200 do
    ~s({"data":[{"id":"rule123","value":"from:testuser","tag":"test rule"}],"meta":{"sent":"2024-01-01T00:00:00.000Z","result_count":1}})
  end

  @doc "Returns a JSON 200 response for adding filtered stream rules."
  def add_rules_200 do
    ~s({"data":[{"id":"rule123","value":"from:testuser","tag":"test rule"}],"meta":{"sent":"2024-01-01T00:00:00.000Z","summary":{"created":1,"not_created":0,"valid":1,"invalid":0}}})
  end

  @doc "Returns a JSON 201 response for newly created filtered stream rules."
  def add_rules_201 do
    ~s({"data":[{"id":"rule123","value":"from:testuser","tag":"test rule"}],"meta":{"sent":"2024-01-01T00:00:00.000Z","summary":{"created":1,"not_created":0,"valid":1,"invalid":0}}})
  end

  # Subtitles
  @doc "Returns a JSON 200 response for successfully creating media subtitles."
  def create_subtitles_200 do
    ~s({"data":{"media_id":"media123","is_translatable":false}})
  end

  # Media upload
  @doc "Returns a JSON response for initializing a media upload."
  def upload_init_response do
    ~s({"media_id":123456789,"media_id_string":"123456789","expires_after_secs":86400})
  end

  @doc "Returns a JSON response for finalizing a media upload including image metadata."
  def upload_finalize_response do
    ~s({"media_id":123456789,"media_id_string":"123456789","size":12345,"expires_after_secs":86400,"image":{"image_type":"image/jpeg","w":100,"h":100}})
  end

  # Metadata
  @doc "Returns a JSON 200 response for successfully creating media metadata."
  def create_metadata_200 do
    ~s({"data":{"media_id":"123456789"}})
  end
end
