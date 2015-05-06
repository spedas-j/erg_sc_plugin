;
;1 basic
;
; splitbeam, 'sd_hok_vlos_1'
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-08-09 15:42:52 +0900 (Tue, 09 Aug 2011) $
; $LastChangedRevision: 207 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/radar/erg_splitbeam_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
t_dateA = '2007-06-21'
t_date0 = '2007-06-21/00:00:00'
t_date1 = '2007-06-22/00:00:00'

thm_init

;set to somewhere appropriate, if needed
timespan, t_dateA, 1 ,/hour

del_data,'*'

;1 Basic Test
; erg_load_sdfit

t_name='basic'

catch,err

if err eq 0 then begin

  erg_load_sdfit, sites='hok'
  splitbeam, 'sd_hok_vlos_1'
;	print, '%%%'
;	tplot_names
;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'sd_hok_vlos_1_azim00 sd_hok_vlos_1_azim01 sd_hok_vlos_1_azim02 sd_hok_vlos_1_azim03 sd_hok_vlos_1_azim04 sd_hok_vlos_1_azim05 sd_hok_vlos_1_azim06 sd_hok_vlos_1_azim07 sd_hok_vlos_1_azim08 sd_hok_vlos_1_azim09 sd_hok_vlos_1_azim10 sd_hok_vlos_1_azim11 sd_hok_vlos_1_azim12 sd_hok_vlos_1_azim13 sd_hok_vlos_1_azim14 sd_hok_vlos_1_azim15'

  if ~data_exists( $
    'sd_hok_vlos_1_azim00 sd_hok_vlos_1_azim01 sd_hok_vlos_1_azim02 sd_hok_vlos_1_azim03 sd_hok_vlos_1_azim04 sd_hok_vlos_1_azim05 sd_hok_vlos_1_azim06 sd_hok_vlos_1_azim07 sd_hok_vlos_1_azim08 sd_hok_vlos_1_azim09 sd_hok_vlos_1_azim10 sd_hok_vlos_1_azim11 sd_hok_vlos_1_azim12 sd_hok_vlos_1_azim13 sd_hok_vlos_1_azim14 sd_hok_vlos_1_azim15', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
