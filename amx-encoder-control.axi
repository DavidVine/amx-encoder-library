PROGRAM_NAME='amx-encoder-control'

#if_not_defined __AMX_ENCODER_CONTROL__
#define __AMX_ENCODER_CONTROL__

/*
 * --------------------
 * amx-encoder-control
 *
 * For usage, check out the readme for the amx-encoder-library.
 * --------------------
 */

define_constant

char VERSION_AMX_ENCODER_CONTROL[] = 'v1.0.0'

#include 'amx-encoder-api'
#include 'amx-device-control'
#include 'common'

/*
 * --------------------
 * Function Naming Format
 * 
 *encoderRequestXXXXXXXX
 *  - call the encoderRequest functions to request information from an Enoder.
 * 
 * encoderSetXXXXXXX
 *  - call the encoderSet functions to set a value on a Encoder (e.g., multicast IP address).
 * 
 * encoderEnableXXXXXXX
 *  - call the encoderEnable functions to enable a setting on the Encoder which can be enabled or disabled.
 * 
 * encoderDisableXXXXXXX
 *  - call the encoderDisable functions to disable a setting on the Encoder which can be enabled or disabled.
 * 
 * encoderCycleXXXXXX
 * - call the encoderCycle functions to toggle a setting on the Encoder from enabled to disabled or vice versa.
 * --------------------
 */



define_function encoderRequestVideoStreamMode (dev encoder)
{
	sendCommand (encoder, ENCODER_COMMAND_STREAM_MODE_REQUEST)
}

define_function encoderRequestVideoStreamStatus (dev encoder)
{
	sendCommand (encoder, ENCODER_COMMAND_STREAM_STATUS_REQUEST)
}

define_function encoderSetVideoStreamModeAuto (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_STREAM_MODE,ENCODER_STREAM_MODE_AUTO")
}

define_function encoderEnableVideoStream (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_STREAM_MODE,ENCODER_STREAM_MODE_START")
}

define_function encoderDisableVideoStream (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_STREAM_MODE,ENCODER_STREAM_MODE_STOP")
}


/*
 * --------------------
 * Video Recording functions
 * --------------------
 */


define_function encoderRequestVideoRecordControl (dev encoder)
{
	sendCommand (encoder, ENCODER_COMMAND_VIDEO_RECORDING_REQUEST)
	// responses:
	//	VIDREC-START
	//	VIDREC-STOP
}

define_function encoderRequestVideoRecordStatus (dev encoder)
{
	sendCommand (encoder, ENCODER_COMMAND_VIDEO_RECORDING_STATUS_REQUEST)
	// responses:
	//	VIDREC_STATUS-SUSPENDED
	//	VIDREC_STATUS-STARTING
	//	VIDREC_STATUS-STARTED
	//	VIDREC_STATUS-STOPPED
}

define_function encoderEnableVideoRecording (dev encoder)
{
	sendCommand (encoder, 'VIDREC-START')
}

define_function encoderDisableVideoRecording (dev encoder)
{
	sendCommand (encoder, 'VIDREC-STOP')
}

/*
 * --------------------
 * USB functions
 * --------------------
 */

/*
 * Function:    encoderRequestUsbStatus
 * 
 * Arguments:   dev encoderUsb - USB port on Encoder
 * 
 * Description: Requests the status of the USB port - is a USB storage device connected?
 */
define_function encoderRequestUsbStatus (dev encoderUsb)
{
	sendCommand (encoderUsb, ENCODER_COMMAND_USB_STATUS_REQUEST)
}

/*
 * Function:    encoderRequestUsbPriority
 * 
 * Arguments:   dev encoder - USB port on Encoder
 * 
 * Description: Requests the USB priority setting of for the Encoder.
 */
define_function encoderRequestUsbPriority (dev encoder)
{
	sendCommand (encoder, ENCODER_COMMAND_USB_PRIORITY_REQUEST)
}

/*
 * Function:    encoderSetUsbPriorityFront
 * 
 * Arguments:   dev encoder - USB port on Encoder
 * 
 * Description: Sets the USB priority for the Encoder to the Front USB port.
 */
define_function encoderSetUsbPriorityFront (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_USB_PRIORITY,ENCODER_USB_PRIORITY_FRONT")
}

/*
 * Function:    encoderSetUsbPriorityBack
 * 
 * Arguments:   dev encoder - USB port on Encoder
 * 
 * Description: Sets the USB priority for the Encoder to the Back USB port.
 */
define_function encoderSetUsbPriorityBack (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_USB_PRIORITY,ENCODER_USB_PRIORITY_BACK")
}

/*
 * Function:    encoderSetUsbPriorityFrontBack
 * 
 * Arguments:   dev encoder - USB port on Encoder
 * 
 * Description: Sets the USB priority for the Encoder to the Front and Back USB ports.
 */
define_function encoderSetUsbPriorityFrontBack (dev encoder)
{
	sendCommand (encoder, "ENCODER_COMMAND_USB_PRIORITY,ENCODER_USB_PRIORITY_FRONT_BACK")
}

/*
 * --------------------
 * Video Input functions
 * --------------------
 */

define_function encoderRequestVideoInputStatus (dev encoder)
{
	sendCommand (encoder, '?VIDIN_STATUS')
}

define_function encoderRequestVideoInputResolution (dev encoder)
{
	sendCommand (encoder, '?VIDIN_RES_REF')
}

define_function encoderRequestVideoInputFormat (dev encoder)
{
	sendCommand (encoder, '?VIDIN_FORMAT')
}








#end_if