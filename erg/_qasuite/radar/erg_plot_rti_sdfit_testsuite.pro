;+
; Name: erg_plot_sdfit_testsuite.pro
;
; Purpose: SuperDARN Range-Time-Intensity plot testscript
;
; Notes:
;
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-08-11 11:41:37 +0900 (Thu, 11 Aug 2011) $
; $LastChangedRevision: 208 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/radar/erg_plot_rti_sdfit_testsuite.pro $
;-

; 1 3panel
; 2 splitbeam
; 3 zlim
; 4 splitbeam 2
; 5 splitbeam 3 
; 6 glat 
; 7 mlat 
; 8 ylim 
; 9 get_fixed_pixel_graph

init_tests

t_num = 0

thm_init
;thm_init, LOCAL_DATA_DIR='/pub/data/', $
;	REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

timespan, '2007-06-21'

t_name = '3 panel'

t_num++

catch,err

if err eq 0 then begin

  erg_load_sdfit, site='hok', /get_support_data

  tplot, ['sd_hok_pwr_1', 'sd_hok_vlos_1', 'sd_hok_spec_width_1']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 2 splitbeam 1
;
t_name = 'splitbeam 1'

t_num++

catch,err

if err eq 0 then begin

  splitbeam, 'sd_hok_vlos_1'

  tplot, ['sd_hok_vlos_1_azim01', 'sd_hok_vlos_1_azim03', $
	'sd_hok_vlos_1_azim05', 'sd_hok_vlos_1_azim07']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 3 zlim
;
t_name = 'zlim'

t_num++

catch,err

if err eq 0 then begin

  zlim, ['sd_hok_vlos_1_azim01', 'sd_hok_vlos_1_azim03', $
	'sd_hok_vlos_1_azim05', 'sd_hok_vlos_1_azim07'], -300, 300, 0

  tplot, ['sd_hok_vlos_1_azim01', 'sd_hok_vlos_1_azim03', $
	'sd_hok_vlos_1_azim05', 'sd_hok_vlos_1_azim07']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 4 splitbeam 2
;
t_name = 'splitbeam 2'

t_num++

catch,err

if err eq 0 then begin

  tlimit, '2007-06-21/13:00', '2007-06-21/15:00'

  splitbeam, 'sd_hok_vlos_bothscat_1'

  tplot, 'sd_hok_vlos_iscat_1_azim03'

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 5 splitbeam 3 
;
t_name = 'splitbeam 3'

t_num++

catch,err

if err eq 0 then begin

  loadct_sd, 43

  tplot, 'sd_hok_vlos_bothscat_1_azim03'

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 6 glat 
;
t_name = 'glat'

t_num++

catch,err

if err eq 0 then begin

  set_coords, ['sd_hok_vlos_bothscat_1_azim03'], 'glat'

  tplot, ['sd_hok_vlos_bothscat_1_azim03']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 7 mlat 
;
t_name = 'mlat'

t_num++

catch,err

if err eq 0 then begin

  set_coords, ['sd_hok_vlos_bothscat_1_azim03'], 'mlat'

  tplot, ['sd_hok_vlos_bothscat_1_azim03']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 8 ylim 
;
t_name = 'ylim'

t_num++

catch,err

if err eq 0 then begin

  ylim, 'sd_hok_vlos_bothscat_1', 57.0, 68.0

  tplot, ['sd_hok_vlos_bothscat_1_azim03']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 9 get_fixed_pixel_graph
;
t_name = 'get_fixed_pixel_graph'

t_num++

catch,err

if err eq 0 then begin

  get_fixed_pixel_graph, 'sd_hok_vlos_1', beam=3, range_gate=65

  tplot, ['sd_hok_vlos_bothscat_1_azim03', $
	'sd_hok_vlos_1_bm03rg065']

  makepng, './plot_sdfit_rti' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

del_data,'*'

end_tests

end
