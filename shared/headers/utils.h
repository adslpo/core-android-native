/*
** Copyright 2012, The CyanogenMod Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdio.h>

#ifndef PROPERTY_VALUE_MAX
#define PROPERTY_VALUE_MAX  92
#endif

/* reads a file, making sure it is terminated with \n \0 */
extern char* read_file(const char *fn);

extern int get_property(const char *data, char *found, const char *searchkey,
                        const char *not_found);
extern int check_property(const char *data, const char *prefix);

extern int append_content(const char *content, const char *file);

extern int fcopy(FILE *f1, FILE *f2);

extern int remount(const char *mntpoint, int flags);

extern int append_content(const char *content, const char *file);

extern int get_package_uid(char *package);

// for when you give zero fucks about the state of the child process.
// this version of fork understands you don't care about the child.
// deadbeat dad fork.
int fork_zero_fucks();

#endif
