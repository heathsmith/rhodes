/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_rhomobile_rhodes_Rhodes */

#ifndef _Included_com_rhomobile_rhodes_Rhodes
#define _Included_com_rhomobile_rhodes_Rhodes
#ifdef __cplusplus
extern "C" {
#endif
#undef com_rhomobile_rhodes_Rhodes_WINDOW_FLAGS
#define com_rhomobile_rhodes_Rhodes_WINDOW_FLAGS 1024L
#undef com_rhomobile_rhodes_Rhodes_WINDOW_MASK
#define com_rhomobile_rhodes_Rhodes_WINDOW_MASK 1024L
/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    createRhodesApp
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_rhomobile_rhodes_Rhodes_createRhodesApp
  (JNIEnv *, jobject, jstring);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    startRhodesApp
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_rhomobile_rhodes_Rhodes_startRhodesApp
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    stopRhodesApp
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_rhomobile_rhodes_Rhodes_stopRhodesApp
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    doSyncAllSources
 * Signature: (Z)V
 */
JNIEXPORT void JNICALL Java_com_rhomobile_rhodes_Rhodes_doSyncAllSources
  (JNIEnv *, jobject, jboolean);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    getOptionsUrl
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_rhomobile_rhodes_Rhodes_getOptionsUrl
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    getStartUrl
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_rhomobile_rhodes_Rhodes_getStartUrl
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    getCurrentUrl
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_rhomobile_rhodes_Rhodes_getCurrentUrl
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    getAppBackUrl
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_rhomobile_rhodes_Rhodes_getAppBackUrl
  (JNIEnv *, jobject);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    normalizeUrl
 * Signature: (Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_rhomobile_rhodes_Rhodes_normalizeUrl
  (JNIEnv *, jobject, jstring);

/*
 * Class:     com_rhomobile_rhodes_Rhodes
 * Method:    makeLink
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_rhomobile_rhodes_Rhodes_makeLink
  (JNIEnv *, jclass, jstring, jstring);

#ifdef __cplusplus
}
#endif
#endif