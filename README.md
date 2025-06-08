# mariposa 🦋

[![CI](https://github.com/jessesquires/mariposa/actions/workflows/ci.yml/badge.svg)](https://github.com/jessesquires/mariposa/actions/workflows/ci.yml)

*A command-line tool to (partially) automate posting [JSON feeds](https://www.jsonfeed.org) to [Bluesky](https://bsky.app) and [Mastodon](https://mastodon.social)*

## About

The goal of this tool is to replace services like [IFTTT](https://ifttt.com) or [Zapier](https://zapier.com) to automatically post to Bluesky and Mastodon whenever I publish a new blog post. 

This is a tool I wrote for my own purposes. It is **partially automated** because you need to run it manually, although you could probably automate it fully if desired. However, I do not need that for my current usage. Feel free to adapt and use as desired. I've made it modular, but features are **very limited** to only what I currently need.

> [!NOTE]
>
> This project contains limited features and functionality very specific to my needs and use case. While I am open to reviewing pull requests that add additional features, please note that **it is an explicit non-goal to write fully fledged clients for Bluesky and Mastodon.**

## How It Works

**Prerequisite:** presumably, you have a JSON feed for your blog. I use [Jekyll](https://jekyllrb.com) for my blog, which easily accommodates [generating a JSON feed](https://www.jessesquires.com/blog/2017/09/03/supporting-json-feed/).

The tool reads a [JSON feed](https://www.jsonfeed.org) locally from disk, and then posts the latest entry to Bluesky and Mastodon. The text of the post includes only the blog post title and url.

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

> [!IMPORTANT]
> 
> **For Bluesky:** create an [app password](https://bsky.app/settings/app-passwords). Do not use your login password.
>
> **For Mastodon:** create [an application](https://mastodon.social/settings/applications) with the `write:statuses` scope.

#### 2. Run

```bash
swift run mariposa --config path/to/your/config.yml --feed path/to/your/feed.json
```

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/jessesquires/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/jessesquires/.github/blob/main/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/jessesquires/.github/blob/main/SUPPORT.md)
- [Security Policy](https://github.com/jessesquires/.github/blob/main/SECURITY.md)

Also consider [sponsoring this project](https://github.com/sponsors/jessesquires) or [buying my apps](https://www.hexedbits.com)! ✌️

## Credits

Created and maintained by [**Jesse Squires**](https://www.jessesquires.com).

*Many thanks to Manton Reece for [writing this blog post](https://www.manton.org/2023/04/29/getting-started-with.html), which helped me get started quickly with the Bluesky API.*

## License

Released under the MIT License. See `LICENSE` for details.

> **Copyright &copy; 2025-present Jesse Squires.**
