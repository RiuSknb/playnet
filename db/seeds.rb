# ゲームジャンルを3つ作成
genres = Genre.create([
  { name: 'RPG' },
  { name: 'STG' },
  { name: 'Sports' }
])

# 各ジャンルに対応する具体的なゲームを作成
games = Game.create([
  { genre_id: genres[0].id, title: 'RPG1' },
  { genre_id: genres[0].id, title: 'RPG2' },
  { genre_id: genres[1].id, title: 'STG1' },
  { genre_id: genres[1].id, title: 'STG2' },
  { genre_id: genres[2].id, title: 'sports1' },
  { genre_id: genres[2].id, title: 'sports2' }
])