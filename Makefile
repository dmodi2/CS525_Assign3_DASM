CC=gcc

default: assign3_1

assign3_1: test_assign3_1.o buffer_mgr.o buffer_mgr_stat.o storage_mgr.o dberror.o expr.o record_mgr.o rm_serializer.o
		$(CC) -o assign3_1 test_assign3_1.o buffer_mgr.o buffer_mgr_stat.o  storage_mgr.o dberror.o expr.o record_mgr.o rm_serializer.o -I.
				
test_expr: test_expr.o dberror.o expr.o record_mgr.o rm_serializer.o storage_mgr.o buffer_mgr.o buffer_mgr_stat.o
	    	$(CC) -o test_expr test_expr.o dberror.o expr.o record_mgr.o rm_serializer.o storage_mgr.o buffer_mgr.o buffer_mgr_stat.o -I.		
				
test_assign3_1.o:test_assign3_1.c dberror.h storage_mgr.h test_helper.h buffer_mgr.h buffer_mgr_stat.h
		$(CC) -o test_assign3_1.o -c test_assign3_1.c

test_expr.o: test_expr.c dberror.h expr.h record_mgr.h tables.h test_helper.h
		$(CC) -o test_expr.o -c test_expr.c

record_mgr.o: record_mgr.c record_mgr.h buffer_mgr.h storage_mgr.h
		$(CC) -o record_mgr.o -c record_mgr.c

expr.o: expr.c dberror.h record_mgr.h expr.h tables.h
		$(CC) -o expr.o -c expr.c

rm_serializer.o: rm_serializer.c dberror.h tables.h record_mgr.h
		$(CC) -o rm_serializer.o -c rm_serializer.c

dberror.o: dberror.c
	$(CC) -o dberror.o -c dberror.c

storage_mgr.o: storage_mgr.c
	$(CC) -o storage_mgr.o -c storage_mgr.c

buffer_mgr.o: buffer_mgr.c
	$(CC) -pthread -o buffer_mgr.o -c buffer_mgr.c

buffer_mgr_stat.o: buffer_mgr_stat.c
	$(CC) -o buffer_mgr_stat.o -c buffer_mgr_stat.c
   
clean:
	rm *.o assign3_1 

 
