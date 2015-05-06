;+
; Name: erg_plot_map_sdfit_testsuite.pro
;
; Purpose: SuperDARN plot map testscript
;
; Notes:
;
;
; $LastChangedBy: horit $
; $LastChangedDate: 2015-05-01 13:49:11 +0900 (Fri, 01 May 2015) $
; $LastChangedRevision: 456 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/radar/erg_plot_map_sdfit_testsuite.pro $
;-

; 1 basic
; 2 coast
; 3 coast + clip
; 4 center
; 5 zlim
; 6 gscatmaskoff
; 7 mltlabel
; 8 mltlabel+lonlab
; 9 geo_plot
; 10 force_scale
; 11 mutliplots

init_tests

t_num = 0

thm_init

timespan, '2007-06-21'

t_name = "basic"

t_num++

catch,err

if err eq 0 then begin

  erg_load_sdfit, site='hok', /get_sup
  loadct_sd, 44
  
  map2d_init
  map2d_time, 1344
  map2d_coord, 'aacgm' 
  plot_map_sdfit, 'sd_hok_vlos_1'

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 2 coast
;
t_name = "coast"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 3 coast+clip
;
t_name = "coast+clip"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 4 center
;
t_name = "center"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170.

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 5 zlim
;
t_name = "zlim"

t_num++

catch,err

if err eq 0 then begin

  zlim, 'sd_hok_vlos_1', -300,300
  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170.

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 6 gscatmaskoff
;
t_name = "gscatmaskoff"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170., /gscatmaskoff

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 7 mltlabel
;
t_name = "mltlabel"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170., /mltlabel

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 8 mltlabel+lonlab
;
t_name = "mltlabel+lonlab"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170., /mltlabel, lonlab=70

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num

; 9 geo_plot
;
t_name = "geo_plot"

t_num++

catch,err

if err eq 0 then begin

  map2d_coord, 'geo'
  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170.

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num
;
; 10 force_scale
;
t_name = "force_scale"

t_num++

catch,err

if err eq 0 then begin

  plot_map_sdfit, 'sd_hok_vlos_1', /coast, /clip, $
    center_glat=60., center_glon=170., force_scale=40e+6

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num
;
; 11 mutliplots
;
t_name = "multiplots"

t_num++

catch,err

if err eq 0 then begin

  ; No.1
  map2d_coord, 'aacgm'
  map2d_time, '2007-06-21/13:40'
  plot_map_sdfit, 'sd_hok_vlos_1', $
    /clip, /coast, center_glat=70,center_glon=170, $
    position=[0.0,0.5,0.5,1.0] ,/nocolorscale
  ; No.2
  map2d_time, '2007-06-21/13:50'
  plot_map_sdfit, 'sd_hok_vlos_1', $
    /clip, /coast, center_glat=70,center_glon=170, $
    position=[0.5,0.5,1.0,1.0], /noerase, /nocolorscale
  ; No.3
  map2d_time, '2007-06-21/14:00'
  plot_map_sdfit, 'sd_hok_vlos_1', $
    /clip, /coast, center_glat=70,center_glon=170, $
    position=[0.0,0.0,0.5,0.5], /noerase, /nocolorscale
  ; No.4
  map2d_time, '2007-06-21/14:10'
  plot_map_sdfit, 'sd_hok_vlos_1', $
    /clip, /coast, center_glat=70,center_glon=170, $
    position=[0.5,0.0,1.0,0.5], /noerase

  makepng, './plot_map_sdfit' + $
	strcompress(string(t_num,format='(I2.2)'),/remove_all)

endif

catch,/cancel

handle_error,err,t_name,t_num
;
del_data,'*'

end_tests

end
