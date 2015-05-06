;+
; PROCEDURE:
;
;1 Basic Test
;
; akb_load_pws
;
;2 /downloadonly
;
; akb_load_pws, /downloadonly
;
;3 /no_download
;
; akb_load_pws, /no_download
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2015-03-20 14:31:54 +0900 (Fri, 20 Mar 2015) $
; $LastChangedRevision: 449 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/akebono/erg_akb_pws_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0

thm_init

;set to somewhere appropriate, if needed
t_dateB = '1990-02-02'
t_dateE = '1990-02-03'
timespan, t_dateB

del_data,'*'

;1 Basic Test
; akb_load_pws

t_name='basic'
tpName='akb_pws_Mode akb_pws_Gain akb_pws_RX1 akb_pws_RX2' ; tplot_names

catch,err

if err eq 0 then begin

  akb_load_pws

  ;just spot checking cause there are a lot of data types
  print_tvar_info, tpName

  if ~data_exists(tpName[0],t_dateB,t_dateE) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;2 /downloadonly
; akb_load_pws, /downloadonly

t_name = '/downloadonly'
tpName='akb_pws_Mode akb_pws_Gain akb_pws_RX1 akb_pws_RX2' ; tplot_names

catch,err

if err eq 0 then begin

  akb_load_pws, /downloadonly

  if data_exists(tpName[0],t_dateB,t_dateE) then message,'invalid downloadonly'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;3 /no_download
;
; akb_load_pws, /no_download

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin

  akb_load_pws, /no_download

  if data_exists(tpName[0], t_dateB, t_dateE) then $
    message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
