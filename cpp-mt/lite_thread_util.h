#pragma once
/* lite_thread_util.h

Вспомогательные классы для работы с lite_thread.h

*/

#include "lite_thread.h"


//----------------------------------------------------------------------------------
//------ ВОССТАНОВЛЕНИЕ ПОСЛЕДОВАТЕЛЬНОСТИ СООБЩЕНИЙ -------------------------------
//----------------------------------------------------------------------------------
/* Актор, восстанавливающий порядок прохождения сообщений, утерянный из-за
   распараллеливания в процессе обработки.

   Перед началом работы принимает сообщение с хэндлом актора, которому отправлять
   упорядоченную последовательность.

   Принимает на вход сообщения типа Т, пришедшие не по порядку кэширует.

   тип сообщения T должен иметь поле size_t idx 
   при отправке сообщений нумеровать idx с нуля.

*/

#include <map>
template <typename T>
class lite_order_t : public lite_actor_t {
	typedef std::map<size_t, lite_msg_t*> cache_t;

	cache_t cache;			// Кэш для пришедших в неправильном порядке
	size_t next;			// Номер следующего на отправку
	lite_actor_t* send_to;	// Адрес отправки упорядоченной последовательности

public:
	lite_order_t(const std::string next_actor) : next(0) {
		send_to = lite_actor_get(next_actor);
		if (send_to == NULL) { // Не задан адрес пересылки
			lite_log(LITE_ERROR_USER, "Can`t find actor '%s'", next_actor.c_str());
			assert(send_to == NULL);
			return;
		}
		// Типы принимаемых сообщений
		type_add(lite_msg_type<T>());
	}

	~lite_order_t() {
		if(cache.size() != 0) {
			lite_log(LITE_ERROR_USER, "%s have %d msg in cache", name_get().c_str(), cache.size());
			for(auto& it : cache) {
				delete it.second; // Явное удаление, т.к. было копирование
			}
			cache.clear();
		}
	}

	// Обработка сообщения
	void recv(lite_msg_t* msg) override {
		T* m = static_cast<T*>(msg);

		if(m->idx == next) {
			// Сообщение пришло по порядку
			send_to->run(msg);
			next++;
			// Поиск в кэше и отправка 
			cache_t::iterator it = cache.find(next);
			while(it != cache.end() && it->first == next) {
				send_to->run(it->second);
				cache_t::iterator it_del = it;
				it++;
				next++;
				cache.erase(it_del);
			}
		} else {
			// Пришло не по порядку, сохранение в кэш
			cache_t::iterator it = cache.find(m->idx);
			if(it != cache.end()) { // Сообщение с таким номером уже есть в кэше
				lite_log(LITE_ERROR_USER, "%s receive two msg with idx#%llu", name_get().c_str(), (uint64_t)m->idx);
				return;
			}
			cache[m->idx] = lite_msg_copy(m);
		}
	}
};

//----------------------------------------------------------------------------------
//------ КОЛИЧЕСТВО ЯДЕР ПРОЦЕССОРА ------------------------------------------------
//----------------------------------------------------------------------------------
#ifdef LT_WIN
#include <windows.h>
int lite_cpu_count() {
	SYSTEM_INFO sysinfo;
	GetSystemInfo(&sysinfo);
	return (int)(sysinfo.dwNumberOfProcessors > 0 ? sysinfo.dwNumberOfProcessors : 1);
}
#else
#include <unistd.h>
int lite_cpu_count() {
	int cnt = sysconf(_SC_NPROCESSORS_ONLN);
	return cnt <= 0 ? 1 : cnt;
}
#endif

