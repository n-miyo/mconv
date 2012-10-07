mconv
====================


DESCRIPTION
--------------------
mconvは[mora](http://mora.jp)で購入した楽曲をiOSデバイスで再
生する際に不要となるatomを削除するAppleScriptです。
フォルダアクションとしての利用を想定しています。

このスクリプトが削除するatomは、
[THOUSAND LEAVES PROJECT](http://thousandleaves-project.com/blog/)さんの
[DRMフリーになったmora楽曲を再エンコードなしでiPhone/touchで再生できるようにする方法](http://thousandleaves-project.com/blog/2012/10/drm%E3%83%95%E3%83%AA%E3%83%BC%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9Fmora%E6%A5%BD%E6%9B%B2%E3%82%92%E5%86%8D%E3%82%A8%E3%83%B3%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AA%E3%81%97%E3%81%A7iphonetouch%E3%81%A7.html)で紹介されていたmoov.metaです。

不要なatomの除去には
[AtomicParsley](http://atomicparsley.sourceforge.net/)を使っています。
[Homebrew](http://mxcl.github.com/homebrew/)や
[MacPorts](http://www.macports.org/)を使って事前にインストールしてください。

なお[@gageas](https://twitter.com/gageas)さんの
[モーラその後に](http://lutea.gageas.com/lutea/wiki/%E3%83%A2%E3%83%BC%E3%83%A9%E3%81%9D%E3%81%AE%E5%BE%8C%E3%81%AB)のように、
moov.meta.ID32タグ内の歌詞画像は追加するような機能は備えていません。


PLATFORM
--------------------
サポートしているOSは以下の通りです。

- OS X 10.8.2以降

他のOSでは未確認です。


INSTALL
--------------------
1. HomebrewやMacPortsでAtomicParsleyをインストールします
`% brew install atomicparsley`

2. Makefileとinstaller.sh、mconv.tmpl.applescriptを同じディレクトリに置き、make install を実行します。コンパイルされたスクリプトが${HOME}/Library/Scripts/Folder Action Scriptsへインストールされます。
`% make install`

3. 任意のディレクトリでコンテキストメニューを開き、ServicesからFolder Actions Setupを開きます。開かれたメニューから「convert - mora files to iOS compat.scpt」を選択します。

4. フォルダアクションを設定したディレクトリへmoraから購入した楽曲をコピーします。数秒後に変換処理が開始され、変換後のファイルがDoneディレクトリへ格納されます。

5. コマンドラインで使いたい方は、同梱の mc.sh などをご利用ください。


WARNING
--------------------
本プログラムを適用した楽曲は、一部の機器ではカバーアートが表示されない可能性があります。

本プログラムは完全無保証です。利用に伴うデータ消失などに関しては、自己責任にてお願いいたします。


SPECIAL THANKS
--------------------
有益な情報を公開して下さったTHOUSAND LEAVES PROJECTさんへ感謝します。


AUTHOR
--------------------
MIYOKAWA, Nobuyoshi

* E-Mail: n-miyo@tempus.org
* Twitter: nmiyo
* Blog: http://blogger.tempus.org/


LICESE
--------------------
MIT License
