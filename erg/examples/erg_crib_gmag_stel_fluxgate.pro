;+
; PROGRAM: erg_crib_gmag_stel_fluxgate
;   This is an example crib sheet that will load STEL fluxgate magnetometer data.
;   Open this file in a text editor and then use copy and paste to copy
;   selected lines into an idl window.
;   Or alternatively compile and run using the command:
;     .run erg_crib_gmag_stel_fluxgate
;
; NOTE: See the rules of the road.
;       For more information, see http://stdb2.stelab.nagoya-u.ac.jp/magne/
;       and http://www1.osakac.ac.jp/crux/ (for mdm and tew).
;
; Written by: Y. Miyashita, Jun 19, 2013
;             ERG-Science Center, STEL, Nagoya Univ.
;             erg-sc-core at st4a.stelab.nagoya-u.ac.jp
;
;   $LastChangedBy: miyasita $
;   $LastChangedDate: 2013-06-19 01:12:22 +0900 (Wed, 19 Jun 2013) $
;   $LastChangedRevision: 265 $
;   $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc/trunk/erg/examples/erg_crib_gmag_stel_fluxgate.pro $
;-

; initialize
thm_init

; set the date and duration (in days)
timespan, '2006-11-20'


; load 1 min resolution data
erg_load_gmag_stel_fluxgate, site='msr kag', datatype='1min'

; view the loaded data names
tplot_names

; plot the H, D, and Z components
tplot, ['stel_fluxgate_mag_*_1min_hdz']
stop

; load 1 sec resolution data
erg_load_gmag_stel_fluxgate, site='msr kag', datatype='1sec'

; view the loaded data names
tplot_names

; plot the H, D, and Z components
tplot, ['stel_fluxgate_mag_*_1sec_hdz']

end
