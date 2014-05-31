# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alg = Team.create(name: 'Algeria',abbreviate: 'alg')
arg = Team.create(name: 'Argentina',abbreviate: 'arg')
aus = Team.create(name: 'Australia',abbreviate: 'aus')
bel = Team.create(name: 'Belgium',abbreviate: 'bel')
bih = Team.create(name: 'Bosnia and Herzegovina',abbreviate: 'bih')
bra = Team.create(name: 'Brasil',abbreviate: 'bra')
chi = Team.create(name: 'Chile',abbreviate: 'chi')
civ = Team.create(name: "Cote D'Ivoire",abbreviate: 'civ')
cmr = Team.create(name: 'Cameroon',abbreviate: 'cmr')
col = Team.create(name: 'Colombia',abbreviate: 'col')

crc = Team.create(name: 'Costa Rica',abbreviate: 'crc')
cro = Team.create(name: 'Croatia',abbreviate: 'cro')
ecu = Team.create(name: 'Ecuador',abbreviate: 'ecu')
eng = Team.create(name: 'England',abbreviate: 'eng')
esp = Team.create(name: 'Spain',abbreviate: 'esp')
fra = Team.create(name: 'France',abbreviate: 'fra')
ger = Team.create(name: 'Germany',abbreviate: 'ger')
gha = Team.create(name: 'Ghana',abbreviate: 'gha')
gre = Team.create(name: 'Greece',abbreviate: 'gre')
hon = Team.create(name: 'Honduras',abbreviate: 'hon')

irn = Team.create(name: 'Iran',abbreviate: 'irn')
ita = Team.create(name: 'Italy',abbreviate: 'ita')
jpn = Team.create(name: 'Japan',abbreviate: 'jpn')
kor = Team.create(name: 'Korea Republic',abbreviate: 'kor')
mex = Team.create(name: 'Mexico',abbreviate: 'mex')
ned = Team.create(name: 'Netherlands',abbreviate: 'ned')
nga = Team.create(name: 'Nigeria',abbreviate: 'nga')
por = Team.create(name: 'Portugal',abbreviate: 'por')
rus = Team.create(name: 'Russia',abbreviate: 'rus')
sui = Team.create(name: 'Switzerland',abbreviate: 'sui')

usa = Team.create(name: 'USA',abbreviate: 'usa')
uru = Team.create(name: 'Uruguay',abbreviate: 'uru')

#pong = Player.create(name: 'pong',uid: '10152042428021695',admin: true,team: ita)
#beer = Player.create(name: 'beer',uid: '100001280493339',admin: false,team: eng)

match01 = Match.create(description: 'Group Stage : A#01',match: '2014-06-12 03:00:00 +0700',team1: bra, team2: cro ,live: '7,8,WC',closed: false)
match02 = Match.create(description: 'Group Stage : A#02',match: '2014-06-13 23:00:00 +0700',team1: mex, team2: cmr ,live: '7,8,WC',closed: false)
match03 = Match.create(description: 'Group Stage : B#01',match: '2014-06-13 02:00:00 +0700',team1: esp, team2: ned ,live: '8,WC',closed: false)
match04 = Match.create(description: 'Group Stage : B#02',match: '2014-06-13 05:00:00 +0700',team1: chi, team2: aus ,live: 'WC',closed: false)
match05 = Match.create(description: 'Group Stage : C#01',match: '2014-06-14 23:00:00 +0700',team1: col, team2: gre ,live: '8,WC',closed: false)

match06 = Match.create(description: 'Group Stage : D#01',match: '2014-06-14 02:00:00 +0700',team1: uru, team2: crc ,live: '7,8,WC',closed: false)
match07 = Match.create(description: 'Group Stage : D#02',match: '2014-06-14 05:00:00 +0700',team1: eng, team2: ita ,live: 'WC',closed: false)
match08 = Match.create(description: 'Group Stage : C#01',match: '2014-06-15 08:00:00 +0700',team1: civ, team2: jpn ,live: 'WC',closed: false)
match09 = Match.create(description: 'Group Stage : E#01',match: '2014-06-15 23:00:00 +0700',team1: sui, team2: ecu ,live: '8,WC',closed: false)
match10 = Match.create(description: 'Group Stage : E#02',match: '2014-06-15 02:00:00 +0700',team1: fra, team2: hon ,live: '7,8,WC',closed: false)

match11 = Match.create(description: 'Group Stage : F#01',match: '2014-06-15 05:00:00 +0700',team1: arg, team2: bih ,live: 'WC',closed: false)
match12 = Match.create(description: 'Group Stage : G#01',match: '2014-06-16 23:00:00 +0700',team1: ger, team2: por ,live: 'WC',closed: false)
match13 = Match.create(description: 'Group Stage : F#02',match: '2014-06-16 02:00:00 +0700',team1: irn, team2: nga ,live: '8,WC',closed: false)
match14 = Match.create(description: 'Group Stage : G#02',match: '2014-06-16 05:00:00 +0700',team1: gha, team2: usa ,live: 'WC',closed: false)
match15 = Match.create(description: 'Group Stage : H#01',match: '2014-06-17 23:00:00 +0700',team1: bel, team2: alg ,live: 'WC',closed: false)



