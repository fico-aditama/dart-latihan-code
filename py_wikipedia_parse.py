import mysql.connector
import xml.etree.ElementTree as ET

# Establish MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="your_database"
)
cursor = db.cursor()

# Parse XML data
tree = ET.parse("mediawiki_data.xml")
root = tree.getroot()

# Iterate through <page> elements
for page in root.findall(".//{http://www.mediawiki.org/xml/export-0.10/}page"):
    title = page.find("{http://www.mediawiki.org/xml/export-0.10/}title").text
    ns = page.find("{http://www.mediawiki.org/xml/export-0.10/}ns").text
    page_id = page.find("{http://www.mediawiki.org/xml/export-0.10/}id").text
    revision = page.find("{http://www.mediawiki.org/xml/export-0.10/}revision")

    # Extract revision information
    revision_id = revision.find("{http://www.mediawiki.org/xml/export-0.10/}id").text
    timestamp = revision.find("{http://www.mediawiki.org/xml/export-0.10/}timestamp").text
    contributor = revision.find("{http://www.mediawiki.org/xml/export-0.10/}contributor")
    username = contributor.find("{http://www.mediawiki.org/xml/export-0.10/}username").text
    comment = revision.find("{http://www.mediawiki.org/xml/export-0.10/}comment").text

    # Construct and execute SQL query
    sql_query = "INSERT INTO your_table_name (title, ns, page_id, revision_id, timestamp, username, comment) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    values = (title, ns, page_id, revision_id, timestamp, username, comment)
    cursor.execute(sql_query, values)
    db.commit()

# Close database connection
cursor.close()
db.close()
