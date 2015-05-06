
;1 Basic Test
; erg_load_gmag_magdas_1sec
;
;2 single site
;
; erg_load_gmag_magdas_1sec,site='onw'
;
;3 multi sites string
;
; erg_load_gmag_magdas_1sec,site='onw daw'
;
;4 multi sites array
;
; erg_load_gmag_magdas_1sec,site=['onw', 'daw', 'asb']
;
;5 caps site
;
; erg_load_gmag_magdas_1sec,site='ONW'
;
;6 load all sites
;
; erg_load_gmag_magdas_1sec,site='all'
;
;7 load * sites
;
; erg_load_gmag_magdas_1sec,site='*'
;
;8 single datatype
;
; erg_load_gmag_magdas_1sec,datatype='1sec'
;
;9 caps datatype
;
; erg_load_gmag_magdas_1sec,datatype='1SEC'
;
;10 * datatype
;
; erg_load_gmag_magdas_1sec,datatype='*'
;
;11 array datatype
;
; erg_load_gmag_magdas_1sec,datatype=['1sec']
;
;12 verbose
;
; erg_load_gmag_magdas_1sec,site='ONW',/verbose
;
;13 /downloadonly
;
; erg_load_gmag_magdas_1sec,site='ONW',/downloadonly
;
;14 /no_download
; erg_load_gmag_magdas_1sec, /no_download
;
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2014-01-22 16:59:18 +0900 (Wed, 22 Jan 2014) $
; $LastChangedRevision: 407 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_magdas_1sec_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;
;	*** set time span ***
qa_timespan = strarr(1,2)
qa_timespan[0,*] = [ '2010-01-24', '2010-01-25']

qa_t = 0

timespan,qa_timespan[qa_t]

del_data,'*'

;1 Basic Test
; erg_load_gmag_nipr

t_name='basic'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; erg_load_gmag_magdas_1sec,site='onw'
;

t_name='single site'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec, site='onw'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz', $
      qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; erg_load_gmag_magdas_1sec,site='onw daw'
;

t_name='multi site string'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec, site='onw daw'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; erg_load_gmag_magdas_1sec,site=['onw', 'daw', 'asb']
;

t_name='multi sites array'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,site=['onw', 'daw', 'asb']

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz'

  IF ~data_exists($
    'magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz', $
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; erg_load_gmag_magdas_1sec,site='ONW'
;

t_name='caps site'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,site='ONW'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz', $
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; erg_load_gmag_magdas_1sec,site='all'
;

t_name='all sites'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz magdas_mag_ama_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz magdas_mag_ama_1sec_hdz',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; erg_load_gmag_magdas_1sec,site='*'
;

t_name='*'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz magdas_mag_ama_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz magdas_mag_daw_1sec_hdz magdas_mag_asb_1sec_hdz magdas_mag_ama_1sec_hdz',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single datatype
;
; erg_load_gmag_magdas_1sec,datatype='1sec'
;

t_name='single datatype'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,datatype='1sec'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz', $
    qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;9 caps datatype
;
; erg_load_gmag_magdas_1sec,datatype='1SEC'
;

t_name='caps datatype'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,datatype='1SEC'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz'

  IF ~data_exists('magdas_mag_onw_1sec_hdz', $
    qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 * datatype
;
; erg_load_gmag_magdas_1sec,datatype='*'
;

t_name='* datatype'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,datatype='*'
	;PRINT, '%%%'
	;tplot_names
	;PRINT, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz magdas_mag_onw_1sec_f'

  IF ~data_exists('magdas_mag_onw_1sec_hdz magdas_mag_onw_1sec_f', $
	qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 array datatype
;
; erg_load_gmag_magdas_1sec,datatype=['1sec']
;

t_name='array datatype'

CATCH,err

IF err EQ 0 THEN BEGIN

  erg_load_gmag_magdas_1sec,datatype=['1sec']

;just spot checking cause there are a lot of data types
  print_tvar_info,'magdas_mag_onw_1sec_hdz magdas_mag_onw_1sec_f'

  IF ~data_exists('magdas_mag_onw_1sec_hdz magdas_mag_onw_1sec_f', $
	qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN message,'invalid load'

ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 verbose
;
; erg_load_gmag_magdas_1sec,site='ONW',/verbose
;

t_name='verbose'

CATCH,err

IF err EQ 0 THEN BEGIN
  erg_load_gmag_magdas_1sec,site='ONW',/verbose
ENDIF

CATCH,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /downloadonly
;
; erg_load_gmag_magdas_1sec,site='ONW',/downloadonly
;

t_name = '/downloadonly'
CATCH,err
IF err EQ 0 THEN BEGIN
  erg_load_gmag_magdas_1sec,site='ONW',/downloadonly

  IF data_exists('magdas_mag_*', qa_timespan[qa_t,0], qa_timespan[qa_t,1]) $
    THEN message,'invalid load'

ENDIF
CATCH,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /no_download
;
; erg_load_gmag_magdas_1sec, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

CATCH,err

IF err EQ 0 THEN BEGIN
  erg_load_gmag_magdas_1sec, /no_download

  IF data_exists('magdas_mag_onw_1sec_hdz', $
    qa_timespan[qa_t,0], qa_timespan[qa_t,1]) $
    THEN message, 'Unexpected data in temporary directory '+root_data_dir()

ENDIF

CATCH,/cancel
handle_error,err,t_name,++t_num
SETENV,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

END
