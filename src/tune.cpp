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

#include "tune.h"
#include <QStringList>
#include <QFile>
#include <QTextStream>

static const QString separator = "@qomp@";


class SimpleStrategy : public TuneURLResolveStrategy
{
public:
	static SimpleStrategy* instance()
	{
		if(!instance_)
			instance_ = new SimpleStrategy;
		return instance_;
	}

	QUrl getUrl(const Tune *t)
	{
		if(!t->file.isEmpty())
			return QUrl::fromLocalFile(t->file);

		return QUrl(t->url);
	}

private:
	static SimpleStrategy* instance_;
	SimpleStrategy(){}
};

SimpleStrategy* SimpleStrategy::instance_ = 0;




Tune::Tune() : strategy_(0)
{
	id_ = lastId_++;
	setUrlResolveStrategy(SimpleStrategy::instance());
}

QUrl Tune::getUrl() const
{
	return strategy_->getUrl(this);
}

QString Tune::toString() const
{
	QStringList list;
	list << artist << title << trackNumber << album << duration << url << file;
	return list.join(separator);
}

bool Tune::fromString(const QString &str)
{
	QStringList list = str.split(separator);
	if(list.size() != 7)
		return false;

	artist = list.takeFirst();
	title = list.takeFirst();
	trackNumber = list.takeFirst();
	album = list.takeFirst();
	duration = list.takeFirst();
	url = list.takeFirst();
	file = list.takeFirst();

	return true;
}

int Tune::id() const
{
	return id_;
}

void Tune::setUrlResolveStrategy(TuneURLResolveStrategy *strategy)
{
	strategy_ = strategy;
}

TuneURLResolveStrategy *Tune::strategy() const
{
	return strategy_;
}

bool Tune::operator==(const Tune& other) const
{
	return id() == other.id();
}

QList<Tune> Tune::tunesFromFile(const QString &fileName)
{
	TuneList tunes;
	QFile f(fileName);
	if(f.exists() && f.open(QFile::ReadOnly)) {
		QTextStream str(&f);
		str.setCodec("UTF-8");
		while(!str.atEnd()) {
			Tune t;
			if(t.fromString(str.readLine())) {
				tunes.append(t);
			}
		}
	}
	return tunes;
}

int Tune::lastId_ = 0;
