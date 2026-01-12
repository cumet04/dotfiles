def entry(input, output, next_input = nil)
  [input, output, next_input].compact.join("\t")
end

def m(xs, ys)
  xs.zip(ys).map { entry(*it) }
end

entries = [
  m(%w[a i u e o], %w[あ い う え お]),
  # m(%w[xa xi xu xe xo], %w[ぁ ぃ ぅ ぇ ぉ]),
  m(%w[la li lu le lo], %w[ぁ ぃ ぅ ぇ ぉ]),
  m(%w[lyi lye], %w[ぃ ぇ]),
  m(%w[xyi xye], %w[ぃ ぇ]),
  m(%w[va vi vu ve vo], %w[ゔぁ ゔぃ ゔ ゔぇ ゔぉ]),
  m(%w[vya vyi vyu vye vyo], %w[ゔゃ ゔぃ ゔゅ ゔぇ ゔょ]),

  m(%w[ka ki ku ke ko], %w[か き く け こ]),
  # m(%w[ca ci cu ce co], %w[か し く せ こ]),
  m(%w[kya kyi kyu kye kyo], %w[きゃ きぃ きゅ きぇ きょ]),
  m(%w[qa qi qu qe qo], %w[くぁ くぃ く くぇ くぉ]),
  m(%w[kwa kwi kwu kwe kwo], %w[くぁ くぃ くぅ くぇ くぉ]),
  m(%w[ga gi gu ge go], %w[が ぎ ぐ げ ご]),
  m(%w[gwa gwi gwu gwe gwo], %w[ぐぁ ぐぃ ぐぅ ぐぇ ぐぉ]),
  m(%w[gya gyi gyu gye gyo], %w[ぎゃ ぎぃ ぎゅ ぎぇ ぎょ]),
  m(%w[xka lka xke lke], %w[ヵ ヵ ヶ ヶ]),

  m(%w[sa si su se so], %w[さ し す せ そ]),
  m(%w[sya syi syu sye syo], %w[しゃ しぃ しゅ しぇ しょ]),
  m(%w[sha shi shu she sho], %w[しゃ し しゅ しぇ しょ]),
  m(%w[swa swi swu swe swo], %w[すぁ すぃ すぅ すぇ すぉ]),
  m(%w[zwa zwi zwu zwe zwo], %w[ずぁ ずぃ ずぅ ずぇ ずぉ]),
  m(%w[za zi zu ze zo], %w[ざ じ ず ぜ ぞ]),
  m(%w[ja ji ju je jo], %w[じゃ じ じゅ じぇ じょ]),
  m(%w{jya jyi jyu jye jyo}, %w{じゃ じぃ じゅ じぇ じょ}),
  m(%w{zya zyi zyu zye zyo}, %w{じゃ じぃ じゅ じぇ じょ}),

  m(%w[ta ti tu te to], %w[た ち つ て と]),
  m(%w[tya tyi tyu tye tyo], %w[ちゃ ちぃ ちゅ ちぇ ちょ]),
  m(%w[cha chi chu che cho], %w[ちゃ ち ちゅ ちぇ ちょ]),
  m(%w[cya cyi cyu cye cyo], %w[ちゃ ちぃ ちゅ ちぇ ちょ]),
  m(%w[tsa tsi tsu tse tso], %w[つぁ つぃ つ つぇ つぉ]),
  m(%w[tha thi thu the tho], %w[てゃ てぃ てゅ てぇ てょ]),
  m(%w[twa twi twu twe two], %w[とぁ とぃ とぅ とぇ とぉ]),
  m(%w[da di du de do], %w[だ ぢ づ で ど]),
  m(%w[dya dyi dyu dye dyo], %w[ぢゃ ぢぃ ぢゅ ぢぇ ぢょ]),
  m(%w[dha dhi dhu dhe dho], %w[でゃ でぃ でゅ でぇ でょ]),
  m(%w[dwa dwi dwu dwe dwo], %w[どぁ どぃ どぅ どぇ どぉ]),

  m(%w[na ni nu ne no], %w[な に ぬ ね の]),
  m(%w[nya nyi nyu nye nyo], %w[にゃ にぃ にゅ にぇ にょ]),

  m(%w[ha hi hu he ho], %w[は ひ ふ へ ほ]),
  m(%w[hya hyi hyu hye hyo], %w[ひゃ ひぃ ひゅ ひぇ ひょ]),
  m(%w[fa fi fu fe fo], %w[ふぁ ふぃ ふ ふぇ ふぉ]),
  m(%w[fya fyu fyo], %w[ふゃ ふゅ ふょ]),
  m(%w[hwa hwi hwe hwo hwyu], %w[ふぁ ふぃ ふぇ ふぉ ふゅ]),
  m(%w[ba bi bu be bo], %w[ば び ぶ べ ぼ]),
  m(%w[bya byi byu bye byo], %w[びゃ びぃ びゅ びぇ びょ]),
  m(%w[pa pi pu pe po], %w[ぱ ぴ ぷ ぺ ぽ]),
  m(%w[pya pyi pyu pye pyo], %w[ぴゃ ぴぃ ぴゅ ぴぇ ぴょ]),

  m(%w[ma mi mu me mo], %w[ま み む め も]),
  m(%w[mya myi myu mye myo], %w[みゃ みぃ みゅ みぇ みょ]),

  m(%w[ya yu ye yo], %w[や ゆ いぇ よ]), # yi は無いらしい
  m(%w[xya xyu xyo], %w[ゃ ゅ ょ]),
  m(%w[lya lyu lyo], %w[ゃ ゅ ょ]),
  entry('wyi', 'ゐ'),
  entry('wye', 'ゑ'),

  m(%w[ra ri ru re ro], %w[ら り る れ ろ]),
  m(%w[rya ryi ryu rye ryo], %w[りゃ りぃ りゅ りぇ りょ]),

  m(%w[wa wi wu we wo], %w[わ うぃ う うぇ を]),
  m(%w[wha whi whu whe who], %w[うぁ うぃ う うぇ うぉ]),
  entry('xwa', 'ゎ'),
  entry('lwa', 'ゎ'),

  entry('nn', 'ん'),
  entry('n', 'ん'),
  entry('xn', 'ん'),

  %w[q v l x k g s z j t d h f b p m y r w c].map { entry(it+it, 'っ', it) },
  entry('xtu', 'っ'),
  entry('xtsu', 'っ'),
  entry('ltu', 'っ'),
  entry('ltsu', 'っ'),
  entry('tch', 'っ', 'ch'),

  entry('www', 'w', 'ww'),

  entry('t\'i', 'てぃ'),
  entry('t\'yu', 'てゅ'),
  entry('d\'i', 'でぃ'),
  entry('d\'yu', 'でゅ'),
  entry('t\'u', 'とぅ'),
  entry('d\'u', 'どぅ'),
  entry('n\'', 'ん'),

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
]

# AZIK
# refs http://bibouroku.net/azik
entries += [
  entry(';', 'っ'),
  entry('q', 'ん'),
  m(%w[xa xu xo], %w[しゃ しゅ しょ]),
  m(%w[ca cu co], %w[ちゃ ちゅ ちょ]),

  # 撥音
  m(%w[kz kk kj kd kl], %w[かん きん くん けん こん]).reject { |e| e.start_with?('kk') },
  m(%w[gz gk gj gd gl], %w[がん ぎん ぐん げん ごん]),
  m(%w[sz sk sj sd sl], %w[さん しん すん せん そん]),
  m(%w[zz zk zj zd zl], %w[ざん じん ずん ぜん ぞん]).reject { |e| e.start_with?('zz') },
  m(%w[tz tk tj td tl], %w[たん ちん つん てん とん]),
  m(%w[dz dk dj dd dl], %w[だん ぢん づん でん どん]).reject { |e| e.start_with?('dd') },
  m(%w[nz nk nj nd nl], %w[なん にん ぬん ねん のん]),
  m(%w[hz hk hj hd hl], %w[はん ひん ふん へん ほん]),
  m(%w[bz bk bj bd bl], %w[ばん びん ぶん べん ぼん]),
  m(%w[pz pk pj pd pl], %w[ぱん ぴん ぷん ぺん ぽん]),
  m(%w[mz mk mj md ml], %w[まん みん むん めん もん]),
  m(%w[yz yk yj yd yl], %w[やん ゆん よん]),
  m(%w[rz rk rj rd rl], %w[らん りん るん れん ろん]),
  m(%w[wz wk wj wd wl], %w[わん うぃん うん うぇん をん]),
  # きゃん ちゃん とかあたりは一旦作ってない

  # 二重母音
  # TODO

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
  entry('nr', 'なる'),
  entry('nt', 'にち'),
  entry('nb', 'ねば'),
  entry('ht', 'ひと'),
  entry('bt', 'びと'),
  entry('ms', 'ます'),
  entry('mt', 'また'),
  entry('mn', 'もの'),
  entry('yr', 'よる'),
  # entry('rr', 'られ'),
  entry('wt', 'わた'),
  entry('wr', 'われ'),
]

entries = entries.flatten(1)
keys = entries.map { it.split("\t").first }
dup_keys = keys.group_by { it }.select { |_, v| v.size > 1 }.keys
if dup_keys.any?
  warn "Duplicate keys found: #{dup_keys.join(', ')}"
  exit 1
end

File.write('romantable.txt', entries.sort.join("\n"))
