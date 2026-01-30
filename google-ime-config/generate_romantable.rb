Entry = Struct.new(:key, :word, :next_key) do
  def to_s
    [key, word, next_key].compact.join("\t")
  end

  def eql?(other)
    return to_s == other.to_s if other.is_a?(Entry) 
    return key == other if other.is_a?(String) # 除外の表現をシンプルに書く用
    false
  end
end

def entry(key, word, next_key = nil)
  Entry.new(key, word, next_key)
end

def m(xs, ys)
  raise "Length mismatch: #{xs.inspect} vs #{ys.inspect}" unless xs.size == ys.size
  xs.zip(ys).map { entry(*it) }
end

entries = [
  m(%w[a i u e o], %w[あ い う え お]),
  m(%w[xa xi xu xe xo], %w[ぁ ぃ ぅ ぇ ぉ]),
  # m(%w[la li lu le lo], %w[ぁ ぃ ぅ ぇ ぉ]),
  # m(%w[lyi lye], %w[ぃ ぇ]),
  # m(%w[xyi xye], %w[ぃ ぇ]),
  m(%w[va vi vu ve vo], %w[ゔぁ ゔぃ ゔ ゔぇ ゔぉ]),
  # m(%w[vya vyi vyu vye vyo], %w[ゔゃ ゔぃ ゔゅ ゔぇ ゔょ]),

  m(%w[ka ki ku ke ko], %w[か き く け こ]),
  # m(%w[ca ci cu ce co], %w[か し く せ こ]),
  m(%w[kya kyi kyu kye kyo], %w[きゃ きぃ きゅ きぇ きょ]),
  # m(%w[qa qi qu qe qo], %w[くぁ くぃ く くぇ くぉ]),
  # m(%w[kwa kwi kwu kwe kwo], %w[くぁ くぃ くぅ くぇ くぉ]),
  m(%w[ga gi gu ge go], %w[が ぎ ぐ げ ご]),
  # m(%w[gwa gwi gwu gwe gwo], %w[ぐぁ ぐぃ ぐぅ ぐぇ ぐぉ]),
  m(%w[gya gyi gyu gye gyo], %w[ぎゃ ぎぃ ぎゅ ぎぇ ぎょ]),
  # m(%w[xka lka xke lke], %w[ヵ ヵ ヶ ヶ]),

  m(%w[sa si su se so], %w[さ し す せ そ]),
  m(%w[sya syi syu sye syo], %w[しゃ しぃ しゅ しぇ しょ]),
  m(%w[sha shi shu she sho], %w[しゃ し しゅ しぇ しょ]),
  # m(%w[swa swi swu swe swo], %w[すぁ すぃ すぅ すぇ すぉ]),
  # m(%w[zwa zwi zwu zwe zwo], %w[ずぁ ずぃ ずぅ ずぇ ずぉ]),
  m(%w[za zi zu ze zo], %w[ざ じ ず ぜ ぞ]),
  m(%w[ja ji ju je jo], %w[じゃ じ じゅ じぇ じょ]),
  # m(%w{jya jyi jyu jye jyo}, %w{じゃ じぃ じゅ じぇ じょ}),
  # m(%w{zya zyi zyu zye zyo}, %w{じゃ じぃ じゅ じぇ じょ}),

  m(%w[ta ti tu te to], %w[た ち つ て と]),
  m(%w[tya tyi tyu tye tyo], %w[ちゃ ちぃ ちゅ ちぇ ちょ]),
  # m(%w[cha chi chu che cho], %w[ちゃ ち ちゅ ちぇ ちょ]),
  m(%w[cya cyi cyu cye cyo], %w[ちゃ ちぃ ちゅ ちぇ ちょ]),
  m(%w[tsa tsi tsu tse tso], %w[つぁ つぃ つ つぇ つぉ]),
  m(%w[tha thi thu the tho], %w[てゃ てぃ てゅ てぇ てょ]),
  # m(%w[twa twi twu twe two], %w[とぁ とぃ とぅ とぇ とぉ]),
  m(%w[da di du de do], %w[だ ぢ づ で ど]),
  m(%w[dya dyi dyu dye dyo], %w[ぢゃ ぢぃ ぢゅ ぢぇ ぢょ]),
  m(%w[dha dhi dhu dhe dho], %w[でゃ でぃ でゅ でぇ でょ]),
  # m(%w[dwa dwi dwu dwe dwo], %w[どぁ どぃ どぅ どぇ どぉ]),

  m(%w[na ni nu ne no], %w[な に ぬ ね の]),
  m(%w[nya nyi nyu nye nyo], %w[にゃ にぃ にゅ にぇ にょ]),

  m(%w[ha hi hu he ho], %w[は ひ ふ へ ほ]),
  m(%w[hya hyi hyu hye hyo], %w[ひゃ ひぃ ひゅ ひぇ ひょ]),
  m(%w[fa fi fu fe fo], %w[ふぁ ふぃ ふ ふぇ ふぉ]),
  m(%w[fya fyu fyo], %w[ふゃ ふゅ ふょ]),
  # m(%w[hwa hwi hwe hwo hwyu], %w[ふぁ ふぃ ふぇ ふぉ ふゅ]),
  m(%w[ba bi bu be bo], %w[ば び ぶ べ ぼ]),
  m(%w[bya byi byu bye byo], %w[びゃ びぃ びゅ びぇ びょ]),
  m(%w[pa pi pu pe po], %w[ぱ ぴ ぷ ぺ ぽ]),
  m(%w[pya pyi pyu pye pyo], %w[ぴゃ ぴぃ ぴゅ ぴぇ ぴょ]),

  m(%w[ma mi mu me mo], %w[ま み む め も]),
  m(%w[mya myi myu mye myo], %w[みゃ みぃ みゅ みぇ みょ]),

  m(%w[ya yu ye yo], %w[や ゆ いぇ よ]), # yi は無いらしい
  m(%w[xya xyu xyo], %w[ゃ ゅ ょ]),
  # m(%w[lya lyu lyo], %w[ゃ ゅ ょ]),
  entry('wyi', 'ゐ'),
  entry('wye', 'ゑ'),

  m(%w[ra ri ru re ro], %w[ら り る れ ろ]),
  m(%w[rya ryi ryu rye ryo], %w[りゃ りぃ りゅ りぇ りょ]),

  m(%w[wa wi wu we wo], %w[わ うぃ う うぇ を]),
  # m(%w[wha whi whu whe who], %w[うぁ うぃ う うぇ うぉ]),
  # entry('xwa', 'ゎ'),
  # entry('lwa', 'ゎ'),

  entry('nn', 'ん'),
  entry('n', 'ん'),
  # entry('xn', 'ん'),

  %w[q v l x k g s z j t d h f b p m y r w c].map { entry(it+it, 'っ', it) } - %w[qq ll xx jj hh],
  # entry('xtu', 'っ'),
  # entry('xtsu', 'っ'),
  # entry('ltu', 'っ'),
  # entry('ltsu', 'っ'),
  # entry('tch', 'っ', 'ch'),

  # entry('www', 'w', 'ww'),

  # entry('t\'i', 'てぃ'),
  # entry('t\'yu', 'てゅ'),
  # entry('d\'i', 'でぃ'),
  # entry('d\'yu', 'でゅ'),
  # entry('t\'u', 'とぅ'),
  # entry('d\'u', 'どぅ'),
  # entry('n\'', 'ん'),

  entry('-', 'ー'),
  entry('~', '〜'),
  entry('.', '。'),
  entry(',', '、'),
  entry('z/', '・'),
  entry('z.', '…'),
  entry('z,', '‥'),
  # entry('zh', '←'),
  # entry('zj', '↓'),
  # entry('zk', '↑'),
  # entry('zl', '→'),
  entry('z-', '〜'),
  entry('z[', '『'),
  entry('z]', '』'),
  entry('[', '「'),
  entry(']', '」'),
].flatten

# AZIK
# refs http://bibouroku.net/azik

consonants = %w[
v
k ky g gy
s sy sh z j
t ty cy ts th d dy dh
n ny
h hy f b by p py
m my
r ry
]

# 撥音
entries += consonants.map do |c|
  [
    entry(c + 'z', entries.find { |e| e.key == c + 'a' }.word + 'ん'), # 子音 + z = 子音 + ann
    entry(c + 'k', entries.find { |e| e.key == c + 'i' }.word + 'ん'), # 子音 + k = 子音 + inn
    entry(c + 'j', entries.find { |e| e.key == c + 'u' }.word + 'ん'), # 子音 + j = 子音 + unn
    entry(c + 'd', entries.find { |e| e.key == c + 'e' }.word + 'ん'), # 子音 + d = 子音 + enn
    entry(c + 'l', entries.find { |e| e.key == c + 'o' }.word + 'ん'), # 子音 + l = 子音 + onn
  ]
end.flatten - %w[kk zz dd] + [ # 無効化されているのは きん ざん でん。
  m(%w[lz lk lj ld ll], %w[あん いん うん えん おん]),
  m(%w[yz yj yl], %w[やん ゆん よん]),
  entry('wz', 'わん'),
].flatten
# kkは'っ'のユースケースが非常に多いのでそちら優先
# zzは「ッジ」「ッズ」が英語で多い
# ddはほぼ「ッド」のみだが、一旦
# jjは'っ'のユースケースが実質グッジョブしかないので撥音優先

# 二重母音
entries += consonants.map do |c|
  [
    entry(c + 'q', entries.find { |e| e.key == c + 'a' }.word + 'い'), # 子音 + q = 子音 + ai
    entry(c + 'v', entries.find { |e| e.key == c + 'u' }.word + 'う'), # 子音 + v = 子音 + uu; オリジナルはHだが、shaなどで即時確定せずイマイチなので、空いているVで代替
    entry(c + 'w', entries.find { |e| e.key == c + 'e' }.word + 'い'), # 子音 + w = 子音 + ei
    entry(c + 'p', entries.find { |e| e.key == c + 'o' }.word + 'う'), # 子音 + p = 子音 + ou
  ]
end.flatten - %w[vv pp] + [ # 無効化されているのは ゔぉう ぽう
  m(%w[lq lv lw lp], %w[あい うう えい おう]),
  m(%w[yq yh yp], %w[やい ゆう よう]),
  entry('wq', 'わい'),
].flatten
# hhは'っ'のユースケースが音的にほぼほぼ無いので二重母音優先

# その他
entries += [
  entry(';', 'っ'),
  entry('q', 'ん'),
  # m(%w[xa xu xo], %w[しゃ しゅ しょ]),
  m(%w[ca cu co], %w[ちゃ ちゅ ちょ]),

  # 頻出音
  entry('km', 'かも'),
  entry('kr', 'から'),
  entry('gr', 'がら'),
  entry('kt', 'こと'),
  entry('gt', 'ごと'),
  entry('zr', 'ざる'),
  entry('st', 'した'),
  entry('sr', 'する'),
  # entry('tt', 'たち'),
  entry('dt', 'だち'),
  entry('tb', 'たび'),
  entry('tm', 'ため'),
  entry('tr', 'たら'),
  entry('ds', 'です'),
  entry('dm', 'でも'),
  # entry('nr', 'なる'), # あまり使わない上に、「n」で「ん」を入れた場合に事故りやすいので無効化
  # entry('nt', 'にち'),
  # entry('nb', 'ねば'),
  entry('ht', 'ひと'),
  entry('bt', 'びと'),
  entry('ms', 'ます'),
  entry('mt', 'また'),
  entry('mn', 'もの'),
  entry('yr', 'よる'),
  # entry('rr', 'られ'),
  entry('wt', 'わた'),
  entry('wr', 'われ'),
].flatten

dup_keys = entries.map(&:key).group_by { it }.select { |_, v| v.size > 1 }.keys
if dup_keys.any?
  warn "Duplicate keys found: #{dup_keys.join(', ')}"
  exit 1
end

if (matches = entries.select { it.key.match?(/^.v.$/) }).any?
  warn "WARN: 二重母音 'v' が即時確定しません。該当:\n#{matches.map(&:to_s).join("\n")}" 
end
if (matches = entries.select { it.key.match?(/^.w.$/) }).any?
  warn "WARN: 二重母音 'w' が即時確定しません。該当:\n#{matches.map(&:to_s).join("\n")}" 
end

File.write('romantable.txt', entries.map(&:to_s).sort.join("\n"))
