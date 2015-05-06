;
;1 basic
; erg_load_camera_omti_asi
;
;2 single site
;
; erg_load_camera_omti_asi,site='drw'
;
;3 multi sites string
;
; erg_load_camera_omti_asi,site='sgk drw'
;
;4 multi sites array
;
; erg_load_camera_omti_asi,site=['sgk', 'sta', 'yng', 'drw']
;
;5 caps site
;
; erg_load_camera_omti_asi,site=['DRW']
;
;6 load all sites
;
; erg_load_camera_omti_asi,site='all'
;
;7 load * sites
;
; erg_load_camera_omti_asi,site='*'
;
;8 single wavelength
;
; erg_load_camera_omti_asi, wavelength='6300', site='drw'
;
;9 multi wavelengths string
;
; erg_load_camera_omti_asi, wavelength='5577 6300', site='drw'
;
;10 array wavelength
;
; erg_load_camera_omti_asi, wavelength=['5577', '6300'], site='drw'
;
;11 /downloadonly
;
; erg_load_camera_omti_asi, site='drw', /downloadonly
;
;12 /no_download
;
; erg_load_camera_omti_asi, /no_download
;
;13 /no_server
;
; erg_load_camera_omti_asi, /no_server
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2014-01-24 15:53:15 +0900 (Fri, 24 Jan 2014) $
; $LastChangedRevision: 409 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/camera/erg_camera_omti_asi_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
qa_timespan = strarr(1,2)
;;qa_timespan[0,*] = [ '2012-09-04/00:00:00', '2012-09-05/00:00:00']
qa_timespan[0,*] = [ '2012-09-04/10:00', '2012-09-04/12:00']
qa_t = 0

thm_init

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'

timespan, qa_timespan[qa_t], 2, /hour

del_data,'*'

;1 Basic Test
; erg_load_camera_omti_asi

t_name='basic'
cmp_TName = 'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi

  ; just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
;
; erg_load_camera_omti_asi,site='drw'
;

t_name='single site'
cmp_TName = 'omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site='drw'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; erg_load_camera_omti_asi,site='sgk drw'
;

t_name='multi site string'
cmp_TName = 'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site='sgk drw'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; erg_load_camera_omti_asi,site=['sgk', 'sta', 'yng', 'drw']
;

t_name='multi sites array'
cmp_TName = 'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site=['sgk', 'sta', 'yng', 'drw']

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; erg_load_camera_omti_asi,site=['DRW']
;

t_name='caps site'
cmp_TName = 'omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site=['DRW']

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; erg_load_camera_omti_asi,site='all'
;
;

t_name='all sites'
cmp_TName = $
    'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site='all'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;7 load * sites
;
; erg_load_camera_omti_asi,site='*'
;

t_name='*'
cmp_TName = $
    'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi,site='*'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 single wavelength
;
; erg_load_camera_omti_asi, wavelength='6300', site='drw'
;

t_name='single wavelength'
cmp_TName = 'omti_asi_drw_6300_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, wavelength='6300', site='drw'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 multi wavelengths string
;
; erg_load_camera_omti_asi, wavelength='5577 6300', site='drw'
;

t_name='multi wavelengths string'
cmp_TName = $
  'omti_asi_drw_5577_image_raw omti_asi_drw_6300_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, wavelength='5577 6300', site='drw'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 array wavelength
;
; erg_load_camera_omti_asi, wavelength=['5577', '6300'], site='drw'
;

t_name='array wavelength'
cmp_TName = $
  'omti_asi_drw_5577_image_raw omti_asi_drw_6300_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, wavelength=['5577', '6300'], site='drw'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 /downloadonly
;
; erg_load_camera_omti_asi, site='drw', /downloadonly
;

t_name = '/downloadonly'
cmp_TName = 'omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, site='drw', /downloadonly

  IF data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'existed data'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;12 /no_download
;
; erg_load_camera_omti_asi, /no_download

t_name = 'no_download'
cmp_TName = $
    'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, /no_download

  IF data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
    message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


;13 /no_server
;
; erg_load_camera_omti_asi, /no_server

t_name = 'no_server'
cmp_TName = $
    'omti_asi_sgk_5577_image_raw omti_asi_sgk_cloud omti_asi_sta_5577_image_raw omti_asi_sta_cloud omti_asi_yng_5577_image_raw omti_asi_yng_cloud omti_asi_drw_5577_image_raw omti_asi_drw_cloud'

catch,err

if err eq 0 then begin

  erg_load_camera_omti_asi, /no_server

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
    message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
