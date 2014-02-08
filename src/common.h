/*
 * Copyright (C) 2013  Khryukin Evgeny
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

#ifndef COMMON_H
#define COMMON_H

#include <QString>


namespace Qomp {

QString encodePassword(const QString& str, const QString &key);
QString decodePassword(const QString& str, const QString &key);

QString durationSecondsToString(uint sec);
QString durationMiliSecondsToString(qint64 ms);

QString unescape(const QString& escaped);
QString fixEncoding(const QString& encoded);

QString cacheDir();
QString dataDir();

enum State {	StateUnknown,	StateStopped,	StatePaused,
		StatePlaying,	StateError,	StateLoading,
		StateBuffering
};

} //namespace Qomp


#ifdef DEBUG_OUTPUT
#include <QtDebug>

QDebug operator<<(QDebug dbg, Qomp::State value);
#endif

#endif // COMMON_H
