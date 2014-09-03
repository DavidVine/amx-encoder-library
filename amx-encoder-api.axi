PROGRAM_NAME='amx-encoder-api'

#if_not_defined __AMX_ENCODER_API__
#define __AMX_ENCODER_API__

/*
 * --------------------
 * amx-encoder-api
 *
 * For usage, check out the readme for the amx-encoder-library.
 * --------------------
 */


define_constant

char VERSION_AMX_ENCODER_API[] = 'v1.0.0'


/*
 * --------------------
 * Encoder structures
 * 
 * Can be used by NetLinx programmer to keep track of Encoder info.
 * --------------------
 */

define_type


structure _Encoder
{
	char usbStatusFront[30]
	char usbStatusBack[30]
	char streamStatus[30]
	char recordStatus[30]
}



/*
 * --------------------
 * Encoder constants
 * --------------------
 */

define_constant


/*
 * --------------------
 * Encoder level codes
 * --------------------
 */

// integer ENCODER_LEVEL_

/*
 * --------------------
 * DVX channel codes
 * --------------------
 */

// USB channels
integer ENCODER_CHANNEL_DIM_LEDS          = 101	// on - dim; off - bright
integer ENCODER_CHANNEL_USB_CONNECTED     = 206 // on - connected; off - disconnected
integer ENCODER_CHANNEL_UNICAST_ENABLED   = 208 // on - enabled; off - disabled
integer ENCODER_CHANNEL_MULTICAST_ENABLED = 209 // on - enabled; off - disabled



/*
 * --------------------
 * Encoder command headers
 * --------------------
 */

//char ENCODER_COMMAND_ []


char ENCODER_COMMAND_ALARM[] = 'ALARM-'

// Encoding Commands
char ENCODER_COMMAND_AUDIO_IN_FORMAT_REQUEST[]                  = '?AUDIN_FORMAT'
char ENCODER_COMMAND_AUDIO_IN_FORMAT[]                          = 'AUDIN_FORMAT-'
char ENCODER_COMMAND_AUDIO_IN_SAMPLING_RATE_REQUEST[]           = '?AUDIN_SAMPLING_RATE'
char ENCODER_COMMAND_AUDIO_IN_SAMPLING_RATE[]                   = 'AUDIN_SAMPLING_RATE-'
char ENCODER_COMMAND_AUDIO_IN_CODEC_REQUEST[]                   = '?AUDSTRM_CODEC'
//char ENCODER_COMMAND_AUDIO_IN_CODEC[] = 'AUDSTRM_CODEC-'		// The '?AUDSTRM_CODEC' command gets a 'AUDIN_FORMAT-<codec>' response, according to the manual
char ENCODER_COMMAND_STREAM_AUDIO_MUTE_STATUS_REQUEST[]         = '?AUDSTRM_MUTE'
char ENCODER_COMMAND_STREAM_AUDIO_MUTE_STATUS[]                 = 'AUDSTRM_MUTE-'
char ENCODER_COMMAND_STREAM_AUDIO_BIT_RATE_REQUEST[]            = '?AUDSTRM_RATE'
char ENCODER_COMMAND_STREAM_AUDIO_BIT_RATE[]                    = 'AUDSTRM_RATE-'
char ENCODER_COMMAND_VIDEO_IN_FORMAT_REQUEST[]                  = '?VIDIN_FORMAT'
char ENCODER_COMMAND_VIDEO_IN_FORMAT[]                          = 'VIDIN_FORMAT-'
char ENCODER_COMMAND_VIDEO_IN_RESOLUTION_REQUEST[]              = '?VIDIN_RES_REF'
char ENCODER_COMMAND_VIDEO_IN_RESOLUTION[]                      = 'VIDIN_RES_REF-'
char ENCODER_COMMAND_STREAM_VIDEO_BURST_SIZE_REQUEST[]          = '?VIDSTRM_BURST'
char ENCODER_COMMAND_STREAM_VIDEO_BURST_SIZE[]                  = 'VIDSTRM_BURST-'
char ENCODER_COMMAND_STREAM_VIDEO_CODEC_REQUEST[]               = '?VIDSTRM_CODEC'
char ENCODER_COMMAND_STREAM_VIDEO_CODEC[]                       = 'VIDSTRM_CODEC-'
char ENCODER_COMMAND_STREAM_VIDEO_FRAME_DECIMATION_REQUEST[]    = '?VIDSTRM_FRAME'
char ENCODER_COMMAND_STREAM_VIDEO_FRAME_DECIMATION[]            = 'VIDSTRM_FRAME-'
char ENCODER_COMMAND_STREAM_VIDEO_GOP_SIZE_REQUEST[]            = '?VIDSTRM_GOP'
char ENCODER_COMMAND_STREAM_VIDEO_GOP_SIZE[]                    = 'VIDSTRM_GOP-'
char ENCODER_COMMAND_STREAM_VIDEO_ENCODING_PROFILE_REQUEST[]    = '?VIDSTRM_PROFILE'
char ENCODER_COMMAND_STREAM_VIDEO_ENCODING_PROFILE[]            = 'VIDSTRM_PROFILE-'
char ENCODER_COMMAND_STREAM_VIDEO_BIT_RATE_REQUEST[]            = '?VIDSTRM_RATE'
char ENCODER_COMMAND_STREAM_VIDEO_BIT_RATE[]                    = 'VIDSTRM_RATE-'
char ENCODER_COMMAND_STREAM_VIDEO_RATE_CONTROL_METHOD_REQUEST[] = '?VIDSTRM_RATE_CTRL'
char ENCODER_COMMAND_STREAM_VIDEO_RATE_CONTROL_METHOD[]         = 'VIDSTRM_RATE_CTRL-'
char ENCODER_COMMAND_STREAM_VIDEO_RESOLUTION_REQUEST[]          = '?VIDSTRM_RES'
char ENCODER_COMMAND_STREAM_VIDEO_RESOLUTION[]                  = 'VIDSTRM_RES-'


// Streaming Commands
char ENCODER_COMMAND_STREAM_FORMAT_REQUEST[]               = '?STRM_FORMAT'
char ENCODER_COMMAND_STREAM_FORMAT[]                       = 'STRM_FORMAT-'
char ENCODER_COMMAND_STREAM_MODE_REQUEST[]                 = '?VIDSTRM'
char ENCODER_COMMAND_STREAM_MODE[]                         = 'VIDSTRM-'
char ENCODER_COMMAND_STREAM_UNICAST_STATE_REQUEST[]        = '?VIDSTRM_EN'
char ENCODER_COMMAND_STREAM_UNICAST_STATE[]                = 'VIDSTRM_EN-'
char ENCODER_COMMAND_STREAM_UNICAST_IP_ADDRESS_REQUEST[]   = '?VIDSTRM_IP'
char ENCODER_COMMAND_STREAM_UNICAST_IP_ADDRESS[]           = 'VIDSTRM_IP-'
char ENCODER_COMMAND_STREAM_UNICAST_PORT_REQUEST[]         = '?VIDSTRM_PORT'
char ENCODER_COMMAND_STREAM_UNICAST_PORT[]                 = 'VIDSTRM_PORT-'
char ENCODER_COMMAND_STREAM_MULTICAST_STATE_REQUEST[]      = '?VIDSTRM_MC_EN'
char ENCODER_COMMAND_STREAM_MULTICAST_STATE[]              = 'VIDSTRM_MC_EN-'
char ENCODER_COMMAND_STREAM_MULTICAST_IP_ADDRESS_REQUEST[] = '?VIDSTRM_MC_IP'
char ENCODER_COMMAND_STREAM_MULTICAST_IP_ADDRESS[]         = 'VIDSTRM_MC_IP-'
char ENCODER_COMMAND_STREAM_MULTICAST_PORT_REQUEST[]       = '?VIDSTRM_MC_PORT'
char ENCODER_COMMAND_STREAM_MULTICAST_PORT[]               = 'VIDSTRM_MC_PORT-'
char ENCODER_COMMAND_STREAM_MULTICAST_TTL_REQUEST[]        = '?VIDSTRM_MC_TTL'
char ENCODER_COMMAND_STREAM_MULTICAST_TTL[]                = 'VIDSTRM_MC_TTL-'
char ENCODER_COMMAND_STREAM_STATUS_REQUEST[]               = '?VIDSTRM_STATUS'
char ENCODER_COMMAND_STREAM_STATUS[]                       = 'VIDSTRM_STATUS-'


// Status Commands
char ENCODER_COMMAND_DISABLE_SWITCH_REQUEST[]  = '?DISABLE_SWITCH'
char ENCODER_COMMAND_DISABLE_SWITCH[]          = 'DISABLE_SWITCH-'
char ENCODER_COMMAND_RELAY_CONTROL_REQUEST[]   = '?RELAY_CTRL'
char ENCODER_COMMAND_RELAY_CONTROL[]           = 'RELAY_CTRL-'
char ENCODER_COMMAND_VIDEO_IN_HDCP_REQUEST[]   = '?VIDIN_HDCP'
char ENCODER_COMMAND_VIDEO_IN_HDCP[]           = 'VIDIN_HDCP-'
char ENCODER_COMMAND_VIDEO_IN_STATUS_REQUEST[] = '?VIDIN_STATUS'
char ENCODER_COMMAND_VIDEO_IN_STATUS[]         = 'VIDIN_STATUS'


// USB & Recording Commands
char ENCODER_COMMAND_USB_STATUS_REQUEST[]             = '?USB_STATUS'
char ENCODER_COMMAND_USB_STATUS[]                     = 'USB_STATUS-'
char ENCODER_COMMAND_USB_PRIORITY_REQUEST[]           = '?USB_PRIORITY'
char ENCODER_COMMAND_USB_PRIORITY[]                   = 'USB_PRIORITY-'
char ENCODER_COMMAND_VIDEO_RECORDING_REQUEST[]        = '?VIDREC'
char ENCODER_COMMAND_VIDEO_RECORDING[]                = 'VIDREC-'
char ENCODER_COMMAND_VIDEO_RECORDING_STATUS_REQUEST[] = '?VIDREC_STATUS'
char ENCODER_COMMAND_VIDEO_RECORDING_STATUS[]         = 'VIDREC_STATUS-'


/*
 * --------------------
 * Encoder ports
 * --------------------
 */

//integer ENCODER_PORT_

integer ENCODER_PORT_INPUT_MULTI_FORMAT = 1
integer ENCODER_PORT_INPUT_SDI = 1
integer ENCODER_PORT_INPUT_AUDIO_LINE = 1
integer ENCODER_PORT_OUTPUT_HDMI = 1
integer ENCODER_PORT_RELAY = 1
integer ENCODER_PORT_KEYPAD = 1
integer ENCODER_PORT_USB_FRONT = 1
integer ENCODER_PORT_USB_BACK = 2


/*
 * --------------------
 * Encoder command parameter values
 * --------------------
 */

//integer ENCODER_
//char ENCODER_ []

// Audio Input Formats
char ENCODER_AUDIO_INPUT_FORMAT_DIGITAL[]  = 'DIGITAL'
char ENCODER_AUDIO_INPUT_FORMAT_ANALOG[]   = 'ANALOG'
char ENCODER_AUDIO_INPUT_FORMAT_NO_AUDIO[] = 'NO AUDIO'

// Audio Sampling Rates

// Audio Stream Rates
integer ENCODER_AUDIO_STREAM_RATE_KBPS_64  = 64
integer ENCODER_AUDIO_STREAM_RATE_KBPS_96  = 96
integer ENCODER_AUDIO_STREAM_RATE_KBPS_128 = 128
integer ENCODER_AUDIO_STREAM_RATE_KBPS_192 = 192

// Video Input Formats (see common.axi)

// Video Input Resolutions

// Video Burst Sizes for Video Stream (in milliseconds)
integer ENCODER_VIDEO_BURST_SIZE_150  = 150
integer ENCODER_VIDEO_BURST_SIZE_200  = 200
integer ENCODER_VIDEO_BURST_SIZE_300  = 300
integer ENCODER_VIDEO_BURST_SIZE_400  = 400
integer ENCODER_VIDEO_BURST_SIZE_500  = 500
integer ENCODER_VIDEO_BURST_SIZE_600  = 600
integer ENCODER_VIDEO_BURST_SIZE_800  = 800
integer ENCODER_VIDEO_BURST_SIZE_1000 = 1000
integer ENCODER_VIDEO_BURST_SIZE_1200 = 1200
integer ENCODER_VIDEO_BURST_SIZE_1400 = 1400
integer ENCODER_VIDEO_BURST_SIZE_1600 = 1600
integer ENCODER_VIDEO_BURST_SIZE_1800 = 1800
integer ENCODER_VIDEO_BURST_SIZE_2000 = 2000

// Video Codecs
char ENCODER_CODEC_H264[] = 'H.264'

// Video Frame Decimations
char ENCODER_FRAME_DECIMATION_NONE[]    = 'NONE'
char ENCODER_FRAME_DECIMATION_HALF[]    = '1/2'
char ENCODER_FRAME_DECIMATION_THIRD[]   = '1/3'
char ENCODER_FRAME_DECIMATION_QUARTER[] = '1/4'

// GOP (Group-of-Picture) Sizes for Video Stream
integer ENCODER_GOP_SIZE_15 = 15
integer ENCODER_GOP_SIZE_30 = 30
integer ENCODER_GOP_SIZE_60 = 60
integer ENCODER_GOP_SIZE_120 = 120
integer ENCODER_GOP_SIZE_240 = 240

// Encoding Profiles
char ENCODER_STREAM_PROFILE_BASELINE[] = 'BASELINE'
char ENCODER_STREAM_PROFILE_MAIN[]     = 'MAIN'
char ENCODER_STREAM_PROFILE_HIGH[]     = 'HIGH'

// Bit Rates for Video Stream	(can vary between 100Kbps to 8000Kbps)

// Rate Control Methods for Vide Stream
char ENCODER_RATE_CONTROL_METHOD_CONSTANT_BIT_RATE[] = 'CBR'
char ENCODER_RATE_CONTROL_METHOD_VARIABLE_BIT_RATE[] = 'VBR'

// Video Stream Resolution Options
char ENCODER_STREAM_VIDEO_RESOLUTION_FOLLOW_INPUT[] = 'FOLLOW INPUT'
char ENCODER_STREAM_VIDEO_RESOLUTION_960x540[]      = '960x540'	// listed in web page but not in doco
char ENCODER_STREAM_VIDEO_RESOLUTION_800x450[]      = '800x450' // listed in web page but not in doco
char ENCODER_STREAM_VIDEO_RESOLUTION_640x480[]      = '640x480'	// listed in doc but not on web page
char ENCODER_STREAM_VIDEO_RESOLUTION_640x360[]      = '640x360'

// Streaming Formats for Video Stream
char ENCODER_STREAM_FORMAT_UDP[] = 'UDP'
char ENCODER_STREAM_FORMAT_RTP[] = 'RTP'

// Stream Mode [Status] (auto, stop, start)
char ENCODER_STREAM_MODE_START[] = 'START'
char ENCODER_STREAM_MODE_STOP[]  = 'STOP'
char ENCODER_STREAM_MODE_AUTO[]  = 'AUTO'

// TTL Options for Multicast Stream
integer ENCODER_MULTICAST_TTL_2  = 2
integer ENCODER_MULTICAST_TTL_3  = 3
integer ENCODER_MULTICAST_TTL_4  = 4
integer ENCODER_MULTICAST_TTL_5  = 5
integer ENCODER_MULTICAST_TTL_6  = 6
integer ENCODER_MULTICAST_TTL_7  = 7
integer ENCODER_MULTICAST_TTL_8  = 8
integer ENCODER_MULTICAST_TTL_9  = 9
integer ENCODER_MULTICAST_TTL_10 = 10
integer ENCODER_MULTICAST_TTL_11 = 11
integer ENCODER_MULTICAST_TTL_12 = 12
integer ENCODER_MULTICAST_TTL_13 = 13
integer ENCODER_MULTICAST_TTL_14 = 14
integer ENCODER_MULTICAST_TTL_15 = 15

// Current Status Options for Video Stream (started, stopped, suspended)
char ENCODER_STREAM_STATUS_STARTING[]  = 'STARTING'
char ENCODER_STREAM_STATUS_STARTED[]   = 'STARTED'
char ENCODER_STREAM_STATUS_STOPPED[]   = 'STOPPED'
char ENCODER_STREAM_STATUS_SUSPENDED[] = 'SUSPENDED'

// Encoder Signal Status
char ENCODER_SIGNAL_STATUS_NO_SIGNAL[]      = 'NO SIGNAL'
char ENCODER_SIGNAL_STATUS_UNKNOWN[]        = 'UNKNOWN'
char ENCODER_SIGNAL_STATUS_VALID_SIGNAL[]   = 'VALID SIGNAL'

// Recording Control
char ENCODER_RECORDING_START[] = 'START'
char ENCODER_RECORDING_STOP[]  = 'STOP'

// Recording Status
char ENCODER_RECORDING_STATUS_STARTING[]  = 'STARTING'
char ENCODER_RECORDING_STATUS_STARTED[]   = 'STARTED'
char ENCODER_RECORDING_STATUS_STOPPED[]   = 'STOPPED'
char ENCODER_RECORDING_STATUS_SUSPENDED[] = 'SUSPENDED'

// USB Status
char ENCODER_USB_STATUS_CONNECTED[]    = 'CONNECTED'
char ENCODER_USB_STATUS_DISCONNECTED[] = 'DISCONNECTED'

// USB Priorities
char ENCODER_USB_PRIORITY_FRONT[]      = 'FRONT'
char ENCODER_USB_PRIORITY_BACK[]       = 'BACK'
char ENCODER_USB_PRIORITY_FRONT_BACK[] = 'FRONT/BACK'


// Alarms
char ENCODER_ALARM_VIDEO_IN_UNSUPPORTED[]        = 'VIDIN41,Unsupported video input'
char ENCODER_ALARM_STREAM_STOPPED[]              = 'STRM11,Stream Stopped'
char ENCODER_ALARM_STREAM_STARTED[]              = 'STRM11,Stream Started'
char ENCODER_ALARM_STREAM_SUSPENDED[]            = 'STRM11,Stream Suspended'
char ENCODER_ALARM_RECORD_STARTED[]              = 'STRM11,Record Started'
char ENCODER_ALARM_RECORD_STOPPED[]              = 'STRM11,Record Stopped'
char ENCODER_ALARM_RECORD_SUSPENDED[]            = 'STRM11,Record Suspended'
char ENCODER_ALARM_NO_VIDEO_IN_DETECTED[]        = 'STRM11,Did not detect any video input'
char ENCODER_ALARM_CONFLICTING_VIDEO_IN_FORMAT[] = 'STRM21,Conflicting Video input Format'
char ENCODER_ALARM_TIMEOUT_STOP_RECORD_STREAM[]  = 'STRM41,Timeout: Stop the record/stream'
char ENCODER_ALARM_CANNOT_RECORD_NO_MEDIUM[]     = 'REC41,Cannot record. No medium'
char ENCODER_ALARM_CANNOT_RECORD_NO_SIGNAL[]     = 'REC51,Did not detect video signal!'

/*
 * --------------------
 * Functions to parse return comamands from Encoder
 * --------------------
 */

define_constant

char cEncoderCmdHeaderSeperator[] = '-'
char cEncoderCmdParamaterSeperator[] = ','

// Name   : ==== encoderParseCmdHeader ====
// Purpose: To parse out parameters from Encoder send_command or send_string
// Params : (1) IN/OUT  - sndcmd/str data
// Returns: parsed property/method name, still includes the leading '?' and/or trailing command seperating caharacter if present
// Notes  : Parses the strings sent to or from modules extracting the command header.
//          Command separating character assumed to be '-'
//
define_function char[100] encoderParseCmdHeader(CHAR cmd[])
{
	stack_var char cmdHeader[100]

	cmdHeader = remove_string(cmd,cEncoderCmdHeaderSeperator,1)

	return cmdHeader
}

// Name   : ==== encoderParseCmdParam ====
// Purpose: To parse out parameters from received Encoder send_command or send_string
// Params : (1) IN/OUT  - sndcmd/str data
// Returns: Parse parameter from the front of the string not including the separator
// Notes  : Parses the strings sent to or from modules extracting the parameters.
//          A single param is picked of the cmd string and removed, through the separator.
//          The separator is NOT returned from the function.
//          If the first character of the param is a double quote, the function will 
//          remove up to (and including) the next double-quote and the separator without spaces.
//          The double quotes will then be stripped from the parameter before it is returned.
//          If the double-quote/separator sequence is not found, the function will remove up to (and including)
//          the separator character and the leading double quote will NOT be removed.
//          If the separator is not found, the entire remained of the command is removed.
//          Parameter separating character assumed to be ','
//
define_function char[100] encoderParseCmdParam(CHAR cCmd[])
{
	stack_var char cTemp[100]
	stack_var char cSep[1]
	stack_var char chC
	stack_var integer nLoop
	stack_var integer nState
	stack_var char bInquotes
	stack_var char bDone

	// Reset state
	nState = 1; //ST_START
	bInquotes = FALSE;
	bDone = FALSE;

	// Loop the command and escape it
	for (nLoop = 1; nLoop <= length_array(cCmd); nLoop++)
	{
		// Grab characters and process it based on state machine
		chC = cCmd[nLoop];
		switch (nState)
		{
			// Start or string: end of string bails us out
			case 1: //ST_START
			{
				// Starts with a quote?
				// If so, skip it, set flag and move to collect.
				if (chC == '"')
				{
				    nState = 2; //ST_COLLECT
				    bInquotes = TRUE;
				}
				
				// Starts with a comma?  Empty param
				else if (chC == cEncoderCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
				}
				
				// Not a quote or a comma?  Add it to the string and move to collection
				else
				{
					cTemp = "cTemp, chC"
					nState = 2; //ST_COLLECT
				}
				break;
			}
			
			// Collect string.
			case 2: //ST_COLLECT
			{
				// If in quotes, just grab the characters
				if (bInquotes)
				{
					// Ah...found a quote, jump to end quote state
					if (chC == '"' )
					{
					nState = 3; //ST_END_QUOTE
					break;
					}
				}
				
				// Not in quotes, look for commas
				else if (chC == cEncoderCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
					break;
				}
				
				// Not in quotes, look for quotes (this would be wrong)
				// But instead of barfing, I will just add the quote (below)
				else if (chC == '"' )
				{
					// I will check to see if it should be escaped
					if (nLoop < length_array(cCmd))
					{
					// If this is 2 uqotes back to back, just include the one
					if (cCmd[nLoop+1] = '"')
						nLoop++;
					}
				}
				
				// Add character to collection
				cTemp = "cTemp,chC"
				break;
			}

			// End Quote
			case 3: //ST_END_QUOTE
			{
				// Hit a comma
				if (chC == cEncoderCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
				}

				// OK, found a quote right after another quote.  So this is escaped.
				else if (chC == '"')
				{
					cTemp = "cTemp,chC"
					nState = 2; //ST_COLLECT
				}
				break;
			}
		}

		// OK, if end of string or done, process and exit
		IF (bDone == TRUE || nLoop >= length_array(cCmd))
		{
			// remove cTemp from cCmd
			cCmd = mid_string(cCmd, nLoop + 1, length_string(cCmd) - nLoop)

			// cTemp is done
			return cTemp;
		}
	}

	// Well...we should never hit this
	return "";
}



#end_if