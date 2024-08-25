using System;
using System.Data.Entity;

using AgileObjects.AgileMapper;

using OpenLibrary.Service.Database.Entity.Interface;

namespace OpenLibrary.Service.Database.Entity
{
    public class Repository<T> : IRepository<T>, IDisposable where T : class
    {
        readonly DbContext _dbContext;

        public Repository(string connectionString)
        {
            _dbContext = new DbContext(connectionString);
        }

        public void Add(T entity, bool createAndMap = false)
        {
            var currentEntity = _dbContext.Set<T>().Find(entity);

            if (currentEntity != null)
            {
                throw new Exception("Entity already exists:  Repository.Update(T entity)");
            }

            else
            {
                if (!createAndMap)
                    _dbContext.Set<T>().Add(entity);

                else
                {
                    var newEntity = _dbContext.Set<T>().Create();

                    // Use Agile Mapper
                    Mapper.Map<T>(entity).Over(newEntity);
                }

                _dbContext.SaveChanges();
            }
        }

        public void Update(T entity)
        {
            var currentEntity = _dbContext.Set<T>().Find(entity);

            if (currentEntity != null)
            {
                // Use Agile Mapper
                Mapper.Map<T>(entity).Over(currentEntity);

                _dbContext.SaveChanges();
            }

            else
                throw new Exception("Entity not found:  Repository.Update(T entity)");
        }

        public void Dispose()
        {
            _dbContext.Database.Connection.Close();
            _dbContext.Dispose();
        }
    }
}
