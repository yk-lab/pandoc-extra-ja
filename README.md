# pandoc-extra-ja

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

## 概要 (Overview)

**pandoc-extra-ja** は、pandoc/extra Docker イメージを拡張し、日本語の PDF 生成をサポートするようにカスタマイズしたものです。
この Docker イメージには、日本語テキストを正しく処理するための追加設定やフォントが含まれており、日本語での文書作成に適しています。

**pandoc-extra-ja** is an extended version of the pandoc/extra Docker image,
customized to support Japanese PDF generation. This Docker image includes additional configurations
and fonts to handle Japanese text seamlessly, making it suitable for creating documents in Japanese.

## 特徴 (Features)

* **日本語 PDF サポート**: 日本語テキストを正しくレンダリングするためのフォントと設定を追加。
* **GitHub Actions 統合**: 自動ビルドやテストを GitHub Actions で簡単に設定し、継続的インテグレーション (CI) を実現。
* **簡単な統合**: 公式の pandoc/extra イメージをベースにしているため、既存のワークフローに簡単に統合可能。

* **Japanese PDF Support**: Includes additional fonts and settings to ensure proper rendering of Japanese text in PDFs.
* **GitHub Actions Integration**: Easily set up automatic builds and tests with GitHub Actions for seamless continuous integration (CI).
* **Easy Integration**: Based on the official pandoc/extra image, making it easy to integrate into existing workflows.

## 使用方法 (Getting Started)

### Docker Hub から取得 (Pull from Docker Hub)

```bash
docker pull yk-lab/pandoc-extra-ja
```

### ローカルでビルド (Build Locally)

```bash
git clone git@github.com:yk-lab/pandoc-extra-ja.git
cd pandoc-extra-ja
docker build -t pandoc-extra-ja .
```

## 使用例 (Usage Example)

Markdown ファイルから PDF を生成する例です:

Here’s how you can use the image to generate a PDF from a Markdown file:

```bash
docker run --rm -v $(pwd):/workspace -w /workspace yk-lab/pandoc-extra-ja \
    pandoc input.md -o output.pdf
```

## GitHub Actions との統合 (GitHub Actions Integration)

Coming soon!

## 貢献 (Contributing)

貢献を歓迎します！詳細については、[CONTRIBUTING.md](CONTRIBUTING.md) をご覧ください。

We welcome contributions! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct,
and the process for submitting pull requests.

## ライセンス (License)

このプロジェクトは GPL-2.0 ライセンスの下で提供されています。詳細については、[LICENSE](LICENSE) ファイルを参照してください。

This project is licensed under the GPL-2.0 License - see the [LICENSE](LICENSE) file for details.

## セキュリティポリシー (Security Policy)

セキュリティポリシーは [SECURITY.md](SECURITY.md) に記載されています。
セキュリティの脆弱性を発見した場合は、ドキュメントに記載されている方法で報告してください。
皆様の貢献に感謝し、このプロジェクトのセキュリティ向上に尽力します。

Our security policy can be found in [SECURITY.md](SECURITY.md).
If you discover any security vulnerabilities, please report them using the methods outlined in the document.
We greatly appreciate your contributions and will acknowledge your efforts to improve the security of this project.

## 行動規範 (Code of Conduct)

このプロジェクトに関わるすべての人が快適に貢献できるよう、行動規範を設けています。
プロジェクトに参加する際は、[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) をご一読ください。

To ensure that everyone involved in this project can contribute comfortably, we have established a code of conduct.
Please read our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before participating.

## サポート (Support)

質問やサポートが必要な場合は、[Discussions][Discussions] タブをご利用ください。
また、バグ報告や機能リクエストは [Issues][Issues] で受け付けています。

If you have any questions or need support, please use the [Discussions][Discussions] tab.
For bug reports and feature requests, please file an issue in the [Issues][Issues] section.

## 連絡先 (Contact)

ご意見やお問い合わせは、[Discussions][Discussions]，[Issues][Issues] あるいはこのリポジトリのメンテナに直接ご連絡ください。

For feedback or inquiries, please reach out to the maintainers directly or use the [Discussions][Discussions] or [Issues][Issues] sections.

[Discussions]: https://github.com/yk-lab/pandoc-extra-ja/discussions
[Issues]: https://github.com/yk-lab/pandoc-extra-ja/issues
