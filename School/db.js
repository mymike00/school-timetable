function dbInit()
{
    var db = LocalStorage.openDatabaseSync("subjects_db", "", "User custom subjects for his weekly school timetable", 100000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS subjects_table (day numeric,hour numeric,subject_name text)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("subjects_db", "",
                                               "Track exercise", 100000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pday, Phour, Psubject)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO subjects_table VALUES(?, ?, ?)',
                      [Pday, Phour, Psubject])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,day,hour,subject_name FROM subjects_table order by rowid desc')
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
                                 checked: " ",
                                 day: results.rows.item(i).day,
                                 hour: results.rows.item(i).hour,
                                 subject_name: results.rows.item(i).subject_name
                             })
        }
    })
}

function dbUpdate(Pday, Phour, Psubject, Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'update subjects_table set day=?, hour=?, subject_name=? where rowid = ?', [Pday, Phour, Psubject, Prowid])
    })
}

function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from subjects_table where rowid = ?', [Prowid])
    })
}
