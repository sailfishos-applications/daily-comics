# Daily Comics
**Daily Comics is a simple to use comic strips and cartoon reader for [SailfishOS](https://sailfishos.org/), which allows for adding new comics / cartoons easily.**

### Features
- Select your favorite comics for quick access
- Retrieve new strips automatically on app start
- Show basic information about a comic
- View all new strips consequtively
- Indicate unread strips on the app cover
- Save strips to the gallery / filesystem
- Share strips via MMS, Bluetooth etc.
- Zoom strips arbitrarily for readability
- Full support for landscape orientation
- Support for animated GIFs
- Each comic uses an individual plugin
- Provides comics and cartoons in various languages
- Covers a multitude of topics and styles

### Screenshots of Daily Comics
|       |       |       |
| :---: | :---: | :---: |
|       |       |       |
| ![Favorite comics](./info/screenshots/favorites.png?raw=true "Favorite comics") | ![View strip](./info/screenshots/comic_bar.png?raw=true "View strip") | ![Comic info](./info/screenshots/comic_info.png?raw=true "Comic info") |
| Favorite&nbsp;comics | &nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;strip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;Comic&nbsp;info&nbsp;&nbsp;&nbsp;&nbsp; |
|       |       |       |
|       |       |       |
| ![Zoom strip](./info/screenshots/image_zoom.png?raw=true "Zoom strip") | ![Select favorites](./info/screenshots/settings.png?raw=true "Select favorites") | ![App cover](./info/screenshots/cover.png?raw=true "App cover") |
| Zoom strip | Select favorites | App cover |
|       |       |       |

## Information
![Covers grid](https://github.com/sailfishos-applications/daily-comics/blob/master/info/covers_grid.jpg?raw=true "Covers grid")

### Comics available
The [comics list](https://github.com/sailfishos-applications/daily-comics/blob/master/info/comics_list.md) shows the currently supported comics.

### Issues with specific comics or Daily Comics proper
Please file bug reports, feature suggestions and help requests in an [issue](https://github.com/sailfishos-applications/daily-comics/issues), after having ensured, that this is not already covered by an existing issue.

### Adding comics
If you want some additional comics or cartoons to be supported by Daily Comics, please open a Pull Request which must adhere to the [guidelines](./info/comic_addition.md).

### Resources
Some resources to find new comics
- [Cartoon Movement](https://cartoonmovement.com/), extraction is [easy and researched](https://github.com/sailfishos-applications/daily-comics/pull/4#issuecomment-1742215566).
- [GoComics](https://gocomics.com/), extraction is easy and researched ([example](https://github.com/sailfishos-applications/daily-comics/blob/devel/plugins/wizardofid/extract.js)).
- [Reddit webcomics](https://www.reddit.com/r/webcomics/), but extraction requires some research, first.
- [Press Cartoon Belgium](http://www.presscartoon.com/en/accueil), but extraction script [requires some research](https://github.com/sailfishos-applications/daily-comics/pull/4#issuecomment-1742215566), first.
- [WebToons](https://www.webtoons.com/), but extraction script requires some research, if feasible at all.
- [Tapas](https://tapas.io/), but extraction script [must be researched, is a bit complicated and triggers a minor Qt issue](https://github.com/tardypad/sailfishos-daily-comics/issues/89#issuecomment-596226840).
- [Comics Kingdom](https://comicskingdom.com/), but extraction script [must be researched, is a bit complicated and triggers a minor Qt issue](https://github.com/sailfishos-applications/daily-comics/issues/46#issuecomment-2024214674).

### Translating Daily Comics (l10n / i18n)
If you want to translate Daily Comics to a language it does not support yet or improve an extant translation, please [read the translations-README](./translations#readme).

## Contributors
### Source Code
- [2015-2019](https://github.com/sailfishos-applications/daily-comics/commits?author=tardypad): Damien Tardy-Panis ([tardypad](https://github.com/tardypad))
- [2016,2019,2024](https://github.com/sailfishos-applications/daily-comics/commits?author=cnlpete): Hauke Schade ([cnlpete](https://github.com/cnlpete))
- [2018-2020](https://github.com/sailfishos-applications/daily-comics/commits?author=Maledictus): Oleg Linkin ([Maledictus](https://github.com/Maledictus))
- [2020](https://github.com/sailfishos-applications/daily-comics/commits?author=ichthyosaurus): Mirian Margiani ([ichthyosaurus](https://github.com/ichthyosaurus))
- [2023,2024](https://github.com/sailfishos-applications/daily-comics/commits?author=Olf0): olf ([Olf0](https://github.com/Olf0))

### Plugins
- [2015-2019](https://github.com/sailfishos-applications/daily-comics/commits?author=tardypad): Damien Tardy-Panis ([tardypad](https://github.com/tardypad))
- [2018](https://github.com/sailfishos-applications/daily-comics/commits?author=f03el): Erik Mållberg ([f03el](https://github.com/f03el))
- [2018-2020](https://github.com/sailfishos-applications/daily-comics/commits?author=Maledictus): Oleg Linkin ([Maledictus](https://github.com/Maledictus))
- [2019,2020](https://github.com/sailfishos-applications/daily-comics/commits?author=cow-n-berg): Rob K ([cow-n-berg](https://github.com/cow-n-berg))
- [2019](https://github.com/sailfishos-applications/daily-comics/commits?author=caio2k): caio2k ([caio2k](https://github.com/caio2k))
- [2019](https://github.com/sailfishos-applications/daily-comics/commits?author=sthocs): sthocs ([sthocs](https://github.com/sthocs))
- [2019](https://github.com/sailfishos-applications/daily-comics/commit/f28be7cf1d112f9e48bf853ad032f8f6f9a622c8): dryo
- [2020](https://github.com/sailfishos-applications/daily-comics/commit/47a83f15c3c43ac189cd31ea327e98cad19addb3): Joni Korhonen
- [2020,2023-2025](https://github.com/sailfishos-applications/daily-comics/commits?author=Olf0): olf ([Olf0](https://github.com/Olf0))
- [2024,2025](https://github.com/sailfishos-applications/daily-comics/commits?author=ExTechOp): Otto ([ExTechOp](https://github.com/ExTechOp))
- [2025](https://github.com/sailfishos-applications/daily-comics/commits?author=f-fr): Frank Fischer ([f-fr](https://github.com/f-fr))

### Translations
- [`de`](https://app.transifex.com/olf/daily-comics/language/de/)
  - [2016,2019](https://github.com/sailfishos-applications/daily-comics/commits?author=cnlpete),[2024](https://github.com/sailfishos-applications/daily-comics/commits?author=transifex-integration%5Bbot%5D): Hauke Schade ([cnlpete](https://github.com/cnlpete))
  - [2020](https://github.com/sailfishos-applications/daily-comics/commits?author=ichthyosaurus): Mirian Margiani ([ichthyosaurus](https://github.com/ichthyosaurus))
  - [2023](https://github.com/sailfishos-applications/daily-comics/commits?author=Olf0): [olf](https://github.com/sailfishos-applications/daily-comics/commits?author=transifex-integration%5Bbot%5D) ([Olf0](https://github.com/Olf0))
- [`fr`](https://app.transifex.com/olf/daily-comics/language/fr/)
  - [2018,2019](https://github.com/sailfishos-applications/daily-comics/commits?author=lutinotmalin): [lutinotmalin](https://github.com/lutinotmalin)
- [`it`](https://app.transifex.com/olf/daily-comics/language/it/)
  - [2025](https://github.com/sailfishos-applications/daily-comics/commits?author=legacychimera247): luca 247 ([legacychimera247](https://github.com/legacychimera247))
- [`nl`](https://app.transifex.com/olf/daily-comics/language/nl/)
  - [2017](https://github.com/tardypad/sailfishos-daily-comics/pull/35): *\<Unknown\>*
- [`sv`](https://app.transifex.com/olf/daily-comics/language/sv/)
  - [2018](https://github.com/sailfishos-applications/daily-comics/commit/dfd23fb435a846fe5776a440669d92fe2eb5c39d): Erik Lundin
  - [2024](https://github.com/sailfishos-applications/daily-comics/commits?author=transifex-integration%5Bbot%5D): Åke Engelbrektson (eson / [eson57](https://github.com/eson57))

## Licenses
The source code of Daily Comics (i.e. all code in this source code repository) is released under the classic MIT license (see the [LICENSE](./LICENSE.txt) file).
Application specific graphics (icons etc.) are released under the [Creative Commons Attribution license (CC-BY)](https://creativecommons.org/licenses/by/4.0/deed.en).

Canonical references for the MIT license:
- https://spdx.org/licenses/MIT.html
- https://opensource.org/license/mit/

Contributions are welcome.

Enjoy!
