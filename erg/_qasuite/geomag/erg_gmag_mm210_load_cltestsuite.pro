
;1 basic
; erg_load_gmag_mm210
;
;2 single site
;
; erg_load_gmag_mm210,site='msr'
;
;3 multi sites string
;
; erg_load_gmag_mm210,site='msr rik'
;
;4 multi sites array
;
; erg_load_gmag_mm210,site=['msr','rik', 'ktb']
;
;5 caps site
;
; erg_load_gmag_mm210,site='MSR'
;
;6 load all sites
;
; erg_load_gmag_mm210,site='all'
;
;7 load * sites
;
; erg_load_gmag_mm210,site='*'
;
;8 single datatype
;
; erg_load_gmag_mm210,datatype='1min'
;
;9 caps datatype
;
; erg_load_gmag_mm210,datatype='1MIN'
;
;10 * datatype
;
; erg_load_gmag_mm210,datatype='*'
;
;11 array datatype
;
; erg_load_gmag_mm210,datatype=['1MIN', '1h']
;
;12 /downloadonly
;
;erg_load_gmag_mm210,site='msr',/downloadonly
;
;13 /no_download
;
; erg_load_gmag_mm210, /no_download
;
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2013-02-13 19:03:02 +0900 (Wed, 13 Feb 2013) $
; $LastChangedRevision: 261 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_mm210_load_cltestsuite.pro $
;-


init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
timespan,'2008-02-22',1,/hour

del_data,'*'

;0 basic
; erg_load_gmag_mm210
;


;1 Basic Test
; erg_load_gmag_mm210

t_name='basic'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz','2008-02-22','2008-02-23') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;2 single site
;
; erg_load_gmag_mm210,site='msr'
;

t_name='single site'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site='msr'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; erg_load_gmag_mm210,site='msr rik'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site='msr rik'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_rik_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; erg_load_gmag_mm210,site=['msr','rik', 'ktb']
;


t_name='multi sites array'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site=['msr','rik', 'ktb']

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_ktb_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;5 caps site
;
; erg_load_gmag_mm210,site='MSR'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site=['MSR']

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; erg_load_gmag_mm210,site='all'
;
;


t_name='all sites'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site='all'

;just spot checking cause there are a lot of data types
print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;7 load * sites
;
; erg_load_gmag_mm210,site='*'
;


t_name='*'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;;;7 level 2 numerical
;;;
;;;
;;; erg_load_gmag_mm210, level=2
;;;
;;
;;t_name='level 2 numerical'
;;
;;catch,err
;;
;;if err eq 0 then begin
;;
;; erg_load_gmag_mm210,level=2
;;
;;;just spot checking cause there are a lot of data types
;;print_tvar_info,'mm210_mag_msr_1min_hdz'
;;
;;if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
;;   then message,'invalid load'
;;
;;endif
;;
;;catch,/cancel
;;
;;handle_error,err,t_name,++t_num
;;
;;del_data,'*'
;;
;;;8 level 2 string
;;;
;;; erg_load_gmag_mm210,level='l2'
;;;
;;
;;t_name='level 2 string'
;;
;;catch,err
;;
;;if err eq 0 then begin
;;
;; erg_load_gmag_mm210,level='l2'
;;
;;;just spot checking cause there are a lot of data types
;;print_tvar_info,'mm210_mag_msr_1min_hdz'
;;
;;if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
;;   then message,'invalid load'
;;
;;endif
;;
;;catch,/cancel
;;
;;handle_error,err,t_name,++t_num
;;
;;del_data,'*'
;;
;;;9 level 2 caps string
;;;
;;; erg_load_gmag_mm210,level='L2'
;;;
;;
;;
;;t_name='level 2 caps string'
;;
;;catch,err
;;
;;if err eq 0 then begin
;;
;; erg_load_gmag_mm210,level='L2'
;;
;;;just spot checking cause there are a lot of data types
;;print_tvar_info,'mm210_mag_msr_1min_hdz'
;;
;;if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
;;   then message,'invalid load'
;;
;;endif
;;
;;catch,/cancel
;;
;;handle_error,err,t_name,++t_num
;;
;;del_data,'*'

;;;10 single datatype
;8 single datatype
;
; erg_load_gmag_mm210,datatype='1min'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,datatype='1min'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;;;11 caps datatype
;9 caps datatype
;
; erg_load_gmag_mm210,datatype='1MIN'
;


t_name='caps datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,datatype='1MIN'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1min_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_rik_1min_hdz mm210_mag_ktb_1min_hdz','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;;;12 * datatype
;10 * datatype
;
; erg_load_gmag_mm210,datatype='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,datatype = '*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1h_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_msr_1h_hdz', $
	'2008-02-22','2008-02-23') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;;;12 * datatype
;11 array datatype
;
; erg_load_gmag_mm210,datatype=['1MIN', '1h']
;


t_name='array datatype'

catch,err

if err eq 0 then begin

  erg_load_gmag_mm210,datatype=['1MIN', '1h']

;just spot checking cause there are a lot of data types
  print_tvar_info,'mm210_mag_msr_1h_hdz'

  if ~data_exists('mm210_mag_msr_1min_hdz mm210_mag_msr_1h_hdz','2008-02-22','2008-02-23') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;;;13 valid_names
;;;
;;;erg_load_gmag_mm210,/valid_names,probe=testp,datatype=testd
;;;
;;
;;t_name='valid names'
;;
;;catch,err
;;
;;if err eq 0 then begin
;;
;;erg_load_gmag_mm210,site=sitep,datatype=testd,/valid_names
;;
;;if ~keyword_set(sitep) || ~keyword_set(testd) then message,'valid names not loaded'
;;
;;;just spot checking cause there are a lot of data types
;;
;;
;;endif
;;
;;catch,/cancel
;;
;;handle_error,err,t_name,++t_num
;;
;;;clear valid names vars
;;if keyword_set(sitep) then begin
;;tmp = temporary(sitep)
;;endif
;;
;;if keyword_set(testl) then begin
;;tmp = temporary(testl)
;;endif
;;
;;if keyword_set(testd) then begin
;;tmp = temporary(testd)
;;endif
;;
;;;14 verbose
;;;
;;;erg_load_gmag_mm210,site='rik',/verbose
;;
;;t_name='verbose'
;;
;;catch,err
;;
;;if err eq 0 then begin
;;
;;erg_load_gmag_mm210,site='rik',/verbose
;;
;;endif
;;
;;catch,/cancel
;;
;;handle_error,err,t_name,++t_num
;;
;;del_data,'*'
;;
;;;15 /downloadonly
;12 /downloadonly
;  erg_load_gmag_mm210,site='msr',/downloadonly
;
t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  erg_load_gmag_mm210,site='msr',/downloadonly

  if data_exists('mm210_mag_msr_*','2008-02-22','2008-02-23') $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'


; (lphilpott Oct 2011) 
; The no_download test does not test the no_download function. 
; Using the same method as for themis load routines
; (changing the !themis.local_data_dir) does not work for erg as it does not make use of !themis.local_data_dir
; Below is one possible way that I think will test this functionality. 
; The idea is to change the local data directory to some empty directory. With no_download set, no data should
; be downloaded and no local data exists so a pass result is when data_exists is false.
 
currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/';make sure there is no data here

;13 /no_download
;erg_load_gmag_mm210, /no_download
;
t_name = '/no_download'
catch,err


if err eq 0 then begin
  erg_load_gmag_mm210, /no_download

  if data_exists('mm210_mag_msr_1min_hdz', '2008-02-22','2008-02-23') then $
    message,'Unexpected data in temporary directory '+root_data_dir()

endif


catch,/cancel
handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
