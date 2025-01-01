# Contribution Guide

このプロジェクトに貢献していただきありがとうございます！貢献を希望する方は、以下のガイドラインに従ってください。

## プルリクエストの作成方法

1. **フォークとクローン**:
   - プロジェクトを [GitHub](https://github.com/yk-lab/pandoc-extra-ja) からフォークしてください。
   - フォークしたリポジトリをローカルにクローンします。

     ```bash
     git clone git@github.com:yk-lab/pandoc-extra-ja.git
     ```

2. **新しいブランチを作成**:
   - 自分の作業用のブランチを作成し、チェックアウトします。

     ```bash
     git checkout -b feature/your-feature
     ```

3. **変更を加える**:
   - 必要な変更を行い、ローカルでコミットします。

     ```bash
     git add .
     git commit -m "Add your commit message here"
     ```

4. **プッシュとプルリクエストの作成**:
   - 変更を自分のリモートリポジトリにプッシュします。

     ```bash
     git push origin feature/your-feature
     ```

   - [GitHub](https://github.com/yk-lab/pandoc-extra-ja/pulls) でプルリクエストを作成し、リポジトリのメインブランチにマージをリクエストしてください。

## コードスタイル

- Dockerfile の変更には [hadolint](https://github.com/hadolint/hadolint) を
  使用して linting を行ってください。

  ```bash
  hadolint Dockerfile
  ```

- Markdown ファイルの変更には [markdownlint](https://github.com/DavidAnson/markdownlint) を
  使用して linting を行ってください。

  ```bash
  markdownlint-cli2 "**/*.md"
  ```

- Shell スクリプトの変更には [shellcheck](https://github.com/koalaman/shellcheck) を
  使用して linting を行ってください。

  ```bash
  shellcheck "**/*.sh"
  ```

- YAML ファイルの変更には
  [yamllint](https://github.com/adrienverge/yamllint) を使用して linting を、
  [yamlfmt](https://github.com/google/yamlfmt) を使用してフォーマットを行ってください。

  ```bash
  yamllint .
  yamlfmt .
  ```

- [codespell](https://github.com/codespell-project/codespell) を使用してスペルミスを防ぐことをお勧めします。

これらのツールを使用してコードをチェックしてください。
なお、プルリクエストを作成する際に CI/CD パイプラインで自動的に実行されますので、問題がある場合は修正してください。

## テスト方法

1. **テストの実行**:

- Eisvogel の examples を取得します。

    ```bash
    REPOSITORY="Wandmalfarbe/pandoc-latex-template"
    RELEASE_URL="https://api.github.com/repos/${REPOSITORY}/releases/latest"

    # Wandmalfarbe/pandoc-latex-template の最新のリリースを取得
    LATEST_RELEASE=$(curl -s ${RELEASE_URL} | grep "tag_name" | cut -d\" -f4)

    # ダウンロードURL
    DOWNLOAD_URL="https://github.com/${REPOSITORY}/releases/download/${LATEST_RELEASE}/Eisvogel.tar.gz"

    # ダウンロードして解凍
    curl -L -s $DOWNLOAD_URL | tar zxvf - examples

    # .gitignore を作成
    echo "*" > examples/.gitignore
    ```

- テストを実行します。
    language-japanese の例:

    ```bash
    docker build -t pandoc-extra-ja .
    docker run --rm -v $(PWD)/examples/language-japanese:/data \
    -it pandoc-extra-ja document.md \
    -o document.pdf \
    --template /.pandoc/templates/eisvogel.latex \
    --listings --pdf-engine "xelatex" \
    -V mainfont="Noto Serif" \
    -V sansfont="Noto Sans" \
    -V monofont="Noto Sans Mono CJK JP" \
    -V mathfont="Noto Serif" \
    -V CJKmainfont="Noto Serif CJK JP"
    ```

## その他

- **バグレポート**:
  バグを見つけた場合は、[Issues](https://github.com/yk-lab/pandoc-extra-ja/issues) に報告してください。
- **質問**:
  質問がある場合は、[Discussions](https://github.com/yk-lab/pandoc-extra-ja/discussions) を利用してください。

貢献していただきありがとうございます！
