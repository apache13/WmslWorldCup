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

play01 = Player.create(name: 'plyaer-01',uid: '10152042428021695',team: eng)
play02 = Player.create(name: 'plyaer-02',uid: '10152042428021695',team: ita)
play03 = Player.create(name: 'plyaer-03',uid: '10152042428021695',team: ned)
play04 = Player.create(name: 'plyaer-04',uid: '10152042428021695',team: ger)
play05 = Player.create(name: 'plyaer-05',uid: '10152042428021695',team: esp)

match01 = Match.create(description: 'Group Stage : A',match: '2014-06-12 17:00:00 UTC',team1: bra, team2: cro ,ready: false)
match02 = Match.create(description: 'Group Stage : A',match: '2014-06-13 13:00:00 UTC',team1: mex, team2: cmr ,ready: false)
match03 = Match.create(description: 'Group Stage : B',match: '2014-06-13 16:00:00 UTC',team1: esp, team2: ned ,ready: false)
match04 = Match.create(description: 'Group Stage : B',match: '2014-06-13 18:00:00 UTC',team1: chi, team2: aus ,ready: false)


