using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtumDesignLab.BaseObjects
{
    public interface IBizObject
    {
        /// <summary>
        /// Создаёт бизнес объект
        /// </summary>
        void Create();

        /// <summary>
        /// Считывает бизнес обьект из базы данных по ID
        /// </summary>
        /// <param name="id">Идентификатор записи</param>
        void Read(int id);

        /// <summary>
        /// Обновляет запись о бизнес объекте
        /// </summary>
        void Update();

        /// <summary>
        /// Удаляет запись
        /// </summary>
        /// <param name="id">Идентификатор записи</param>
        void Delete();
    }
}
