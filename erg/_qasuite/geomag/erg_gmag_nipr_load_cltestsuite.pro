
;1 basic
; erg_load_gmag_nipr
;
;2 single site
;
; erg_load_gmag_nipr,site='syo'
;
;3 multi sites string
;
; erg_load_gmag_nipr,site='syo hus'
;
;4 multi sites array
;
; erg_load_gmag_nipr,site=['syo', 'hus', 'tjo']
;
;5 caps site
;
; erg_load_gmag_nipr,site='SYO'
;
;6 load all sites
;
; erg_load_gmag_nipr,site='all'
;
;7 load * sites
;
; erg_load_gmag_nipr,site='*'
;
;8 single datatype
;
; erg_load_gmag_nipr,datatype='1sec'
;
;9 caps datatype
;
; erg_load_gmag_nipr,datatype='1SEC'
;
;10 * datatype
;
; erg_load_gmag_nipr,datatype='*'
;
;11 array datatype
;
; erg_load_gmag_nipr,datatype=['1sec']
;
;12 verbose
;
; erg_load_gmag_nipr,site='syo',/verbose
;
;13 /downloadonly
;
; erg_load_gmag_nipr,site='syo',/downloadonly
;
;14 /no_download
; erg_load_gmag_nipr, /no_download
;
;15 /fproton
; erg_load_gmag_nipr, site='syo', /fproton
;
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-10-11 17:31:49 +0900 (Tue, 11 Oct 2011) $
; $LastChangedRevision: 213 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_nipr_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;timespan,'2008-02-22',1,/hour
;	*** set time span ***
qa_timespan = strarr(2,2)
; 0. syo, hus, tjo
qa_timespan[0,*] = [ '2008-02-22', '2008-02-23']
; 1. syo (2sec)
qa_timespan[1,*] = [ '1987-02-22', '1987-02-23']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; erg_load_gmag_nipr

t_name='basic'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec'

  if ~data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; erg_load_gmag_nipr,site='syo'
;

t_name='single site'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site='syo'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec'

  if ~data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; erg_load_gmag_nipr,site='syo hus'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site='syo hus'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec nipr_mag_hus_02hz'

  if ~data_exists('nipr_mag_syo_1sec nipr_mag_hus_02hz', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; erg_load_gmag_nipr,site=['syo', 'hus', 'tjo']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site=['syo', 'hus', 'tjo']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz'

  if ~data_exists('nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; erg_load_gmag_nipr,site='SYO'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site=['SYO']

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec'

  if ~data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; erg_load_gmag_nipr,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz'

  if ~data_exists('nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; erg_load_gmag_nipr,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz'

  if ~data_exists('nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single datatype
;
; erg_load_gmag_nipr,datatype='1sec'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,datatype='1sec'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec'

  if ~data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;9 caps datatype
;
; erg_load_gmag_nipr,datatype='1SEC'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,datatype='1SEC'
	print, tnames('*')

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec'

  if ~data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 * datatype
;
; erg_load_gmag_nipr,datatype='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,datatype = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz'

  if ~data_exists('nipr_mag_syo_1sec nipr_mag_hus_02hz nipr_mag_tjo_02hz', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 array datatype
;
; erg_load_gmag_nipr,datatype=['1sec']
;

t_name='array datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_nipr,datatype=['1sec']

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_hus_1sec'

  if ~data_exists('nipr_mag_syo_1sec', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 verbose
;
;erg_load_gmag_nipr,site='syo',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

erg_load_gmag_nipr,site='syo',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /downloadonly
;
;  erg_load_gmag_nipr,site='syo',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  erg_load_gmag_nipr,site='syo',/downloadonly

  if data_exists('nipr_mag_syo_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /no_download
;
;erg_load_gmag_nipr, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  erg_load_gmag_nipr, /no_download

  if data_exists('nipr_mag_syo_1sec',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
	then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

;
;15 /fproton
;
; erg_load_gmag_nipr, site='syo', /fproton
;

t_name='/fproton'
qa_t = 1				; timerange
timespan,qa_timespan[qa_t,0],1,/hour	; change time range

catch,err

if err eq 0 then begin

;  erg_load_gmag_nipr, site='syo', datatype='2sec', /fproton
  erg_load_gmag_nipr, site='syo', /fproton
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_mag_syo_2sec nipr_mag_syo_2sec_f'

  if ~data_exists('nipr_mag_syo_2sec nipr_mag_syo_2sec_f',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
