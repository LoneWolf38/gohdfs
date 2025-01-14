package hdfs

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestDatanodeStorageReport(t *testing.T) {
	client := getClientForUser(t, "root")
	err := client.GetDataNodeReport()
	assert.Equal(t, nil, err, "should have no errors")
}
