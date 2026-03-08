![GitHub issues](https://img.shields.io/github/issues/x_api_ex)
![GitHub stars](https://img.shields.io/github/stars/x_api_ex)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

# XApiEx

Elixir HTTP client for the [X API v2](https://docs.x.com). Wraps all major v2 endpoints with typed request/response structs and a Tesla-based connection layer.

## Installation

Add `x_api_ex` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:x_api_ex, "~> 1.0"}
  ]
end
```

## Authentication

Create a connection using a bearer token:

```elixir
conn = XApiEx.Connection.new(bearer_token: "your-bearer-token")
```

Or with an OAuth2 token fetcher function:

```elixir
conn = XApiEx.Connection.new(token: fn scopes -> fetch_oauth_token(scopes) end)
```

## Usage

Each API category is a separate module under `XApiEx.Api.*`. All functions take a connection as the first argument and return `{:ok, struct}` or `{:error, Tesla.Env.t()}`.

```elixir
conn = XApiEx.Connection.new(bearer_token: "your-bearer-token")

# Look up a user by username
{:ok, %XApiEx.Model.UserResponse{data: user}} =
  XApiEx.Api.UserLookup.find_user_by_username(conn, "elixirlang")

# Search recent posts
{:ok, %XApiEx.Model.SearchResponse{data: posts}} =
  XApiEx.Api.SearchPosts.tweets_recent_search(conn, "from:elixirlang", [])

# Create a post
{:ok, %XApiEx.Model.CreateAPost200Response{data: data}} =
  XApiEx.Api.ManagePosts.create_tweet(conn, %{text: "Hello from XApiEx!"})
```

## API Coverage

| Module | Description |
|---|---|
| `XApiEx.Api.UserLookup` | Look up users by ID or username |
| `XApiEx.Api.PostLookup` | Look up posts by ID |
| `XApiEx.Api.Timelines` | Home and user timelines |
| `XApiEx.Api.SearchPosts` | Recent and full-archive search |
| `XApiEx.Api.ManagePosts` | Create and delete posts |
| `XApiEx.Api.Likes` | Like/unlike posts, liking users |
| `XApiEx.Api.Reposts` | Repost/undo repost |
| `XApiEx.Api.QuotePosts` | Quote posts |
| `XApiEx.Api.PostCounts` | Post volume counts |
| `XApiEx.Api.Bookmarks` | Bookmark management |
| `XApiEx.Api.Follows` | Follow/unfollow users |
| `XApiEx.Api.Blocks` | Block/unblock users |
| `XApiEx.Api.Mutes` | Mute/unmute users |
| `XApiEx.Api.HideReplies` | Hide/unhide replies |
| `XApiEx.Api.List` | List CRUD |
| `XApiEx.Api.ListLookup` | Look up lists |
| `XApiEx.Api.ListMembers` | List member management |
| `XApiEx.Api.ListFollows` | List follow management |
| `XApiEx.Api.ListPosts` | Posts from a list |
| `XApiEx.Api.PinnedLists` | Pin/unpin lists |
| `XApiEx.Api.ManageLists` | Create/update/delete lists |
| `XApiEx.Api.Spaces` | Spaces lookup |
| `XApiEx.Api.SpacesLookup` | Look up spaces by ID |
| `XApiEx.Api.SearchSpaces` | Search spaces |
| `XApiEx.Api.DirectMessagesLookup` | DM conversation lookup |
| `XApiEx.Api.ManageDirectMessages` | Send DMs |
| `XApiEx.Api.FilteredStream` | Filtered stream rules and connection |
| `XApiEx.Api.SampledStream` | Sampled stream connection |
| `XApiEx.Api.BatchCompliance` | Batch compliance jobs |
| `XApiEx.Api.Media` | Media upload (INIT/APPEND/FINALIZE) |
| `XApiEx.Api.Upload` | Media upload status |
| `XApiEx.Api.Subtitles` | Media subtitle management |
| `XApiEx.Api.Metadata` | Media metadata management |
| `XApiEx.Api.UsagePosts` | Post usage and cap metrics |

## Configuration

The base URL defaults to `https://api.x.com` and can be overridden globally:

```elixir
# config/config.exs
config :x_api_ex, base_url: "https://api.x.com"
```

Or per-client:

```elixir
conn = XApiEx.Connection.new(base_url: "https://staging.example.com")
```

Additional Tesla middleware (e.g. a custom adapter) can be configured via:

```elixir
config :tesla, XApiEx.Connection,
  adapter: Tesla.Adapter.Hackney
```

## Development

```console
mix deps.get
mix compile
mix test
```

Documentation is generated with [ExDoc](https://github.com/elixir-lang/ex_doc):

```console
mix docs
```


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
