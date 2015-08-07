PROGRAM_NAME='amx-encoder-listener'

#if_not_defined __AMX_ENCODER_LISTENER__
#define __AMX_ENCODER_LISTENER__

/*
 * --------------------
 * amx-encoder-listener
 *
 * For usage, check out the readme for the amx-encoder-library.
 * --------------------
 */

define_constant

char VERSION_AMX_ENCODER_LISTENER[] = 'v1.0.0'

include 'amx-encoder-api'
#include 'common'



/*
 * --------------------
 * Device arrays
 *
 * Any components that are to be monitored should have the appropriate
 * device array copied into the main program DEFINE_VARIABLE section and the 
 * associated #DEFINE compiler directives should be copied to the top of the 
 * main program, above the line of code that this include file is included 
 * into the main program.
 * --------------------
 */

define_variable
/*
#DEFINE INCLUDE_ENCODER_MONITOR_MAIN
dev dvEncoderMainPorts[] = { 6001:1:0 }

#DEFINE INCLUDE_ENCODER_MONITOR_USB
dev dvEncoderUsbPorts[] = { 6001:1:0, 6001:2:0 }
*/




/*
 * --------------------
 * Callback functions
 * --------------------
 */


/*
#define INCLUDE_ENCODER_NOTIFY_VIDEO_RECORDING_STATUS_CALLBACK
define_function encoderNotifyVideoRecordingStatus (dev encoderMain, char status[])
{
	// encoderMain is the D:P:S of the main port on the Encoder.
	// status is the status of the recording (ENCODER_RECORDING_STATUS_STARTING | ENCODER_RECORDING_STATUS_STARTED | ENCODER_RECORDING_STATUS_STOPPED | ENCODER_RECORDING_STATUS_SUSPENDED)
}
*/


/*
#define INCLUDE_ENCODER_NOTIFY_STREAM_STATUS_CALLBACK
define_function encoderNotifyStreamStatus (dev encoderMain, char status[])
{
	// encoderMain is the D:P:S of the main port on the Encoder.
	// status is the status of the stream (ENCODER_STREAM_STATUS_STARTING | ENCODER_STREAM_STATUS_STARTED | ENCODER_STREAM_STATUS_STOPPED | ENCODER_STREAM_STATUS_SUSPENDED)
}
*/



/*
#define INCLUDE_ENCODER_NOTIFY_USB_STATUS_CALLBACK
define_function encoderNotifyUsbStatus (dev encoderUsb, char status[])
{
	// encoderUsb is the D:P:S of the USB port on the Encoder.
	// status is the status of the USB storage connection (ENCODER_USB_STATUS_CONNECTED | ENCODER_USB_STATUS_DISCONNECTED)
}
*/

/*
#define INCLUDE_ENCODER_NOTIFY_ALARM_CALLBACK
define_function encoderNotifyAlarm (dev encoderUsb, char alarmMsg[])
{
	// encoderUsb is the D:P:S of the USB port on the Encoder.
	// alarmMsg is the message from the alarm.
	//		ENCODER_ALARM_STREAM_STOPPED
	//		ENCODER_ALARM_STREAM_STARTED
	//		ENCODER_ALARM_STREAM_SUSPENDED
	//		ENCODER_ALARM_RECORD_STARTED
	//		ENCODER_ALARM_RECORD_STOPPED
	//		ENCODER_ALARM_RECORD_SUSPENDED
	//		ENCODER_ALARM_NO_VIDEO_IN_DETECTED
	//		ENCODER_ALARM_CONFLICTING_VIDEO_IN_FORMAT
	//		ENCODER_ALARM_TIMEOUT_STOP_RECORD_STREAM
	//		ENCODER_ALARM_CANNOT_RECORD_NO_MEDIUM
	//		ENCODER_ALARM_CANNOT_RECORD_NO_SIGNAL
}
*/




/*
 * --------------------
 * Events to capture responses from the Encoder or update notifications
 * --------------------
 */

define_event


/*
 * --------------------
 * Data events
 * --------------------
 */

#if_defined INCLUDE_ENCODER_MONITOR_MAIN
data_event[dvEncoderMainPorts] // dvEncoderMainPorts should be the device (D:P:S) for port 1 on the Encoder or an array containing multiple devices for port 1 on multiple Encoders
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = encoderParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_ENCODER_NOTIFY_VIDEO_RECORDING_STATUS_CALLBACK
			case ENCODER_COMMAND_VIDEO_RECORDING_STATUS:
			{
				encoderNotifyVideoRecordingStatus (data.device, data.text)
			}
			#end_if
			
			
			#if_defined INCLUDE_ENCODER_NOTIFY_STREAM_STATUS_CALLBACK
			case ENCODER_COMMAND_STREAM_STATUS:
			{
				encoderNotifyStreamStatus (data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_ENCODER_NOTIFY_ALARM_CALLBACK
			case ENCODER_COMMAND_ALARM:
			{
				encoderNotifyAlarm (data.device, data.text)
			}
			#end_if
			
			default:	{}	// unhandled command responses
		}
	}
}
#end_if

#if_defined INCLUDE_ENCODER_MONITOR_USB
data_event[dvEncoderUsbPorts] // dvEncoderUsbPorts should be a DEV array containing devices for each USB port on the Encoder
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = encoderParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			#if_defined INCLUDE_ENCODER_NOTIFY_USB_STATUS_CALLBACK
			case ENCODER_COMMAND_USB_STATUS:
			{
				encoderNotifyUsbStatus (data.device, data.text)
			}
			#end_if
			
			
			
			default:	{}	// unhandled command responses
		}
	}
}
#end_if

/*
 * --------------------
 * Channel events
 * --------------------
 */

#if_defined INCLUDE_ENCODER_MONITOR_USB
channel_event[dvEncoderUsbPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_ENCODER_NOTIFY_USB_STATUS_CALLBACK
			case ENCODER_CHANNEL_USB_CONNECTED:
			{
				encoderNotifyUsbStatus (channel.device, ENCODER_USB_STATUS_CONNECTED)
			}
			#end_if
			
			default: {}	// unhandled channels
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_ENCODER_NOTIFY_USB_STATUS_CALLBACK
			case ENCODER_CHANNEL_USB_CONNECTED:
			{
				encoderNotifyUsbStatus (channel.device, ENCODER_USB_STATUS_DISCONNECTED)
			}
			#end_if
			
			default: {}	// unhandled channels
		}
	}
}
#end_if



#end_if