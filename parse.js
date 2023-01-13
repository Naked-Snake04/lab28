function load() {

listModel.clear();
var xhr = new XMLHttpRequest();
xhr.open("GET","qrc:/data.json",true);
xhr.onreadystatechange = function()
{
if ( xhr.readyState == xhr.DONE)
{
if ( xhr.status == 200)
{
var jsonObject = JSON.parse(xhr.responseText);
loaded(jsonObject)
}
}
}
xhr.send();
}

function loaded(jsonObject)
{
for ( var index in jsonObject.flux.all )
{
listModel.append({
"title" : jsonObject.flux.all[index].data["title"],
"icon" : jsonObject.flux.all[index].data["icon"]});
}

// get directly the json object. Should work but not tested
//listModel.append({jsonObject.flux.all});

}
