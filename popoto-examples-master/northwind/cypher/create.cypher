LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row,
     toInteger(row.total_tempat_tidur) AS beds,
     toInteger(row.total_layanan) AS services,
     toInteger(row.total_tenaga_kerja) AS workforce
MERGE (h:Hospital {id: row.id})
SET h.nama = row.nama,
    h.alamat = row.alamat,
    h.total_tempat_tidur = beds,
    h.total_layanan = services,
    h.total_tenaga_kerja = workforce


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (h:Hospital {id: row.id})
MERGE (c:City {nama: row.kab})
MERGE (h)-[:LOCATED_IN_CITY]->(c)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (c:City {nama: row.kab})
MERGE (p:Province {nama: row.propinsi})
MERGE (c)-[:BELONGS_TO_PROVINCE]->(p)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (h:Hospital {id: row.id})
MERGE (o:Ownership {nama: row.kepemilikan})
MERGE (h)-[:HAS_OWNERSHIP]->(o)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (h:Hospital {id: row.id})
MERGE (t:HospitalType {jenis: row.jenis})
MERGE (h)-[:HAS_TYPE]->(t)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (h:Hospital {id: row.id})
MERGE (cl:Class {kelas: row.kelas})
MERGE (h)-[:HAS_CLASS]->(cl)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
MERGE (h:Hospital {id: row.id})
MERGE (bs:BLUStatus {status: row.status_blu})
MERGE (h)-[:HAS_BLU_STATUS]->(bs)

LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row, toInteger(row.total_layanan) AS services
MERGE (h:Hospital {id: row.id})
MERGE (cap:Capacity {jumlah: services})
MERGE (h)-[:HAS_CAPACITY]->(cap)


LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row, toInteger(row.total_tenaga_kerja) AS workforce
MERGE (h:Hospital {id: row.id})
MERGE (wf:Workforce {jumlah: workforce})
MERGE (h)-[:HAS_WORKFORCE]->(wf)

LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row
WHERE row.total_tempat_tidur IS NOT NULL 
  AND row.total_tempat_tidur <> '' 
  AND row.total_tempat_tidur =~ '\\d+'
WITH row, toInteger(row.total_tempat_tidur) AS beds
MERGE (h:Hospital {id: row.id})
MERGE (b:Bed {jumlah: beds})
MERGE (h)-[:HAS_BED]->(b)

LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row,
     toFloat(row.latitude) AS lat,
     toFloat(row.longitude) AS lon
MERGE (h:Hospital {id: row.id})
MERGE (loc:Location {latitude: lat, longitude: lon})
MERGE (h)-[:LOCATED_AT]->(loc)

///***///
LOAD CSV WITH HEADERS FROM 'http://localhost/peduliaceh2004/rumahsakitaceh.csv' AS row
WITH row,
     toInteger(row.total_tempat_tidur) AS beds,
     toInteger(row.total_layanan) AS services,
     toInteger(row.total_tenaga_kerja) AS workforce,
     toFloat(row.latitude) AS lat,
     toFloat(row.longitude) AS lon
MERGE (h:Hospital {id: row.id})
SET h.nama = row.nama,
    h.alamat = row.alamat,
    h.total_tempat_tidur = beds,
    h.total_layanan = services,
    h.total_tenaga_kerja = workforce,
    h.latitude = lat,
    h.longitude = lon
///***///

///MATCH (h:Hospital)-[:LOCATED_AT]->(l:Location)
SET h.latitude = l.latitude,
    h.longitude = l.longitude
///
