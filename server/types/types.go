package types

type PagingConfig struct {
	PageSize int
	Page     int
}

type CrudService[T any] interface {
	GetAll(PagingConfig) []T
	GetByID(string) T
	Create(T) T
	Update(T) T
	Delete(string) error
}
