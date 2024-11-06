
var mysql = require('mysql');

var connection = mysql.createConnection({
  host: '185.207.251.198',
  user: 'projectdbms',
  password: '1234',
  database: 'lms',
  dateStrings:true
});


function dbQuery(q,flg, callback = null)
{
  connection.query(q,function(err,rows,fields){
    if(err){
      console.log("Query Failed!! Error");
      console.log(err);
      return 0;
    }

    console.log('Query Successfull');
    if(flg) alert('Successfull');

    if (callback != null)
    callback();
    return 1;
  });
}


function selectQry(q,callback)
{
  console.log(q);
  connection.query(q,function(err,rows,fields){
    if(err){
      console.log("Query Failed!!");
      alert('Failed to retrieve');
      console.log(err);
      return;
    }

    callback(rows);
    console.log('Query Successfully executed');
  });
}
