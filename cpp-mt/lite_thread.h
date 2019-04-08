#pragma once
/* lite_thread.h

Кросплатформенная библиотека на С++11 для легкого распараллеливания кода, в т.ч. потокоНЕбезопасного.

Библиотека построена по Модели Акторов, т.е. общий алгоритм разбивается на акторы (код, атомарные
части бизнес-логики) и акторы общаются между собой пересылкой сообщений друг-другу.

Библиотека сама создает нужное количество потоков и запускает в них акторы.

Библиотека гарантирует что актор не будет запущен одновременно в нескольких потоках, т.е. код актора
не требует потокобезопасности. Но если актор потокобезопасный, то есть установка ограничения на
количество одновременно работающих копий данного актора. Также есть ограничение доступа группы акторов
к конкретному ресурсу (например для ограничения количества используемых потоков)


ПРИМЕР ПРОСТЕЙШЕГО ИСПОЛЬЗОВАНИЯ -------------------------------------------------------------

// Сообщение
struct msg_t : public lite_msg_t {
	uint32_t x;
};

// Актор (обработчик сообщения)
class actor_t : public lite_actor_t {
	void recv(lite_msg_t* m) override {
		msg_t* msg = dynamic_cast<msg_t*>(m);
		if(msg == NULL) ... // Сообщение имеет другой тип, обработка ошибки
		работа с msg
	}
};

void main() {
	actor_t* actor = new actor_t();
	msg_t* msg = new msg_t; // Создание сообщения
	msg->x = 100500;
	actor->run(msg); // Постановка в очередь на выполнение

	lite_thread_end(); // Ожидание завершения работы
}


СООБЩЕНИЯ ------------------------------------------------------------------------------------

Класс сообщения должен быть унаследован от lite_msg_t
struct msg_t : public lite_msg_t {
};

--- Создание сообщения.
msg_t* msg = new msg_t;
Сообщения удаляются библиотекой автоматически после обработки

--- Передача сообщения на обработку.
actor->run(msg)

--- Копирование сообщения.
T* lite_msg_copy(T* msg)
При копировании сообщения полученного извне не использовать и не отправлять исходное, т.к. оно
не копируется, а просто снимается с контроля автоудаления. 
При копировании копии или явно созданного создается полноценная копия, т.е. можно использовать оба.
В классе сообщения необходимо прописывать конструктор копирования.

--- Удаление сообщения.
delete msg
Полученные извне и отправленные сообщения удалять нельзя, т.к. сообщения удаляются автоматически после 
обработки.
Удалять необходимо только скопированные или созданные и не отправленные сообщения.


ВАЖНО -----------------------------------------------------------------------------------------

Сообщения НЕ иммутабельны, поэтому:
- нельзя отправлять одно сообщение дважды;
- нельзя читать/писать сообщение после отправки, т.к. оно может быть уже в обработке или удалено.

Сообщение можно изменять и отправлять дальше.

Гарантируется что одно сообщение в любой момент времени обрабатывается только в одном потоке.

Гарантируется что каждый обработчик получит сообщения в том порядке, в котором они отправлены.


АКТОР (обработчик сообщений) ------------------------------------------------------------------

Объекты акторов хранятся библиотекой и удаляются по окончании работы. 
Для поиска существующего актора ему можно присвоить имя.

Все классы акторов должны наследоваться от класса lite_actor_t.
В дочернем классе необходимо прописать только метод recv()

class actor_t : public lite_actor_t {
	void recv(lite_msg_t* msg) override {
	}
}

--- Создание объекта
actor_t* actor = new actor_t;

--- Присвоение имени
actor->name_set(const std::string& name);

--- Получение объекта по имени
lite_actor_t* lite_actor_get(const std::string& name)

--- Удаление объекта
lite_actor_destroy(lite_actor_t* la);

Если перед удалением необходимо выполнить какие-то операции связанные с отправкой сообщений, то прописать 
это в методе before_destroy()

class actor_t : public lite_actor_t {
	void before_destroy() override {
	}
}


Доступные методы базового класса:

--- Регистрация типа обрабатываемого сообщения
type_add(lite_msg_type<T>())
Если зарегистрирован хоть один тип сообщения, то в метод recv() будут передаваться только зарегистрированные, 
остальные будут игнорироваться с сообщением об ошибке.
Если ни один тип не зарегистрирован, то на обработку проходят все входящие сообщения.


РАСПАРЕЛЛЕЛИВАНИЕ АКТОРА --------------------------------------------------------------------

Для акторов с потокобезопасным кодом (например актор без окружения, все необходимое для его
работы содержится в сообщении) можно установить глубину распараллеливания, т.е. в скольки
потоках актор может одновременно обрабатывать сообщения.

--- Установка глубины распараллеливания
actor->parallel_set(int max_threads)


ЗАПУСК ПО ТАЙМЕРУ ----------------------------------------------------------------------------

actor->timer_set(int time_ms)

Устанавливает период запуска с интервалом time_ms. Отсчет начинается с момента установки.
При time_ms <= 0 отключение таймера.

В дочернем классе необходимо прописать метод timer()
class actor_t : public lite_actor_t {
	void timer() override {
	}
}

Вызов по таймеру имеет приоритет ниже чем обработка сообщений, поэтому происходит только при пустой 
очереди сообщений актора. Если по каким-либо причинам был пропушен момент запуска и наступил следующий, 
то запуск будет один раз.

ОБРАБОТКА ИСКЛЮЧЕНИЙ -------------------------------------------------------------------------

При возниконвении исключений в методах recv() или timer() происходит вызов обработчика исключений
По-умолчанию вызывается запись исключения в лог, но обработчик можно переопределить, для этого
прописать метод exception()

class actor_t : public lite_actor_t {
	void exception(std::exception& ex) override {
	}
}

РЕСУРСЫ --------------------------------------------------------------------------------------

Ресурс ограничивает сколько может быть запущено одновременно акторов привязанных к ресурсу.
При старте создается ресурс по умолчанию и вновь создаваемые акторы привязываются к нему.
Рекомендуется использовать ресурс по умолчанию для акторов нагружающих процессор. Соответственно 
максимум этого ресурса - количество потоков, которое можно использовать.
Для акторов не нагружающих процессор (например запрос к вэб-сервису и ожидание ответа) лучше 
создать отдельный ресурс и привязать туда эти акторы.

--- Установка ресурса по умолчанию
lite_thread_max(int max)

--- Создание ресурса
lite_resource_t* lite_resource_create(const std::string& name, int max)

--- Привязка актора к ресурсу
actor->resource_set(lite_resource_t* res)


ВЕДЕНИЕ ЛОГА --------------------------------------------------------------------------------

--- Запись в лог
lite_log(int error, const char* data, ...)
К введенным данным добавляется дата-время и отправляется сообщением на актор с именем "log", где
по умолчанию выводится в консоль.

В случае если error != 0 в текст дописывается "Error" и номер ошибки. 
Номера менее LITE_ERROR_USER используются библиотекой.

При необходимости можно создать свой актор "log". Он должен быть зарегистрирован до первого 
вызова lite_log(). Актор получает сообщения типа 
struct lite_msg_log_t : public lite_msg_t {
	std::string data;
	int err_num;
};


ЗАВЕРШЕНИЕ РАБОТЫ --------------------------------------------------------------------------

--- Ожидание завершения работы всех акторов
lite_thread_end()
Ожидает когда будет полностью завершена работа, удаляет все потоки, акторы и т.д. Возвращает
библиотеку в нулевое состояние. Можно вызывать многократно.


ОСОБЕННОСТИ РАБОТЫ -------------------------------------------------------------------------

Каждый актор имеет очередь входящих сообщений. Отправка сообщения актору это постановка его
в очередь актора и пробуждение простаивающего потока для его обработки.

Поток захвативший актор выполняет его в цикле до тех пор пока очередь сообщений актора не опустеет.

При запуске актора происходит захват ресурса, к которому привязан актор, по окончании работы актора,
ищется ожидающий выполнения актор привязанный к этому же ресурсу.

При обработке последнего сообщения в очереди актора происходит перехват исходящего сообщения актору 
с тем же ресурсом, чтобы по завершению работы с текущим актором в том же потоке запустить получателя.
Другие потоки при этом не оповещаются, поэтому отправку сообщения лучше всего выносить в конец актора
или после отправки принудительно разбудить свободный поток lite_thread_wake_up(). 

Потоки создаются по мере необходимости. Когда все имеющиеся потоки заняты обрабокой акторов, то создается
новый. Потоки нумеруются при создании, при простаивании приоритет пробуждения отдается потоку с меньшим 
номером. Если поток с максимальным номером простаивает 1 секунду - он завершается.


ОТЛАДКА -----------------------------------------------------------------------------------

--- Вывод lite_log() сразу в консоль
#define LT_DEBUG_LOG
Используется встроенный вывод в лог и отключается отложенный вывод, т.к. если происходит прерывание
работы при отложенном выводе (например обращение к несуществующей памяти), то не все последние записи
успевают записаться в лог.

--- Включение счетчиков статистики
#define LT_STAT
Выводятся по окончании lite_thread_end(). Назначение описано ниже в lite_thread_stat_t

--- Вывод в лог информации о состоянии потоков
#define LT_DEBUG
Рекомендуется использовать вместе с LT_DEBUG_LOG, т.к. используется lite_log(), иначе вывод вызывает
дополнительное изменение состояния потоков.

--- Компиляция в DLL под WinXP (там проблемы с thread_local и static при явной загрузке)
#define LT_XP_DLL

*/

#if defined(_WIN32) || defined(_WIN64)
#define LT_WIN
#include <windows.h>
#else
#include <unistd.h>
#endif

#define LT_VERSION "0.9.2" // Версия библиотеки

#ifndef LT_RESOURCE_DEFAULT
#define LT_RESOURCE_DEFAULT 32 // Предел ресурса по умолчанию
#endif

#define LITE_ERROR_NOT_IMPLEMENTED	1  // Не прописан обработчик актора
#define LITE_ERROR_RESOURCE			2  // Актор использует другой ресурс
#define LITE_ERROR_ACTOR_DOUBLE		3  // Попытка присвоить имя уже существующего актора
#define LITE_ERROR_ACTOR_NAME		4  // Попытка смены имени актора
#define LITE_ERROR_MSG_TYPE			5  // Сообщение необрабатываемого типа
#define LITE_ERROR_EXCEPTION		6  // Исключение в коде актора
#define LITE_ERROR_USER				16 // Пользовательские коды ошибок начиная с LITE_ERROR_USER
#ifdef LT_DEBUG
#ifdef NDEBUG
#undef NDEBUG
#endif
#endif

#include <atomic>
#include <vector>
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <unordered_map>
#include <map>
#include <string>
#include <assert.h>
#include <time.h>
#include <string.h>
#include <stdarg.h>

//----------------------------------------------------------------------------------
//-------- ВЫРАВНИВАНИЕ В ПАМЯТИ ---------------------------------------------------
//----------------------------------------------------------------------------------
// Выделение памяти с выравниванием под кэшлинию (кратно 0x40)
#ifdef LT_WIN
void* lite_malloc(size_t size) {
	return _aligned_malloc(size, 0x40);
}

void lite_free(void *p) {
	_aligned_free(p);
}
#else
void* lite_malloc(size_t size) {
	void *p;
	if (posix_memalign(&p, 0x40, size)) p = NULL;
	return p;
}

void lite_free(void *p) {
	free(p);
}
#endif


class lite_align64_t {
public:
	lite_align64_t() {}
	lite_align64_t(int) {}

	void *operator new(size_t size) {
		void* p = lite_malloc(size);
		if (p == NULL) {
			assert(p != NULL);
			throw std::bad_alloc();
		}
		return p;
	}

	void operator delete(void *p) {
		lite_free(p);
	}
};

//----------------------------------------------------------------------------------
//------ ПЕРЕМЕННЫЕ ПОТОКА (для DLL под XP) ----------------------------------------
//----------------------------------------------------------------------------------
#ifdef LT_XP_DLL
template <typename T>
class lite_thread_info_t : public lite_align64_t {
	static uint32_t tls_idx() noexcept {
		static uint32_t x = TLS_OUT_OF_INDEXES;
		if (x == TLS_OUT_OF_INDEXES) {
			x = TlsAlloc();
			assert(x != TLS_OUT_OF_INDEXES);
		}
		return x;
	}
public:
	static T& tls_get() noexcept {
		T* x = (T*)TlsGetValue(tls_idx());
		if (x == NULL) {
			x = new T();
			memset(x, 0, sizeof(T));
			TlsSetValue(tls_idx(), x);
		}
		return *x;
	}

	static void tls_free() noexcept {
		T* x = (T*)TlsGetValue(tls_idx());
		if (x != NULL) {
			delete x;
			TlsSetValue(tls_idx(), NULL);
		}
	}
};

template <typename T>
class lite_static_info_t : public lite_align64_t {
public:
	static T& si() noexcept {
		static T* x;
		if(x == NULL) {
			x = new T();
		}
		return *x;
	}
};
#else
template <typename T>
class lite_thread_info_t {

public:
	static T& tls_get() noexcept {
		thread_local T x;
		return x;
	}

	static void tls_free() noexcept {
	}
};

template <typename T>
class lite_static_info_t {
public:
	static T& si() noexcept {
		static T x;
		return x;
	}
};
#endif

#ifdef LT_STAT
//----------------------------------------------------------------------------------
//------ СЧЕТЧИКИ СТАТИСТИКИ -------------------------------------------------------
//----------------------------------------------------------------------------------
static int64_t lite_time_now();

class lite_thread_stat_t : public lite_thread_info_t<lite_thread_stat_t>, public lite_static_info_t<lite_thread_stat_t> {

public:
	size_t stat_thread_max;			// Максимальное количество потоков запущенных одновременно
	size_t stat_parallel_run;		// Максимальное количество потоков работавших одновременно
	size_t stat_thread_create;		// Создано потоков
	size_t stat_thread_wake_up;		// Сколько раз будились потоки
	size_t stat_try_wake_up;		// Попыток разбудить поток
	size_t stat_msg_create;			// Создано сообщений
	size_t stat_msg_erase;			// Удалено сообщений
	size_t stat_actor_create;		// Создано акторов
	size_t stat_actor_erase;		// Удалено акторов
	size_t stat_actor_get;			// Запросов lite_actor_t* по (func, env)
	size_t stat_actor_find;			// Поиск очередного актора готового к работе
	size_t stat_actor_not_run;		// Промахи обработки сообщения, уже обрабатывается другим потоком
	size_t stat_cache_found;		// Найдено в глобальном кэше
	size_t stat_cache_bad;			// Извлечение из кэша неготового актора
	size_t stat_cache_full;			// Попытка записи в полный кэш
	size_t stat_res_lock;			// Количество блокировок ресурсов
	size_t stat_queue_max;			// Максимальная глубина очереди
	size_t stat_msg_send;			// Обработано сообщений

	//---------------------------------------------------------------------
	// Счетчики потока
	static lite_thread_stat_t& ti() noexcept {
		return tls_get();
	}

	// Сигнал о зачершении потока
	static void thread_end() noexcept {
		tls_free();
	}

	//---------------------------------------------------------------------
	lite_thread_stat_t() {
		init();
		lite_time_now(); // Запуск отсчета времени
	}

	~lite_thread_stat_t() {
		store();
	}

	// Сброс в 0
	void init() {
		memset(this, 0, sizeof(lite_thread_stat_t));
	}

	// Сохранение счетчиков потока в глобальные
	void store() {
		static std::mutex mtx;
		std::unique_lock<std::mutex> lck(mtx); // Блокировка
		if(si().stat_thread_max < stat_thread_max) si().stat_thread_max = stat_thread_max;
		if(si().stat_parallel_run < stat_parallel_run) si().stat_parallel_run = stat_parallel_run;
		si().stat_thread_create += stat_thread_create;
		si().stat_thread_wake_up += stat_thread_wake_up;
		si().stat_try_wake_up += stat_try_wake_up;
		si().stat_msg_create += stat_msg_create;
		si().stat_msg_erase += stat_msg_erase;
		si().stat_actor_create += stat_actor_create;
		si().stat_actor_erase += stat_actor_erase;
		si().stat_actor_get += stat_actor_get;
		si().stat_actor_find += stat_actor_find;
		si().stat_cache_found += stat_cache_found;
		si().stat_cache_bad += stat_cache_bad;
		si().stat_cache_full += stat_cache_full;
		si().stat_res_lock += stat_res_lock;
		si().stat_actor_not_run += stat_actor_not_run;
		if(si().stat_queue_max < stat_queue_max) si().stat_queue_max = stat_queue_max;
		si().stat_msg_send += stat_msg_send;
		init();
	}

	void print_stat() {
		store();
		printf("\n------- STAT -------\n");
		printf("thread_max     %u\n", (uint32_t)si().stat_thread_max);
		printf("parallel_run   %u\n", (uint32_t)si().stat_parallel_run);
		printf("thread_create  %u\n", (uint32_t)si().stat_thread_create);
		printf("thread_wake_up %u\n", (uint32_t)si().stat_thread_wake_up);
		printf("try_wake_up    %u\n", (uint32_t)si().stat_try_wake_up);
		printf("msg_create     %u\n", (uint32_t)si().stat_msg_create);
		printf("actor_create   %u\n", (uint32_t)si().stat_actor_create);
		printf("actor_get      %u\n", (uint32_t)si().stat_actor_get);
		printf("actor_find     %u\n", (uint32_t)si().stat_actor_find);
		printf("actor_not_run  %u\n", (uint32_t)si().stat_actor_not_run);
		printf("cache_found    %u\n", (uint32_t)si().stat_cache_found);
		printf("cache_bad      %u\n", (uint32_t)si().stat_cache_bad);
		printf("cache_full     %u\n", (uint32_t)si().stat_cache_full);
		printf("resource_lock  %u\n", (uint32_t)si().stat_res_lock);
		#ifdef LT_STAT_QUEUE
		printf("queue_max      %u\n", (uint32_t)si().stat_queue_max);
		#endif
		printf("msg_send       %u\n", (uint32_t)si().stat_msg_send);
		int64_t time_ms = lite_time_now();
		printf("msg_send/sec   %u\n", (uint32_t)(si().stat_msg_send * 1000 / (time_ms > 0 ? time_ms : 1))); // Сообщений в секунду
		printf("\n");
		if (si().stat_msg_create != si().stat_msg_erase) printf("!!! ERROR: lost %d messages (erase %d)\n\n", (uint32_t)(si().stat_msg_create - si().stat_msg_erase), (uint32_t)si().stat_msg_erase); // Утечка памяти
		if (si().stat_actor_create != si().stat_actor_erase) printf("!!! ERROR: lost %d actors (erase %d)\n\n", (uint32_t)(si().stat_actor_create - si().stat_actor_erase), (uint32_t)si().stat_actor_erase); // Утечка памяти
	}
};

#endif

//----------------------------------------------------------------------------------
//------ БЛОКИРОВКИ ----------------------------------------------------------------
//----------------------------------------------------------------------------------
#define LOCK_TYPE_LT "spinlock + Sleep(0)"

class lite_mutex_t {
	std::atomic_flag af = ATOMIC_FLAG_INIT;

public:
	void lock() noexcept {
		while (af.test_and_set(std::memory_order_acquire)) {
#if defined LT_WIN
			Sleep(0);
#else
			usleep(20);
#endif
		}

	}

	void unlock() noexcept {
		af.clear(std::memory_order_release);
	}
}; 


class lite_lock_t {
	lite_mutex_t* mtx;
public:
	lite_lock_t(lite_mutex_t& mtx) noexcept {
		this->mtx = &mtx;
		this->mtx->lock();
	}

	~lite_lock_t() noexcept {
		this->mtx->unlock();
	}
};

// Время с момента запуска, мсек
static int64_t lite_time_now() {
	static std::chrono::steady_clock::time_point t = std::chrono::steady_clock::now();
	std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
	std::chrono::duration<double> time_span = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t);
	return (int64_t)(time_span.count() * 1000);
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class lite_actor_t;
class lite_thread_t;
class lite_msg_queue_t;
class lite_timer_t;

static void lite_log(int err, const char* data, ...) noexcept;
static size_t lite_thread_num() noexcept;
static void lite_thread_wake_up() noexcept;
static void lite_timer_run(lite_actor_t* actor, int time_ms) noexcept;

//----------------------------------------------------------------------------------
//-------- СООБЩЕНИE ---------------------------------------------------------------
//----------------------------------------------------------------------------------
struct lite_msg_t : public lite_align64_t {
public:
	size_t lite_msg_type = {0};		// Тип сообщения

	friend lite_msg_queue_t;
protected:
	lite_msg_t* lite_msg_next = {0};	// Указатель на следующее сообщение в очереди

public:

	lite_msg_t() {}

	lite_msg_t(const lite_msg_t& m) {
		lite_msg_type = m.lite_msg_type;
	}

	virtual ~lite_msg_t(){};

	void *operator new(size_t size) {
		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_msg_create++;
		#endif
		return lite_align64_t::operator new(size);
	}

	void operator delete(void *p) {
		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_msg_erase++;
		#endif
		lite_align64_t::operator delete(p);
	}

	// Установка типа сообщения по классу
	template <typename T>
	static void type_set(T* msg) {
		if(msg->lite_msg_type == 0) msg->lite_msg_type = typeid(T).hash_code();
	}

private:
	// static переменные глобальные ----------------------------------------------------
	typedef std::unordered_map<size_t, std::string> type_name_idx_t;

	struct static_info_t : public lite_static_info_t<static_info_t> {
		type_name_idx_t tn_idx; // Список типов
		lite_mutex_t mtx;		// Блокировка для доступа к tn_idx
	};

	static static_info_t& si() noexcept {
		return static_info_t::si();
	}

public:
	// Вывод типа сообщения
	template <typename T>
	static size_t type_get() noexcept {
		size_t hash = typeid(T).hash_code();
		lite_lock_t lck(si().mtx); // Блокировка
		// Сохранение названия типа
		if (si().tn_idx.find(hash) == si().tn_idx.end()) {
			si().tn_idx[hash] = typeid(T).name();
		}
		return hash;
	}

	// Тип сообщения строкой
	const std::string type_descr() {
		lite_lock_t lck(si().mtx); // Блокировка
		type_name_idx_t::iterator it = si().tn_idx.find(lite_msg_type);
		if (it == si().tn_idx.end()) {
			std::string t = "type#";
			t += std::to_string(lite_msg_type);
			return t;
		} else {
			return it->second;
		}
	}
};

//----------------------------------------------------------------------------------
//-------- ОЧЕРЕДЬ СООБЩЕНИЙ -------------------------------------------------------
//----------------------------------------------------------------------------------

class lite_msg_queue_t {
	lite_msg_t* msg_first;			// Указатель на первое в очереди
	lite_msg_t* msg_first2;			// Указатель на первое в очереди, меняется только под блокировкой
	lite_msg_t* msg_last;			// Указатель на последнее в очереди
	lite_mutex_t mtx;				// Синхронизация доступа
	#ifdef LT_STAT_QUEUE
	std::atomic<size_t> size;		// Размер очереди
	#endif

public:
	lite_msg_queue_t() : msg_first(NULL), msg_first2(NULL), msg_last(NULL) {
		#ifdef LT_STAT_QUEUE
		size = 0;
		#endif
	}

	// Добавление сообщения в очередь
	void push(lite_msg_t* msg) noexcept {
		msg->lite_msg_next = NULL;
		lite_lock_t lck(mtx); // Блокировка
		if(msg_last == NULL) {
			msg_first2 = msg;
			msg_last = msg;
		} else {
			msg_last->lite_msg_next = msg;
			msg_last = msg;
		}
		#ifdef LT_STAT_QUEUE
		size++;
		if (lite_thread_stat_t::ti().stat_queue_max < size) lite_thread_stat_t::ti().stat_queue_max = size;
		#endif
	}

	// Чтение сообщения из очереди. lock = false без блокировки использовать msg_first
	lite_msg_t* pop(bool lock = true) noexcept {
		if (lock) {
			mtx.lock(); // Блокировка
		}
		if (msg_first == NULL) {
			if (!lock) {
				mtx.lock(); // Блокировка для доступа к msg_first2
				lock = true;
			}
			msg_first = msg_first2;
			msg_first2 = NULL;
		}
		lite_msg_t* msg = msg_first;

		if(msg != NULL) {
			msg_first = msg->lite_msg_next; // Чтение без блокировки
			if (msg_first == NULL) {
				if(!lock) {
					mtx.lock(); // Блокировка для доступа к msg_last
					lock = true;
				}
				msg_first = msg->lite_msg_next; // Повторное чтение под блокировкой на случай если был push
				if(msg_first == NULL) msg_last = NULL;
			}
		}
		if (lock) mtx.unlock(); // Снятие блокировки

		#ifdef LT_DEBUG
		if(msg != NULL) msg->next = NULL;
		#endif
		#ifdef LT_STAT_QUEUE
		if (msg != NULL) size--;
		#endif
		return msg;
	}

	int empty() noexcept {
		return msg_last == NULL;
	}
};

//----------------------------------------------------------------------------------
//------ КЭШ АКТОРОВ ГОТОВЫХ К ВЫПОЛНЕНИЮ ------------------------------------------
//----------------------------------------------------------------------------------
class lite_actor_cache_t {
	std::atomic<lite_actor_t*> next = {0};

public:
	// Запись в кэш
	void push(lite_actor_t* la) noexcept {
		if(next == (lite_actor_t*)NULL) {
			lite_actor_t* nul = NULL;
			if (next.compare_exchange_weak(nul, la)) return;
		}
		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_cache_full++;
		#endif	
	}

	// Извлечение из кэша
	lite_actor_t* pop() noexcept {
		if(next == (lite_actor_t*)NULL) return NULL;
		return next.exchange(NULL);
	}
};

//----------------------------------------------------------------------------------
//------ РЕСУРС --------------------------------------------------------------------
//----------------------------------------------------------------------------------
class lite_resource_manage_t;

class lite_resource_t : public lite_align64_t {
	std::atomic<int> res_free;	// Свободное количество
	int res_max;				// Максимум

friend lite_resource_manage_t;
private:
	std::string name;			// Название ресурса

public:
	lite_actor_cache_t la_cache;

	lite_resource_t() {
		res_free = LT_RESOURCE_DEFAULT;
		res_max = LT_RESOURCE_DEFAULT;
	}

	lite_resource_t(int max) : res_free(max), res_max(max) {
	}
	
	~lite_resource_t() noexcept {
		assert(res_free == res_max);
	}

	// Захват ресурса, возвращает true при успехе
	bool lock() noexcept {
		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_res_lock++;
		#endif
		if(res_free-- <= 0) {
			res_free++;
			return false;
		} else {
			return true;
		}
	}

	// Освобождение ресурса
	void unlock() noexcept {
		res_free++;
	}

	// Количество свободных ресурсов
	bool is_free() noexcept {
		return res_free > 0;
	}

	// Установка максимума одновременно выполняющихся акторов
	void max_set(int max) noexcept {
		if (max <= 0) max = 1;
		if (max == res_max) return;

		res_free += max - res_max;
		res_max = max;
	}

	// Получение имени
	const std::string name_get() {
		return name;
	}
};

// Управление ресурсами
class lite_resource_manage_t {
	// static методы глобальные ----------------------------------------------------
	typedef std::unordered_map<std::string, lite_resource_t*> lite_resource_list_t;

	struct static_info_t : public lite_static_info_t<static_info_t> {
		lite_resource_list_t lr_idx; // Индекс списка ресурсов
		lite_mutex_t mtx;			// Блокировка для доступа к lr_idx
	};

	static static_info_t& si() noexcept {
		return static_info_t::si();
	}

public:
	// Создание нового ресурса. max емкость ресурса, при получении указателя на имеющийся можно не указывать
	static lite_resource_t* get(const std::string& name, int max = 0) {
		lite_lock_t lck(si().mtx);
		lite_resource_list_t::iterator it = si().lr_idx.find(name); // Поиск по индексу
		lite_resource_t* lr = NULL;
		if (it != si().lr_idx.end()) {
			lr = it->second;
			if (max != 0) assert(lr->res_max == max);
		} else {
			assert(max != 0);
			lr = new lite_resource_t(max);
			lr->name = name;
			si().lr_idx[name] = lr;
		}
		return lr;
	}

	// Очистка памяти
	static void clear() noexcept {
		lite_lock_t lck(si().mtx);
		for (auto& it : si().lr_idx) {
			delete it.second;
		}
		si().lr_idx.clear();
	}
};

//----------------------------------------------------------------------------------
//------ ОБРАБОТЧИК (АКТОР) --------------------------------------------------------
//----------------------------------------------------------------------------------
// Актор (обработчик + очередь сообщений)
class lite_actor_t : public lite_align64_t {

	lite_resource_t* resource;			// Ресурс, используемый актором
	lite_msg_queue_t msg_queue;			// Очередь сообщений
	std::atomic<int> actor_free;		// Количество свободных акторов, т.е. сколько можно запускать
	std::atomic<int> thread_max;		// Количество потоков, в скольки можно одновременно выполнять
	bool in_cache;						// Помещен в кэш планирования запуска
	bool timer_run;						// Требуется запуск обработки сигнала таймера
	std::string name;					// Наименование актора

	std::vector<size_t> type_list;		// Список обрабатываемых типов

	friend lite_thread_t;
protected:
	//---------------------------------
	// Конструктор
	lite_actor_t() : actor_free(1), thread_max(1), in_cache(false), timer_run(false) {
		if(si().res_default == NULL) {
			si().res_default = lite_resource_manage_t::get("CPU", LT_RESOURCE_DEFAULT);
		}
		resource = si().res_default;
		list_add(this);
	}

	// Проверка готовности к запуску
	bool is_ready() noexcept {
		return ((!msg_queue.empty() || timer_run) && actor_free > 0 && (resource == NULL || resource == ti().lr_now_used || resource->is_free()));
	}

	// Постановка сообщения в очередь
	void push(lite_msg_t* msg) noexcept {

		msg_queue.push(msg);

		if (msg == ti().msg_del) {
			// Помеченное на удаление сообщение поместили в очередь другого актора. Снятие пометки
			ti().msg_del = NULL;
		}

		cache_push(this);
	}

	// Запуск обработки всех сообщений очереди
	void run_all() noexcept {
		int free_now = --actor_free;
		if (free_now < 0) {
			// Уже выполняется разрешенное количество акторов
			#ifdef LT_STAT
			lite_thread_stat_t::ti().stat_actor_not_run++;
			#endif
		} else if (resource_lock(resource)) { // Занимаем ресурс
			thread_info_t& t = ti();
			t.la_next_run = NULL;
			t.la_now_run = this;
			bool need_lock = (thread_max != 1); // Блокировка нужна только многопоточным акторам
			while (true) {
				// Извлечение сообщения из очереди
				lite_msg_t* msg = msg_queue.pop(need_lock);
				if (msg == NULL) break;
				// Запуск функции
				t.msg_del = msg; // Пометка на удаление
				try {
					recv(msg); // Обработка
				} catch(std::exception e) {
					exception(e);
				}
				if (msg == t.msg_del) delete msg;
				#ifdef LT_STAT
				lite_thread_stat_t::ti().stat_msg_send++;
				#endif
			}
			if(timer_run) {
				timer_run = false;
				try {
					timer();
				} catch (std::exception e) {
					exception(e);
				}
			}
			in_cache = false;
		}
		actor_free++;
		return;
	}

public:
	// Установка имени актора
	void name_set(const std::string& name_) {
		name_set(this, name_);
	}

	// Получение имени актора
	const std::string name_get() {
		if(!name.empty()) {
			return name;
		} else {
			std::string n = "actor#";
			n += std::to_string((size_t)this);
			return n;
		}
	}


	// Привязка к ресурсу
	void resource_set(lite_resource_t* res) noexcept {
		assert(res != NULL);
		if (resource != si().res_default) {
			lite_log(LITE_ERROR_RESOURCE, "Actor %s already used resource '%s'", name_get().c_str(), res->name_get().c_str());
		}
		else {
			resource = res;
		}
	}

	// Установка глубины распараллеливания
	void parallel_set(int count) noexcept {
		if (count <= 0) count = 1;
		if (count == thread_max) return;

		actor_free += count - thread_max.exchange(count);
	}

	// Проверка типа сообщения
	bool check_type(lite_msg_t* msg) noexcept {
		if (!type_list.empty()) {
			// Проверка что тип сообщения в обрабатываемых
			bool found = false;
			for (auto& t : type_list) {
				if (msg->lite_msg_type == t) {
					found = true;
					break;
				}
			}
			if (!found) {
				lite_log(LITE_ERROR_MSG_TYPE, "'%s' recv '%s'", name_get().c_str(), msg->type_descr().c_str());
				return false;
			}
		}
		return true;
	}

	// Помещение в очередь для последующего запуска
	template <typename T>
	void run(T* msg) noexcept {
		lite_msg_t::type_set(msg);
		if(check_type(msg)) {
			push(msg);
		} else if (msg != ti().msg_del) {
			delete msg;
		}
	}

	// Добавление обрабатываемого типа
	void type_add(size_t type) noexcept {
		bool found = false;
		for (auto& t : type_list) {
			if (type == t) {
				found = true;
				break;
			}
		}
		if (!found) type_list.push_back(type);
	}

	// Установка периода вызова timer()
	void timer_set(int time_ms) noexcept {
		lite_timer_run(this, time_ms);
	}

	// Вызов timer()
	void timer_alert() noexcept {
		if (!timer_run) {
			timer_run = true;
			cache_push(this);
		}
	}

	#ifdef LT_STAT
	void *operator new(size_t size) {
		lite_thread_stat_t::ti().stat_actor_create++;
		return lite_align64_t::operator new(size);
	}

	void operator delete(void *p) {
		lite_thread_stat_t::ti().stat_actor_erase++;
		lite_align64_t::operator delete(p);
	}
	#endif

	//-----------------------------------------------------------------------------------
	// Обработчик сообщения, прописывать в дочернем классе
	virtual void recv(lite_msg_t*) = 0;

	// Обработчик исключений
	virtual void exception(std::exception& ex) {
		lite_log(LITE_ERROR_EXCEPTION, "%s: exception %s", name_get().c_str(), ex.what());
	}

	virtual void before_destroy() {
	}

	virtual void timer() {
		lite_log(LITE_ERROR_NOT_IMPLEMENTED, "%s method timer() is not implemented.", name_get().c_str());
	}

	virtual ~lite_actor_t() {}

private:
	// static переменные уровня потока -------------------------------------------------
	struct thread_info_t : public lite_thread_info_t<thread_info_t> {
		lite_msg_t* msg_del;		// Обрабатываемое сообщение, будет удалено после обработки
		lite_actor_t* la_next_run;	// Следующий на выполнение актор
		lite_actor_t* la_now_run;	// Текущий актор
		lite_resource_t* lr_now_used;// Текущий захваченный ресурс
	};

	static thread_info_t& ti() noexcept {
		return thread_info_t::tls_get();
	}

	// static переменные глобальные ----------------------------------------------------
	typedef std::unordered_map<std::string, lite_actor_t*> lite_name_idx_t;
	typedef std::vector<lite_actor_t*> lite_actor_list_t;

	struct static_info_t : public lite_static_info_t<static_info_t> {
		lite_name_idx_t la_name_idx;// Индекс для поиска lite_actor_t* по имени
		lite_mutex_t mtx_idx;		// Блокировка для доступа к la_idx. В случае одновременной блокировки сначала mtx_idx затем mtx_list
		lite_actor_list_t la_list;	// Список акторов
		lite_mutex_t mtx_list;		// Блокировка для доступа к la_list
		lite_resource_t* res_default;// Ресурс по умолчанию
		std::atomic<bool> is_destroy;// Идет удаление всех акторов
	};

	static static_info_t& si() noexcept {
		return static_info_t::si();
	}

	// static методы глобальные ----------------------------------------------------
	// Сохранение в кэш указателя на актор ожидающий исполнения
	static void cache_push(lite_actor_t* la) noexcept {
		assert(la != NULL);
		if (!la->is_ready() || la->in_cache) return;

		thread_info_t& t = ti();
		if (t.la_now_run != NULL && t.la_now_run->msg_queue.empty() && t.la_next_run == NULL && t.lr_now_used == la->resource) {
			// Выпоняется последнее задание текущего актора, запоминаем в локальный кэш потока для обработки его следующим
			t.la_next_run = la;
			return;
		}

		// Запись в кэш ресурса
		la->resource->la_cache.push(la);

		if(la->resource->is_free()) {
			lite_thread_wake_up();
		}
	}

	// Получение из кэша указателя на актор ожидающий исполнения
	static lite_actor_t* cache_pop() noexcept {
		thread_info_t& t = ti();
		// Проверка локального кэша
		lite_actor_t* la = t.la_next_run;
		if (la != NULL) {
			t.la_next_run = NULL;
			if (la->is_ready()) {
				return la;
			} else {
				#ifdef LT_STAT
				lite_thread_stat_t::ti().stat_cache_bad++;
				#endif			
				la = NULL;
			}
		}

		if(t.lr_now_used != NULL) {
			// Проверка кэша используемого ресурса
			while ((la = t.lr_now_used->la_cache.pop()) != NULL) {
				if (la->is_ready()) {
					return la;
				}
			}
		}

		return NULL;
	}

	// Поиск ожидающего выполнение
	static lite_actor_t* find_ready() noexcept {
		// Извлечение из кэша
		lite_actor_t* ret = cache_pop();
		if (ret != NULL) {
			#ifdef LT_STAT
			lite_thread_stat_t::ti().stat_cache_found++;
			#endif
			return ret;
		}

		// Поиск перебором списка акторов
		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_actor_find++;
		#endif

		lite_lock_t lck(si().mtx_list); // Блокировка
		lite_actor_list_t& la_list = si().la_list;
		for (lite_actor_list_t::iterator it = la_list.begin(); it != la_list.end(); ++it) {
			if ((*it)->is_ready()) {
				ret = (*it);
				ret->in_cache = true;
				if(it != si().la_list.begin()) {
					// Сдвиг активных ближе к началу
					lite_actor_list_t::iterator it2 = it;
					--it2;
					(*it) = (*it2);
					(*it2) = ret;
				}
				break;
			} 
		}
		return ret;
	}

	// Количество готовых к выполнению
	static size_t count_ready() noexcept {
		lite_lock_t lck(si().mtx_list); // Блокировка
		size_t cnt = 0;
		for (lite_actor_list_t::iterator it = si().la_list.begin(); it != si().la_list.end(); ++it) {
			if ((*it)->is_ready()) {
				cnt += (*it)->actor_free;
			}
		}
		return cnt;
	}

	// Захват и освобождение ресурса
	static bool resource_lock(lite_resource_t* res) {
		// Проверка что уже захвачен
		if (res == ti().lr_now_used) return true;
		// Освобождение ранее захваченного
		if (ti().lr_now_used != NULL) ti().lr_now_used->unlock();
		ti().lr_now_used = NULL;
		// Захват нового
		if(res == NULL || res->lock()) {
			ti().lr_now_used = res;
			return true;
		} else {
			return false;
		}
	}

	// Добавление в список акторов
	static void list_add(lite_actor_t* la) noexcept {
		lite_lock_t lck2(si().mtx_list); // Блокировка
		si().la_list.push_back(la);
	}

	// Установка имени актора
	static void name_set(lite_actor_t* la, const std::string& name) {
		lite_lock_t lck(si().mtx_idx); // Блокировка
		lite_name_idx_t::iterator it = si().la_name_idx.find(name); // Поиск по индексу
		if (it != si().la_name_idx.end()) {
			if(it->second != la) lite_log(LITE_ERROR_ACTOR_DOUBLE, "Actor '%s' already exists", name.c_str());
		} else if(!la->name.empty()) {
			lite_log(LITE_ERROR_ACTOR_NAME, "Try set name '%s' to actor '%s'", name.c_str(), la->name.c_str());
		} else {
			si().la_name_idx[name] = la;
			la->name = name;
		}
	}

	// Очистка всего
	static void clear() noexcept {
		si().is_destroy = true;
		while (!si().la_list.empty()) {
			lite_actor_t* la_del = NULL;
			{
				lite_lock_t lck(si().mtx_list); // Блокировка
				if (si().la_list.back()->name == "log") { // "log" удаляется последним, т.к. могли быть записи в деструкторах
					la_del = si().la_list[0];
					si().la_list[0] = si().la_list.back();
				}
				else {
					la_del = si().la_list.back();
				}
				si().la_list.pop_back();
			}
			if (la_del->name == "log") {
				la_del->run_all();
				resource_lock(NULL);
			} else {
				la_del->before_destroy();
			}
			if (!la_del->name.empty()) { // Удаление из индекса
				lite_lock_t lck(si().mtx_idx); // Блокировка
				lite_name_idx_t::iterator it = si().la_name_idx.find(la_del->name);
				if (it != si().la_name_idx.end()) si().la_name_idx.erase(it);
			}
			delete la_del;
		}

		assert(si().la_name_idx.empty());

		si().res_default = NULL;
		si().is_destroy = false;
	}

public: //-------------------------------------------------------------

	// Удаление одного актора
	static void destroy(lite_actor_t *la_del) noexcept {
		if (si().is_destroy) return; // Идет удаление всех

		bool is_del = false;
		// Удаление из списка
		{
			lite_lock_t lck(si().mtx_list); // Блокировка
			for (auto & l : si().la_list) {
				if (l == la_del) {
					if (l != si().la_list.back()) { // Если не последний, то перенос в конец
						l = si().la_list.back();
					}
					si().la_list.pop_back();
					is_del = true;
					break;
				}
			}
		}
		if (is_del && !la_del->name.empty()) { // Удаление из индекса
			lite_lock_t lck(si().mtx_idx); // Блокировка
			lite_name_idx_t::iterator it = si().la_name_idx.find(la_del->name);
			if (it != si().la_name_idx.end()) si().la_name_idx.erase(it);
		}
		// Дообработка оставщихся сообщений
		if (is_del) {
			la_del->timer_set(0);
			la_del->before_destroy();
			while (!la_del->msg_queue.empty()) {
				la_del->run_all();
				if (!la_del->msg_queue.empty()) std::this_thread::sleep_for(std::chrono::milliseconds(20)); 
			}
			assert(la_del->msg_queue.empty());
			delete la_del;
		}
	}

	// Получание актора по имени
	static lite_actor_t* name_find(const std::string& name) {
		lite_lock_t lck(si().mtx_idx); // Блокировка
		lite_name_idx_t::iterator it = si().la_name_idx.find(name); // Поиск по индексу
		lite_actor_t* la = NULL;
		if (it != si().la_name_idx.end()) {
			la = it->second;
		}
		return la;
	}

	// Копирование сообщения
	template <typename T>
	static T* msg_copy(T* msg) noexcept {
		if (ti().msg_del == msg) {
			ti().msg_del = NULL; // Снятие пометки на удаление
			return msg;
		} else {
			T* msg2 = new T(*msg);
			return msg2;
		}
	}

	// Установка максимума ресурсу по умолчанию
	static void resource_max(int max) noexcept {
		si().res_default->max_set(max);
	}

	// Извещение о завершении потока
	static void thread_end() {
		thread_info_t::tls_free();
	}
};

//-------------------------------------------------------------------------
//---------------------- ТАЙМЕР -------------------------------------------
//-------------------------------------------------------------------------
// Вызов акторов по таймеру.

class lite_timer_t {

	struct task_t { // Задание
		lite_actor_t* la;	// Актор
		int step;			// Периодичность оповещения, мс
	};
	typedef std::multimap<int64_t, task_t> task_list_t; // Список заданий с сортировкой по времени срабатывания

	task_list_t task_list;


	std::thread thread;			// Поток ожидания

	std::mutex mtx;				// Для засыпания
	std::condition_variable cv;	// Для засыпания

	// Функция потока
	static void thread_func(lite_timer_t* const tmr) noexcept {
		#ifdef LT_DEBUG
		lite_log(0, "timer thread start");
		#endif
		std::unique_lock<std::mutex> lck(tmr->mtx);
		while(!tmr->task_list.empty()) {
			int64_t now = lite_time_now(), sleep_ms = 0;

			while(true) { // Запуск тех, у кого время наступило
				task_list_t::iterator it = tmr->task_list.begin();
				if (it->first > now) {
					now = lite_time_now();
					if(it->first > now) {
						sleep_ms = it->first - now + 1;
						break;
					}
				}
				it->second.la->timer_alert();
				int64_t next = it->first + it->second.step;
				while(next <= now) next += it->second.step;
				tmr->task_list.insert(std::pair<int64_t, task_t>(next, it->second));
				tmr->task_list.erase(it);
			}

			assert(sleep_ms > 0);
			tmr->cv.wait_for(lck, std::chrono::milliseconds(sleep_ms)); // Ожидание времени следущей сработки
		}
		#ifdef LT_DEBUG
		lite_log(0, "timer thread stop");
		#endif	
	}

	// Поиск настроек актора
	task_list_t::iterator find(lite_actor_t* la) noexcept {
		task_list_t::iterator it = task_list.begin();
		for(; it != task_list.end(); it++) {
			if (it->second.la == la) break;
		}
		return it;
	}

public:
	// Добавление таймера 
	void set(lite_actor_t* la, int time_ms) noexcept {
		std::unique_lock<std::mutex> lck(mtx); // Блокировка
		bool start_thread = task_list.empty();
		#ifdef LT_DEBUG
		lite_log(0, "timer %d ms for %s start_thread = %d", time_ms, la->name_get().c_str(), start_thread);
		#endif
		// Удаление предыдущих настроек для la
		task_list_t::iterator it = find(la);
		if (it != task_list.end()) task_list.erase(it);

		if (time_ms <= 0) {
			cv.notify_all();
			return; // Остановка таймера
		}


		task_t t;
		t.la = la;
		t.step = time_ms;
		task_list.insert(std::pair<int64_t, task_t>(lite_time_now() + time_ms, t));

		lck.unlock();
		if(start_thread) { // Первое задание. Запуск потока.
			if(thread.joinable()) {
				cv.notify_all();
				thread.join();
			}
			thread = std::thread(thread_func, this);
		} else {
			cv.notify_all();
		}
	}

	// Остановка всех таймеров
	void stop_all() {
		std::unique_lock<std::mutex> lck(mtx); // Блокировка
		task_list.clear();
	}

	// Завершение работы
	~lite_timer_t() {
		stop_all();
		if (thread.joinable()) {
			cv.notify_all();
			thread.join();
		}
	}
};

//----------------------------------------------------------------------------------
//----- ПОТОКИ ---------------------------------------------------------------------
//----------------------------------------------------------------------------------

class lite_thread_t : lite_align64_t {
	size_t num;					// Номер потока
	std::mutex mtx_sleep;		// Для засыпания
	std::condition_variable cv;	// Для засыпания
	bool is_free;				// Поток свободен
	bool is_end;				// Поток завершен

	// Конструктор
	lite_thread_t(size_t num) : num(num), is_free(true), is_end(false) { }

	// Общие данные всех потоков
	struct static_info_t : public lite_static_info_t<static_info_t> {
		std::atomic<lite_thread_t*> worker_free = {0}; // Указатель на свободный поток
		std::vector<lite_thread_t*> worker_list;	// Массив описателей потоков
		std::atomic<size_t> thread_count;			// Количество запущеных потоков
		lite_mutex_t mtx;							// Блокировка доступа к массиву потоков
		std::atomic<bool> stop = {0};				// Флаг остановки всех потоков
		std::mutex mtx_end;							// Для ожидания завершения потоков
		std::condition_variable cv_end;				// Для ожидания завершения потоков
		lite_timer_t* timer = { 0 };				// Таймер вызова акторов по времени
	};

	static static_info_t& si() {
		return static_info_t::si();
	}

	// Создание потока
	static void create_thread() noexcept {
		if (si().stop) return;
		lite_thread_t* lt;
		{
			lite_lock_t lck(si().mtx); // Блокировка
			size_t num = si().thread_count;
			if (si().worker_list.size() == num) {
				si().worker_list.push_back(NULL);
			} else {
				assert(num < si().worker_list.size());
				assert(si().worker_list[num] != NULL);
				assert(si().worker_list[num]->is_end);
				delete si().worker_list[num];
			}
			lt = new lite_thread_t(num);
			si().worker_list[num] = lt;
			si().thread_count++;
		}
		std::thread th(thread_func, lt);
		th.detach();

		#ifdef LT_STAT
		lite_thread_stat_t::ti().stat_thread_create++;
		size_t cnt = si().thread_count;
		if (lite_thread_stat_t::ti().stat_thread_max < cnt) lite_thread_stat_t::ti().stat_thread_max = cnt;
		#endif
	}

	// Поиск свободного потока
	static lite_thread_t* find_free() noexcept {
		lite_thread_t* wf = si().worker_free;
		if(wf != NULL && wf->is_free) return wf;

		if (si().thread_count == 0) return NULL;
		wf = NULL;
		lite_lock_t lck(si().mtx); // Блокировка
		size_t max = si().thread_count;
		assert(max <= si().worker_list.size());

		for (size_t i = 0; i < max; i++) {
			lite_thread_t* w = si().worker_list[i];
			assert(w != NULL);
			if (w->is_free) {
				wf = w;
				break;
			}
		}

		si().worker_free = wf;
		return wf;
	}

	// Подсчет работающих потоков
	static size_t thread_work() noexcept {
		lite_lock_t lck(si().mtx); // Блокировка
		size_t max = si().thread_count;
		assert(max <= si().worker_list.size());

		size_t ret = 0;
		for (size_t i = 0; i < max; i++) {
			if (!si().worker_list[i]->is_free) ret++;
		}
		#ifdef LT_STAT
		if (lite_thread_stat_t::ti().stat_parallel_run < ret) lite_thread_stat_t::ti().stat_parallel_run = ret;
		#endif		
		return ret;
	}

	// Обработка сообщений
	static void work_msg(lite_actor_t* la = NULL) noexcept {
		if (la == NULL) la = lite_actor_t::find_ready();
		while (la != NULL) {
			la->run_all();
			la = lite_actor_t::find_ready();
		}
		lite_actor_t::resource_lock(NULL);
	}

	// Функция потока
	static void thread_func(lite_thread_t* const lt) noexcept {
		#ifdef LT_DEBUG
		lite_log(0, "thread#%d start", (int)lt->num);
		#endif
		this_num(lt->num);
		// Пробуждение другого потока если ожидающих акторов больше одного
		if(lite_actor_t::count_ready() > 1) {
			lt->is_free = false;
			wake_up();
		}
		// Цикл обработки сообщений
		while(true) {
			// Проверка необходимости и создание новых потоков
			lite_actor_t* la = lite_actor_t::find_ready();
			if(la != NULL) { // Есть что обрабатывать
				lt->is_free = false;
				// Обработка сообщений
				work_msg(la);
				lt->is_free = true;
			}
			if (si().stop) break;
			// Уход в ожидание
			bool stop = false;
			{
				#ifdef LT_DEBUG
				lite_log(0, "thread#%d sleep at %d ms", (int)lt->num, (int)lite_time_now());
				#endif
				if(thread_work() == 0) si().cv_end.notify_one(); // Если никто не работает, то разбудить ожидание завершения
				lite_thread_t* wf = si().worker_free;
				while(wf == NULL || wf->num > lt->num) { // Следующим будить поток с меньшим номером
					si().worker_free.compare_exchange_weak(wf, lt);
				}
				std::unique_lock<std::mutex> lck(lt->mtx_sleep);
				lt->is_free = true;
				if(lt->cv.wait_for(lck, std::chrono::seconds(1)) == std::cv_status::timeout) {	// Проснулся по таймауту
					stop = (lt->num == si().thread_count - 1);	// Остановка потока с наибольшим номером
					#ifdef LT_DEBUG
					lite_log(0, "thread#%d wake up (total: %d, work: %d)", (int)lt->num, (int)si().thread_count, (int)thread_work());
					#endif
				} else {
					#ifdef LT_DEBUG
					lite_log(0, "thread#%d wake up", (int)lt->num);
					#endif
					#ifdef LT_STAT
					lite_thread_stat_t::ti().stat_thread_wake_up++;
					#endif
				}
				if (si().worker_free == lt) {
					wf = lt;
					si().worker_free.compare_exchange_weak(wf, NULL);
				}
			}
			if (stop) {
				lt->is_free = false;
				break;
			}
		}
		#ifdef LT_STAT
		lite_thread_stat_t::ti().store(); // Сохранение счетчиков потока
		#endif
		lite_lock_t lck(si().mtx); // Блокировка
		lt->is_end = true;
		lt->is_free = false;
		si().thread_count--;
		si().cv_end.notify_one(); // пробуждение end()
		#ifdef LT_DEBUG
		lite_log(0, "thread#%d stop", (int)lt->num);
		#endif
		lite_actor_t::thread_end();
		#ifdef LT_STAT
		lite_thread_stat_t::thread_end();
		#endif
	}

public: //-------------------------------------
	// Пробуждение свободного потока
	static void wake_up() noexcept {
		lite_thread_t* wf = find_free();
		if (wf != NULL) {
			wf->cv.notify_one();
			#ifdef LT_STAT
			lite_thread_stat_t::ti().stat_try_wake_up++;
			#endif
		} else {
			create_thread();
		}
	}

	// Установка таймера для la
	static void timer_set(lite_actor_t* la, int time_ms) noexcept {
		if(si().timer == NULL) {
			if (time_ms <= 0) return;
			si().timer = new lite_timer_t;
		}
		si().timer->set(la, time_ms);
	}

	// Завершение, ожидание всех потоков
	static void end() noexcept {
		// Рассчет еще не начался
		if(si().thread_count == 1 && thread_work() == 0) {
			#ifdef LT_DEBUG
			lite_log(0, "--- wait start ---");
			#endif	
			std::this_thread::sleep_for(std::chrono::milliseconds(100)); // для запуска потоков
		}
		#ifdef LT_DEBUG
		lite_log(0, "--- wait all ---");
		#endif	
		// Ожидание завершения расчетов. 
		while(thread_work() > 0) {
			std::unique_lock<std::mutex> lck(si().mtx_end);
			si().cv_end.wait_for(lck, std::chrono::milliseconds(300));
		}
		#ifdef LT_DEBUG
		lite_log(0, "--- stop all ---");
		#endif	
		// Остановка таймеров
		if (si().timer != NULL) {
			delete si().timer;
			si().timer = NULL;
		}
		// Остановка потоков
		si().stop = true;
		while(true) { // Ожидание остановки всех потоков
			bool is_end = true;
			{
				lite_lock_t lck(si().mtx); // Блокировка
				for (auto& w : si().worker_list) {
					if(!w->is_end) { // Поток не завершился
						w->cv.notify_one(); // Пробуждение потока
						is_end = false;
					}
				}
			}
			if (is_end) {
				break;
			} else { // Ожидание пока какой-нибудь завершившийся поток не разбудит
				std::unique_lock<std::mutex> lck(si().mtx_end);
				si().cv_end.wait_for(lck, std::chrono::milliseconds(100));
			}
		}
		// Завершены все потоки
		assert(si().thread_count == 0);

		// Очистка данных потоков
		lite_lock_t lck(si().mtx); // Блокировка
		for (auto& w : si().worker_list) {
			assert(w != NULL);
			delete w;
			w = NULL;
		}
		si().worker_list.clear();
		si().worker_free = NULL;
		// Дообработка необработанных сообщений. 
		work_msg();
		// Удаление акторов
		lite_actor_t::clear();
		// Очистка памяти под ресурсы
		lite_resource_manage_t::clear();
		#ifdef LT_STAT
		lite_thread_stat_t::ti().print_stat();
		#endif		
		lite_actor_t::thread_end();
		#ifdef LT_STAT
		lite_thread_stat_t::thread_end();
		#endif		
		#ifdef LT_DEBUG
		printf("         !!! end !!!\n");
		#endif
		si().stop = false;

	}

	// Номер текущего потока
	static size_t this_num(size_t num = 999) noexcept {
		#ifdef LT_XP_DLL
		num = GetCurrentThreadId();
		return num;
		#else
		thread_local size_t n = 999;
		if (num != 999) {
			n = num;
		}
		return n;
		#endif
	}
};

//----------------------------------------------------------------------------------
//----- ВЫВОД В ЛОГ ----------------------------------------------------------------
//----------------------------------------------------------------------------------
#ifndef LITE_LOG_BUF_SIZE
#define LITE_LOG_BUF_SIZE 4096
#endif

// Сообщение
struct lite_msg_log_t : public lite_msg_t {
	lite_msg_log_t(int err, const char* str) : data(str), err_num(err) { }

	std::string data;
	int err_num;
};

// Вывод по умолчанию в консоль. При необходимости зарегистрировать свой актор "log"
class lite_actor_log_t : public lite_actor_t {
public:
	void recv(lite_msg_t* msg) override { // Обработчик сообщения
		lite_msg_log_t* m = dynamic_cast<lite_msg_log_t*>(msg);
		assert(m != NULL);
		printf("%s\n", m->data.c_str() + 9);
	}
};

// Запись в лог
static void lite_log(int err, const char* data, ...) noexcept {
	va_list ap;
	va_start(ap, data);
	char buf[LITE_LOG_BUF_SIZE];

	time_t rawtime;
	time(&rawtime);

	size_t size = 0;
	char* p = buf;

#ifdef WIN32
	struct tm timeinfo;
	localtime_s(&timeinfo, &rawtime);
	if(err > 0) {
		size += sprintf_s(p, LITE_LOG_BUF_SIZE - size, "%02d.%02d.%02d %02d:%02d:%02d !!! ERROR %d: ", timeinfo.tm_mday, timeinfo.tm_mon, timeinfo.tm_year % 100, timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec, err);
	} else {
		size += sprintf_s(p, LITE_LOG_BUF_SIZE - size, "%02d.%02d.%02d %02d:%02d:%02d ", timeinfo.tm_mday, timeinfo.tm_mon, timeinfo.tm_year % 100, timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec);
	}
	p += size;
	size += vsprintf_s(p, LITE_LOG_BUF_SIZE - size, data, ap);
	p += size;
#else
	struct tm * timeinfo;
	timeinfo = localtime(&rawtime);
	if (err > 0) {
		size += snprintf(p, LITE_LOG_BUF_SIZE - size, "%02d.%02d.%02d %02d:%02d:%02d !!! ERROR %d: ", timeinfo->tm_mday, timeinfo->tm_mon, timeinfo->tm_year % 100, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec, err);
	} else {
		size += snprintf(p, LITE_LOG_BUF_SIZE - size, "%02d.%02d.%02d %02d:%02d:%02d ", timeinfo->tm_mday, timeinfo->tm_mon, timeinfo->tm_year % 100, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
	}
	p += size;
	size += vsnprintf(p, LITE_LOG_BUF_SIZE - size, data, ap);
	p += size;
#endif
	va_end(ap);
	assert(size < LITE_LOG_BUF_SIZE);
	*p = 0;
	lite_msg_log_t* msg = new lite_msg_log_t(err, buf);
	// Отправка на вывод
	lite_actor_t* log = lite_actor_t::name_find("log");
	if(log == NULL) { // Нет актора "log"
		// Регистрация lite_actor_log_t()
		log = new lite_actor_log_t();
		log->name_set("log");
	}
	#ifdef LT_DEBUG_LOG
	log->recv(msg);
	delete msg;
	#else
	log->run(msg);
	#endif
}

//----------------------------------------------------------------------------------
//----- ОБЕРТКИ --------------------------------------------------------------------
//----------------------------------------------------------------------------------
#pragma warning( push )
#pragma warning( disable : 4505 ) // unreferenced local function has been removed

// Получение типа сообщения
template <typename T>
static size_t lite_msg_type() {
	return lite_msg_t::type_get<T>();
}

// Получения указателя на актор по имени
static lite_actor_t* lite_actor_get(const std::string& name) noexcept {
	return lite_actor_t::name_find(name);
}

// Удаление актора
static void lite_actor_destroy(lite_actor_t* la) noexcept {
	return lite_actor_t::destroy(la);
}

// Завершение с ожиданием всех
static void lite_thread_end() noexcept {
	lite_thread_t::end();
}

// Номер текущего потока
static size_t lite_thread_num() noexcept {
	return lite_thread_t::this_num();
}

// Установка максимума ресурсу по умолчанию
static void lite_thread_max(int max) noexcept {
	return lite_actor_t::resource_max(max);
}

// Создание ресурса
static lite_resource_t* lite_resource_create(const std::string& name, int max) noexcept {
	return lite_resource_manage_t::get(name, max);
}

// Копирование сообщения
template <typename T>
static T* lite_msg_copy(T* msg) noexcept {
	return lite_actor_t::msg_copy(msg);
}

// Пробуждение потока
static void lite_thread_wake_up() noexcept {
	lite_thread_t::wake_up();
}

// Запуск с повторами по таймеру
static void lite_timer_run(lite_actor_t* actor, int time_ms) noexcept {
	lite_thread_t::timer_set(actor, time_ms);
}
#pragma warning( pop )
