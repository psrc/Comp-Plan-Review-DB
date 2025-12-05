library(odbc)
library(DBI)
library(psrcelmer)
library(tidyverse)
library(bit64)

accdb_path <- "C:\\Users\\cpeak\\OneDrive - Puget Sound Regional Council\\Projects\\2025\\plan_review_tracking\\Plan Review Tracking DB_copy.accdb;"
conn_str <- paste0("Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=", 
    accdb_path,
    "MaxBufferSize=2048;",
    "PageTimeout=5;",
    "MaxScanRows=0")

access_conn <- dbConnect(
    odbc::odbc(),
    .connection_string = conn_str
)

sql_conn <- dbConnect(odbc::odbc(),
  driver = "SQL Server",
  server = "SQLserver",
  database = "CompPlanReview",
  trusted_connection = "yes"
  ) 

df <- dbReadTable(access_conn, "tblActions")

tables <- dbListTables(access_conn)

read_table <- function(table_name, conn) {
    tryCatch({
       df <- dbReadTable(conn, table_name) 

    }, error = function(e) {
        print(paste("an error happened in read_table:", e))
        stop(e)
    })
}

write_table <- function(df, tbl_name, sql_conn) {
    tryCatch({
        table_id <- Id(schema="stg", table=tbl_name)
        if (tbl_name == "DatabaseHints") {
            dbWriteTable(conn=sql_conn, 
                name = table_id, 
                value = df,
                field.types = c(Notes = "VARCHAR(MAX)"),
                overwrite = TRUE)
        } else {
            dbWriteTable(conn=sql_conn, 
                name=table_id, 
                value=df,
                overwrite = TRUE)
        }
    }, error = function(e) {
        print(paste("an error happened in write_table:", e))
        stop(e)
    })
}

for (t in tables) {
    if (!substr(t, 1, 3) %in% c("qry", "MSy")) {
        if (!grepl("(Query|Query1|Errors)$", t)) {
            tbl <- sub("^(tbl|tlkp)", "", t)
            print(paste(t, tbl))
            df <- dbReadTable(access_conn, t)
            write_table(df, tbl, sql_conn)
        }
    }
}

dft <- dbReadTable(access_conn, 'tblDatabaseHints')
write_table(dft, 'DatabaseHints', sql_conn)
str(dft)
