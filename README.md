# mariposa 🦋

*A command-line tool to (partially) automate posting JSON feeds to Bluesky and Mastodon*

## About

The goal of this tool is to replace a service like [IFTTT](https://ifttt.com) or [Zapier](https://zapier.com) to automatically post to Bluesky when I publish a new blog post. Currently, IFTTT has integrations for posting RSS feeds to Twitter and ([with some extra work](https://www.jessesquires.com/blog/2022/12/15/rss-to-mastodon/)) Mastodon — both of which I use. Currently, IFTTT does not provide an option for automating RSS to Bluesky.

This is a tool I wrote for my own purposes. It's a (partially) automated way for me to share new blog posts to Bluesky. I say "partially" because you need to run it manually, although with a small amount of effort you could automate it fully. (I don't need that for my current usage.) Feel free to adapt and use as desired. I've made it somewhat modular, but features are limited to only what I currently need — which is creating a post with my latest blog post title and url link.

## How It Works

The script works by reading a generated JSON feed and then posting the latest entry to Bluesky. It shares only the blog post title and url.

## Usage

#### 1. Create a `config.yml` with your credentials

```yaml
bluesky:
  email: "your@email.com"
  password: "your-app-password"

mastodon:
  instanceName: "mastodon.social"
  accessToken: "your-access-token"
```

For Bluesky: create an [app password](https://bsky.app/settings/app-passwords).

For Mastodon: create [an application](https://mastodon.social/settings/applications) with the `write:statuses` scope.

#### 2. Run

```bash
swift run mariposa --config path/to/your/config.yml --feed path/to/your/feed.json
```

## Project Goals and Non-Goals

As stated above, this project contains features and functionality very specific to my needs and use case. While I am open to reviewing pull requests that add additional features, please not that **it is an explicit non-goal to write fully fledged clients for Bluesky and Mastodon.**

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/jessesquires/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/jessesquires/.github/blob/main/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/jessesquires/.github/blob/main/SUPPORT.md)
- [Security Policy](https://github.com/jessesquires/.github/blob/main/SECURITY.md)

Also consider [sponsoring this project](https://github.com/sponsors/jessesquires) or [buying my apps](https://www.hexedbits.com)! ✌️

## Credits

Created and maintained by [**Jesse Squires**](https://www.jessesquires.com).

Many thanks to Manton Reece for [writing this blog post](https://www.manton.org/2023/04/29/getting-started-with.html), which helped me get started quickly.

## License

Released under the MIT License. See `LICENSE` for details.

> **Copyright &copy; 2025-present Jesse Squires.**
