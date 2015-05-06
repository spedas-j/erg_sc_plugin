;
;1 basic
;
; erg_load_sdfit 
;
;2 single site
;
; erg_load_sdfit, sites='hok'
;
;3 multi sites string
;
; erg_load_sdfit, sites='hok ksr'
;
;4 multi sites array
;
; erg_load_sdfit, sites=['hok', 'ksr', 'sye', 'sys']
;
;5 caps site
;
; erg_load_sdfit, sites=['HOK']
;
;6 load all sites
;
; erg_load_sdfit, sites='all'
;
;7 load * sites
;
; erg_load_sdfit, sites='*'
;
;8 get_support_data: Turn this on to load the supporting data
;
; erg_load_sdfit, sites='hok', /get_support_data
;
;9 noacknowledgment
;
; erg_load_sdfit, sites='hok', /get_support_data, /noacknowledgment
;
;10 /downloadonly
;
; erg_load_sdfit, site='hok', /get_support_data, /downloadonly
;
;11 /no_download
;
; erg_load_sdfit, site='hok', /get_support_data, /no_download
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2014-02-07 15:00:24 +0900 (Fri, 07 Feb 2014) $
; $LastChangedRevision: 415 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/radar/erg_sdfit_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
t_dateA = '2007-06-21'
t_date0 = '2007-06-21/00:00:00'
t_date1 = '2007-06-22/00:00:00'

thm_init

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
timespan, t_dateA, 1 ,/hour

del_data,'*'

;1 Basic Test
; erg_load_sdfit

t_name='basic'

catch,err

if err eq 0 then begin

  erg_load_sdfit

;just spot checking cause there are a lot of data types

  if data_exists('sd_hok_azim_no_1', $
	t_date0, t_date1) then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
; erg_load_sdfit, sites='hok'
;

t_name='single site'
cmp_TName = $
	'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1'

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='hok'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;3 multi sites string
;
; erg_load_sdfit, sites='hok ksr'
;

t_name='multi site string'
cmp_TName = $
	'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1 sd_hok_pwr_1 sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0'

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='hok ksr'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; erg_load_sdfit, sites=['hok', 'ksr', 'sye', 'sys']
;

t_name='multi sites array'
hok_TName = $
	'sd_hok_azim_no_1 sd_hok_echo_flag_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_veast_1 sd_hok_veast_gscat_1 sd_hok_veast_iscat_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_vlos_gscat_1 sd_hok_vlos_iscat_1 sd_hok_vnorth_1 sd_hok_vnorth_gscat_1 sd_hok_vnorth_iscat_1 '
ksr_TName = $
	'sd_ksr_azim_no_0 sd_ksr_echo_flag_0 sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_veast_0 sd_ksr_veast_gscat_0 sd_ksr_veast_iscat_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_vlos_gscat_0 sd_ksr_vlos_iscat_0 sd_ksr_vnorth_0 sd_ksr_vnorth_gscat_0 sd_ksr_vnorth_iscat_0 '
sye_TName = $
	'sd_sye_azim_no_0 sd_sye_echo_flag_0 sd_sye_pwr_0 sd_sye_pwr_err_0 sd_sye_quality_0 sd_sye_quality_flag_0 sd_sye_spec_width_0 sd_sye_spec_width_err_0 sd_sye_veast_0 sd_sye_veast_gscat_0 sd_sye_veast_iscat_0 sd_sye_vlos_0 sd_sye_vlos_err_0 sd_sye_vlos_gscat_0 sd_sye_vlos_iscat_0 sd_sye_vnorth_0 sd_sye_vnorth_gscat_0 sd_sye_vnorth_iscat_0 '
sys_TName = $
	'sd_sys_azim_no_0 sd_sys_echo_flag_0 sd_sys_pwr_0 sd_sys_pwr_err_0 sd_sys_quality_0 sd_sys_quality_flag_0 sd_sys_spec_width_0 sd_sys_spec_width_err_0 sd_sys_veast_0 sd_sys_veast_gscat_0 sd_sys_veast_iscat_0 sd_sys_vlos_0 sd_sys_vlos_err_0 sd_sys_vlos_gscat_0 sd_sys_vlos_iscat_0 sd_sys_vnorth_0 sd_sys_vnorth_gscat_0 sd_sys_vnorth_iscat_0'
cmp_TName = hok_TName + ksr_TName + sye_TName + sys_TName

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites=['ksr', 'hok', 'sye', 'sys']
	;print, '%%%'
	;tplot_names
	;print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; erg_load_sdfit, sites=['HOK']
;

t_name='caps site'
cmp_TName = hok_TName

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites=['HOK']

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; erg_load_sdfit, sites='all'
;
;

t_name='all sites'
hal_TName = $
	'sd_hal_azim_no_0 sd_hal_pwr_0 sd_hal_pwr_err_0 sd_hal_spec_width_0 sd_hal_spec_width_err_0 sd_hal_vlos_0 sd_hal_vlos_err_0 sd_hal_echo_flag_0 sd_hal_quality_0 sd_hal_quality_flag_0 sd_hal_vnorth_0 sd_hal_veast_0 sd_hal_vlos_iscat_0 sd_hal_vlos_gscat_0'
han_TName = $
	'sd_han_azim_no_2 sd_han_pwr_2 sd_han_pwr_err_2 sd_han_spec_width_2 sd_han_spec_width_err_2 sd_han_vlos_2 sd_han_vlos_err_2 sd_han_echo_flag_2 sd_han_quality_2 sd_han_quality_flag_2 sd_han_vnorth_2 sd_han_veast_2 sd_han_vlos_iscat_2 sd_han_vlos_gscat_2'
kod_TName = $
	'sd_kod_azim_no_0 sd_kod_pwr_0 sd_kod_pwr_err_0 sd_kod_spec_width_0 sd_kod_spec_width_err_0 sd_kod_vlos_0 sd_kod_vlos_err_0 sd_kod_echo_flag_0 sd_kod_quality_0 sd_kod_quality_flag_0 sd_kod_vnorth_0 sd_kod_veast_0 sd_kod_vlos_iscat_0 sd_kod_vlos_gscat_0'
pgr_TName = $
	'sd_pgr_azim_no_0 sd_pgr_pwr_0 sd_pgr_pwr_err_0 sd_pgr_spec_width_0 sd_pgr_spec_width_err_0 sd_pgr_vlos_0 sd_pgr_vlos_err_0 sd_pgr_echo_flag_0 sd_pgr_quality_0 sd_pgr_quality_flag_0 sd_pgr_vnorth_0 sd_pgr_veast_0 sd_pgr_vlos_iscat_0 sd_pgr_vlos_gscat_0'
pyk_TName = $
	'sd_pyk_azim_no_2 sd_pyk_pwr_2 sd_pyk_pwr_err_2 sd_pyk_spec_width_2 sd_pyk_spec_width_err_2 sd_pyk_vlos_2 sd_pyk_vlos_err_2 sd_pyk_echo_flag_2 sd_pyk_quality_2 sd_pyk_quality_flag_2 sd_pyk_vnorth_2 sd_pyk_veast_2 sd_pyk_vlos_iscat_2 sd_pyk_vlos_gscat_2'
rkn_TName = $
	'sd_rkn_azim_no_4 sd_rkn_pwr_4 sd_rkn_pwr_err_4 sd_rkn_spec_width_4 sd_rkn_spec_width_err_4 sd_rkn_vlos_4 sd_rkn_vlos_err_4 sd_rkn_echo_flag_4 sd_rkn_quality_4 sd_rkn_quality_flag_4 sd_rkn_vnorth_4 sd_rkn_veast_4 sd_rkn_vlos_iscat_4 sd_rkn_vlos_gscat_4'
sas_TName = $
	'sd_sas_azim_no_0 sd_sas_pwr_0 sd_sas_pwr_err_0 sd_sas_spec_width_0 sd_sas_spec_width_err_0 sd_sas_vlos_0 sd_sas_vlos_err_0 sd_sas_echo_flag_0 sd_sas_quality_0 sd_sas_quality_flag_0 sd_sas_vnorth_0 sd_sas_veast_0 sd_sas_vlos_iscat_0 sd_sas_vlos_gscat_0'
sto_TName = $
	'sd_tig_azim_no_2 sd_tig_pwr_2 sd_tig_pwr_err_2 sd_tig_spec_width_2 sd_tig_spec_width_err_2 sd_tig_vlos_2 sd_tig_vlos_err_2 sd_tig_echo_flag_2 sd_tig_quality_2 sd_tig_quality_flag_2 sd_tig_vnorth_2 sd_tig_veast_2 sd_tig_vlos_iscat_2 sd_tig_vlos_gscat_2'
tig_TName = $
	'sd_tig_azim_no_2 sd_tig_pwr_2 sd_tig_pwr_err_2 sd_tig_spec_width_2 sd_tig_spec_width_err_2 sd_tig_vlos_2 sd_tig_vlos_err_2 sd_tig_echo_flag_2 sd_tig_quality_2 sd_tig_quality_flag_2 sd_tig_vnorth_2 sd_tig_veast_2 sd_tig_vlos_iscat_2 sd_tig_vlos_gscat_2'
unw_TName = $
	'sd_unw_azim_no_2 sd_unw_pwr_2 sd_unw_pwr_err_2 sd_unw_spec_width_2 sd_unw_spec_width_err_2 sd_unw_vlos_2 sd_unw_vlos_err_2 sd_unw_echo_flag_2 sd_unw_quality_2 sd_unw_quality_flag_2 sd_unw_vnorth_2 sd_unw_veast_2 sd_unw_vlos_iscat_2 sd_unw_vlos_gscat_2'
cmp_TName = hok_TName + ksr_TName + sye_TName + sys_TName + ' ' + $
	hal_TName + ' ' + han_TName + ' ' + kod_TName + ' ' + $
	pgr_TName + ' ' + rkn_TName + ' ' + $
	sas_TName + ' ' + sto_TName + ' ' + tig_TName + ' ' + unw_TName

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='all'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;7 load * sites
;
; erg_load_sdfit, sites='*'
;

t_name='*'
cmp_TName = hok_TName + ksr_TName + sye_TName + sys_TName + ' ' + $
	hal_TName + ' ' + han_TName + ' ' + kod_TName + ' ' + $
	pgr_TName + ' ' + rkn_TName + ' ' + $
	sas_TName + ' ' + sto_TName + ' ' + tig_TName + ' ' + unw_TName

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='*'
	;print, '%%%'
	;tplot_names
	;print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 get_support_data
;
; erg_load_sdfit, sites='hok', /get_support_data
;

t_name='get_support_data'
cmp_TName = hok_TName

catch,err

if err eq 0 then begin

 erg_load_sdfit, sites='hok', /get_support_data
	;print, '%%%'
	;tplot_names
	;print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 noacknowledgment
;
; erg_load_sdfit, sites='hok', /get_support_data, /noacknowledgment
;

t_name='noacknowledgement'
cmp_TName = hok_TName

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='hok', /get_support_data, /noacknowledgment

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  if ~data_exists(cmp_TName, t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 /downloadonly
;
; erg_load_sdfit, site='hok', /get_support_data, /downloadonly
;

t_name = '/downloadonly'

catch,err

if err eq 0 then begin

  erg_load_sdfit, site='hok', /get_support_data, /downloadonly

  if data_exists('sd_hok_azim_no_1', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 /no_download
;
; erg_load_sdfit, site='hok', /get_support_data, /no_download
;

t_name = 'no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here
FILE_DELETE, GETENV('IDL_TMPDIR') + 'data/', /ALLOW_NONEXISTENT, /RECURSIVE
FILE_MKDIR, GETENV('IDL_TMPDIR') + 'data/'

catch,err

if err eq 0 then begin

  erg_load_sdfit, site='ksr', /get_support_data, /no_download

  if data_exists('sd_ksr_azim_no_0', t_date0, t_date1) then begin
    message, 'Unexpected data in temporary directory : '+ root_data_dir()
  endif

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
