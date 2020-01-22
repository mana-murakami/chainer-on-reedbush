# 参考資料
 * Reedbush Quick Start Guide https://www.cc.u-tokyo.ac.jp/supercomputer/files/QuickStartGuide.pdf
 * 利用ポータル https://reedbush-www.cc.u-tokyo.ac.jp/
 * https://github.com/keisukefukuda/chainer-on-reedbush

# 前提
2020年1月22日 GPU miniキャンプ with reedbush用

reedbushのchainer/7.0.0モジュールをロードして、chainermnでtrain_mnist.pyを実行する為の手順を纏めています。


[このプロジェクト](https://github.com/keisukefukuda/chainer-on-reedbush)をベースにしています。先に必ず確認して下さい。


## 環境設定
計算ノードからはHOMEは見えないので、Lustreを事実上のHOMEとして用いる。
```
$ cd /lustre/$(id -ng)/$USER/
```
## setup.shの編集
setup.shをテキストエディタで開き、MYDIRを適切に書き換える


## 足りないスクリプトやモジュールの準備
setup.shスクリプトを実行し、mpi4py, mnistデータセット、chainermn用train_mnist.pyを準備する
```
$ chmod +x setup.sh
$ ./setup.sh
```
計算ノードにジョブ投入をする前に、mnistデータセットやmpi4pyをインストールしておく必要がある


## MNISTの実行準備
ジョブ投入スクリプトjob.shのMYDIR変数を適切に書き換える。スクリプト中のPBS設定も適切に書き換える

## MNISTの実行と確認

ジョブを投入する。

```
$ chmod +x job.sh
$ qsub job.sh
```

ジョブが投入されたことを確認する

```
$ rbstat 
Reedbush-H scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)
Reedbush-L scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)
Reedbush-U scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)

JOB_ID     JOB_NAME   STATUS  PROJECT    QUEUE           START_DATE       ELAPSE   TOKEN    NODE
1405000    job.sh     RUNNING pz0425     h-debug         01/10 15:39:08   00:00:24 0.1      2
```

