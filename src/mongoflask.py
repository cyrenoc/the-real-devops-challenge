from datetime import date, datetime
import json  #get list on object json
import ast   #to solve single quote and final comma issues

from collections import namedtuple

import isodate as iso
from bson import ObjectId
from flask.json import JSONEncoder
from werkzeug.routing import BaseConverter


class MongoJSONEncoder(JSONEncoder):
    def default(self, o):
        if isinstance(o, (datetime, date)):
            return iso.datetime_isoformat(o)
        if isinstance(o, ObjectId):
            return str(o)
        else:
            return super().default(o)


class ObjectIdConverter(BaseConverter):
    def to_python(self, value):
        return ObjectId(value)

    def to_url(self, value):
        return str(value)
def _json_object_hook(d): return namedtuple('X', d.keys())(*d.values())
def json2obj(data): return json.loads(data, object_hook=_json_object_hook)
def subt(str):
    return "\""+str+"\":"
def subt2(stri,last=False):
   stringR=""
   if last==True:
      stringR="\""+str(stri)+"\""
   else:
      stringR="\""+str(stri)+"\","

   return stringR

def decodeString(result,_id=None):
    result2=[]
    for key in result:
      row1=key['URL']
      row2=str(key['_id'])
      row3=key['address']
      row4=key['address line 2']
      row5=key['name']
      row6=key['outcode']
      row7=key['postcode']
      row8=key['rating']
      row9=key['type_of_food']
      row="{"+subt("URL")+subt2(row1,False)+subt("id")+subt2(row2,False)+ \
 	 subt("address")+subt2(row3,False)+subt("address_line_2")+subt2(row4,False) + \
	 subt("name")+subt2(row5,False)+subt("outcode")+subt2(row6,False) + \
	 subt("postcode")+subt2(row7,False)+subt("rating")+subt2(row8,False) + \
	 subt("type_of_food")+subt2(row9,True)+"}"
      #print(row)
      #print(json2obj(row))  #convert to string, then convert to object python
      result2.append(json.loads(row))

    return result2

def find_restaurants(mongo, _id=None):
    query = {}
    result={};
    result2=[]

    if _id:
       #print ("prinsazo: "+(_id))
       query["_id"] = ObjectId(_id)
       result=list(mongo.db.restaurant.find(query))
       result2=decodeString(result,_id)
       if not result2:
          #result2="ERROR 204 - no match found."
          result2="<p style='color:#FF0000';>ERROR 204</p> -no match found."
       #print("calc: "+str(result))
          #for key in query:
          #   print (key, ":", query[key]) 
    else:
        result=list(mongo.db.restaurant.find(query))
        result2=decodeString(result)
      
    return result2
